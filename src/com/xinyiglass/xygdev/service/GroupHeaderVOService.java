package com.xinyiglass.xygdev.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcSubProcess;

import com.xinyiglass.xygdev.dao.GroupHeaderVODao;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class GroupHeaderVOService {
	@Autowired
	GroupHeaderVODao groupH;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public SqlResultSet getGroup(Long userId,Long loginId) throws Exception{
		return groupH.getGroup(userId);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = groupH.assign(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
