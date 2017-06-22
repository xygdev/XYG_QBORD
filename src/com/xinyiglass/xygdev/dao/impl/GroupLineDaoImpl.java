package com.xinyiglass.xygdev.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.GroupLineDao;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("GroupLineDao")
public class GroupLineDaoImpl extends DevJdbcDaoSupport implements GroupLineDao{
	
	@Autowired
	GroupLineDaoImpl(DataSource dataSource) {
	    setDataSource(dataSource);
	}
	
	//自动序号递增，每次递增量为addCount
	public Long autoAddSequence(Long groupId) throws Exception{
		String addCount = "10";
		String sql="SELECT MAX(GROUP_SEQUENCE)+"+addCount+" GROUP_SEQUENCE FROM XYG_ALD_GROUP_LINES WHERE GROUP_ID = :1";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", groupId);
		Long seq = null;
		try{
			BigDecimal seqBD = (BigDecimal) this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap);
		    seq=seqBD.longValue();
		}catch(NullPointerException NullPointerException) {
			seq = 10L;
		}		
		return seq;
	}	
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_group_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.INSERT_GROUP_L( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"  
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("groupId"));
		paramMap.put("2", conditionMap.get("groupSeq"));
		paramMap.put("3", conditionMap.get("subGroupId"));
		paramMap.put("4", conditionMap.get("custId"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_group_id number; "
				+ "  begin "
				+ "  XYG_ALD_GROUP_PKG.DELETE_GROUP_L( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("groupId"));
		paramMap.put("2", conditionMap.get("groupSeq"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
