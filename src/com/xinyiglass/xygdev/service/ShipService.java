package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;
import xygdev.commons.sqlStmt.SqlStmtPub;


@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class ShipService {
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForShipPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT XQSQ.*");
		sqlBuff.append("  FROM XYG_QBORD_SHIP_QUERY_V XQSQ");
		sqlBuff.append("      ,XYG_ALD_USER XAU");
		sqlBuff.append("      ,XYG_ALD_USER_GROUP_V XAUG");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append(SqlStmtPub.getAndStmt("SEND_NUM",conditionMap.get("sendNum")==null?null:conditionMap.get("sendNum").toString().trim(),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CUS_BATCH",conditionMap.get("cusBatch")==null?null:conditionMap.get("cusBatch").toString().trim(),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("ACTUAL_SHIP_DATE",conditionMap.get("actualShipDate_F"),conditionMap.get("actualShipDate_T"),paramMap));	
		
		sqlBuff.append("   AND XAU.USER_ID= :1");
		sqlBuff.append("   AND XAUG.USER_ID(+)=XAU.USER_ID");
		sqlBuff.append("   AND XAUG.GROUP_APPL_ID(+) = XYG_ALD_GLOBAL_PKG.APPL_ID");
		sqlBuff.append("   AND (XAU.USER_TYPE='CUSTOMER'");
		sqlBuff.append("      AND EXISTS(SELECT 1");
		sqlBuff.append("           		 FROM XYG_ALD_USER_CUST XAUC");
		sqlBuff.append("   				WHERE XAUC.USER_ID = :1");
		sqlBuff.append("   				  AND XAUC.ORG_ID = XQSQ.SALES_ORG_ID");
		sqlBuff.append("   				  AND XAUC.CUSTOMER_ID = XQSQ.CUSTOMER_ID)");
		sqlBuff.append("   OR XAU.USER_TYPE='EMP'");
		sqlBuff.append("	  AND EXISTS(SELECT 1");
		sqlBuff.append("				   FROM XYG_ALFR_CUST_ACCOUNT_V XACA");              
		sqlBuff.append("                  WHERE XACA.CUST_ACCOUNT_ID = XQSQ.CUSTOMER_ID");
		sqlBuff.append("				    AND XACA.ORG_ID = XQSQ.SALES_ORG_ID");
		sqlBuff.append(" 				    AND XACA.ACT_ID IN");
		sqlBuff.append("							    (SELECT H.CUST_ID");
		sqlBuff.append("								   FROM XYG_ALD_GROUP_LINES H");                     
		sqlBuff.append(" 						          WHERE H.GROUP_ID IN (SELECT S.SUB_GROUP_ID");
		sqlBuff.append("                                                         FROM XYG_ALD_GROUP_LINES S");
		sqlBuff.append("										   		        WHERE 1=1");
		sqlBuff.append("									         			  AND S.SUB_GROUP_ID IS NOT NULL   ");
		sqlBuff.append("											 		  CONNECT BY NOCYCLE PRIOR S.SUB_GROUP_ID = S.GROUP_ID");
		sqlBuff.append("    												    START WITH S.GROUP_ID = XAUG.GROUP_ID ");
		sqlBuff.append("						 							    UNION ALL");
		sqlBuff.append(" 					    							   SELECT XAUG.GROUP_ID FROM DUAL) )))");
		
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}

}
