package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.springjdbc.DevJdbcDaoSupport;

import com.xinyiglass.xygdev.dao.RespVODao;

@Repository("RespVODao")
public class RespVODaoImpl extends DevJdbcDaoSupport implements RespVODao{
	
	@Autowired
	RespVODaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public String findMenuId(Long respId) throws Exception{
		String sql = "SELECT MENU_ID FROM XYG_ALD_RESP WHERE RESP_ID = :1";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", respId);
		return this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap).toString();
	}
}
