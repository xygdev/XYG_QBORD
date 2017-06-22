package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.GroupHeaderVODao;
import com.xinyiglass.xygdev.entity.GroupHeaderVO;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("GroupHeaderVODao")
public class GroupHeaderVODaoImpl extends DevJdbcDaoSupport implements GroupHeaderVODao{
	
	@Autowired
	GroupHeaderVODaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	public SqlResultSet getGroup(Long userId) throws Exception{
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT GROUP_ID,GROUP_NAME,CASE WHEN SYSDATE BETWEEN START_DATE AND NVL(END_DATE,SYSDATE+1)THEN 'Y' ELSE 'N' END ENABLED_FLAG ");
		sqlBuff.append("  FROM XYG_ALD_USER_GROUP_V");
		sqlBuff.append(" WHERE USER_ID = :1");
		sqlBuff.append("   AND GROUP_APPL_ID = XYG_ALD_GLOBAL_PKG.APPL_ID");
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", userId);
		return this.getDevJdbcTemplate().queryForResultSet(sqlBuff.toString(), paramMap);
	}
	
	public PlsqlRetValue assign(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_user_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.ASSIGN_USER_GROUP( "
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
		paramMap.put("3", conditionMap.get("groupId"));
		paramMap.put("4", conditionMap.get("enabledFlag"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue insert(GroupHeaderVO ghVO) throws Exception{
		String sql ="Declare "
				+ "     l_group_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.INSERT_GROUP_H( "
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
		paramMap.put("2", ghVO.getGroupCode());
		paramMap.put("3", ghVO.getGroupName());
		paramMap.put("4", ghVO.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue lock(GroupHeaderVO ghVO) throws Exception{
		String sql ="Declare "
				+ "     l_group_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.LOCK_GROUP_H( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"  
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ghVO.getGroupId());
		paramMap.put("2", ghVO.getGroupCode());
		paramMap.put("3", ghVO.getGroupName());
		paramMap.put("4", ghVO.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue update(GroupHeaderVO ghVO) throws Exception{
		String sql ="Declare "
				+ "     l_group_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.UPDATE_GROUP_H( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"  
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ghVO.getGroupId());
		paramMap.put("2", ghVO.getGroupCode());
		paramMap.put("3", ghVO.getGroupName());
		paramMap.put("4", ghVO.getDescription());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public GroupHeaderVO findVOById(Long groupId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_GROUP_HEADERS_V WHERE GROUP_ID = :1";
		paramMap.put("1", groupId);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new GroupHeaderVO());
	}
	
	public SqlResultSet findJSONById(Long groupId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_ALD_GROUP_HEADERS_V WHERE GROUP_ID = :1";
		paramMap.put("1", groupId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
}
