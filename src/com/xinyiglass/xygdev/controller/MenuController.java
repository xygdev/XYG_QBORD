package com.xinyiglass.xygdev.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyiglass.xygdev.service.MenuHeaderVOService;
import com.xinyiglass.xygdev.service.MenuLineService;
import com.xinyiglass.xygdev.service.RespVOService;

import xygdev.commons.core.BaseController;
import xygdev.commons.util.TypeConvert;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.entity.MenuHeaderVO;



@Controller
@RequestMapping("/menu")
@Scope("prototype")
public class MenuController extends BaseController {
	@Autowired
    RespVOService rvs;
	@Autowired
	MenuHeaderVOService mhvs;
	@Autowired
	MenuLineService mls;
	
	@RequestMapping("/getPersonalMenu.do")
    public void getPersonalMenu() throws Exception{
    	Long respId = TypeConvert.str2Long(this.getSessionAttr("RESP_ID").toString());
    	Long menuId = rvs.findMenuId(respId,loginId);
    	this.response.getWriter().print(mhvs.findPersonalMenuById(menuId,loginId));
    }
	
	@RequestMapping("/menuManage.do")
	public String menuHeader(){
		return this.getSessionAttr("LANG")+"/xygQbordMenuManage";
	}
	
	@RequestMapping(value = "/getAutoAddSeq.do", method = RequestMethod.POST)
    public void getAutoAddSeq() throws Exception
	{
		Long menuId = this.getParaToLong("MENU_ID");
		this.response.getWriter().print(mls.findAutoAddSequence(menuId,loginId));
	}
	
	@RequestMapping(value = "/getMenuHeaderPage.do", method = RequestMethod.POST)
	public void getMenuHeaderPage() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
        conditionMap.put("menuId", this.getParaToLong("MENU_ID"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
        this.renderStr(mhvs.findForMenuHPage(conditionMap,loginId));
	}	
	
	@RequestMapping(value = "/insertMenuHeader.do", method = RequestMethod.POST)
	public void insertMenuH() throws Exception
	{
		MenuHeaderVO m = new MenuHeaderVO();
        m.setMenuCode(this.getPara("MENU_CODE"));
        m.setMenuName(this.getPara("MENU_NAME"));
        m.setDescription(this.getPara("DESCRIPTION"));
        m.setIconId(this.getParaToLong("ICON_ID"));
        this.renderStr(mhvs.insert(m, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/preUpdateMenuHeader.do", method = RequestMethod.POST)
	public void preUpdateMH() throws Exception
	{
		Long menuId = this.getParaToLong("MENU_ID");
		MenuHeaderVO menuheaderVO = mhvs.findById(menuId, loginId);
		this.setSessionAttr("lockMenuHeaderVO", menuheaderVO );
		this.renderStr(mhvs.findByIdForJSON(menuId,loginId));
	}
	
	@RequestMapping(value = "/updateMenuHeader.do", method = RequestMethod.POST)
	public void updateMH() throws Exception
	{
		Long menuId = this.getParaToLong("MENU_ID");
		MenuHeaderVO lockMenuHeaderVO = (MenuHeaderVO)this.getSessionAttr("lockMenuHeaderVO");
		if (lockMenuHeaderVO ==null){
		    throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!menuId.equals(lockMenuHeaderVO.getMenuId())){
		    throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		MenuHeaderVO m = new MenuHeaderVO();//复制对象！
	    m = (MenuHeaderVO) lockMenuHeaderVO.clone();	 
		m.setMenuId(menuId);
		m.setMenuCode(this.getPara("MENU_CODE"));
        m.setMenuName(this.getPara("MENU_NAME"));
        m.setDescription(this.getPara("DESCRIPTION"));
        m.setIconId(this.getParaToLong("ICON_ID")); 
	    this.renderStr(mhvs.update(lockMenuHeaderVO,m, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/getMenuLinePage.do", method = RequestMethod.POST)
	public void getMenuLinePage() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
        conditionMap.put("menuId", this.getParaToLong("MENU_ID"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
        this.renderStr(mls.findForDetailPage(conditionMap,loginId));	
	}
	
	@RequestMapping(value = "/insertMenuLine.do", method = RequestMethod.POST)
	public void insertMenuL() throws Exception
	{
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	Long menuId = this.getParaToLong("MENU_ID");
		conditionMap.put("menuId", menuId);
		conditionMap.put("menuSequence",this.getPara("MENU_SEQUENCE"));
		conditionMap.put("subMenuId", this.getParaToLong("SUB_MENU_ID"));
		conditionMap.put("functionId", this.getParaToLong("FUNCTION_ID"));
		conditionMap.put("enabledFlag", "Y");
		this.renderStr(mls.insert(conditionMap, menuId).toJsonStr());
	}
	
	@RequestMapping(value = "/deleteL.do", method = RequestMethod.POST)
	public void deleteL() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("menuId", this.getParaToLong("MENU_ID"));
		conditionMap.put("menuSeq",this.getParaToLong("MENU_SEQUENCE"));
		this.renderStr(mls.delete(conditionMap, loginId).toJsonStr());
	}
	
}


