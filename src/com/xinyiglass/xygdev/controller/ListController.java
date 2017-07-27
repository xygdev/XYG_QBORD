package com.xinyiglass.xygdev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xygdev.commons.core.BaseController;

import com.xinyiglass.xygdev.service.ListService;

@Controller
@RequestMapping("/list")
@Scope("prototype")
public class ListController extends BaseController{
	
	@Autowired
	ListService listService;
	
	@RequestMapping(value = "/getUserType.do", method = RequestMethod.POST)
	public void getUserType() throws Exception
	{
		this.renderStr(listService.findForUserType(loginId,this.getSessionAttr("LANG").toString()));
	}
	
	@RequestMapping(value = "/getEnableFlag.do", method = RequestMethod.POST)
	public void getEnableFlag() throws Exception
	{
		this.renderStr(listService.findForEnableFlag(loginId,this.getSessionAttr("LANG").toString()));
	}
	
	@RequestMapping(value = "/getOrderType.do", method = RequestMethod.POST)
	public void getOrderType() throws Exception
	{
		this.renderStr(listService.findForOrderType(loginId, this.getSessionAttr("LANG").toString()));
	}
}
