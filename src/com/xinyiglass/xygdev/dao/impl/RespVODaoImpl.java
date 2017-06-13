package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
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
	
	public SqlResultSet getResp(Long userId) throws Exception{
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT RESP_ID,RESP_NAME,CASE WHEN SYSDATE BETWEEN START_DATE AND NVL(END_DATE,SYSDATE+1)THEN 'Y' ELSE 'N' END ENABLED_FLAG ");
		sqlBuff.append("  FROM XYG_ALD_USER_RESP_V");
		sqlBuff.append(" WHERE USER_ID = :1");
		sqlBuff.append("   AND RESP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID");
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", userId);
		return this.getDevJdbcTemplate().queryForResultSet(sqlBuff.toString(), paramMap);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_RESP_PKG.ASSIGN_USER_RESP( "
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
		paramMap.put("3", conditionMap.get("respId"));
		paramMap.put("4", conditionMap.get("enabledFlag"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
