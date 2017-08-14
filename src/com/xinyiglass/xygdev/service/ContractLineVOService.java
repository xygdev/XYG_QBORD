package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.ContractLineVODao;
import com.xinyiglass.xygdev.entity.ContractLineVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class ContractLineVOService {
	
	@Autowired
	PagePub pagePub;
	@Autowired
	ContractLineVODao cld;
	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findAutoAddSequence(Long headerId,Long loginId) throws Exception{
		Long Seq = cld.autoAddSequence(headerId);
		return "{\"rows\":[{\"LINE_NUM\":\""+Seq+"\"}]}";
	}	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public PlsqlRetValue getUnitPrice(Map<String,Object> conditionMap,Long loginId) throws Exception{
		return cld.getUnitPrice(conditionMap);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT A.*,(A.ORDER_QUANTITY*A.UNIT_PRICE) LINE_PRICE ");
		sqlBuff.append("  FROM XYG_QBORD_CONTRACT_LINES_V A");
		sqlBuff.append(" WHERE HEADER_ID = :1");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("headerId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findProductList(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("SELECT XQPBL.* ");
		sqlBuff.append("  FROM XYG_QBO_PRODUCT_BATCH_LIST XQPBL");
		sqlBuff.append("      ,XYG_QBO_PRODUCT_LINE_LIST XQPLL");
		sqlBuff.append(" WHERE 1=1");
		sqlBuff.append("   AND XQPLL.LIST_LINE_ID  = XQPBL.LIST_LINE_ID");
		sqlBuff.append("   AND XQPBL.ITEM_ID = :1");
		sqlBuff.append("   AND XQPBL.LIST_HEADER_ID = :2");
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		paramMap.put("1", conditionMap.get("itemId"));
		paramMap.put("2", conditionMap.get("productListId"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	//获取成本价与底价
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String getStandardPrice(Map<String,Object> conditionMap,Long loginId) throws Exception{
		return cld.findStandardPrice(conditionMap).toJsonStr();
	}
	
	//新增订单明细
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret=cld.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	//修改订单明细
	public PlsqlRetValue update(ContractLineVO lockClVO,ContractLineVO updateClVO,Long loginId) throws Exception{
		PlsqlRetValue ret = cld.lock(lockClVO);
		if(ret.getRetcode()==0){
			ret = cld.update(updateClVO);
		}else{
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	//删除订单明细
	public PlsqlRetValue delete(Long lineId,Long loginId) throws Exception{
		PlsqlRetValue ret = cld.delete(lineId);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}	
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public ContractLineVO findVOById(Long lineId,Long loginId) throws Exception{
		return cld.findVOById(lineId);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findJSONById(Long lineId,Long loginId) throws Exception{
		return cld.findJSONById(lineId).toJsonStr();
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String sumQuantityAndPrice(String contractNumber,Long loginId) throws Exception{
		return cld.sumQuantityAndPrice(contractNumber).toJsonStr();
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String sumQuantity(String contractNumber,Long loginId) throws Exception{
		return cld.sumQuantity(contractNumber).toJsonStr();
	}
}
