package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xinyiglass.xygdev.util.Constant;
import com.xinyiglass.xygdev.util.MD5Util;
import com.xinyiglass.xygdev.service.UserVOService;

import xygdev.commons.core.BaseController;
import xygdev.commons.entity.PlsqlRetValue;

@Controller
@RequestMapping("/user")
@Scope("prototype")
public class UserController extends BaseController {
	
	@Autowired
	UserVOService UVS;
	
	//非Ajax请求
    @RequestMapping(value = "/updatePWD.do", method = RequestMethod.POST)
    public ModelAndView updatePWD() throws Exception
    {   
    	
    	ModelAndView mv = new ModelAndView();
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	conditionMap.put("userId", (Long)this.getSessionAttr("USER_ID"));
    	conditionMap.put("oldPassword", MD5Util.string2MD5(this.getPara("O_PASSWORD"),Constant.SALT));
    	conditionMap.put("newPassword", MD5Util.string2MD5(this.getPara("N_PASSWORD"),Constant.SALT));
    	PlsqlRetValue ret=UVS.updatePWD(conditionMap, loginId);
		int retCode = ret.getRetcode();
        if(retCode==0){
            mv.setViewName("redirect:/index.do");
        }else if(retCode==2){
        	mv.setViewName("redirect:/modifyPWD.do");
        	this.setSessionAttr("errorMsg", ret.getErrbuf());
        }
        return mv;
        
    }
}
