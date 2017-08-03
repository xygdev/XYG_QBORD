package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;
import xygdev.commons.sqlStmt.SqlStmtPub;

//正常应该是写在dao层的。Lov特殊处理，因为只有一个SQL就可以得到要的内容，所以先写在Service层。
//而且Lov的数据访问的重用性不是很高，以查询和验证数据为主，所以确实可以不用封装dao。
//关于分页处理的必须要封装。基本的逻辑是：给一个SQL，还有相关的条件，返回页的json数据结果-->2016.8.9已经完成
@Service
//不需要事务管理的(只查询的)方法，可以提高效率。
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class LovService {

	@Autowired
	PagePub pagePub;
	
	/***用户LOV***/
	public String findUserForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT USER_ID,USER_NAME,DESCRIPTION FROM XYG_ALD_USER");
		sqlBuf.append(" WHERE (END_DATE IS NULL OR END_DATE > SYSDATE)");
		sqlBuf.append(SqlStmtPub.getAndStmt("USER_NAME", conditionMap.get("userName"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION", conditionMap.get("userDesc"),paramMap));
		sqlBuf.append(" ORDER BY USER_ID ");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***职责LOV***/
	public String findRespForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT RESP_ID,RESP_CODE,RESP_NAME,DESCRIPTION FROM XYG_ALD_RESP");
		sqlBuf.append(" WHERE (END_DATE IS NULL OR END_DATE > SYSDATE)");
		sqlBuf.append(" AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
		sqlBuf.append(SqlStmtPub.getAndStmt("RESP_CODE", conditionMap.get("respCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("RESP_NAME", conditionMap.get("respName"),paramMap));
		sqlBuf.append(" ORDER BY RESP_ID ");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap,  (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	
	/***员工LOV***/
	public String findEmpForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT PERSON_ID EMP_ID,FULL_NAME ENAME,EMPLOYEE_NUMBER EMPNO FROM XYG_ALH_PER_PEOPLE");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append(SqlStmtPub.getAndStmt("FULL_NAME",conditionMap.get("ename"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("EMPLOYEE_NUMBER", conditionMap.get("eno"),paramMap));
		sqlBuf.append(" ORDER BY EMP_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap,  (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***工作组LOV***/
	public String findGroupForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT GROUP_ID,GROUP_CODE,GROUP_NAME,DESCRIPTION FROM XYG_ALD_GROUP_HEADERS");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append(" AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
		sqlBuf.append(SqlStmtPub.getAndStmt("GROUP_CODE",conditionMap.get("groupCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("GROUP_NAME", conditionMap.get("groupName"),paramMap));
		sqlBuf.append(" ORDER BY GROUP_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***菜单LOV***/
	public String findMenuForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT MENU_ID,MENU_CODE,MENU_NAME,DESCRIPTION FROM XYG_ALD_MENU_HEADERS");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append(" AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
		sqlBuf.append(SqlStmtPub.getAndStmt("MENU_CODE", conditionMap.get("menuCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("MENU_NAME", conditionMap.get("menuName"),paramMap));
		sqlBuf.append(" ORDER BY MENU_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***图标LOV***/
	public String findIconForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT ICON_ID,ICON_CODE,DESCRIPTION,ICON_SOURCE FROM XYG_ALD_ICONS");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append(SqlStmtPub.getAndStmt("ICON_CODE",conditionMap.get("iconCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION", conditionMap.get("iconDesc"),paramMap));
		sqlBuf.append(" ORDER BY ICON_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***库存组织LOV***/
	public String findOrganizationForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT ORGANIZATION_ID,ORGANIZATION_CODE,ORGANIZATION_NAME FROM XYG_ALI_ORGANIZATION_VL");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND GLASS_INDUSTRY = 'QB'");
		sqlBuf.append("   AND DISABLE_DATE IS NULL");
		sqlBuf.append(SqlStmtPub.getAndStmt("ORGANIZATION_CODE",conditionMap.get("oCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("ORGANIZATION_NAME", conditionMap.get("oName"),paramMap));
		sqlBuf.append(" ORDER BY ORGANIZATION_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***用户库存权限LOV***/
	public String findUserOrganization(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1",conditionMap.get("userId"));
		sqlBuf.append("SELECT ORGANIZATION_ID,ORGANIZATION_CODE,ORGANIZATION_NAME FROM XYG_QBORD_INV_PERMISSION_V");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND USER_ID = :1");
		sqlBuf.append("   AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1)");
		sqlBuf.append(SqlStmtPub.getAndStmt("ORGANIZATION_CODE",conditionMap.get("oCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("ORGANIZATION_NAME", conditionMap.get("oName"),paramMap));
		sqlBuf.append(" ORDER BY ORGANIZATION_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***功能LOV***/
	public String findFuncForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT FUNCTION_ID,FUNCTION_CODE,FUNCTION_NAME,DESCRIPTION FROM XYG_ALD_FUNCTIONS");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
		sqlBuf.append(SqlStmtPub.getAndStmt("FUNCTION_CODE",conditionMap.get("funcCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("FUNCTION_NAME", conditionMap.get("funcName"),paramMap));
		sqlBuf.append(" ORDER BY FUNCTION_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***客户（后台分配界面）LOV***/
	public String findCustAllForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT XACA.*");
		sqlBuf.append("  FROM (SELECT OPERATING_UNIT");
		sqlBuf.append("          FROM XYG_ALI_ORGANIZATION_VL");
		sqlBuf.append("         WHERE GLASS_INDUSTRY = 'QB'");
		sqlBuf.append("         GROUP BY OPERATING_UNIT) XAO");
		sqlBuf.append("      ,XYG_ALFR_CUST_ACCOUNT_V XACA");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND STATUS='A'");
		sqlBuf.append("   AND XACA.ORG_ID=XAO.OPERATING_UNIT");
		sqlBuf.append("   AND XACA.PRODUCT_LIST_HEADER_ID IS NOT NULL");
		sqlBuf.append(SqlStmtPub.getAndStmt("PARTY_NAME", conditionMap.get("partyName"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("ACCOUNT_NUMBER", conditionMap.get("accountNumber"),paramMap));
		sqlBuf.append(" ORDER BY XACA.ORG_ID,XACA.CUST_ACCOUNT_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***用户客户LOV***/
	public String findUserCustForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT * ");
		sqlBuf.append("  FROM XYG_ALFR_CUST_ACCOUNT_V");
		sqlBuf.append(" WHERE 1=1");
		sqlBuf.append(SqlStmtPub.getAndStmt("PARTY_NAME", conditionMap.get("partyName"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("ACCOUNT_NUMBER", conditionMap.get("accountNumber"),paramMap));
		sqlBuf.append("   AND ACT_ID IN (SELECT CUST_ID");
		sqlBuf.append("					   FROM XYG_ALD_GROUP_LINES");
		sqlBuf.append("					  WHERE GROUP_ID IN(SELECT SUB_GROUP_ID");
		sqlBuf.append("										  FROM XYG_ALD_GROUP_LINES");
		sqlBuf.append("										 WHERE 1=1");
		sqlBuf.append("										   AND SUB_GROUP_ID IS NOT NULL");
		sqlBuf.append("									CONNECT BY NOCYCLE PRIOR SUB_GROUP_ID = GROUP_ID");
		sqlBuf.append("									START WITH GROUP_ID = (SELECT GROUP_ID");
		sqlBuf.append("										  					 FROM XYG_ALD_USER_GROUP_V");
		sqlBuf.append("										 					WHERE USER_ID = :1");
		sqlBuf.append("															  AND USER_TYPE = 'EMP'");
		sqlBuf.append("															  AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuf.append("					     OR GROUP_ID = (SELECT GROUP_ID");
		sqlBuf.append("							              FROM XYG_ALD_USER_GROUP_V");
		sqlBuf.append("										 WHERE USER_ID = :1");
		sqlBuf.append("										   AND USER_TYPE = 'EMP'");
		sqlBuf.append("										   AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuf.append("    OR ACT_ID IN (SELECT ACT_ID");
		sqlBuf.append("					   FROM XYG_ALD_USER_CUST_V");
		sqlBuf.append("					  WHERE USER_ID = :1");
		sqlBuf.append("					    AND USER_TYPE = 'CUSTOMER'");
		sqlBuf.append("					    AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID)");
		sqlBuf.append(" ORDER BY ORG_ID,CUST_ACCOUNT_ID");  
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***物料LOV***/
	public String findItemForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT A.*");
		sqlBuf.append("  FROM (SELECT XQPL.ITEM_ID INVENTORY_ITEM_ID,XQPL.ITEM_NUMBER,XQPL.ITEM_DESCRIPTION DESCRIPTION,XQPL.ITEM_CH_DESCRIPTION CARNAME,XQPH.NOT_CONTROL");
		sqlBuf.append("          FROM XYG_QBO_PRODUCT_LINE_LIST XQPL");
		sqlBuf.append("              ,XYG_QBO_PRODUCT_HEADER_LIST XQPH");
		sqlBuf.append("         WHERE EXISTS (SELECT 1");
		sqlBuf.append("                         FROM XYG_ALFR_CUST_ACCOUNT");
		sqlBuf.append("                        WHERE XQPL.LIST_HEADER_ID = PRODUCT_LIST_HEADER_ID ");
		sqlBuf.append("                          AND CUST_ACCOUNT_ID = :1");
		sqlBuf.append("                          AND ORG_ID = :2)");
		sqlBuf.append("           AND EXISTS(SELECT 1");
		sqlBuf.append("                        FROM XYG_QBI_ITEM_TP_B");
		sqlBuf.append("                       WHERE INVENTORY_ITEM_ID = XQPL.ITEM_ID ");
		sqlBuf.append("                         AND ORGANIZATION_ID = :3)");
		sqlBuf.append("           AND XQPL.LIST_HEADER_ID = XQPH.LIST_HEADER_ID");
		sqlBuf.append("           AND XQPH.NOT_CONTROL = 'Y'");
		sqlBuf.append("         UNION ALL SELECT XQIT.INVENTORY_ITEM_ID,XQIT.ITEM_NUMBER,XQIT.DESCRIPTION,XQIT.CARNAME,'N' NOT_CONTROL");
		sqlBuf.append("                     FROM XYG_QBI_ITEM_TP_B XQIT");
		sqlBuf.append("                    WHERE XQIT.ORGANIZATION_ID = :3) A");
		sqlBuf.append("       ,XYG_QBO_PRODUCT_HEADER_LIST XQPHL");
		sqlBuf.append("  WHERE A.NOT_CONTROL = XQPHL.NOT_CONTROL");
		sqlBuf.append("    AND EXISTS (SELECT 1");  
		sqlBuf.append("                  FROM XYG_ALFR_CUST_ACCOUNT");
		sqlBuf.append("                 WHERE XQPHL.LIST_HEADER_ID = PRODUCT_LIST_HEADER_ID ");
		sqlBuf.append("                   AND CUST_ACCOUNT_ID = :1");
		sqlBuf.append("                   AND ORG_ID = :2) ");                     	                   
		//sqlBuf.append(SqlStmtPub.getAndStmt("ORGANIZATION_ID",conditionMap.get("organizationId"),paramMap,true));
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("CARNAME",conditionMap.get("carName"),paramMap));
		sqlBuf.append(" ORDER BY INVENTORY_ITEM_ID");  
		paramMap.put("1", conditionMap.get("customerId"));
		paramMap.put("2", conditionMap.get("salesOrgId"));
		paramMap.put("3", conditionMap.get("organizationId"));
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***产品种类 LOV***/
	public String findProductForPage(Map<String,Object> conditionMap,Long loginId,String lang) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT LOOKUP_CODE,DESCRIPTION FROM XYG_ALD_LOOKUP_VALUES");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND LANGUAGE = :1 ");
		sqlBuf.append("   AND LOOKUP_TYPE='XYG_TP_PRODUCTTYPE_SET'");
		sqlBuf.append("   AND ENABLED_FLAG='Y'");
		sqlBuf.append("   AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1)");
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuf.append(" ORDER BY LOOKUP_CODE");
		paramMap.put("1", lang);
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***加工类型LOV***/
	public String findProcessForPage(Map<String,Object> conditionMap,Long loginId,String lang) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT LOOKUP_CODE,DESCRIPTION FROM XYG_ALD_LOOKUP_VALUES");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND LANGUAGE = :1 ");
		sqlBuf.append("   AND LOOKUP_TYPE='XYG_TP_PROCESSTYPE_SET'");
		sqlBuf.append("   AND ENABLED_FLAG='Y'");
		sqlBuf.append("   AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1)");
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuf.append(" ORDER BY LOOKUP_CODE");
		paramMap.put("1", lang);
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
	/***装车位置LOV***/
	public String findLoadForPage(Map<String,Object> conditionMap,Long loginId,String lang) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT LOOKUP_CODE,DESCRIPTION FROM XYG_ALD_LOOKUP_VALUES");
		sqlBuf.append(" WHERE 1 = 1");
		sqlBuf.append("   AND LANGUAGE = :1 ");
		sqlBuf.append("   AND LOOKUP_TYPE='XYG_TP_LOCATION_SET'");
		sqlBuf.append("   AND ENABLED_FLAG='Y'");
		sqlBuf.append("   AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1)");
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION",conditionMap.get("description"),paramMap));
		sqlBuf.append(" ORDER BY LOOKUP_CODE");
		paramMap.put("1", lang);
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
	
}
