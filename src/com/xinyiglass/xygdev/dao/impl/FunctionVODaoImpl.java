package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.FunctionVODao;
import com.xinyiglass.xygdev.entity.FunctionVO;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("FunctionVODao")
public class FunctionVODaoImpl extends DevJdbcDaoSupport implements FunctionVODao{

	@Autowired
	FunctionVODaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}
	
	//Insert
	public PlsqlRetValue insert(FunctionVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_FUNCTIONS_PKG.INSERT_FUNCTION( "
				+ "   :FUNCTION_ID "		
				+ "  ,:FUNCTION_CODE "
				+ "  ,:FUNCTION_NAME "
				+ "  ,:FUNCTION_URL "
				+ "  ,:FUNCTION_ICON_ID "
				+ "  ,:DESCRIPTION "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("FUNCTION_ID", vo.getFunctionId());
		paramMap.put("FUNCTION_CODE", vo.getFunctionCode());
		paramMap.put("FUNCTION_NAME", vo.getFunctionName());
		paramMap.put("FUNCTION_URL", vo.getFunctionUrl());
		paramMap.put("FUNCTION_ICON_ID", vo.getIconId());
		paramMap.put("DESCRIPTION", vo.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	//Lock
	public PlsqlRetValue lock(FunctionVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_FUNCTIONS_PKG.LOCK_FUNCTION( "
				+ "   :FUNCTION_ID "
				+ "  ,:FUNCTION_CODE "
				+ "  ,:FUNCTION_NAME "
				+ "  ,:FUNCTION_URL "
				+ "  ,:FUNCTION_ICON_ID "
				+ "  ,:DESCRIPTION "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("FUNCTION_ID", vo.getFunctionId());
		paramMap.put("FUNCTION_CODE", vo.getFunctionCode());
		paramMap.put("FUNCTION_NAME", vo.getFunctionName());
		paramMap.put("FUNCTION_URL", vo.getFunctionUrl());
		paramMap.put("FUNCTION_ICON_ID", vo.getIconId());
		paramMap.put("DESCRIPTION", vo.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	//Update
	public PlsqlRetValue update(FunctionVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_FUNCTIONS_PKG.UPDATE_FUNCTION( "
				+ "   :FUNCTION_ID "
				+ "  ,:FUNCTION_CODE "
				+ "  ,:FUNCTION_NAME "
				+ "  ,:FUNCTION_URL "
				+ "  ,:FUNCTION_ICON_ID "
				+ "  ,:DESCRIPTION "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("FUNCTION_ID", vo.getFunctionId());
		paramMap.put("FUNCTION_CODE", vo.getFunctionCode());
		paramMap.put("FUNCTION_NAME", vo.getFunctionName());
		paramMap.put("FUNCTION_URL", vo.getFunctionUrl());
		paramMap.put("FUNCTION_ICON_ID", vo.getIconId());
		paramMap.put("DESCRIPTION", vo.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}

	@Override
	public FunctionVO findById(Long id) throws Exception {
	    Map<String,Object> paramMap=new  HashMap<String,Object>();
        String sql = "SELECT * FROM XYG_ALD_FUNCTIONS_V WHERE FUNCTION_ID = :1";
	    paramMap.put("1", id);
	    return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new FunctionVO());
	}

	@Override
	public SqlResultSet findByIdForJSON(Long id) throws Exception {
		String sql = "SELECT * FROM XYG_ALD_FUNCTIONS_V WHERE FUNCTION_ID = :1";
        Map<String,Object> paramMap=new  HashMap<String,Object>();
        paramMap.put("1", id);
        return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}

}
