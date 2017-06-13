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
		conditionMap.put("groupCode", this.getPara("GROUP_CODE"));
		conditionMap.put("groupName", this.getPara("GROUP_NAME"));
		this.renderStr(lovService.findGroupForPage(conditionMap, loginId));
  	}
}
