package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

public interface GroupHeaderVODao {
	
	public SqlResultSet getGroup(Long userId) throws Exception;
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap) throws Exception;
}
