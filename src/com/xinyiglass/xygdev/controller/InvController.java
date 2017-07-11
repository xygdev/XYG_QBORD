package com.xinyiglass.xygdev.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.InvService;

import xygdev.commons.core.BaseController;



@Controller
@RequestMapping("/perm")
@Scope("prototype")

public class InvController extends BaseController{
	@Autowired
	InvService ps;
	
	@RequestMapping("/invPermission.do")
    public String resp(){
	    return this.getSessionAttr("LANG")+"/xygQbordInvPermission";
    }
	
	@RequestMapping(value = "/getInvPermission.do", method = RequestMethod.POST)
	public void getInvPermPage() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
        conditionMap.put("organizationId", this.getParaToLong("ORGANIZATION_ID"));
		conditionMap.put("startDateActive_F", this.getParaToDate("START_DATE_ACTIVE_F"));
		/*conditionMap.put("startDateActive_T", this.getParaToDate("START_DATE_ACTIVE_T"));*/
		conditionMap.put("orderBy",  this.getPara("orderby"));
        this.renderStr(ps.findForPermPage(conditionMap,loginId));	
	}
	
	@RequestMapping(value = "/insertInvPermission.do", method = RequestMethod.POST)
	public void insertInvP() throws Exception
	{
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	Long permissionId = this.getParaToLong("PERMISSION_ID");
		conditionMap.put("permissionId", permissionId);
		conditionMap.put("userId",this.getParaToLong("USER_ID"));
		conditionMap.put("organizationId",this.getParaToLong("ORGANIZATION_ID"));
		this.renderStr(ps.insert(conditionMap, permissionId).toJsonStr());
	}
	
	@RequestMapping(value = "/deleteInvPermission.do", method = RequestMethod.POST)
	public void deleteInvP() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("permissionId", this.getParaToLong("PERMISSION_ID"));
		this.renderStr(ps.delete(conditionMap, loginId).toJsonStr());
	}

	@RequestMapping(value = "/validate.do", method = RequestMethod.POST)
	public void validate() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("permissionId", this.getParaToLong("PERMISSION_ID"));
		conditionMap.put("action", this.getPara("ACTION"));
		this.renderStr(ps.validate(conditionMap, loginId).toJsonStr());
	}
	
}
