package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.entity.ContractHeaderVO;
import com.xinyiglass.xygdev.entity.ContractLineVO;
import com.xinyiglass.xygdev.service.ContractHeaderVOService;
import com.xinyiglass.xygdev.service.ContractLineVOService;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/contract")
@Scope("prototype")
public class ContractController extends BaseController {
	
	@Autowired
	ContractHeaderVOService CHS;
	@Autowired
	ContractLineVOService CLS;
	
	@RequestMapping("/contractManage.do")
	public String listContract(){
		return this.getSessionAttr("LANG")+"/xygQbordContractManage";
	}
	
	@RequestMapping("/orderSchedule.do")
	public String orderSchedule(){
		return this.getSessionAttr("LANG")+"/xygQbordOrderSchedule";
	}
	

	@RequestMapping("/orderScheduleDetail.do")
	public String orderScheduleDetail(){
		return this.getSessionAttr("LANG")+"/xygQbordOrderScheduleDetail";
	}
	
	@RequestMapping(value = "/getTransferContractDetail.do", method = RequestMethod.POST)
	public void getTransferContractDetailPage() throws Exception
	{   
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
		conditionMap.put("contractNumber", this.getPara("CONTRACT_NUMBER"));
		conditionMap.put("shipFromOrgId", this.getParaToLong("ORGANIZATION_ID"));
		conditionMap.put("salesOrgId", this.getParaToLong("ORG_ID"));
		conditionMap.put("customerId", this.getParaToLong("CUSTOMER_ID"));
		conditionMap.put("description", this.getPara("DESCRIPTION"));
		conditionMap.put("carname", this.getPara("CARNAME"));
		conditionMap.put("creationDate_F", this.getParaToDate("CREATION_DATE_F"));
		conditionMap.put("creationDate_T", this.getParaToDate("CREATION_DATE_T"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CHS.findForTransferDetailPage(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getTransferContractH.do", method = RequestMethod.POST)
	public void getTransferContractPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
		conditionMap.put("contractNumber", this.getPara("CONTRACT_NUMBER"));
		conditionMap.put("shipFromOrgId", this.getParaToLong("ORGANIZATION_ID"));
		conditionMap.put("salesOrgId", this.getParaToLong("ORG_ID"));
		conditionMap.put("customerId", this.getParaToLong("CUSTOMER_ID"));
		conditionMap.put("creationDate_F", this.getParaToDate("CREATION_DATE_F"));
		conditionMap.put("creationDate_T", this.getParaToDate("CREATION_DATE_T"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CHS.findForTransferPage(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getTransferContractL.do", method = RequestMethod.POST)
	public void getTransferContractLine() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("cusBatch", this.getPara("CUS_BATCH"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CHS.findForTransferPageL(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getContractH.do", method = RequestMethod.POST)
	public void getContractPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
		conditionMap.put("contractNumber", this.getPara("CONTRACT_NUMBER"));
		conditionMap.put("shipFromOrgId", this.getParaToLong("ORGANIZATION_ID"));
		conditionMap.put("salesOrgId", this.getParaToLong("ORG_ID"));
		conditionMap.put("customerId", this.getParaToLong("CUSTOMER_ID"));
		conditionMap.put("creationDate_F", this.getParaToDate("CREATION_DATE_F"));
		conditionMap.put("creationDate_T", this.getParaToDate("CREATION_DATE_T"));
		conditionMap.put("status", this.getPara("STATUS"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CHS.findForPage(conditionMap, loginId));
	}

	@RequestMapping(value = "/insertH", method = RequestMethod.POST)
	public void insertH() throws Exception
	{
		ContractHeaderVO ch = new ContractHeaderVO();
		ch.setCustomerId(this.getParaToLong("CUSTOMER_ID"));
		ch.setSalesOrgId(this.getParaToLong("SALES_ORG_ID"));
		ch.setShipFromOrgId(this.getParaToLong("SHIP_FROM_ORG_ID"));
		ch.setStatus("INPUT");
		ch.setCurrCode(this.getPara("CURR_CODE"));
		ch.setCustomerPo(this.getPara("CUSTOMER_PO"));
		ch.setRemarks(this.getPara("REMARKS"));
		this.renderStr(CHS.insert(ch, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/preUpdateH.do", method = RequestMethod.POST)
	public void preUpdateH() throws Exception
	{
		Long headerId = this.getParaToLong("HEADER_ID");
		ContractHeaderVO ch = CHS.findVOById(headerId, loginId);
		this.setSessionAttr("LockCHV", ch);
		this.renderStr(CHS.findJSONById(headerId, loginId));
	}
	
	@RequestMapping(value = "/updateH.do", method = RequestMethod.POST)
	public void updateH() throws Exception
	{ 
		Long headerId = this.getParaToLong("HEADER_ID");
		ContractHeaderVO lockChVO = (ContractHeaderVO)this.getSessionAttr("LockCHV");
		if (lockChVO ==null){
			throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!headerId.equals(lockChVO.getHeaderId())){
			throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		ContractHeaderVO ch = new ContractHeaderVO();
		ch = (ContractHeaderVO)lockChVO.clone();
		ch.setHeaderId(this.getParaToLong("HEADER_ID"));
		ch.setCustomerId(this.getParaToLong("CUSTOMER_ID"));
		ch.setSalesOrgId(this.getParaToLong("SALES_ORG_ID"));
		ch.setShipFromOrgId(this.getParaToLong("SHIP_FROM_ORG_ID"));
		ch.setOrderTypeId(this.getParaToLong("ORDER_TYPE_ID"));
		ch.setCurrCode(this.getPara("CURR_CODE"));
		ch.setCustomerPo(this.getPara("CUSTOMER_PO"));
		ch.setRemarks(this.getPara("REMARKS"));
		this.renderStr(CHS.update(lockChVO, ch, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/updateOT.do", method = RequestMethod.POST)
	public void updateOT() throws Exception
	{ 
		ContractHeaderVO ch = new ContractHeaderVO();
		ch.setHeaderId(this.getParaToLong("HEADER_ID"));
		ch.setOrderTypeId(this.getParaToLong("ORDER_TYPE_ID"));
		this.renderStr(CHS.updateOrderType(ch, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/deleteH.do", method = RequestMethod.POST)
	public void deleteH() throws Exception
	{ 
		Long headerId = this.getParaToLong("HEADER_ID");
		this.renderStr(CHS.delete(headerId, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/changeStatus.do", method = RequestMethod.POST)
	public void changeStatus() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("headerId",this.getParaToLong("HEADER_ID"));
		conditionMap.put("newStatus", this.getPara("NEW_STATUS"));
		this.renderStr(CHS.changeStatus(conditionMap, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/getContractL.do", method = RequestMethod.POST)
	public void getContractLine() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("headerId", this.getParaToLong("HEADER_ID"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.setSessionAttr("CONTRACT_HEADER_ID", this.getPara("HEADER_ID"));
		this.renderStr(CLS.findForPage(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getAutoLineNum.do", method = RequestMethod.POST)
    public void getAutoLineNum() throws Exception
	{
		Long headerId = this.getParaToLong("HEADER_ID");
		this.renderStr(CLS.findAutoAddSequence(headerId, loginId));
	}
	
	@RequestMapping(value = "/getUnitPrice.do", method = RequestMethod.POST)
    public void getUnitPrice() throws Exception
    {
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("inventoryItemId", this.getParaToLong("INVENTORY_ITEM_ID"));
		conditionMap.put("orgId", this.getParaToLong("ORG_ID"));
		conditionMap.put("currCode", this.getPara("CURR_CODE"));
		conditionMap.put("priceListId", this.getParaToLong("PRICE_LIST_ID"));
		conditionMap.put("orderQuantity", this.getParaToLong("ORDER_QUANTITY"));
		this.renderStr(CLS.getUnitPrice(conditionMap, loginId).toJsonStr());
    }
	
	@RequestMapping(value = "/getProductList.do", method = RequestMethod.POST)
    public void getProductList() throws Exception
    {
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));	
		conditionMap.put("itemId", this.getParaToLong("ITEM_ID"));
		conditionMap.put("productListId", this.getParaToLong("PRODUCT_LIST_ID"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CLS.findProductList(conditionMap, loginId));
    }
	
	@RequestMapping(value = "/getStandardPrice.do", method = RequestMethod.POST)
	public void getStandardPrice() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("itemId", this.getParaToLong("ITEM_ID"));
		conditionMap.put("productListId", this.getParaToLong("PRODUCT_LIST_ID"));
		this.renderStr(CLS.getStandardPrice(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/sumQuantityAndPrice.do", method = RequestMethod.POST)
	public void sumQuantityAndPrice() throws Exception
	{
		String contractNumber = this.getPara("CONTRACT_NUMBER");
		this.renderStr(CLS.sumQuantityAndPrice(contractNumber, loginId));
	}
	
	@RequestMapping(value = "/sumQuantity.do", method = RequestMethod.POST)
	public void sumQuantity() throws Exception
	{
		String contractNumber = this.getPara("CONTRACT_NUMBER");
		this.renderStr(CLS.sumQuantity(contractNumber, loginId));
	}
	
	@RequestMapping(value = "/insertL", method = RequestMethod.POST)
	public void insertL() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("headerId", this.getParaToLong("HEADER_ID"));
		conditionMap.put("lineNum", this.getParaToLong("LINE_NUM"));
		conditionMap.put("inventoryItemId", this.getParaToLong("INVENTORY_ITEM_ID"));
		conditionMap.put("shipFromOrgId", this.getParaToLong("SHIP_FROM_ORG_ID"));
		conditionMap.put("orderQuantity", this.getParaToLong("ORDER_QUANTITY"));
		conditionMap.put("currCode", this.getPara("CURR_CODE"));
		conditionMap.put("priceListId", this.getParaToLong("PRICE_LIST_ID"));
		conditionMap.put("remarks", this.getPara("REMARKS"));
		this.renderStr(CLS.insert(conditionMap, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/preUpdateL", method = RequestMethod.POST)
	public void preUpdateL() throws Exception
	{
		Long lineId = this.getParaToLong("LINE_ID");
		ContractLineVO cl = CLS.findVOById(lineId, loginId);
		this.setSessionAttr("LockCLV", cl);
		this.renderStr(CLS.findJSONById(lineId, loginId));
	}
	
	@RequestMapping(value = "/updateL", method = RequestMethod.POST)
	public void updateL() throws Exception
	{
		Long lineId = this.getParaToLong("LINE_ID");
		ContractLineVO lockClVO = (ContractLineVO)this.getSessionAttr("LockCLV");
		if (lockClVO ==null){
			throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!lineId.equals(lockClVO.getLineId())){
			throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		ContractLineVO cl = new ContractLineVO();
		cl = (ContractLineVO)lockClVO.clone();
		cl.setLineId(lineId);
		cl.setOrderQuantity(this.getParaToLong("ORDER_QUANTITY"));
		cl.setUnitPrice(this.getParaToLong("UNIT_PRICE"));	
		this.renderStr(CLS.update(lockClVO, cl, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/deleteL.do", method = RequestMethod.POST)
	public void deleteL() throws Exception
	{ 
		Long lineId = this.getParaToLong("LINE_ID");
		this.renderStr(CLS.delete(lineId, loginId).toJsonStr());
	}
}
