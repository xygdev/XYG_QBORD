package com.xinyiglass.xygdev.dao.impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xinyiglass.xygdev.dao.ContractLineVODao;
import com.xinyiglass.xygdev.entity.ContractLineVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.springjdbc.DevJdbcDaoSupport;

@Repository("ContractLineVODao")
public class ContractLineVODaoImpl extends DevJdbcDaoSupport implements ContractLineVODao{
	
	@Autowired
	ContractLineVODaoImpl(DataSource dataSource) {
		setDataSource(dataSource);
	}
	
	//自动序号递增，每次递增量为addCount
	public Long autoAddSequence(Long headerId) throws Exception{
		String addCount = "1";
		String sql="SELECT MAX(LINE_NUM)+"+addCount+" LINE_NUM FROM XYG_QBORD_CONTRACT_LINES WHERE HEADER_ID = :1";
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		paramMap.put("1", headerId);
		Long seq = null;
		try{
			BigDecimal seqBD = (BigDecimal) this.getDevJdbcTemplate().queryForObjSingle(sql, paramMap);
		    seq=seqBD.longValue();
		}catch(NullPointerException NullPointerException) {
			seq = 1L;
		}		
		return seq;
	}	
	
	
	
	public PlsqlRetValue getUnitPrice(Map<String,Object> conditionMap) throws Exception{
		String sql ="Declare "
				+ "     l_header_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.GET_UNIT_PRICE_BY_LIST( "
				+ "  :1"
				+ " ,:2"
				+ " ,SYSDATE"
                + " ,:3"
                + " ,:4"
                + " ,:5"
                + " ,:"+PlsqlRetValue.PARAM1
                + " ,:"+PlsqlRetValue.PARAM2
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", conditionMap.get("inventoryItemId"));
		paramMap.put("2", conditionMap.get("orgId"));
		//paramMap.put("3", "SYSDATE");
		paramMap.put("3", conditionMap.get("currCode"));
		paramMap.put("4", conditionMap.get("priceListId"));
		paramMap.put("5", conditionMap.get("orderQuantity"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap) throws Exception{
		SqlResultSet srs = countLineItem(conditionMap);
		String count = srs.getResultSet().get(0)[0].toString();
		System.out.println(count);
		if(!count.equals("0")){
			PlsqlRetValue ret = new PlsqlRetValue();
			ret.setRetcode(2);
			ret.setErrbuf("此型号产品再订单明细中已存在,请勿重复新增同型号产品");
			return ret;
		}
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.INSERT_CONTRACT_LINE( "
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
		paramMap.put("1", conditionMap.get("lineId"));
		paramMap.put("2", conditionMap.get("headerId"));
		paramMap.put("3", conditionMap.get("lineNum"));
		paramMap.put("4", conditionMap.get("inventoryItemId"));
		paramMap.put("5", conditionMap.get("shipFromOrgId"));
		paramMap.put("6", conditionMap.get("orderQuantity"));
		paramMap.put("7", conditionMap.get("currCode"));
		paramMap.put("8", conditionMap.get("priceListId"));
		paramMap.put("9", conditionMap.get("remarks"));
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue lock(ContractLineVO cl) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.LOCK_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", cl.getLineId());
		paramMap.put("2", cl.getOrderQuantity());
		paramMap.put("3", cl.getUnitPrice());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue update(ContractLineVO cl) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.UPDATE_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:2"
				+ " ,:3"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", cl.getLineId());
		paramMap.put("2", cl.getOrderQuantity());
		paramMap.put("3", cl.getUnitPrice());
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public PlsqlRetValue delete(Long lineId) throws Exception{
		String sql ="Declare "
				+ "     l_line_id number; "
				+ "  begin "
				+ "  XYG_QBORD_CONTRACT_PKG.DELETE_CONTRACT_LINE( "
				+ "  :1"
				+ " ,:"+PlsqlRetValue.RETCODE
				+ " ,:"+PlsqlRetValue.ERRBUF
				+ " ); "
				+ "end;";
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().executeForRetValue(sql, paramMap);
	}
	
	public ContractLineVO findVOById(Long lineId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_LINES_V WHERE LINE_ID = :1";
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().queryForObject(sql, paramMap, new ContractLineVO());
	}
	
	public SqlResultSet findJSONById(Long lineId) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBORD_CONTRACT_LINES_V WHERE LINE_ID = :1";
		paramMap.put("1", lineId);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public SqlResultSet countLineItem(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT COUNT(*) FROM XYG_QBORD_CONTRACT_LINES WHERE HEADER_ID = :1 AND INVENTORY_ITEM_ID = :2";
		paramMap.put("1", conditionMap.get("headerId"));
		paramMap.put("2", conditionMap.get("inventoryItemId"));
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	public SqlResultSet findStandardPrice(Map<String,Object> conditionMap) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT * FROM XYG_QBO_PRODUCT_LINE_LIST WHERE ITEM_ID = :1 AND LIST_HEADER_ID = :2";
		paramMap.put("1", conditionMap.get("itemId"));
		paramMap.put("2", conditionMap.get("productListId"));
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	}
	
	//汇总订单数量与金额
	public SqlResultSet sumQuantityAndPrice(String contractNumber) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		String sql = "SELECT SUM(ORDER_QUANTITY) TOTAL_QUANTITY,SUM(ORDER_QUANTITY*UNIT_PRICE) TOTAL_PRICE FROM XYG_QBORD_CONTRACT_LINES XQCL,XYG_QBORD_CONTRACT_HEADERS XQCH WHERE XQCL.HEADER_ID = XQCH.HEADER_ID AND XQCH.CONTRACT_NUMBER = :1";
		paramMap.put("1", contractNumber);
		return this.getDevJdbcTemplate().queryForResultSet(sql, paramMap);
	
	}
	
	//汇总需求量，订单量，备货量，需求量
	public SqlResultSet sumQuantity(String contractNumber) throws Exception{
		Map<String,Object> paramMap=new  HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT SUM(REQUIRED_QUANTITY) REQUIRED_QTY,SUM(ORDER_QUANTITY) ORDER_QTY,SUM(BH_QTY) BH_QTY,SUM(FH_QTY) FH_QTY");
		sqlBuff.append("  FROM (SELECT XQCQ.*,XQCL.ORDER_QUANTITY REQUIRED_QUANTITY ");
		sqlBuff.append("          FROM XYG_QBORD_CONTRACT_QUERY_V XQCQ");
		sqlBuff.append("              ,XYG_QBORD_CONTRACT_HEADERS XQCH");
		sqlBuff.append("              ,XYG_QBORD_CONTRACT_LINES XQCL");
		sqlBuff.append("         WHERE 1=1");
		sqlBuff.append("           AND XQCQ.CUS_BATCH = :1");
		sqlBuff.append("           AND XQCH.CONTRACT_NUMBER = XQCQ.CUS_BATCH");
		sqlBuff.append("           AND XQCL.HEADER_ID = XQCH.HEADER_ID");
		sqlBuff.append("           AND XQCQ.LINE_NUM = XQCL.LINE_NUM)");
		paramMap.put("1", contractNumber);
		return this.getDevJdbcTemplate().queryForResultSet(sqlBuff.toString(), paramMap);
	}
}
