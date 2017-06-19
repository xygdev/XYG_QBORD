package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import com.xinyiglass.xygdev.entity.RespVO;

public interface RespVODao {

	public String findMenuId(Long respId) throws Exception;
	
	public SqlResultSet getResp(Long userId) throws Exception;
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue insert(RespVO vo) throws Exception;
	
	public PlsqlRetValue lock(RespVO vo) throws Exception;
	
	public PlsqlRetValue update(RespVO vo) throws Exception;
	
	public RespVO findById(Long id) throws Exception;
	
	public SqlResultSet findByIdForJSON(Long id) throws Exception;
}

