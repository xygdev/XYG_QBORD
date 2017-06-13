package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

import com.xinyiglass.xygdev.entity.UserVO;

public interface UserVODao {
	
	public UserVO findByUserName(String userName) throws Exception;
	
	public PlsqlRetValue insert(UserVO u) throws Exception;
	
	public PlsqlRetValue lock(UserVO u) throws Exception;
	
	public PlsqlRetValue update(UserVO u) throws Exception;
	
	public PlsqlRetValue updatePWD(Map<String,Object> conditionMap) throws Exception;
	
	public UserVO findVOById(Long userId) throws Exception;
	
	public SqlResultSet findJSONById(Long userId) throws Exception;
}
