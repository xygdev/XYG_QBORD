package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

import com.xinyiglass.xygdev.util.LogUtil;
import com.xinyiglass.xygdev.dao.UserVODao;
import com.xinyiglass.xygdev.entity.UserVO;


@Repository("UserVODao")
public class UserVODaoImpl extends DevJdbcDaoSupport implements UserVODao{
	
	@Autowired
	UserVODaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public UserVO findByUserName(String userName) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_USER_V WHERE USER_NAME = :1 AND RESP_APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id";
		paramMap.put("1", userName);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new UserVO());
	}
	
	public PlsqlRetValue updatePWD(Map<String,Object> conditionMap) throws Exception{
		String sql= "Declare "
				+	"   l_user_id number; "
				+	"begin "
				+ "  XYG_ALD_USER_PKG.UPDATE_PWD( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
				+ ",:"+PlsqlRetValue.RETCODE
				+ ",:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		LogUtil.log("UPDATE User ID:" + conditionMap.get("userId"));
		Map<String,Object> paramMap=new HashMap<String,Object>();
		System.out.println(conditionMap);
		paramMap.put("1", conditionMap.get("userId"));
		paramMap.put("2", conditionMap.get("oldPassword"));
		paramMap.put("3", conditionMap.get("newPassword"));
		
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
