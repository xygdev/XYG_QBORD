package com.xinyiglass.xygdev.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.LovService;

@Controller
@RequestMapping("/lov")
@Scope("prototype")
public class LovController {
	
	@Autowired
	LovService lovService;
	
	protected HttpServletRequest req; 
    protected HttpServletResponse res; 
    protected HttpSession sess; 
    protected Long loginId; 
    
    @ModelAttribute 
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
        this.req = request; 
        this.res = response; 
        this.sess = request.getSession(); 
        req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");  
	    loginId=(Long)sess.getAttribute("LOGIN_ID");
    } 
	
    //获取USER值列表
	@RequestMapping(value = "/getEmpPage.do", method = RequestMethod.POST)
	public void getEmpPage() throws Exception
	{   	
		int pageSize=Integer.parseInt(req.getParameter("pageSize"));
		int pageNo=Integer.parseInt(req.getParameter("pageNo"));
		boolean goLastPage=Boolean.parseBoolean(req.getParameter("goLastPage"));
		String fullName=req.getParameter("FULL_NAME");
		String employeeNumber=req.getParameter("EMPLOYEE_NUMBER");
		System.out.println("fullName:"+fullName+",employeeNumber:"+employeeNumber);
		res.getWriter().print(lovService.findEmpForPage(pageSize, pageNo, goLastPage, fullName, employeeNumber,loginId));
	}
}
