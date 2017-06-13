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
@Component("UserVO")
public class UserVO extends BaseEntity  implements FactoryBean,RowMapper<UserVO>, Cloneable {
   //备注：该Entity对应的数据库对象是：XYG_ALD_USER_V
   public static final Map<String, String> mapCol = new HashMap<String, String>();
   static {
      mapCol.put("userId", "USER_ID");
      mapCol.put("userName", "USER_NAME");
      mapCol.put("description", "DESCRIPTION");
      mapCol.put("startDate", "START_DATE");
      mapCol.put("endDate", "END_DATE");
      mapCol.put("encryptedUserPassword", "ENCRYPTED_USER_PASSWORD");
      mapCol.put("passwordDate", "PASSWORD_DATE");
      mapCol.put("userType", "USER_TYPE");
      mapCol.put("empId", "EMP_ID");
      mapCol.put("empName", "EMP_NAME");
      mapCol.put("empNumber", "EMP_NUMBER");
      mapCol.put("imgUrl", "IMG_URL");
      mapCol.put("wechatCode", "WECHAT_CODE");
      mapCol.put("mobileNumber", "MOBILE_NUMBER");
      mapCol.put("emailAddr", "EMAIL_ADDR");
      mapCol.put("createdBy", "CREATED_BY");
      mapCol.put("creationDate", "CREATION_DATE");
      mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
      mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
      mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
   }
 
   private Long userId;
   private String userName;
   private String description;
   private java.util.Date startDate;
   private java.util.Date endDate;
   private String encryptedUserPassword;
   private java.util.Date passwordDate;
   private String userType;
   private Long empId;
   private String empName;
   private String empNumber;
   private String imgUrl;
   private String wechatCode;
   private Long mobileNumber;
   private String emailAddr;
   private Long createdBy;
   private java.util.Date creationDate;
   private Long lastUpdatedBy;
   private java.util.Date lastUpdateDate;
   private Long lastUpdateLogin;
 
   //GET&SET Method
   public Long getUserId() {
      return userId;
   }
   public void setUserId(Long userId) {
      this.userId = userId;
   }
   public String getUserName() {
      return userName;
   }
   public void setUserName(String userName) {
      this.userName = userName;
   }
   public String getDescription() {
      return description;
   }
   public void setDescription(String description) {
      this.description = description;
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
   public String getEncryptedUserPassword() {
      return encryptedUserPassword;
   }
   public void setEncryptedUserPassword(String encryptedUserPassword) {
      this.encryptedUserPassword = encryptedUserPassword;
   }
   public java.util.Date getPasswordDate() {
      return passwordDate;
   }
   public void setPasswordDate(java.util.Date passwordDate) {
      this.passwordDate = passwordDate;
   }
   public String getUserType() {
      return userType;
   }
   public void setUserType(String userType) {
      this.userType = userType;
   }
   public Long getEmpId() {
      return empId;
   }
   public void setEmpId(Long empId) {
      this.empId = empId;
   }
   public String getEmpName() {
      return empName;
   }
   public void setEmpName(String empName) {
      this.empName = empName;
   }
   public String getEmpNumber() {
      return empNumber;
   }
   public void setEmpNumber(String empNumber) {
      this.empNumber = empNumber;
   }
   public String getImgUrl() {
      return imgUrl;
   }
   public void setImgUrl(String imgUrl) {
      this.imgUrl = imgUrl;
   }
   public String getWechatCode() {
      return wechatCode;
   }
   public void setWechatCode(String wechatCode) {
      this.wechatCode = wechatCode;
   }
   public Long getMobileNumber() {
      return mobileNumber;
   }
   public void setMobileNumber(Long mobileNumber) {
      this.mobileNumber = mobileNumber;
   }
   public String getEmailAddr() {
      return emailAddr;
   }
   public void setEmailAddr(String emailAddr) {
      this.emailAddr = emailAddr;
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
     UserVO h = null;  
     try{  
        h = (UserVO)super.clone();  
     }catch(CloneNotSupportedException e) {  
        e.printStackTrace();  
     }  
     return h;  
   } 
    
   @Override
   public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      return (UserVO) mapRowCreator(UserVO.class,mapCol,rs,rowNum);
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