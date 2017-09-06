package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.ItemsService;
import xygdev.commons.core.BaseController;
import xygdev.commons.util.LogUtil;

@Controller
@RequestMapping("/items")
@Scope("prototype")
public class ItemsController extends BaseController {
	
	@Autowired
	ItemsService IS;
	
	@RequestMapping("/item.do")
	public String listItem(){
		return this.getSessionAttr("LANG")+"/xygQbordItems";
	}
	
	@RequestMapping("/itemQuery.do")
	public String queryItem(){
		return this.getSessionAttr("LANG")+"/xygQbordItemsQuery";
	}
	
	@RequestMapping("/itemDetail.do")
	public String itemDetail(){
		return this.getSessionAttr("LANG")+"/xygQbordItemsDetail";
	}
	
	@RequestMapping(value = "/getItemsPage.do", method = RequestMethod.POST)
    public void getItemsPage() throws Exception
	{  
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));	
		conditionMap.put("orgId", this.getPara("ORGANIZATION_ID"));
		conditionMap.put("itemNumber", this.getPara("ITEM_NUMBER"));
		conditionMap.put("description", this.getPara("DESCRIPTION"));
		conditionMap.put("carName", this.getPara("CARNAME"));
		conditionMap.put("productTypeId", this.getPara("PRODUCT_TYPE_ID"));
		conditionMap.put("processTypeId", this.getPara("PROCESS_TYPE_ID"));
		conditionMap.put("loadLocationId", this.getPara("LOAD_LOCATION_ID"));
		conditionMap.put("qbordEnabledFlag", this.getPara("QBORD_ENABLED_FLAG"));
		conditionMap.put("syncDate_F",this.getParaToDate("SYNC_DATE_F"));
		conditionMap.put("syncDate_T",this.getParaToDate("SYNC_DATE_T"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
		this.renderStr(IS.findForItems(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getValidItemsPage.do", method = RequestMethod.POST)
    public void getValidItemsPage() throws Exception
	{  
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));	
		conditionMap.put("orgId", this.getPara("ORGANIZATION_ID"));
		conditionMap.put("itemNumber", this.getPara("ITEM_NUMBER"));
		conditionMap.put("description", this.getPara("DESCRIPTION"));
		conditionMap.put("carName", this.getPara("CARNAME"));
		conditionMap.put("productTypeId", this.getPara("PRODUCT_TYPE_ID"));
		conditionMap.put("processTypeId", this.getPara("PROCESS_TYPE_ID"));
		conditionMap.put("loadLocationId", this.getPara("LOAD_LOCATION_ID"));
		conditionMap.put("oemno",this.getPara("OEMNO"));
		conditionMap.put("enDesc",this.getPara("EN_DESC"));
		conditionMap.put("chang_F",this.getPara("CHANG_F"));
		conditionMap.put("chang_T",this.getPara("CAHNG_T"));
		conditionMap.put("gao_F",this.getPara("GAO_F"));
		conditionMap.put("gao_T",this.getPara("GAO_T"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
		this.renderStr(IS.findForValidItems(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getItemsDetail.do", method = RequestMethod.POST)
    public void getItemsDetail() throws Exception
    {
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	conditionMap.put("itemId", this.getParaToLong("ITEM_ID"));
		conditionMap.put("orgId", this.getPara("ORG_ID"));
    	this.renderStr(IS.findDetailByIdForJSON(conditionMap));
    }
	
	@RequestMapping(value = "/countPic.do", method = RequestMethod.POST)
    public void countPic() throws Exception
    {
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	conditionMap.put("itemId", this.getParaToLong("ITEM_ID"));
		conditionMap.put("orgId", this.getPara("ORG_ID"));
		conditionMap.put("fileTypeCode", this.getPara("FILE_TYPE_CODE"));
		this.renderStr("{\"result\":\""+IS.countPic(conditionMap)+"\"}");
    }
	
	@RequestMapping(value = "/updateEnabledFlag.do", method = RequestMethod.POST)
    public void updateEnabledFlag() throws Exception
    {
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	conditionMap.put("itemId", this.getParaToLong("ITEM_ID"));
		conditionMap.put("orgId", this.getPara("ORG_ID"));
		String enabledFlag = "N";
		if(this.getPara("ACTION").equals("ON")){
			enabledFlag = "Y";
		}else if(this.getPara("ACTION").equals("OFF")){
			enabledFlag = "N";
		}else{
		    LogUtil.log("ACTION参数有误");	
		}
		conditionMap.put("enabledFlag", enabledFlag);
		try{
			IS.updateItemEnabledFlag(conditionMap);
			this.renderStr("{\"result\":\"success\"}");
		}catch(Exception e){
			this.renderStr("{\"result\":\"error\"}");
		}
    }
}
