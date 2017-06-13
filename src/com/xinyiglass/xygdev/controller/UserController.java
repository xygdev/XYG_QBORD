package com.xinyiglass.xygdev.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xinyiglass.xygdev.entity.UserVO;
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
	
	@RequestMapping("/userManage.do")
	public String listEmpVO(){
		return this.getSessionAttr("LANG")+"/xygQbordUserManage";
	}
	
	@RequestMapping(value = "/getUserPage.do", method = RequestMethod.POST)
	public void getEmpPage() throws Exception
	{   	
		Map<String,Object> conditionMap=new HashMap<String,Object>();
		conditionMap.put("pageSize", this.getParaToInt("pageSize"));
		conditionMap.put("pageNo", this.getParaToInt("pageNo"));
		conditionMap.put("goLastPage", this.getParaToBoolean("goLastPage"));		
		conditionMap.put("userId", this.getParaToLong("USER_ID"));
		conditionMap.put("respId", this.getParaToLong("RESP_ID"));
		conditionMap.put("userType", this.getPara("USER_TYPE"));
		conditionMap.put("startDate_F", this.getParaToDate("START_DATE_F"));
		conditionMap.put("startDate_T", this.getParaToDate("START_DATE_T"));
		conditionMap.put("endDate_F", this.getParaToDate("END_DATE_F"));
		conditionMap.put("endDate_T", this.getParaToDate("END_DATE_T"));
		conditionMap.put("orderBy", this.getPara("orderby"));
		this.renderStr(UVS.findForPage(conditionMap,loginId));
	}
	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public void insret() throws Exception
	{ 
    	UserVO u = new UserVO();
    	u.setUserName(this.getPara("USER_NAME").toUpperCase());
    	u.setDescription(this.getPara("DESC"));
    	u.setStartDate(this.getParaToDate("START_DATE"));
    	u.setEndDate(this.getParaToDate("END_DATE"));
    	u.setEncryptedUserPassword(MD5Util.string2MD5(this.getPara("PASSWORD"),Constant.SALT));
    	u.setEmpId(this.getParaToLong("EMP_ID"));
    	u.setUserType(this.getPara("USER_TYPE"));
    	u.setImgUrl("default.png");
    	u.setWechatCode(this.getPara("WECHAT_CODE"));
    	u.setMobileNumber(this.getParaToLong("MOBILE_NUMBER"));
    	u.setEmailAddr(this.getPara("EMAIL_ADDR"));
    	this.renderStr(UVS.insert(u, loginId).toJsonStr());
	}
	
	@RequestMapping(value = "/preUpdate.do", method = RequestMethod.POST)
	public void preUpdate() throws Exception
	{
		Long userId = this.getParaToLong("USER_ID");
		UserVO userVO = UVS.findVOById(userId, loginId);
		this.setSessionAttr("lockUserVO", userVO);
		this.renderStr(UVS.findJSONById(userId, loginId));
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public void update() throws Exception
	{ 
    	Long userId = this.getParaToLong("U_ID");
		UserVO lockUserVO = (UserVO)this.getSessionAttr("lockUserVO");
		if (lockUserVO ==null){
			throw new RuntimeException("更新数据出错:会话数据已经无效!请返回再重新操作!");
		}
		if (!userId.equals(lockUserVO.getUserId())){
			throw new RuntimeException("更新的数据无法匹配!请重新查询!");
		}
		UserVO u = new UserVO();//复制对象！
		u = (UserVO) lockUserVO.clone();		
		u.setUserId(userId);
		u.setUserName(this.getPara("USER_NAME").toUpperCase());
    	u.setDescription(this.getPara("DESC"));
    	u.setStartDate(this.getParaToDate("START_DATE"));
    	u.setEndDate(this.getParaToDate("END_DATE"));
    	String password = this.getPara("PASSWORD");
    	if(password==null||password.equals("")){
    		u.setEncryptedUserPassword(this.getPara("ENCRYPTED_USER_PASSWORD"));
    		u.setPasswordDate(this.getParaToDate("PASSWORD_DATE"));
    	}else{
    		u.setEncryptedUserPassword(MD5Util.string2MD5(password,Constant.SALT));
    		u.setPasswordDate(null);
    	}   	
    	u.setEmpId(this.getParaToLong("EMP_ID"));
    	u.setUserType(this.getPara("USER_TYPE"));
    	u.setImgUrl(this.getPara("IMG_URL"));
    	u.setWechatCode(this.getPara("WECHAT_CODE"));
    	u.setEmailAddr(this.getPara("EMAIL_ADDR"));
    	u.setMobileNumber(this.getParaToLong("MOBILE_NUMBER"));
    	this.renderStr(UVS.update(lockUserVO, u, userId).toJsonStr());
	}
	
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
