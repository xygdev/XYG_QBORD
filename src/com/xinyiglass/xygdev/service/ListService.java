package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;
import xygdev.commons.sqlStmt.SqlStmtPub;

//类似Lov的处理
@Service
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class ListService {

	@Autowired
	PagePub pagePub;
	
	public String findForLookup(String lookupType,Long loginId) throws Exception{
		String sql = "SELECT MEANING DISPLAY,LOOKUP_CODE VALUE"
				+ " FROM XYG_ALD_LOOKUP_VALUES  "
				+ " WHERE LOOKUP_TYPE = :1 "
				+ " AND LANGUAGE = 'ZHS' "
				+ " AND ENABLED_FLAG='Y' "
				+ " AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1) "
				+ " ORDER BY 1 ";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", lookupType);
		return pagePub.qSqlForJson(sql, paramMap);
	}
	
	public String findForLookupByTag(String lookupType,String tag,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT MEANING DISPLAY,LOOKUP_CODE VALUE"
				+ " FROM XYG_ALD_LOOKUP_VALUES  "
				+ " WHERE LANGUAGE = 'ZHS' "
				+ " AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1) "
				+ " AND ENABLED_FLAG='Y' ");
		sqlBuff.append(SqlStmtPub.getAndStmt("LOOKUP_TYPE",lookupType,paramMap,true));
		sqlBuff.append(SqlStmtPub.getAndStmt("TAG",tag,paramMap,true));
		sqlBuff.append(" ORDER BY  1");
		return pagePub.qSqlForJson(sqlBuff.toString(), paramMap);
	}
	
}
