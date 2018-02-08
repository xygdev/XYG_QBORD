package com.xinyiglass.xygdev.dao;

import java.util.List;
import java.util.Map;

import com.xinyiglass.xygdev.entity.BatchExcel;
import com.xinyiglass.xygdev.entity.ContractLineVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;

public interface ContractLineVODao {
	public Long autoAddSequence(Long headerId) throws Exception;
	
	public PlsqlRetValue getUnitPrice(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue lock(ContractLineVO cl) throws Exception;
	
	public PlsqlRetValue update(ContractLineVO cl) throws Exception;
	
	public PlsqlRetValue delete(Long lineId) throws Exception;
	
	public ContractLineVO findVOById(Long lineId) throws Exception;
	
	public SqlResultSet findJSONById(Long lineId) throws Exception;
	
	public SqlResultSet countLineItem(Map<String,Object> conditionMap) throws Exception;
	
	public SqlResultSet findStandardPrice(Map<String,Object> conditionMap) throws Exception;
	
	public SqlResultSet sumQuantityAndPrice(String contractNumber) throws Exception;
	
	public SqlResultSet sumQuantity(String contractNumber) throws Exception;
	
	public void batchInsertTemp(List<BatchExcel> list,Map<String,Object> conditionMap) throws Exception;
	
	public PlsqlRetValue batchInsert(Map<String,Object> conditionMap) throws Exception;
}
