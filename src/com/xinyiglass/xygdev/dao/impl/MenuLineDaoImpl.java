package com.xinyiglass.xygdev.dao.impl;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.MenuLineDao;


import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("MenuLineDao")
public class MenuLineDaoImpl extends DevJdbcDaoSupport implements MenuLineDao{
	
	@Autowired
	MenuLineDaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}
	
	//自动序号递增，每次递增量为addCount
	public Long autoAddSequence(Long menuId) throws Exception{
		String addCount = "10";
		String sql="SELECT MAX(MENU_SEQUENCE)+"+addCount+" MENU_SEQUENCE FROM XYG_ALD_MENU_LINES WHERE MENU_ID = :1";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", menuId);
		Long seq = null;
		try{
			BigDecimal seqBD = (BigDecimal) this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap);
		    seq=seqBD.longValue();
		}catch(NullPointerException NullPointerException) {
			seq = 10L;
		}		
		return seq;
	}
	
	//Insert
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_MENU_PKG.INSERT_MENU_LINE( "
				+ "   :MENU_ID "
				+ "  ,:MENU_SEQUENCE "
				+ "  ,:SUB_MENU_ID "
				+ "  ,:FUNCTION_ID "
				+ "  ,:ENABLED_FLAG "	
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();	
		paramMap.put("MENU_ID", conditionMap.get("menuId"));
		paramMap.put("MENU_SEQUENCE", conditionMap.get("menuSequence"));
		paramMap.put("SUB_MENU_ID", conditionMap.get("subMenuId"));
		paramMap.put("FUNCTION_ID", conditionMap.get("functionId"));
		paramMap.put("ENABLED_FLAG", conditionMap.get("enabledFlag"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap) throws Exception{
		String sql = 
				"  begin "
				+ "  XYG_ALD_MENU_PKG.DELETE_MENU_LINE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("menuId"));
		paramMap.put("2", conditionMap.get("menuSeq"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}

}