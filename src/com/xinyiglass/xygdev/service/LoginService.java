package com.xinyiglass.xygdev.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.entity.PlsqlRetValue;

import com.xinyiglass.xygdev.dao.LoginDao;
import com.xinyiglass.xygdev.util.Constant;
import com.xinyiglass.xygdev.util.MD5Util;

@Service
@Transactional(rollbackFor=Exception.class)
public class LoginService {
    @Autowired
    LoginDao loginDao;
	
    @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
    public PlsqlRetValue handleLogin(Map<String,Object> conditionMap) throws Exception{ 
    	conditionMap.put("password",MD5Util.string2MD5(conditionMap.get("password").toString(),Constant.SALT));
    	//password = MD5Util.string2MD5(password);
    	PlsqlRetValue ret=loginDao.handleLogin(conditionMap);
		return ret;    	
    }
    
    @Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
    public PlsqlRetValue logout(Long loginId) throws Exception{ 
    	PlsqlRetValue ret=loginDao.logout(loginId);
    	return ret;
    }
    
}
