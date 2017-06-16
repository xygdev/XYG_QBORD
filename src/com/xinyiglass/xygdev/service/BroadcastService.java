package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.BroadcastDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class BroadcastService {

	@Autowired
	PagePub pagePub;
	@Autowired
	BroadcastDao bcDao;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT BROADCAST_ID,BROADCAST_TITLE,USER_DESC,START_DATE,END_DATE");
		sqlBuff.append("  FROM XYG_ALD_BROADCAST_V");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID");
		sqlBuff.append(SqlStmtPub.getAndStmt("CREATED_BY",conditionMap.get("userId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("BROADCAST_TITLE",conditionMap.get("broadcastTitle"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("START_DATE", conditionMap.get("sDate_F"),conditionMap.get("sDate_T"), paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("END_DATE", conditionMap.get("eDate_F"),conditionMap.get("eDate_T"), paramMap));
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findContentById(Long broadcastId,Long loginId) throws Exception{
		return bcDao.findContentById(broadcastId).toJsonStr();
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret=bcDao.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
