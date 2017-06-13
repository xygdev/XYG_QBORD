package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;

//类似Lov的处理
@Service
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class ListService {

	@Autowired
	PagePub pagePub;
	
	public String findForUserType(Long loginId,String lang) throws Exception{
		String sql = "SELECT MEANING DISPLAY,LOOKUP_CODE VALUE"
				+ " FROM XYG_ALD_LOOKUP_VALUES  "
				+ " WHERE LOOKUP_TYPE = 'XYG_ALD_USER_TYPE' "
				+ " AND LANGUAGE = :1 "
				+ " AND ENABLED_FLAG='Y' "
				+ " AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1) "
				+ " ORDER BY LOOKUP_CODE";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", lang);
		return pagePub.qSqlForJson(sql, paramMap);
	}
	
	public String findForEnableFlag(Long loginId,String lang) throws Exception{
		String sql = "SELECT MEANING DISPLAY,LOOKUP_CODE VALUE"
				+ " FROM XYG_ALD_LOOKUP_VALUES  "
				+ " WHERE LOOKUP_TYPE = 'XYG_ALD_YN' "
				+ " AND LANGUAGE = :1 "
				+ " AND ENABLED_FLAG='Y' "
				+ " AND SYSDATE BETWEEN START_DATE_ACTIVE AND NVL(END_DATE_ACTIVE,SYSDATE+1) "
				+ " ORDER BY LOOKUP_CODE DESC";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", lang);
		return pagePub.qSqlForJson(sql, paramMap);
	}
	
}
