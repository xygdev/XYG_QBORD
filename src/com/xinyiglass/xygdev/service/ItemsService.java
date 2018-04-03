package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.ItemsDao;

import xygdev.commons.page.PagePub;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class ItemsService {
	
	@Autowired
	PagePub pagePub;
	@Autowired
	ItemsDao itemsDao;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForItems(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT ITEM_ID,ORGANIZATION_ID,ORGANIZATION_NAME,ITEM_NUMBER,DESCRIPTION,CARNAME,EN_DESC,SPEC,PRODUCT_TYPE_DESC,PROCESS_TYPE_DESC,LOAD_LOCATION_DESC,OEMNO,QBORD_ENABLED_FLAG,LAST_SYNC_DATE FROM XYG_QBI_ITEM_TP_B_V");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND CHECKFLAG <> 'N'");
		sqlBuff.append(SqlStmtPub.getAndStmt("ORGANIZATION_ID",conditionMap.get("orgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("ITEM_NUMBER",conditionMap.get("itemNumber"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CARNAME",conditionMap.get("carName"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("PRODUCT_TYPE_ID",conditionMap.get("productTypeId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("PROCESS_TYPE_ID",conditionMap.get("processTypeId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("LOAD_LOCATION_ID",conditionMap.get("loadLocationId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("QBORD_ENABLED_FLAG",conditionMap.get("qbordEnabledFlag"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("LAST_SYNC_DATE",conditionMap.get("syncDate_F"),conditionMap.get("syncDate_T"),paramMap));
		sqlBuff.append("  AND XYG_QBI_ITEM_TP_B_V.ORGANIZATION_ID IN(SELECT XOIP.ORGANIZATION_ID ");
		sqlBuff.append("                                               FROM XYG_QBORD_INV_PERMISSION XOIP");   
		sqlBuff.append("                                              WHERE XOIP.USER_ID=:1 ");
		sqlBuff.append("                                                          )");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForValidItems(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT ITEM_ID,ORGANIZATION_ID,ORGANIZATION_NAME,ITEM_NUMBER,DESCRIPTION,CARNAME,EN_DESC,SPEC,PRODUCT_TYPE_DESC,PROCESS_TYPE_DESC,LOAD_LOCATION_DESC,OEMNO,QBORD_ENABLED_FLAG,CHANG,GAO FROM XYG_QBI_ITEM_TP_B_V ");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND QBORD_ENABLED_FLAG = 'Y'");
		sqlBuff.append("   AND CHECKFLAG <> 'N'");
		sqlBuff.append(SqlStmtPub.getAndStmt("ORGANIZATION_ID",conditionMap.get("orgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("ITEM_NUMBER",conditionMap.get("itemNumber"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CARNAME",conditionMap.get("carName"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("PRODUCT_TYPE_ID",conditionMap.get("productTypeId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("PROCESS_TYPE_ID",conditionMap.get("processTypeId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("LOAD_LOCATION_ID",conditionMap.get("loadLocationId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("OEMNO",conditionMap.get("oemno")==null?null:conditionMap.get("oemno").toString().trim(),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("EN_DESC",conditionMap.get("enDesc"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CHANG",conditionMap.get("chang_F"),conditionMap.get("chang_T"),paramMap));
	    sqlBuff.append(SqlStmtPub.getAndStmt("GAO",conditionMap.get("gao_F"),conditionMap.get("gao_T"),paramMap));
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public void updateItemEnabledFlag(Map<String,Object> conditionMap) throws Exception{
		itemsDao.updateItemEnabledFlag(conditionMap);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findDetailByIdForJSON(Map<String,Object> conditionMap) throws Exception{
		return itemsDao.findDetailById(conditionMap).toJsonStr();
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Long countPic(Map<String,Object> conditionMap) throws Exception{
		return itemsDao.countPic(conditionMap);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findPicUrlByItemId(Map<String,Object> conditionMap) throws Exception{
		return itemsDao.findPicUrlByItemId(conditionMap);
	}
}
