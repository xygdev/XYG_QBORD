package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;

import com.xinyiglass.xygdev.entity.UserVO;

public interface UserVODao {
	
	public UserVO findByUserName(String userName) throws Exception;
	
	public PlsqlRetValue updatePWD(Map<String,Object> conditionMap) throws Exception;

}
