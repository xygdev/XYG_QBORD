package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.CustDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class CustService {
	
	@Autowired
	PagePub pagePub;
	@Autowired
	CustDao cDao;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT A.*");
		sqlBuff.append("      ,CASE WHEN SYSDATE BETWEEN A.START_DATE AND NVL(A.END_DATE,SYSDATE+1)");
		sqlBuff.append("       THEN 'Y' ELSE 'N' END ENABLED_FLAG");
		sqlBuff.append("  FROM XYG_ALD_USER_CUST_V A");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND USER_ID = :1");
		sqlBuff.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("userId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = cDao.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue validate(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = cDao.validate(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
