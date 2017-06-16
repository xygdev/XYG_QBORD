package com.xinyiglass.xygdev.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.TextMessage;

import com.xinyiglass.xygdev.websocket.SystemWebSocketHandler;
import com.xinyiglass.xygdev.service.BroadcastService;
import com.xinyiglass.xygdev.service.UserVOService;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/broadcast")
@Scope("prototype")
public class BroadcastController extends BaseController {
	
	@Autowired
	BroadcastService BS;
	@Autowired
	UserVOService UVS;
	
	@Bean
    public SystemWebSocketHandler systemWebSocketHandler() {
        return new SystemWebSocketHandler();
    }
	
	@RequestMapping("/bcManage.do")
	public String listEmpVO(){
		return this.getSessionAttr("LANG")+"/xygQbordBcManage";
	}
	
	@RequestMapping(value = "/getBcPage.do", method = RequestMethod.POST)
	public void getEmpPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("broadcastTitle", this.getPara("BROADCAST_TITLE"));
		conditionMap.put("sDate_F", this.getParaToDate("START_DATE_F"));
		conditionMap.put("sDate_T", this.getParaToDate("START_DATE_T"));
		conditionMap.put("eDate_F", this.getParaToDate("END_DATE_F"));
		conditionMap.put("eDate_T", this.getParaToDate("END_DATE_T"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(BS.findForPage(conditionMap,loginId));
	}
	
	@RequestMapping(value = "/getContent.do", method = RequestMethod.POST)
	public void getContent() throws Exception
	{
		Long broadcastId = this.getParaToLong("BROADCAST_ID");
		this.renderStr(BS.findContentById(broadcastId, loginId));
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public void insret() throws Exception
	{ 
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("startDate", this.getParaToDate("START_DATE"));
		conditionMap.put("endDate", this.getParaToDate("END_DATE"));
		conditionMap.put("broadcastTitle", this.getPara("BROADCAST_TITLE"));
		conditionMap.put("broadcastContent", this.getPara("BROADCAST_CONTENT"));
		if(conditionMap.get("startDate")==null||"".equals(conditionMap.get("startDate"))){
			String recUser = UVS.findAllUsers(loginId);
			ArrayList<Long> userIdList=new ArrayList<Long>();
			for(String userIdStr:recUser.split(",")){
				userIdList.add(Long.parseLong(userIdStr));
				//System.out.println("user_id:"+Long.parseLong(userIdStr));
			}
			String message="有一则新公告:"+conditionMap.get("broadcastTitle");
			systemWebSocketHandler().sendMessageToUsers(userIdList, new TextMessage(message));
		}
		
		this.renderStr(BS.insert(conditionMap, loginId).toJsonStr());
	}
}
