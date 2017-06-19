package com.xinyiglass.xygdev.entity;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import xygdev.commons.core.BaseEntity;

@SuppressWarnings("rawtypes")
@Component("RespVO")
public class RespVO extends BaseEntity  implements FactoryBean,RowMapper<RespVO>, Cloneable {
    //备注：该Entity对应的数据库对象是：XYG_ALD_RESP_V
    public static final Map<String, String> mapCol = new HashMap<String, String>();
    static {
   	    mapCol.put("respId", "RESP_ID");
   	    mapCol.put("applId", "APPL_ID");
   	    mapCol.put("applCode", "APPL_CODE");
        mapCol.put("applDesc", "APPL_DESC");
        mapCol.put("respCode", "RESP_CODE");
	   	mapCol.put("respName", "RESP_NAME");
	   	mapCol.put("description", "DESCRIPTION");
	   	mapCol.put("menuId", "MENU_ID");
	   	mapCol.put("menuCode", "MENU_CODE");
	   	mapCol.put("menuName", "MENU_NAME");
	   	mapCol.put("menuDesc", "MENU_DESC");
        mapCol.put("startDate", "START_DATE");
        mapCol.put("endDate", "END_DATE");
		mapCol.put("createdBy", "CREATED_BY");
		mapCol.put("creationDate", "CREATION_DATE");
		mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
		mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
		mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
   }
   private Long respId;
   private Long applId;
   private String applCode;
   private String applDesc;
   private String respCode;
   private String respName;
   private String description;
   private Long menuId;
   private String menuCode;
   private String menuName;
   private String menuDesc;
   private java.util.Date startDate;
   private java.util.Date endDate;
   private Long createdBy;
   private java.util.Date creationDate;
   private Long lastUpdatedBy;
   private java.util.Date lastUpdateDate;
   private Long lastUpdateLogin;
   
   //GET&SET Method
   public Long getRespId() {
   	   return respId;
   }
   public void setRespId(Long respId) {
   	   this.respId = respId;
   }
   public Long getApplId() {
   	   return applId;
   }
   public void setApplId(Long applId) {
   	   this.applId = applId;
   }
   public String getApplCode() {
       return applCode;
   }
   public void setApplCode(String applCode) {
   	   this.applCode = applCode;
   }
   public String getApplDesc() {
   	   return applDesc;
   }
   public void setApplDesc(String applDesc) {
   	   this.applDesc = applDesc;
   }
   public String getRespCode() {
   	   return respCode;
   }
   public void setRespCode(String respCode) {
   	   this.respCode = respCode;
   }
   public String getRespName() {
   	   return respName;
   }
   public void setRespName(String respName) {
   	   this.respName = respName;
   }
   public String getDescription() {
   	   return description;
   }
   public void setDescription(String description) {
   	   this.description = description;
   }
   public Long getMenuId() {
   	   return menuId;
   }
   public void setMenuId(Long menuId) {
   	   this.menuId = menuId;
   }
   public String getMenuCode() {
       return menuCode;
   }
   public void setMenuCode(String menuCode) {
   	   this.menuCode = menuCode;
   }
   public String getMenuName() {
   	   return menuName;
   }
   public void setMenuName(String menuName) {
   	   this.menuName = menuName;
   }
   public String getMenuDesc() {
   	   return menuDesc;
   }
   public void setMenuDesc(String menuDesc) {
   	   this.menuDesc = menuDesc;
   }
   public java.util.Date getStartDate() {
   	   return startDate;
   }
   public void setStartDate(java.util.Date startDate) {
   	   this.startDate = startDate;
   }
   public java.util.Date getEndDate() {
   	   return endDate;
   }
   public void setEndDate(java.util.Date endDate) {
   	   this.endDate = endDate;
   }
   public Long getCreatedBy() {
   	   return createdBy;
   }
   public void setCreatedBy(Long createdBy) {
   	   this.createdBy = createdBy;
   }
   public java.util.Date getCreationDate() {
   	   return creationDate;
   }
   public void setCreationDate(java.util.Date creationDate) {
   	   this.creationDate = creationDate;
   }
   public Long getLastUpdatedBy() {
   	   return lastUpdatedBy;
   }
   public void setLastUpdatedBy(Long lastUpdatedBy) {
   	   this.lastUpdatedBy = lastUpdatedBy;
   }
   public java.util.Date getLastUpdateDate() {
   	   return lastUpdateDate;
   }
   public void setLastUpdateDate(java.util.Date lastUpdateDate) {
   	   this.lastUpdateDate = lastUpdateDate;
   }
   public Long getLastUpdateLogin() {
   	   return lastUpdateLogin;
   }
   public void setLastUpdateLogin(Long lastUpdateLogin) {
   	   this.lastUpdateLogin = lastUpdateLogin;
   } 
   
   @Override
   public Object clone() {
   RespVO h = null;
   	  try{
   		  h = (RespVO)super.clone();
      }catch(CloneNotSupportedException e) {
      	  e.printStackTrace();
      }
      return h;
   }
   @Override
   public RespVO mapRow(ResultSet rs, int rowNum) throws SQLException {
   	   return (RespVO) mapRowCreator(RespVO.class,mapCol,rs,rowNum);
   }
   @Override
   public Object getObject() throws Exception {
   	   return null;
   }
   @Override
   public Class getObjectType() {
   	   return null;
   }
   @Override
   public boolean isSingleton() {
   	   return false;
   }						
}