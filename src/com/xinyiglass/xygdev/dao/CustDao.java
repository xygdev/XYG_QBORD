package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;

public interface CustDao {
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue validate(Map<String,Object> conditionMap) throws Exception;
}
