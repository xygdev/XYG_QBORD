package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.xinyiglass.xygdev.service.RespVOService;
import xygdev.commons.core.BaseController;
import com.xinyiglass.xygdev.entity.RespVO;


@Controller
@RequestMapping("/resp")
@Scope("prototype")
public class RespController extends BaseController{
	
	@Autowired
	RespVOService RVS;

	@RequestMapping("/respManage.do")
    public String resp(){
	    return this.getSessionAttr("LANG")+"/xygQbordRespManage";
    }

	@RequestMapping(value = "/getUserResp.do", method = RequestMethod.POST)
	public void getUserResp() throws Exception
	{
		Long userId = this.getParaToLong("USER_ID");
		this.renderStr(RVS.getResp(userId,loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/assignUserResp.do", method = RequestMethod.POST)
	public void assignUserResp() throws Exception
	{
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("respId", this.getParaToLong("RESP_ID"));
		conditionMap.put("enabledFlag", this.getPara("ENABLED_FLAG"));
		this.renderStr(RVS.assign(conditionMap, loginId).toJsonStr());
	}
			
    @RequestMapping(value = "/getRespPage.do", method = RequestMethod.POST)
    public void getRespPage() throws Exception
    {
   	    Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));
        conditionMap.put("menuId", this.getParaToLong("MENU_ID"));
		conditionMap.put("respId",  this.getParaToLong("RESP_ID"));
		conditionMap.put("startDate_F", this.getParaToDate("START_DATE_F"));
		conditionMap.put("startDate_T", this.getParaToDate("START_DATE_T"));
		conditionMap.put("orderBy",  this.getPara("orderby"));
        this.renderStr(RVS.findForPage(conditionMap,loginId));
   }
   
   @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
   public void insert() throws Exception
   {
       RespVO r = new RespVO();
       r.setRespCode(this.getPara("RESP_CODE"));
       r.setRespName(this.getPara("RESP_NAME"));
       r.setDescription(this.getPara("DESCRIPTION"));
       r.setMenuId(this.getParaToLong("MENU_ID"));	
       r.setStartDate(this.getParaToDate("START_DATE"));
       r.setEndDate(this.getParaToDate("END_DATE"));
       this.renderStr(RVS.insert(r, loginId).toJsonStr());
   }
   
   @RequestMapping(value = "/preUpdate.do", method = RequestMethod.POST)
   public void preUpdate() throws Exception
   {
       Long respId = this.getParaToLong("RESP_ID");
       RespVO respVO = RVS.findById(respId, loginId);
       this.setSessionAttr("lockRespVO", respVO);
       this.renderStr(RVS.findByIdForJSON(respId,loginId));
   }
   
   @RequestMapping(value = "/update.do", method = RequestMethod.POST)
   public void update() throws Exception
   {
       Long respId = this.getParaToLong("R_ID");
       RespVO lockRespVO = (RespVO)this.getSessionAttr("lockRespVO");
       if(lockRespVO ==null){
      	   throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
       }
       if (!respId.equals(lockRespVO.getRespId())){
      	   throw new RuntimeException("更新的数据无法匹配!请重新查询!");
       }   
       RespVO r = new RespVO();//复制对象！
       r = (RespVO) lockRespVO.clone();		
	   r.setRespId(respId);
       r.setRespCode(this.getPara("RESP_CODE"));
       r.setRespName(this.getPara("RESP_NAME"));
       r.setDescription(this.getPara("DESCRIPTION"));
       r.setMenuId(this.getParaToLong("MENU_ID"));
       r.setStartDate(this.getParaToDate("START_DATE"));
       r.setEndDate(this.getParaToDate("END_DATE"));    	
       this.renderStr(RVS.update(lockRespVO,r, loginId).toJsonStr());          
    }
}


