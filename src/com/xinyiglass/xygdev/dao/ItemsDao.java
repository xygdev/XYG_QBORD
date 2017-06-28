package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.SqlResultSet;

public interface ItemsDao {
	
	public void updateItemEnabledFlag(Map<String,Object> conditionMap) throws Exception;
	
	public SqlResultSet findDetailById(Map<String,Object> conditionMap) throws Exception;
	
	public Long countPic(Map<String,Object> conditionMap) throws Exception;
	
	public String findPicUrlByItemId(Map<String,Object> conditionMap) throws Exception;
}
