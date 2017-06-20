package com.xinyiglass.xygdev.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;
import xygdev.commons.util.TypeConvert;

import com.xinyiglass.xygdev.dao.BroadcastDao;

@Repository("BroadcastDao")
public class BroadcastDaoImpl extends DevJdbcDaoSupport implements BroadcastDao{
	
	@Autowired
	BroadcastDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public SqlResultSet findContentById(Long broadcastId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_BROADCAST_V WHERE BROADCAST_ID = :1 AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID";
		paramMap.put("1", broadcastId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public SqlResultSet findValidBroadcast() throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_BROADCAST_V WHERE 1 = 1 AND SYSDATE BETWEEN START_DATE AND END_DATE AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID ORDER BY START_DATE DESC";
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public SqlResultSet countValidBroadcast() throws Exception{
		Map<String,Object> paramMap = new HashMap<String,Object>();
		String sql = "SELECT COUNT(*) COUNT FROM XYG_ALD_BROADCAST_V WHERE 1 = 1 AND SYSDATE BETWEEN START_DATE AND END_DATE AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID ORDER BY START_DATE DESC";
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_broadcast_id number; "
				+ "  begin "
				+ "  XYG_ALD_BROADCAST_PKG.INSERT_BROADCAST( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", null);
		if(conditionMap.get("startDate")==null||"".equals(conditionMap.get("startDate"))){
			paramMap.put("2", TypeConvert.u2tDate(new Date()));
		}else{
			paramMap.put("2", TypeConvert.str2Timestamp(TypeConvert.type2Str(conditionMap.get("startDate"))));
		}	
		paramMap.put("3", TypeConvert.str2Timestamp(TypeConvert.type2Str(conditionMap.get("endDate"))));
		paramMap.put("4", conditionMap.get("broadcastTitle").toString());
		paramMap.put("5", conditionMap.get("broadcastContent").toString());
		//paramMap.put("5", this.getOracleCLOB(conditionMap.get("broadcastContent").toString()));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
