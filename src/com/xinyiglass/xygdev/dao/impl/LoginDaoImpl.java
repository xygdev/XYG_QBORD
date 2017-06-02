package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

import com.xinyiglass.xygdev.dao.LoginDao;

@Repository("LoginDao")
public class LoginDaoImpl extends DevJdbcDaoSupport implements LoginDao{
    
	@Autowired
	LoginDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public PlsqlRetValue handleLogin(Map<String,Object> conditionMap) throws Exception{	
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_LOGIN_PKG.HANDLE_LOGIN( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
				+ " ,:4"
				+ " ,:5"
				+ " ,:"+PlsqlRetValue.PARAM1
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("userName"));
		paramMap.put("2", conditionMap.get("applCode"));
		paramMap.put("3", conditionMap.get("password"));
		paramMap.put("4", conditionMap.get("lang"));
		paramMap.put("5", conditionMap.get("ipAddress"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue logout(Long loginId) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_LOGIN_PKG.LOGOUT( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", loginId);
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}

