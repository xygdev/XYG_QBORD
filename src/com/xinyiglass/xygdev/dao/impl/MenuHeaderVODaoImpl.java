package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

import com.xinyiglass.xygdev.dao.MenuHeaderVODao;

import com.xinyiglass.xygdev.entity.MenuHeaderVO;

import xygdev.commons.entity.PlsqlRetValue;

@Repository("MenuHeaderVODao")
public class MenuHeaderVODaoImpl  extends DevJdbcDaoSupport implements MenuHeaderVODao{
	
	@Autowired
	MenuHeaderVODaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public SqlResultSet findPersonalMenuById(Long menuId) throws Exception{
		//String sql = "SELECT DECODE(LEVEL,1,'',MENU_CODE) PREV_CODE,SUB_MENU_NAME NAME,SUB_MENU_CODE CODE,ICON_CODE ICON,FUNCTION_NAME FUNC,FUNCTION_HREF HREF FROM (SELECT * FROM XYG_ALB2B_MENU_LINES_V WHERE ENABLED_FLAG = 'Y') WHERE 1=1 CONNECT BY PRIOR SUB_MENU_ID = MENU_ID START WITH MENU_ID=:1 ORDER BY LEVEL,MENU_CODE,MENU_SEQUENCE";
		String sql = "SELECT DECODE(LEVEL,1,'',MENU_CODE) PREV_CODE,SUB_MENU_NAME NAME,SUB_MENU_CODE CODE,ICON_CODE ICON,FUNCTION_ID FUNC_ID,FUNCTION_NAME FUNC,FUNCTION_URL URL FROM (SELECT * FROM XYG_ALD_MENU_LINES_V WHERE ENABLED_FLAG = 'Y') WHERE 1=1 AND APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID CONNECT BY NOCYCLE PRIOR SUB_MENU_ID = MENU_ID START WITH MENU_ID=:1 ORDER BY LEVEL,MENU_CODE,MENU_SEQUENCE";
		//MODIFY BY BIRD 2016.12.12
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", menuId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	//Insert
	public PlsqlRetValue insert(MenuHeaderVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_MENU_PKG.INSERT_MENU_HEADER( "
				+ "   :MENU_ID "
				+ "  ,:MENU_CODE "
				+ "  ,:MENU_NAME "
				+ "  ,:DESCRIPTION "
				+ "  ,:MENU_ICON_ID "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("MENU_ID", vo.getMenuId());
		paramMap.put("MENU_CODE", vo.getMenuCode());
		paramMap.put("MENU_NAME", vo.getMenuName());
		paramMap.put("DESCRIPTION", vo.getDescription());
		paramMap.put("MENU_ICON_ID", vo.getIconId());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	//Lock
	public PlsqlRetValue lock(MenuHeaderVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_MENU_PKG.LOCK_MENU_HEADER( "
				+ "   :MENU_ID "
				+ "  ,:MENU_CODE "
				+ "  ,:MENU_NAME "
				+ "  ,:DESCRIPTION "
				+ "  ,:MENU_ICON_ID "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("MENU_ID", vo.getMenuId());
		paramMap.put("MENU_CODE", vo.getMenuCode());
		paramMap.put("MENU_NAME", vo.getMenuName());
		paramMap.put("DESCRIPTION", vo.getDescription());
		paramMap.put("MENU_ICON_ID", vo.getIconId());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	//Update
	public PlsqlRetValue update(MenuHeaderVO vo) throws Exception{
		String sql =
				"  begin "
				+ "  XYG_ALD_MENU_PKG.UPDATE_MENU_HEADER( "
				+ "   :MENU_ID "
				+ "  ,:MENU_CODE "
				+ "  ,:MENU_NAME "
				+ "  ,:DESCRIPTION "
				+ "  ,:MENU_ICON_ID "
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("MENU_ID", vo.getMenuId());
		paramMap.put("MENU_CODE", vo.getMenuCode());
		paramMap.put("MENU_NAME", vo.getMenuName());
		paramMap.put("DESCRIPTION", vo.getDescription());
		paramMap.put("MENU_ICON_ID", vo.getIconId());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
		
	public MenuHeaderVO findById(Long id) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
        String sql = "SELECT * FROM XYG_ALD_MENU_HEADERS_V WHERE MENU_ID = :1";
	    paramMap.put("1", id);
	    return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new MenuHeaderVO());
	}
	
	public SqlResultSet findByIdForJSON(Long id) throws Exception{
		String sql = "SELECT * FROM XYG_ALD_MENU_HEADERS_V WHERE MENU_ID = :1";
        Map<String,Object> paramMap=new  HashMap<String,Object>();
        paramMap.put("1", id);
        return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
}
