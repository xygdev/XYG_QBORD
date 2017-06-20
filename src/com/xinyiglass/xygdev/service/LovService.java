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
		sqlBuf.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
		sqlBuf.append(SqlStmtPub.getAndStmt("ICON_CODE",conditionMap.get("iconCode"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("DESCRIPTION", conditionMap.get("iconDesc"),paramMap));
		sqlBuf.append(" ORDER BY ICON_ID");
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
		sqlBuf.append(SqlStmtPub.getAndStmt("PARTY_NAME", conditionMap.get("partyName"),paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("ACCOUNT_NUMBER", conditionMap.get("accountNumber"),paramMap));
		sqlBuf.append(" ORDER BY XACA.ORG_ID,XACA.CUST_ACCOUNT_ID");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"),false);
	}
}
