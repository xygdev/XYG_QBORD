package com.xinyiglass.xygdev.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.RespVODao;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.util.TypeConvert;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class RespVOService {
	@Autowired
	RespVODao respDao;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Long findMenuId(Long respId,Long loginId) throws Exception{
		return TypeConvert.str2Long(respDao.findMenuId(respId));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public SqlResultSet getResp(Long userId,Long loginId) throws Exception{
		return respDao.getResp(userId);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = respDao.assign(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
