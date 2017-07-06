package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;
import xygdev.commons.util.TypeConvert;

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
		String sql = "SELECT * FROM XYG_ALD_USER_V WHERE USER_NAME = :1";
		paramMap.put("1", userName);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new UserVO());
	}
	
	public PlsqlRetValue insert(UserVO u) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_USER_PKG.INSERT_USER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
                + " ,:8"
                + " ,:9"
                + " ,:10"
                + " ,:11"
                + " ,:12"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", u.getUserId());
		paramMap.put("2", u.getUserName());
		paramMap.put("3", u.getDescription());
		paramMap.put("4", TypeConvert.u2tDate(u.getStartDate()));
		paramMap.put("5", TypeConvert.u2tDate(u.getEndDate()));
		paramMap.put("6", u.getEncryptedUserPassword());
		paramMap.put("7", u.getUserType());
		paramMap.put("8", u.getEmpId());
		paramMap.put("9", u.getImgUrl());
		paramMap.put("10", u.getWechatCode());
		paramMap.put("11", u.getMobileNumber());
		paramMap.put("12", u.getEmailAddr());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	//lock
	public PlsqlRetValue lock(UserVO u) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_USER_PKG.LOCK_USER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
                + " ,:8"
                + " ,:9"
                + " ,:10"
                + " ,:11"
                + " ,:12"
                + " ,:13"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		LogUtil.log("LOCK Emp ID:"+u.getUserId());
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", u.getUserId());
		paramMap.put("2", u.getUserName());
		paramMap.put("3", u.getDescription());
		paramMap.put("4", TypeConvert.u2tDate(u.getStartDate()));
		paramMap.put("5", TypeConvert.u2tDate(u.getEndDate()));
		paramMap.put("6", u.getEncryptedUserPassword());
		paramMap.put("7", TypeConvert.u2tDate(u.getPasswordDate()));
		paramMap.put("8", u.getUserType());
		paramMap.put("9", u.getEmpId());
		paramMap.put("10", u.getImgUrl());
		paramMap.put("11", u.getWechatCode());
		paramMap.put("12", u.getMobileNumber());
		paramMap.put("13", u.getEmailAddr());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);	
	}	
	
	//update
	public PlsqlRetValue update(UserVO u) throws Exception{
		String sql = "Declare "
				+	"  l_user_id number; "
				+	"begin "
				+ "  XYG_ALD_USER_PKG.UPDATE_USER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
	            + " ,:4"
	            + " ,:5"
	            + " ,:6"
                + " ,:7"
                + " ,:8"
	            + " ,:9"
	            + " ,:10"
	            + " ,:11"
	            + " ,:12"
	            + " ,:13"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		LogUtil.log("UPDATE Emp ID:"+u.getUserId());
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", u.getUserId());
		paramMap.put("2", u.getUserName());
		paramMap.put("3", u.getDescription());
		paramMap.put("4", TypeConvert.u2tDate(u.getStartDate()));
		paramMap.put("5", TypeConvert.u2tDate(u.getEndDate()));
		paramMap.put("6", u.getEncryptedUserPassword());
		paramMap.put("7", TypeConvert.u2tDate(u.getPasswordDate()));
		paramMap.put("8", u.getUserType());
		paramMap.put("9", u.getEmpId());
		paramMap.put("10", u.getImgUrl());
		paramMap.put("11", u.getWechatCode());
		paramMap.put("12", u.getMobileNumber());
		paramMap.put("13", u.getEmailAddr());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);	
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
	
	public PlsqlRetValue updatePriceLimit(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_USER_PKG.UPDATE_PRICE_LIMIT( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("userId"));
		paramMap.put("2", conditionMap.get("action"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public UserVO findVOById(Long userId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_USER_V WHERE USER_ID = :1";
		paramMap.put("1", userId);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new UserVO());
	}
	
	public SqlResultSet findJSONById(Long userId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_USER_V WHERE USER_ID = :1";
		paramMap.put("1", userId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public String findAllUsers() throws Exception{
		String userGroup = null;
		String sql = "SELECT USER_ID FROM XYG_ALD_USER_RESP WHERE RESP_APPL_ID = XYG_ALD_GLOBAL.APPL_ID";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		SqlResultSet rs = this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
		for(int i=0;i<rs.getResultSet().size();i++){
			if(i==0){
				userGroup=(rs.getResultSet().get(i)[0]).toString();
			}else{
				userGroup=userGroup+","+(rs.getResultSet().get(i)[0]).toString();
			}
		}
		return userGroup;
	}
}
