package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.CustService;
import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/cust")
@Scope("prototype")
public class CustController extends BaseController {
	
	@Autowired
	CustService CS;
	
	@RequestMapping(value = "/getUserCustPage.do", method = RequestMethod.POST)
	public void getUserCustPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(CS.findForPage(conditionMap,loginId));
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public void insret() throws Exception
	{ 
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("orgId", this.getParaToLong("ORG_ID"));
		conditionMap.put("customerId", this.getParaToLong("CUSTOMER_ID"));
    	this.renderStr(CS.insert(conditionMap, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/validate.do", method = RequestMethod.POST)
	public void validate() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userCustId", this.getParaToLong("USER_CUST_ID"));
		conditionMap.put("action", this.getPara("ACTION"));
		this.renderStr(CS.validate(conditionMap, loginId).toJsonStr());
	}
}
