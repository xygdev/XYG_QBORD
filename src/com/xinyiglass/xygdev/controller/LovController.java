package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xygdev.commons.core.BaseController;

import com.xinyiglass.xygdev.service.LovService;

@Controller
@RequestMapping("/lov")
@Scope("prototype")
public class LovController extends BaseController{
	
	@Autowired
	LovService lovService;
	
	//获取USER值列表
	@RequestMapping(value = "/getUserPage.do", method = RequestMethod.POST)
	public void getUserPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("userName", this.getPara("USER_NAME"));
		conditionMap.put("userDesc", this.getPara("DESCRIPTION"));
		this.renderStr(lovService.findUserForPage(conditionMap, loginId));
	}	
	
	//获取RESP值列表
	@RequestMapping(value = "/getRespPage.do", method = RequestMethod.POST)
	public void getRespPage() throws Exception
	{   
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("respName", this.getPara("RESP_NAME"));
		conditionMap.put("respCode", this.getPara("RESP_CODE"));
		this.renderStr(lovService.findRespForPage(conditionMap, loginId));
	}	
	
	//获取EMP值列表
  	@RequestMapping(value = "/getEmpPage.do", method = RequestMethod.POST)
  	public void getEmpPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("ename", this.getPara("ENAME"));
		conditionMap.put("eno", this.getPara("ENO"));
  		this.renderStr(lovService.findEmpForPage(conditionMap, loginId));
  	}
  	
    //获取GROUP值列表
  	@RequestMapping(value = "/getGroupPage.do", method = RequestMethod.POST)
  	public void getGroupPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("groupCode", this.getPara("GROUP_CODE"));
		conditionMap.put("groupName", this.getPara("GROUP_NAME"));
		this.renderStr(lovService.findGroupForPage(conditionMap, loginId));
  	}
  	
    //获取MENU值列表
  	@RequestMapping(value = "/getMenuPage.do", method = RequestMethod.POST)
  	public void getMenuPage() throws Exception
  	{   
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("menuName", this.getPara("MENU_NAME"));
  		conditionMap.put("menuCode", this.getPara("MENU_CODE"));
  		this.renderStr(lovService.findMenuForPage(conditionMap, loginId));
  	}	
  	
    //获取FUNC值列表
  	@RequestMapping(value = "/getFuncPage.do", method = RequestMethod.POST)
  	public void getFuncPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("funcName", this.getPara("FUNCTION_NAME"));
  		conditionMap.put("funcCode", this.getPara("FUNCTION_CODE"));
  		this.renderStr(lovService.findFuncForPage(conditionMap, loginId));
  	}
  	
    //获取ICON值列表
  	@RequestMapping(value = "/getIconPage.do", method = RequestMethod.POST)
  	public void getIconPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("iconDESC", this.getPara("DESCRIPTION"));
  		conditionMap.put("iconCode", this.getPara("ICON_CODE"));
  		this.renderStr(lovService.findIconForPage(conditionMap, loginId));
  	}
  	
    //获取ORGANIZATION值列表
  	@RequestMapping(value = "/getOrganizationPage.do", method = RequestMethod.POST)
  	public void getOrganizationPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("oName", this.getPara("ORGANIZATION_NAME"));
  		conditionMap.put("oCode", this.getPara("ORGANIZATION_CODE"));
  		this.renderStr(lovService.findOrganizationForPage(conditionMap, loginId));
  	}
  	
    //获取USER ORGANIZATION值列表  (技术资料，库存查询界面使用)
  	@RequestMapping(value = "/getUserOrganization.do", method = RequestMethod.POST)
  	public void getUserOrganizationForInv() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("oName", this.getPara("ORGANIZATION_NAME"));
  		conditionMap.put("oCode", this.getPara("ORGANIZATION_CODE"));
  		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
  		this.renderStr(lovService.findUserOrganizationForInv(conditionMap, loginId));
  	}
  	
    //获取USER ORGANIZATION值列表  (技术资料，库存查询界面使用)
  	@RequestMapping(value = "/getOrganizationForContr.do", method = RequestMethod.POST)
  	public void getUserOrganizationForContr() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("oName", this.getPara("ORGANIZATION_NAME"));
  		conditionMap.put("oCode", this.getPara("ORGANIZATION_CODE"));
  		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
  		this.renderStr(lovService.findUserOrganizationForContr(conditionMap, loginId));
  	}
  	
    //获取CUST(ALL QB)值列表
  	@RequestMapping(value = "/getCustAllPage.do", method = RequestMethod.POST)
  	public void getCustAllPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("partyName", this.getPara("PARTY_NAME"));
  		conditionMap.put("accountNumber", this.getPara("ACCOUNT_NUMBER"));
  		this.renderStr(lovService.findCustAllForPage(conditionMap, loginId));
  	}
  	
    //获取USER CUST值列表
  	@RequestMapping(value = "/getUserCustPage.do", method = RequestMethod.POST)
  	public void getUserCustPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
  		conditionMap.put("partyName", this.getPara("PARTY_NAME"));
  		conditionMap.put("accountNumber", this.getPara("ACCOUNT_NUMBER"));
  		this.renderStr(lovService.findUserCustForPage(conditionMap, loginId));
  	}
  	
    //获取ITEM值列表
  	@RequestMapping(value = "/getItemPage.do", method = RequestMethod.POST)
  	public void getItemPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("customerId", this.getParaToLong("CUSTOMER_ID"));
  		conditionMap.put("salesOrgId", this.getParaToLong("SALES_ORG_ID"));
  		conditionMap.put("organizationId", this.getParaToLong("ORGANIZATION_ID"));
  		conditionMap.put("description", this.getPara("DESCRIPTION"));
  		conditionMap.put("carName", this.getPara("CARNAME"));
  		this.renderStr(lovService.findItemForPage(conditionMap, loginId));
  	}
  	
    //获取PRODUCT_TYPE_DESC值列表
  	@RequestMapping(value = "/getProductPage.do", method = RequestMethod.POST)
  	public void getProductPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("description", this.getPara("DESCRIPTION"));
  		this.renderStr(lovService.findProductForPage(conditionMap, loginId,this.getSessionAttr("LANG").toString()));
  	}
  	
    //获取PROCESS_TYPE_DESC值列表
  	@RequestMapping(value = "/getProcessPage.do", method = RequestMethod.POST)
  	public void getProcessPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("description", this.getPara("DESCRIPTION"));
  		this.renderStr(lovService.findProcessForPage(conditionMap, loginId,this.getSessionAttr("LANG").toString()));
  	}
  	
    //获取LOAD_LOCATION_DESC值列表
  	@RequestMapping(value = "/getLoadPage.do", method = RequestMethod.POST)
  	public void getLoadPage() throws Exception
  	{
  		Map<String,Object> conditionMap=new HashMap<String,Object>();
  		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
  		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
  		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
  		conditionMap.put("description", this.getPara("DESCRIPTION"));
  		this.renderStr(lovService.findLoadForPage(conditionMap, loginId,this.getSessionAttr("LANG").toString()));
  	}
  	
}
