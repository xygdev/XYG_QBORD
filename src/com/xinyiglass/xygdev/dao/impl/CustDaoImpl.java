package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.CustDao;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("CustDao")
public class CustDaoImpl extends DevJdbcDaoSupport implements CustDao{
	
	@Autowired
	CustDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_USER_PKG.INSERT_USER_CUST( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", null);
		paramMap.put("2", conditionMap.get("userId"));
		paramMap.put("3", conditionMap.get("orgId"));
		paramMap.put("4", conditionMap.get("customerId"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue validate(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_USER_PKG.VALIDATE_USER_CUST( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("userCustId"));
		paramMap.put("2", conditionMap.get("action"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
