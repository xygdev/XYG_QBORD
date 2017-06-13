package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.RespVOService;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/resp")
@Scope("prototype")
public class RespController extends BaseController{
	
	@Autowired
	RespVOService RVS;
	
	@RequestMapping(value = "/getUserResp.do", method = RequestMethod.POST)
	public void getUserResp() throws Exception
	{
		Long userId = this.getParaToLong("USER_ID");
		this.renderStr(RVS.getResp(userId, userId).toJsonStr());
	}
	
	@RequestMapping(value = "/assignUserResp.do", method = RequestMethod.POST)
	public void assignUserResp() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("respId", this.getParaToLong("RESP_ID"));
		conditionMap.put("enabledFlag", this.getPara("ENABLED_FLAG"));
		this.renderStr(RVS.assign(conditionMap, loginId).toJsonStr());
	}
}
