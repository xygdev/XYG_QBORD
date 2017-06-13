package com.xinyiglass.xygdev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import xygdev.commons.core.BaseController;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.interact.InteractPub;

@Controller
@RequestMapping("/irr")
@Scope("prototype")
public class IrrController  extends BaseController  {

	@Autowired
	InteractPub irrPub;

	@RequestMapping(value = "/getDefaultIrr.do", method = RequestMethod.POST)
	public void getDefaultIrr() throws Exception
	{   	
		//获取用户的默认打开的交互式报表定义
		Long userId = getParaToLong("USER_ID");
		String interactCode = getPara("INTERACT_CODE");
		renderStr(irrPub.getIrr(irrPub.getDefaultIrrHid(userId, interactCode)));
	}

	//对应旧的：/getSaveData
	@RequestMapping(value = "/saveIrr.do", method = RequestMethod.POST)
	public void saveIrr() throws Exception
	{   
		//将交互式报表的定义存到数据库
		Long userId=this.getParaToLong("USER_ID");
		String interactCode=getPara("INTERACT_CODE");
		String userInteractName=getPara("USER_INTERACT_NAME");
		String description=getPara("DESCRIPTION");
		String publicFlag=getPara("PUBLIC_FLAG");
		String autoqueryFlag=getPara("AUTOQUERY_FLAG");
		String defaultFlag=getPara("DEFAULT_FLAG");
		String orderBy=getPara("ORDER_BY");
		int pageSize=this.getParaToInt("PAGE_SIZE");
		String seq=getPara("SEQ");
		PlsqlRetValue ret=irrPub.saveIrr(userId, interactCode, userInteractName, description, publicFlag, autoqueryFlag, defaultFlag, orderBy, pageSize, seq);
		//前端判断：0：处理成功。非0：处理失败。
		renderStr(ret.toJsonStr()); 
	}
	
	@RequestMapping(value = "/getIrrHead.do", method = RequestMethod.POST)
	public void getIrrHead() throws Exception
	{   
		//获取用户可用的所有IRR定义的头列表
		Long userId=getParaToLong("USER_ID");
		String interactCode=getPara("INTERACT_CODE");
		//LogUtil.log("userId:"+userId); 
		//根据用户和报表的名称获取默认打开的文件夹 
		renderStr(irrPub.getIrrHead(userId, interactCode)); 
	}
	
	@RequestMapping(value = "/getIrr.do", method = RequestMethod.POST)
	public void getIrr() throws Exception
	{   
		Long header_id = getParaToLong("HEADER_ID"); 
		renderStr(irrPub.getIrr(header_id)); 
	}
}
