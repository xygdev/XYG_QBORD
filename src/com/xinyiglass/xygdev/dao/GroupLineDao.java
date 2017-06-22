package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;

public interface GroupLineDao {
	
	public Long autoAddSequence(Long groupId) throws Exception;
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap) throws Exception;
}
