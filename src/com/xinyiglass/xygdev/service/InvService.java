package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.InvDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！

public class InvService {
	
	@Autowired
	InvDao permDao;
	@Autowired
	PagePub pagePub;


	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPermPage(Map<String,Object> conditionMap,Long loginId) throws Exception{		
		Map<String,Object> paramMap=new HashMap<String,Object>();
	    StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT A.*");
		sqlBuff.append("      ,CASE WHEN SYSDATE BETWEEN A.START_DATE_ACTIVE AND NVL(A.END_DATE_ACTIVE,SYSDATE+1)");
		sqlBuff.append("       THEN 'Y' ELSE 'N' END ENABLED_FLAG");
		sqlBuff.append("  FROM XYG_QBORD_INV_PERMISSION_V A");
		sqlBuff.append(" WHERE 1=1 ");
		sqlBuff.append(SqlStmtPub.getAndStmt("ORGANIZATION_ID",conditionMap.get("organizationId"),paramMap));
 	    sqlBuff.append(SqlStmtPub.getAndStmt("USER_ID",conditionMap.get("userId"),paramMap));
 	    sqlBuff.append(SqlStmtPub.getAndStmt("START_DATE_ACTIVE",conditionMap.get("startDateActive_F"),conditionMap.get("startDateActive_T"),paramMap));
 	    sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret= permDao.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = permDao.delete(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}	
	
	public PlsqlRetValue validate(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = permDao.validate(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForInvPage(Map<String,Object> conditionMap,Long loginId) throws Exception{		
		Map<String,Object> paramMap=new HashMap<String,Object>();
	    StringBuffer sqlBuff = new StringBuffer();
	    sqlBuff.append("SELECT XQIO.*");
	    sqlBuff.append("  FROM XYG_QBORD_INV_ONHAND_V XQIO");
	    sqlBuff.append("      ,XYG_QBI_ITEM_TP_B XQIT");
	    sqlBuff.append(" WHERE 1=1 ");
	    sqlBuff.append("   AND XQIO.ORGANIZATION_ID = XQIT.ORGANIZATION_ID ");
	    sqlBuff.append("   AND XQIO.INVENTORY_ITEM_ID = XQIT.INVENTORY_ITEM_ID ");
	    sqlBuff.append("   AND XQIT.CHECKFLAG <> 'N' ");
	    sqlBuff.append("   AND XQIT.QBORD_ENABLED_FLAG = 'Y' ");
		sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.ORGANIZATION_ID",conditionMap.get("organizationId"),paramMap,true)); 	 
		sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.DESCRIPTION",conditionMap.get("description"),paramMap)); 	 
	    sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.CARNAME",conditionMap.get("carName"),paramMap)); 
	    sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.PRODUCT_TYPE_ID",conditionMap.get("productTypeId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.PROCESS_TYPE_ID",conditionMap.get("processTypeId"),paramMap));
	    sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.LOAD_LOCATION_ID",conditionMap.get("loadLocationId"),paramMap)); 
	    sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.WIDTH",conditionMap.get("width_F"),conditionMap.get("width_T"),paramMap));
	    sqlBuff.append(SqlStmtPub.getAndStmt("XQIO.HEIGHT",conditionMap.get("height_F"),conditionMap.get("height_T"),paramMap));
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
	    return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
}
