package com.xinyiglass.xygdev.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.ContractHeaderVODao;


import com.xinyiglass.xygdev.entity.ContractHeaderVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("ContractHeaderVODao")
public class ContractHeaderVODaoImpl extends DevJdbcDaoSupport implements ContractHeaderVODao{

	@Autowired
	ContractHeaderVODaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}
	
	public ContractHeaderVO findVOById(Long headerId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_HEADERS_V WHERE HEADER_ID = :1";
		paramMap.put("1", headerId);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new ContractHeaderVO());
	}
	
	public SqlResultSet findJSONById(Long headerId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_HEADERS_V WHERE HEADER_ID = :1";
		paramMap.put("1", headerId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public PlsqlRetValue insert(ContractHeaderVO ch) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.INSERT_CONTRACT_HEADER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
                + " ,:8"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ch.getHeaderId());
		paramMap.put("2", ch.getCustomerId());
		paramMap.put("3", ch.getSalesOrgId());
		paramMap.put("4", ch.getShipFromOrgId());
		//paramMap.put("5", ch.getPriceListId());
		paramMap.put("5", ch.getStatus());
		paramMap.put("6", ch.getCurrCode());
		paramMap.put("7", ch.getCustomerPo());
		paramMap.put("8", ch.getRemarks());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue lock(ContractHeaderVO ch) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.LOCK_CONTRACT_HEADER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
                + " ,:8"
                + " ,:9"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ch.getHeaderId());
		paramMap.put("2", ch.getCustomerId());
		paramMap.put("3", ch.getSalesOrgId());
		paramMap.put("4", ch.getShipFromOrgId());
		paramMap.put("5", ch.getPriceListId());
		paramMap.put("6", ch.getStatus());
		paramMap.put("7", ch.getCurrCode());
		paramMap.put("8", ch.getCustomerPo());
		paramMap.put("9", ch.getRemarks());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue update(ContractHeaderVO ch) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.UPDATE_CONTRACT_HEADER( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:6"
                + " ,:7"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ch.getHeaderId());
		paramMap.put("2", ch.getCustomerId());
		paramMap.put("3", ch.getSalesOrgId());
		paramMap.put("4", ch.getShipFromOrgId());
		paramMap.put("5", ch.getOrderTypeId());
		paramMap.put("6", ch.getCustomerPo());
		paramMap.put("7", ch.getRemarks());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue updateOrderType(ContractHeaderVO ch) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.UPDATE_ORDER_TYPE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", ch.getHeaderId());
		paramMap.put("2", ch.getOrderTypeId());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Long headerId) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.DELETE_CONTRACT_HEADER( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", headerId);
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue changeStatus(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.CHANGE_STATUS( "
				+ "  :1"
				+ " ,:2"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("headerId"));
		paramMap.put("2", conditionMap.get("newStatus"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
}
