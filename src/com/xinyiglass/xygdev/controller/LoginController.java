package com.xinyiglass.xygdev.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import xygdev.commons.core.BaseController;
import xygdev.commons.core.Server;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.entity.SqlResultSet;
import xygdev.commons.util.TypeConvert;

import com.xinyiglass.xygdev.entity.UserVO;
import com.xinyiglass.xygdev.service.LoginService;
import com.xinyiglass.xygdev.service.RespVOService;
import com.xinyiglass.xygdev.service.UserVOService;
import com.xinyiglass.xygdev.util.Constant;
import com.xinyiglass.xygdev.util.GlobalInit;
import com.xinyiglass.xygdev.util.LogUtil;

@Controller
@Scope("prototype")
public class LoginController extends BaseController {
	
	@Autowired
	UserVOService uvos;
	@Autowired
	LoginService ls;
	@Autowired
	RespVOService rvos;
		
	@RequestMapping("/")
	public String login(){
		return "login-zhs";
	}
	
	@RequestMapping("/loginZHS.do")
	public void loginZHS() throws ServletException, IOException{
		this.getRequest().getRequestDispatcher("/WEB-INF/page/login-zhs.jsp").forward(this.getRequest(),this.getResponse());	
		//return "login-zhs";
	}
	
	@RequestMapping("/loginUS.do")
	public void loginUS() throws ServletException, IOException{
		this.getRequest().getRequestDispatcher("/WEB-INF/page/login-us.jsp").forward(this.getRequest(),this.getResponse());	
		//return "login-us";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView postLogin(String username,String password,String lang) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		//Constant.LANG = lang;
		this.setSessionAttr("LANG", lang);
		conditionMap.put("userName", username.toUpperCase());
		conditionMap.put("applCode", Constant.APPL_CODE);
		conditionMap.put("password", password);
		conditionMap.put("lang",  lang);
		conditionMap.put("ipAddress", getIp(this.getRequest()) );
		PlsqlRetValue ret=ls.handleLogin(conditionMap);
		int retCode = ret.getRetcode();
		if(retCode==2){
			if(lang.equals("ZHS")){
				mv.setViewName("login-zhs");
			}else{
				mv.setViewName("login-us");
			}
			this.setSessionAttr("errorMsg", ret.getErrbuf());
		 }else{
			 UserVO user=uvos.findForUserVOByName(username.toUpperCase(),null);
			 this.setSessionAttr("LOGIN_ID",TypeConvert.str2Long(ret.getParam1()));
			 this.setSessionAttr("USER_ID", user.getUserId());
			 this.setSessionAttr("USER_NAME", user.getUserName());
			 this.setSessionAttr("DESC", user.getDescription());
			 this.setSessionAttr("IMG", user.getImgUrl());
			 SqlResultSet resp = rvos.getResp(user.getUserId(), loginId);
			 this.setSessionAttr("RESP_ID",resp.getResultSet().get(0)[0].toString());
			 this.setSessionAttr("RESP", resp.getResultSet().get(0)[1].toString());
			 this.setSessionAttr("USER_TYPE", user.getUserType());
			 if(retCode==1){
				 mv.setViewName("redirect:/modifyPWD.do");
				 this.setSessionAttr("errorMsg", ret.getErrbuf());
			 }else if(retCode==0){				
				 mv.setViewName("redirect:/index.do"); 
			 }
			 //这里全局初始化。例如启用调试等
			 GlobalInit.init(null);//Boolean.parseBoolean("false")
			 LogUtil.log("成功登录!-->当前SESS会话"+this.session.getId()+" 匹配的longId:"+ret.getParam1());
		 }
		return mv;
	}

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String getLogin(){
		return "redirect:/";
	}
	
	@RequestMapping(value="/index.do")
	public void listIndex() throws Exception{
		String debug= this.getPara("debug");// req.getParameter("debug");
		if(debug!=null){//重新初始化
			GlobalInit.init(Boolean.parseBoolean(debug));
		}
		this.getRequest().getRequestDispatcher("/WEB-INF/page/"+this.getSessionAttr("LANG")+"/index.jsp").forward(this.getRequest(),this.getResponse());	
	}
	
	@RequestMapping(value="/modifyPWD.do")
	public void listModifyPWD() throws Exception{
		this.getRequest().getRequestDispatcher("/WEB-INF/page/"+this.getSessionAttr("LANG")+"/modifyPWD.jsp").forward(this.getRequest(),this.getResponse());	
	}	

	@RequestMapping(value="/logout.do",method=RequestMethod.POST)
	public ModelAndView getLogout() throws Exception{
		ModelAndView mv = new ModelAndView();
		Long loginId = (Long)this.getSessionAttr("LOGIN_ID");
		PlsqlRetValue ret=ls.logout(loginId);
		if(ret.getRetcode()!=0){
			LogUtil.log("Error:"+ret.getErrbuf());
		}	
		String lang = this.getSessionAttr("LANG");
		this.getSession().invalidate();
		if(lang.equals("ZHS")){
			mv.setViewName("login-zhs");
		}else{
			mv.setViewName("login-us");
		}
		return mv;
	}
	
	@RequestMapping(value="/home.do")
	public String listHome(){
		return this.getSessionAttr("LANG")+"/xygQbordHome";
	}
	
	@RequestMapping(value="/404.do")
	public String pageNotFonud(){
		return "404notFound";
	}	
	
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");     
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
			ip = request.getHeader("Proxy-Client-IP");     
		}     
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
			ip = request.getHeader("WL-Proxy-Client-IP");     
		}     
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {     
			ip = request.getRemoteAddr();     
		}     
		return ip;
    }
	
	public static void main(String[] args) {
        Server.start("WebRoot", 8080, "/XYG_QBORD", 5,"E:\\image","/image");
        //Server.start("WebRoot", 8080, "/XYG_WEBDEV_SAMPLE", 5);
    }
}
