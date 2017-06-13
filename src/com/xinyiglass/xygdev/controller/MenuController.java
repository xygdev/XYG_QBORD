package com.xinyiglass.xygdev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyiglass.xygdev.service.MenuHeaderVOService;
import com.xinyiglass.xygdev.service.RespVOService;

import xygdev.commons.core.BaseController;
import xygdev.commons.util.TypeConvert;

@Controller
@RequestMapping("/menu")
@Scope("prototype")
public class MenuController extends BaseController {
	@Autowired
    RespVOService rvs;
	@Autowired
	MenuHeaderVOService mhvs;
	
	@RequestMapping("/getPersonalMenu.do")
    public void getPersonalMenu() throws Exception{
    	Long respId = TypeConvert.str2Long(this.getSessionAttr("RESP_ID").toString());
    	Long menuId = rvs.findMenuId(respId,loginId);
    	this.response.getWriter().print(mhvs.findPersonalMenuById(menuId,loginId));
    	//this.renderStr(mhvs.findPersonalMenuById(menuId,loginId));
    	//res.getWriter().print(mhvs.findPersonalMenuById(menuId,loginId));
    }
}
