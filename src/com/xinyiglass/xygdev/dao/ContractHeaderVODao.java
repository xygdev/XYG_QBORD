package com.xinyiglass.xygdev.dao;

import java.util.Map;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

import com.xinyiglass.xygdev.entity.ContractHeaderVO;

public interface ContractHeaderVODao {
	public ContractHeaderVO findVOById(Long headerId) throws Exception;
	
	public SqlResultSet findJSONById(Long headerId) throws Exception;
	
	public PlsqlRetValue insert(ContractHeaderVO ch) throws Exception;
	
	public PlsqlRetValue lock(ContractHeaderVO ch) throws Exception;
	
	public PlsqlRetValue update(ContractHeaderVO ch) throws Exception;
	
	public PlsqlRetValue updateOrderType(ContractHeaderVO ch) throws Exception;
	
	public PlsqlRetValue delete(Long headerId) throws Exception;
	
	public PlsqlRetValue changeStatus(Map<String,Object> conditionMap) throws Exception;
}
