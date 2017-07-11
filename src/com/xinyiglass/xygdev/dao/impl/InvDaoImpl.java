package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




import com.xinyiglass.xygdev.dao.InvDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("PermissionDao")
public class InvDaoImpl extends DevJdbcDaoSupport implements InvDao{
	
	@Autowired
	InvDaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}

	//Insert
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_QBORD_INV_PERMISSION_PKG.INSERT_INV_PERMISSION( "
				+ "   :PERMISSION_ID "
				+ "  ,:USER_ID  "
				+ "  ,:ORGANIZATION_ID "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("PERMISSION_ID", conditionMap.get("permissionId"));
		paramMap.put("USER_ID", conditionMap.get("userId"));
		paramMap.put("ORGANIZATION_ID", conditionMap.get("organizationId"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap) throws Exception{
		String sql = 
				"  begin "
				+ "  XYG_QBORD_INV_PERMISSION_PKG.DELETE_INV_PERMISSION( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("permissionId"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}

	public PlsqlRetValue validate(Map<String,Object> conditionMap) throws Exception{
		String sql = 
				"  begin "
				+ "  XYG_QBORD_INV_PERMISSION_PKG.VALIDATE_INV_PERMISSION( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("permissionId"));
		paramMap.put("2", conditionMap.get("action"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
}
