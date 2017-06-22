package com.xinyiglass.xygdev.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcSubProcess;

import com.xinyiglass.xygdev.dao.GroupLineDao;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class GroupLineService {
	
	@Autowired
	GroupLineDao groupL;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Long autoAddSequence(Long groupId,Long loginId) throws Exception{
		return groupL.autoAddSequence(groupId);
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret= groupL.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = groupL.delete(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
