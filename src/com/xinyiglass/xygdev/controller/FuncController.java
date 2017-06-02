package com.xinyiglass.xygdev.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/func")
@Scope("prototype")
public class FuncController extends BaseController{
	
	@RequestMapping("/setFuncId.do")
	public void setFuncId(){
    	Long funcId = this.getParaToLong("FUNC_ID");
    	this.setSessionAttr("FUNC_ID", funcId);
    }
}
