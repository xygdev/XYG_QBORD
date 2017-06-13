package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.GroupHeaderVOService;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/group")
@Scope("prototype")
public class GroupController extends BaseController{
	
	@Autowired
	GroupHeaderVOService GHVS;
	
	@RequestMapping(value = "/getUserGroup.do", method = RequestMethod.POST)
	public void getUserGroup() throws Exception
	{
		Long userId = this.getParaToLong("USER_ID");
		this.renderStr(GHVS.getGroup(userId, userId).toJsonStr());
	}
	
	@RequestMapping(value = "/assignUserGroup.do", method = RequestMethod.POST)
	public void assignUserResp() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("groupId", this.getParaToLong("GROUP_ID"));
		conditionMap.put("enabledFlag", this.getPara("ENABLED_FLAG"));
		this.renderStr(GHVS.assign(conditionMap, loginId).toJsonStr());
	}
}
