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
@Component("MenuHeaderVO")
public class MenuHeaderVO extends BaseEntity  implements FactoryBean,RowMapper<MenuHeaderVO>, Cloneable {
   //备注：该Entity对应的数据库对象是：XYG_ALD_MENU_HEADERS_V
   public static final Map<String, String> mapCol = new HashMap<String, String>();
   static {
	  mapCol.put("menuId", "MENU_ID");
	  mapCol.put("applId", "APPL_ID");
	  mapCol.put("applCode", "APPL_CODE");
	  mapCol.put("applDesc", "APPL_DESC");
	  mapCol.put("menuCode", "MENU_CODE");
	  mapCol.put("menuName", "MENU_NAME");
	  mapCol.put("iconId", "ICON_ID");
	  mapCol.put("iconCode", "ICON_CODE");
	  mapCol.put("iconDesc", "ICON_DESC");
	  mapCol.put("description", "DESCRIPTION");
	  mapCol.put("createdBy", "CREATED_BY");
	  mapCol.put("creationDate", "CREATION_DATE");
	  mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
	  mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
	  mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
   }
   private Long menuId;
   private Long applId;
   private String applCode;
   private String applDesc;
   private String menuCode;
   private String menuName;
   private Long iconId;
   private String iconCode;
   private String iconDesc;
   private String description;
   private Long createdBy;
   private java.util.Date creationDate;
   private Long lastUpdatedBy;
   private java.util.Date lastUpdateDate;
   private Long lastUpdateLogin;
   
   //GET&SET Method
   public Long getMenuId() {
	  return menuId;
   }
   public void setMenuId(Long menuId) {
	  this.menuId = menuId;
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
   public Long getIconId() {
	  return iconId;
   }
   public void setIconId(Long iconId) {
	  this.iconId = iconId;
   }
   public String getIconCode() {
	  return iconCode;
   }
   public void setIconCode(String iconCode) {
	  this.iconCode = iconCode;
   }
   public String getIconDesc() {
	  return iconDesc;
   }
   public void setIconDesc(String iconDesc) {
	  this.iconDesc = iconDesc;
   }
   public String getDescription() {
	  return description;
   }
   public void setDescription(String description) {
	  this.description = description;
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
	  MenuHeaderVO h = null;
	  try{
		 h = (MenuHeaderVO)super.clone();
	  }catch(CloneNotSupportedException e) {
		 e.printStackTrace();
	  }
	  return h;
   }
   
   @Override
   public MenuHeaderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
	  return (MenuHeaderVO) mapRowCreator(MenuHeaderVO.class,mapCol,rs,rowNum);
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