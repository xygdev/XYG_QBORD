package com.xinyiglass.xygdev.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.RespVODao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;
import xygdev.commons.util.TypeConvert;





import java.util.HashMap;

import com.xinyiglass.xygdev.entity.RespVO;



@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class RespVOService {
	@Autowired
	RespVODao respDao;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Long findMenuId(Long respId,Long loginId) throws Exception{
		return TypeConvert.str2Long(respDao.findMenuId(respId));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public SqlResultSet getResp(Long userId,Long loginId) throws Exception{
		return respDao.getResp(userId);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = respDao.assign(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}

   public PlsqlRetValue insert(RespVO vo,Long loginId) throws Exception{
   	   PlsqlRetValue ret=respDao.insert(vo);
       if(ret.getRetcode()!=0){
      	   DevJdbcSubProcess.setRollbackOnly();
       }
       return ret;
   }
   public PlsqlRetValue update(RespVO lVO,RespVO uVO,Long loginId) throws Exception
   {
       PlsqlRetValue ret=respDao.lock(lVO);
       if(ret.getRetcode()==0){
      	   ret=respDao.update(uVO);
       }else{
      	   DevJdbcSubProcess.setRollbackOnly();
       }
       return ret;
   }
   
   @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
   public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
   	   Map<String,Object> paramMap=new HashMap<String,Object>();
	   StringBuffer sqlBuff = new StringBuffer();
       sqlBuff.append("select * from XYG_ALD_RESP_V WHERE 1=1");
       sqlBuff.append(" AND APPL_ID = XYG_ALD_GLOBAL.APPL_ID");
       sqlBuff.append(SqlStmtPub.getAndStmt("MENU_ID",conditionMap.get("menuId"),paramMap));
	   sqlBuff.append(SqlStmtPub.getAndStmt("RESP_ID",conditionMap.get("respId"),paramMap));
	   sqlBuff.append(SqlStmtPub.getAndStmt("START_DATE",conditionMap.get("startDate_F"),conditionMap.get("startDate_T"),paramMap));
	   sqlBuff.append(SqlStmtPub.getAndStmt("END_DATE",conditionMap.get("endDate_F"),conditionMap.get("endDate_T"),paramMap));
	   sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
	   return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
				
   @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
   public RespVO findById(Long id,Long loginId) throws Exception{
   	   return respDao.findById(id);
   }
   
   @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
   public String findByIdForJSON(Long id,Long loginId) throws Exception{
   	   return respDao.findByIdForJSON(id).toJsonStr();
   }
}


