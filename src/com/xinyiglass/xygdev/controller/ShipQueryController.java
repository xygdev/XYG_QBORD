package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.ShipService;

import xygdev.commons.core.BaseController;


@Controller
@RequestMapping("/ship")
@Scope("prototype")
public class ShipQueryController extends BaseController {
	
	@Autowired
	ShipService SHIP;
	
	
	@RequestMapping("/shipQuery.do")
	public String queryItem(){
		return this.getSessionAttr("LANG")+"/xygQbordShipQuery";
	}
	
	@RequestMapping(value = "/getShipPage.do", method = RequestMethod.POST)
    public void getValidItemsPage() throws Exception
	{  
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("userId", this.getSessionAttr("USER_ID"));
		conditionMap.put("sendNum", this.getPara("SEND_NUM"));
		conditionMap.put("actualShipDate_F", this.getParaToDate("ACTUAL_SHIP_DATE_F"));
		conditionMap.put("actualShipDate_T", this.getParaToDate("ACTUAL_SHIP_DATE_T"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
		this.renderStr(SHIP.findForShipPage(conditionMap, loginId));
	}
	
}
