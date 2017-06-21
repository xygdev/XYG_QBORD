package com.xinyiglass.xygdev.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.entity.FunctionVO;
import com.xinyiglass.xygdev.service.FunctionVOService;
import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/func")
@Scope("prototype")
public class FuncController extends BaseController{
	@Autowired
	FunctionVOService FVS;
	//http://192.168.88.123:8080/XYG_WEBDEV_SAMPLE/function/function.do
	
	
	@RequestMapping("/setFuncId.do")
	public void setFuncId(){
    	Long funcId = this.getParaToLong("FUNCTION_ID");
    	this.setSessionAttr("FUNCTION_ID", funcId);
    }
	
	@RequestMapping("/funcManage.do")
	public String function(){
		return this.getSessionAttr("LANG")+"/xygQbordFuncManage";
	}
	
	@RequestMapping(value = "/getFuncPage.do", method = RequestMethod.POST)
	public void getFuncPage() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
        conditionMap.put("funcId", this.getParaToLong("FUNCTION_ID"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
        this.renderStr(FVS.findForPage(conditionMap,loginId));
	}	
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public void insert() throws Exception
	{
		FunctionVO f = new FunctionVO();
        f.setFunctionCode(this.getPara("FUNCTION_CODE"));
        f.setFunctionName(this.getPara("FUNCTION_NAME"));
        f.setFunctionUrl(this.getPara("FUNCTION_URL"));
        f.setDescription(this.getPara("DESCRIPTION"));
        f.setIconId(this.getParaToLong("ICON_ID"));
        this.renderStr(FVS.insert(f, loginId).toJsonStr());
	}	
	
	@RequestMapping(value = "/preUpdate.do", method = RequestMethod.POST)
	public void preUpdate() throws Exception
	{
		Long functionId = this.getParaToLong("FUNCTION_ID");
		FunctionVO functionVO = FVS.findById(functionId, loginId);
		this.setSessionAttr("lockFunctionVO", functionVO);
		this.renderStr(FVS.findByIdForJSON(functionId,loginId));
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public void update() throws Exception
	{
		Long functionId = this.getParaToLong("FUNCTION_ID");
		FunctionVO lockFunctionVO = (FunctionVO)this.getSessionAttr("lockFunctionVO");
		if (lockFunctionVO ==null){
		    throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!functionId.equals(lockFunctionVO.getFunctionId())){
		    throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		FunctionVO f = new FunctionVO();//复制对象！
	    f = (FunctionVO) lockFunctionVO.clone();	 
		f.setFunctionId(functionId);
		f.setFunctionCode(this.getPara("FUNCTION_CODE"));
        f.setFunctionName(this.getPara("FUNCTION_NAME"));
        f.setFunctionUrl(this.getPara("FUNCTION_URL"));
        f.setDescription(this.getPara("DESCRIPTION"));
        f.setIconId(this.getParaToLong("ICON_ID")); 
	    this.renderStr(FVS.update(lockFunctionVO,f, loginId).toJsonStr());  
	}
	
}
