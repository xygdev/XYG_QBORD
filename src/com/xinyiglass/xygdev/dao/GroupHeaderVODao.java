package com.xinyiglass.xygdev.dao;

import java.util.Map;

import com.xinyiglass.xygdev.entity.GroupHeaderVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

public interface GroupHeaderVODao {
	
	public SqlResultSet getGroup(Long userId) throws Exception;
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue insert(GroupHeaderVO ghVO) throws Exception;
	
	public PlsqlRetValue lock(GroupHeaderVO ghVO) throws Exception;
	
	public PlsqlRetValue update(GroupHeaderVO ghVO) throws Exception;
	
	public GroupHeaderVO findVOById(Long groupId) throws Exception;
	
	public SqlResultSet findJSONById(Long groupId) throws Exception;
}
