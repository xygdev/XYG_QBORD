package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

public interface BroadcastDao {
	public SqlResultSet findContentById(Long broadcastId) throws Exception;
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception;
}
