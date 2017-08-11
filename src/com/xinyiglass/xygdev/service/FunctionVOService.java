package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.FunctionVODao;
import com.xinyiglass.xygdev.entity.FunctionVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class FunctionVOService {
	@Autowired
	FunctionVODao funcDao;
	@Autowired
	PagePub pagePub;
	
	public PlsqlRetValue insert(FunctionVO vo,Long loginId) throws Exception
	{
		PlsqlRetValue ret=funcDao.insert(vo);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();
		}
		return ret;
	}
	
	public PlsqlRetValue update(FunctionVO lVO,FunctionVO uVO,Long loginId) throws Exception
	{
		PlsqlRetValue ret=funcDao.lock(lVO);
		if(ret.getRetcode()==0){
			ret=funcDao.update(uVO);
		}else{
			DevJdbcSubProcess.setRollbackOnly();
		}
		return ret;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
   	    Map<String,Object> paramMap=new HashMap<String,Object>();
	    StringBuffer sqlBuff = new StringBuffer();
        sqlBuff.append("select * from XYG_ALD_FUNCTIONS_VL WHERE 1=1");
        sqlBuff.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
        sqlBuff.append(SqlStmtPub.getAndStmt("FUNCTION_ID",conditionMap.get("funcId"),paramMap));
	    sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
	    return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public FunctionVO findById(Long id,Long loginId) throws Exception{
		return funcDao.findById(id);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findByIdForJSON(Long id,Long loginId) throws Exception{
		return funcDao.findByIdForJSON(id).toJsonStr();
	}
}