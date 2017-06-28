package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.ItemsDao;

import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;
import xygdev.commons.util.TypeConvert;

@Repository("ItemsDao")
public class ItemsDaoImpl extends DevJdbcDaoSupport implements ItemsDao{
	
	@Autowired
	ItemsDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public void updateItemEnabledFlag(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "UPDATE XYG_QBI_ITEM_TP_B "
				   + "   SET QBORD_ENABLED_FLAG = :1 "
		           + " WHERE 1=1 "
		           + "   AND ITEM_ID = :2"
		           + "   AND ORGANIZATION_ID = :3";
		paramMap.put("1", conditionMap.get("enabledFlag"));
		paramMap.put("2", conditionMap.get("itemId"));
		paramMap.put("3", conditionMap.get("orgId"));
		this.getDevJdbcTemplate().execute(sql, paramMap);
	}
	
	public SqlResultSet findDetailById(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBI_ITEM_TP_B_V A WHERE 1=1 AND ITEM_ID = :1 AND ORGANIZATION_ID = :2";
		paramMap.put("1", conditionMap.get("itemId"));
		paramMap.put("2", conditionMap.get("orgId"));
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public Long countPic(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT COUNT(*) FROM XYG_QBI_ITEMTP_ADJUNCT_B WHERE 1=1 AND ITEM_ID = :1 AND ORGANIZATION_ID = :2 AND FILE_TYPE_CODE = :3";
		paramMap.put("1", conditionMap.get("itemId"));
		paramMap.put("2", conditionMap.get("orgId"));
        paramMap.put("3", conditionMap.get("fileTypeCode"));
		return TypeConvert.str2Long(this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap).toString());
	}
	
	public String findPicUrlByItemId(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT FILE_PATCH FROM XYG_QBI_ITEMTP_ADJUNCT_B WHERE 1=1 AND ITEM_ID = :1 AND ORGANIZATION_ID = :2 AND FILE_TYPE_CODE = :3";
		paramMap.put("1", conditionMap.get("itemId"));
		paramMap.put("2", conditionMap.get("orgId"));
		paramMap.put("3", conditionMap.get("fileTypeCode"));
		return this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap).toString();
	}
}
