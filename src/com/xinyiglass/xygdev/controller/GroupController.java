package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.entity.GroupHeaderVO;
import com.xinyiglass.xygdev.service.GroupHeaderVOService;
import com.xinyiglass.xygdev.service.GroupLineService;

import xygdev.commons.core.BaseController;

@Controller
@RequestMapping("/group")
@Scope("prototype")
public class GroupController extends BaseController{
	
	@Autowired
	GroupHeaderVOService GHVS;
	@Autowired
	GroupLineService GLS;
	
	@RequestMapping(value = "/getUserGroup.do", method = RequestMethod.POST)
	public void getUserGroup() throws Exception
	{
		Long userId = this.getParaToLong("USER_ID");
		this.renderStr(GHVS.getGroup(userId, userId).toJsonStr());
	}
	
	@RequestMapping("/groupManage.do")
	public String listGroupH(){
		return this.getSessionAttr("LANG")+"/xygQbordGroupManage";
	}
	
	@RequestMapping(value = "/assignUserGroup.do", method = RequestMethod.POST)
	public void assignUserResp() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("groupId", this.getParaToLong("GROUP_ID"));
		conditionMap.put("enabledFlag", this.getPara("ENABLED_FLAG"));
		this.renderStr(GHVS.assign(conditionMap, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/getGroupHPage.do", method = RequestMethod.POST)
	public void getGroupHPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("groupId", this.getParaToLong("GROUP_ID"));
		conditionMap.put("onlyCust", this.getPara("ONLY_CUST"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(GHVS.findForPage(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/getGroupLPage.do", method = RequestMethod.POST)
	public void getGroupLPage() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
		conditionMap.put("groupId", this.getParaToLong("GROUP_ID"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(GHVS.findForDetailPage(conditionMap, loginId));
	}
	
	@RequestMapping(value = "/insertH.do", method = RequestMethod.POST)
	public void insretH() throws Exception
	{ 
    	GroupHeaderVO gh = new GroupHeaderVO();
    	gh.setGroupCode(this.getPara("GROUP_CODE"));
    	gh.setGroupName(this.getPara("GROUP_NAME"));
    	gh.setDescription(this.getPara("DESC"));
    	this.renderStr(GHVS.insert(gh, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/preUpdateH.do", method = RequestMethod.POST)
	public void preUpdateH() throws Exception
	{
		Long groupId = this.getParaToLong("GROUP_ID");
		GroupHeaderVO ghVO = GHVS.findVOById(groupId, loginId);
		this.setSessionAttr("lockGhVO", ghVO);
		this.renderStr(GHVS.findJSONById(groupId, loginId));
	}
	
	@RequestMapping(value = "/updateH.do", method = RequestMethod.POST)
	public void updateH() throws Exception
	{ 
		Long groupId = this.getParaToLong("GROUP_ID");
		GroupHeaderVO lockGhVO = (GroupHeaderVO)this.getSessionAttr("lockGhVO");
		if (lockGhVO ==null){
			throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!groupId.equals(lockGhVO.getGroupId())){
			throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		GroupHeaderVO ghVO = new GroupHeaderVO();
		ghVO = (GroupHeaderVO)lockGhVO.clone();
		ghVO.setGroupId(groupId);
		ghVO.setGroupCode(this.getPara("GROUP_CODE"));
		ghVO.setGroupName(this.getPara("GROUP_NAME"));
		ghVO.setDescription(this.getPara("DESC"));
		this.renderStr(GHVS.update(lockGhVO, ghVO, groupId).toJsonStr());
	}
	
	@RequestMapping(value = "/insertL.do", method = RequestMethod.POST)
	public void insretL() throws Exception
	{ 
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		Long groupId =  this.getParaToLong("GROUP_ID");
		conditionMap.put("groupId", groupId);
		conditionMap.put("groupSeq",GLS.autoAddSequence(groupId, groupId));
		conditionMap.put("subGroupId", this.getParaToLong("SUB_GROUP_ID"));
		conditionMap.put("custId", this.getParaToLong("ACT_ID"));
		this.renderStr(GLS.insert(conditionMap, groupId).toJsonStr());
	}
	
	@RequestMapping(value = "/deleteL.do", method = RequestMethod.POST)
	public void deleteL() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("groupId", this.getParaToLong("GROUP_ID"));
		conditionMap.put("groupSeq",this.getParaToLong("GROUP_SEQUENCE"));
		this.renderStr(GLS.delete(conditionMap, loginId).toJsonStr());
	}
}
