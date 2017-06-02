package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;

public interface LoginDao {
	public PlsqlRetValue handleLogin(Map<String,Object> conditionMap) throws Exception;
	public PlsqlRetValue logout(Long loginId) throws Exception;
}
