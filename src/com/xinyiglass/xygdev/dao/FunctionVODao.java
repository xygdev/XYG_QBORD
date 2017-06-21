package com.xinyiglass.xygdev.dao;

import com.xinyiglass.xygdev.entity.FunctionVO;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
public interface FunctionVODao {
	
	public PlsqlRetValue insert(FunctionVO vo) throws Exception;
	
	public PlsqlRetValue lock(FunctionVO vo) throws Exception;
	
	public PlsqlRetValue update(FunctionVO vo) throws Exception;
	
	public FunctionVO findById(Long id) throws Exception;
	
	public SqlResultSet findByIdForJSON(Long id) throws Exception;
}
