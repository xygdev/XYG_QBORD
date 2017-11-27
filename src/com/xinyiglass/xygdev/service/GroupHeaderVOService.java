package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

import com.xinyiglass.xygdev.dao.GroupHeaderVODao;
import com.xinyiglass.xygdev.entity.GroupHeaderVO;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class GroupHeaderVOService {
	@Autowired
	GroupHeaderVODao groupH;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public SqlResultSet getGroup(Long userId,Long loginId) throws Exception{
		return groupH.getGroup(userId);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = groupH.assign(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("select * from XYG_ALD_GROUP_HEADERS_V WHERE 1=1");
		sqlBuff.append(" AND APPL_ID = XYG_ALD_GLOBAL.APPL_ID");
		String onlyCust = conditionMap.get("onlyCust")==null?"":conditionMap.get("onlyCust").toString();
		if(onlyCust.equals("Y")){
			sqlBuff.append(" AND GROUP_ID IN (SELECT GROUP_ID");
			sqlBuff.append(" 					FROM XYG_ALD_GROUP_LINES_V");
			sqlBuff.append(" 				   WHERE APPL_ID = XYG_ALD_GLOBAL.APPL_ID");
			sqlBuff.append(" 					 AND CUST_ID IS NOT NULL)");
		}
		String customerId = conditionMap.get("customerId")==null?"":conditionMap.get("customerId").toString();
		if(!customerId.equals("")){
			sqlBuff.append(" AND GROUP_ID IN (SELECT DISTINCT(GROUP_ID) ");
			sqlBuff.append(" 				    FROM XYG_ALD_GROUP_LINES_V");
			sqlBuff.append(" 				    WHERE 1=1");
			sqlBuff.append(" 					  AND CUST_ACCOUNT_ID = :1)");
			paramMap.put("1", customerId);
		}
		sqlBuff.append(SqlStmtPub.getAndStmt("GROUP_ID",conditionMap.get("groupId"),paramMap));
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForDetailPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("select * from XYG_ALD_GROUP_LINES_V WHERE 1=1");
		sqlBuff.append(" AND GROUP_ID = :1");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("groupId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	public PlsqlRetValue insert(GroupHeaderVO gh,Long loginId) throws Exception{
		PlsqlRetValue ret= groupH.insert(gh);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue update(GroupHeaderVO gh,GroupHeaderVO updateGhVO,Long loginId) throws Exception
	{ 
		PlsqlRetValue ret = groupH.lock(gh);
		if(ret.getRetcode()==0){
			ret = groupH.update(updateGhVO);
		}else{
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public GroupHeaderVO findVOById(Long groupId,Long loginId) throws Exception{
		return groupH.findVOById(groupId);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findJSONById(Long groupId,Long loginId) throws Exception{
		return groupH.findJSONById(groupId).toJsonStr();
	}
}
