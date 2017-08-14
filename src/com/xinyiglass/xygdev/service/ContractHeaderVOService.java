package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.ContractHeaderVODao;
import com.xinyiglass.xygdev.entity.ContractHeaderVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class ContractHeaderVOService {
	
	@Autowired
	PagePub pagePub;
	@Autowired
	ContractHeaderVODao chd;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForTransferPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT XQCH.*,XYG_ALD_COMMON_PKG.GET_LKD_BY_LKCODE('XYG_QBORD_CONTRACT_STATUS',XQCH.STATUS) STATUS_DESC");
		sqlBuff.append("  FROM XYG_QBORD_CONTRACT_HEADERS_V XQCH");
		sqlBuff.append("      ,XYG_ALFR_CUST_ACCOUNT_V XACA");
		sqlBuff.append(" WHERE XQCH.CUSTOMER_ID = XACA.CUST_ACCOUNT_ID");	
		sqlBuff.append("   AND XQCH.STATUS = 'TRANSFER' ");
		sqlBuff.append(SqlStmtPub.getAndStmt("CONTRACT_NUMBER",conditionMap.get("contractNumber").toString().trim(),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("SHIP_FROM_ORG_ID",conditionMap.get("shipFromOrgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("SALES_ORG_ID",conditionMap.get("salesOrgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CUSTOMER_ID",conditionMap.get("customerId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("XQCH.CREATION_DATE",conditionMap.get("creationDate_F"),conditionMap.get("creationDate_T"),paramMap));
		sqlBuff.append("   AND XQCH.SALES_ORG_ID = XACA.ORG_ID");
		sqlBuff.append("   AND (XACA.ACT_ID IN(SELECT CUST_ID");
		sqlBuff.append("					     FROM XYG_ALD_GROUP_LINES");
		sqlBuff.append(" 						WHERE GROUP_ID IN(SELECT SUB_GROUP_ID");
		sqlBuff.append("						 					FROM XYG_ALD_GROUP_LINES");
		sqlBuff.append("										   WHERE 1=1");
		sqlBuff.append("											 AND SUB_GROUP_ID IS NOT NULL");              
		sqlBuff.append("                                      CONNECT BY NOCYCLE PRIOR SUB_GROUP_ID = GROUP_ID");
		sqlBuff.append("									  START WITH GROUP_ID = (SELECT GROUP_ID ");
		sqlBuff.append("										                       FROM XYG_ALD_USER_GROUP_V");
		sqlBuff.append(" 															  WHERE USER_ID = :1");
		sqlBuff.append("															    AND USER_TYPE = 'EMP'");
		sqlBuff.append("																AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");                     
		sqlBuff.append(" 						   OR GROUP_ID = (SELECT GROUP_ID ");
		sqlBuff.append("                                            FROM XYG_ALD_USER_GROUP_V");
		sqlBuff.append("										   WHERE USER_ID = :1");
		sqlBuff.append("									         AND USER_TYPE = 'EMP'");
		sqlBuff.append("											 AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuff.append("    OR XACA.ACT_ID IN (SELECT ACT_ID");
		sqlBuff.append("						 FROM XYG_ALD_USER_CUST_V");
		sqlBuff.append(" 					    WHERE USER_ID = :1");
		sqlBuff.append("						  AND USER_TYPE = 'CUSTOMER'");
		sqlBuff.append("						  AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForTransferPageL(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT XQCQ.*,XQCL.ORDER_QUANTITY REQUIRED_QUANTITY ");
		sqlBuff.append("  FROM XYG_QBORD_CONTRACT_QUERY_V XQCQ");
		sqlBuff.append("      ,XYG_QBORD_CONTRACT_HEADERS XQCH");
		sqlBuff.append("      ,XYG_QBORD_CONTRACT_LINES XQCL");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND XQCQ.CUS_BATCH = :1");
		sqlBuff.append("   AND XQCH.CONTRACT_NUMBER = XQCQ.CUS_BATCH");
		sqlBuff.append("   AND XQCL.HEADER_ID = XQCH.HEADER_ID");
		sqlBuff.append("   AND XQCQ.LINE_NUM = XQCL.LINE_NUM");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("cusBatch"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}

	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT XQCH.*,XYG_ALD_COMMON_PKG.GET_LKD_BY_LKCODE('XYG_QBORD_CONTRACT_STATUS',XQCH.STATUS) STATUS_DESC");
		sqlBuff.append("  FROM XYG_QBORD_CONTRACT_HEADERS_V XQCH");
		sqlBuff.append("      ,XYG_ALFR_CUST_ACCOUNT_V XACA");
		sqlBuff.append(" WHERE XQCH.CUSTOMER_ID = XACA.CUST_ACCOUNT_ID");	
		sqlBuff.append(SqlStmtPub.getAndStmt("CONTRACT_NUMBER",conditionMap.get("contractNumber").toString().trim(),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("SHIP_FROM_ORG_ID",conditionMap.get("shipFromOrgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("SALES_ORG_ID",conditionMap.get("salesOrgId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("CUSTOMER_ID",conditionMap.get("customerId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("XQCH.CREATION_DATE",conditionMap.get("creationDate_F"),conditionMap.get("creationDate_T"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("XQCH.STATUS",conditionMap.get("lookupCode"),paramMap));
		sqlBuff.append("   AND XQCH.SALES_ORG_ID = XACA.ORG_ID");
		sqlBuff.append("   AND (XACA.ACT_ID IN(SELECT CUST_ID");
		sqlBuff.append("					     FROM XYG_ALD_GROUP_LINES");
		sqlBuff.append(" 						WHERE GROUP_ID IN(SELECT SUB_GROUP_ID");
		sqlBuff.append("						 					FROM XYG_ALD_GROUP_LINES");
		sqlBuff.append("										   WHERE 1=1");
		sqlBuff.append("											 AND SUB_GROUP_ID IS NOT NULL");              
		sqlBuff.append("                                      CONNECT BY NOCYCLE PRIOR SUB_GROUP_ID = GROUP_ID");
		sqlBuff.append("									  START WITH GROUP_ID = (SELECT GROUP_ID ");
		sqlBuff.append("										                       FROM XYG_ALD_USER_GROUP_V");
		sqlBuff.append(" 															  WHERE USER_ID = :1");
		sqlBuff.append("															    AND USER_TYPE = 'EMP'");
		sqlBuff.append("																AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");                     
		sqlBuff.append(" 						   OR GROUP_ID = (SELECT GROUP_ID ");
		sqlBuff.append("                                            FROM XYG_ALD_USER_GROUP_V");
		sqlBuff.append("										   WHERE USER_ID = :1");
		sqlBuff.append("									         AND USER_TYPE = 'EMP'");
		sqlBuff.append("											 AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuff.append("    OR XACA.ACT_ID IN (SELECT ACT_ID");
		sqlBuff.append("						 FROM XYG_ALD_USER_CUST_V");
		sqlBuff.append(" 					    WHERE USER_ID = :1");
		sqlBuff.append("						  AND USER_TYPE = 'CUSTOMER'");
		sqlBuff.append("						  AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID))");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public ContractHeaderVO findVOById(Long headerId,Long loginId) throws Exception{
		return chd.findVOById(headerId);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findJSONById(Long headerId,Long loginId) throws Exception{
		return chd.findJSONById(headerId).toJsonStr();
	}
	
	//新增订单头
	public PlsqlRetValue insert(ContractHeaderVO ch,Long loginId) throws Exception{
		PlsqlRetValue ret=chd.insert(ch);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	//修改订单头
	public PlsqlRetValue update(ContractHeaderVO lockChVO,ContractHeaderVO updateChVO,Long loginId) throws Exception{
		PlsqlRetValue ret = chd.lock(lockChVO);
		if(ret.getRetcode()==0){
			ret = chd.update(updateChVO);
		}else{
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	//修改订单类型
	public PlsqlRetValue updateOrderType(ContractHeaderVO ch,Long loginId) throws Exception{
		PlsqlRetValue ret = chd.updateOrderType(ch);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	
	//删除订单头
	public PlsqlRetValue delete(Long headerId,Long loginId) throws Exception{
		PlsqlRetValue ret = chd.delete(headerId);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	//改变订单状态
	public PlsqlRetValue changeStatus(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = chd.changeStatus(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
