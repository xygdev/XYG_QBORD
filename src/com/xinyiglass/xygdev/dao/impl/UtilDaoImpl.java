package com.xinyiglass.xygdev.dao.impl;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.UtilDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;
import xygdev.commons.util.TypeConvert;

@Repository("UtilDao")
public class UtilDaoImpl extends DevJdbcDaoSupport implements UtilDao{
	
	@Autowired
	UtilDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public PlsqlRetValue applInit(Long loginId) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_GLOBAL_PKG.APPL_INIT( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", loginId);
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public Long getLoginId() throws Exception{
		//return this.getDevJdbcTemplate().queryForLong("select XYG_ALD_GLOBAL.LOGIN_ID from dual");
		String sql =" begin :1 := XYG_ALD_GLOBAL.LOGIN_ID;  end;";
		//定义输出参数
		Map<String,Integer> outParamMap=new HashMap<String,Integer>();
		outParamMap.put("1", Types.VARCHAR);
		Map<String,Object> outValueMap=this.getDevJdbcTemplate().execute(sql, new HashMap<String,Object>(),outParamMap);
		return TypeConvert.str2Long(outValueMap.get("1").toString());
	}
}
