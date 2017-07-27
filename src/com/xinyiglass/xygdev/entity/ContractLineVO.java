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
@Component("ContractLineVO")
public class ContractLineVO extends BaseEntity  implements FactoryBean,RowMapper<ContractLineVO>, Cloneable {
   //备注：该Entity对应的数据库对象是：XYG_QBORD_CONTRACT_LINES_V
   public static final Map<String, String> mapCol = new HashMap<String, String>();
   static {
      mapCol.put("headerId", "HEADER_ID");
      mapCol.put("lineId", "LINE_ID");
      mapCol.put("lineNum", "LINE_NUM");
      mapCol.put("inventoryItemId", "INVENTORY_ITEM_ID");
      mapCol.put("shipFromOrgId", "SHIP_FROM_ORG_ID");
      mapCol.put("orgId", "ORG_ID");
      mapCol.put("description", "DESCRIPTION");
      mapCol.put("carname", "CARNAME");
      mapCol.put("orderQuantity", "ORDER_QUANTITY");
      mapCol.put("suggestUnitPrice", "SUGGEST_UNIT_PRICE");
      mapCol.put("unitPrice", "UNIT_PRICE");
      mapCol.put("remarks", "REMARKS");
      mapCol.put("createdBy", "CREATED_BY");
      mapCol.put("creationDate", "CREATION_DATE");
      mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
      mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
      mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
   }
 
   private Long headerId;
   private Long lineId;
   private Long lineNum;
   private Long inventoryItemId;
   private Long shipFromOrgId;
   private Long orgId;
   private String description;
   private String carname;
   private Long orderQuantity;
   private Long suggestUnitPrice;
   private Long unitPrice;
   private String remarks;
   private Long createdBy;
   private java.util.Date creationDate;
   private Long lastUpdatedBy;
   private java.util.Date lastUpdateDate;
   private Long lastUpdateLogin;
 
   //GET&SET Method
   public Long getHeaderId() {
      return headerId;
   }
   public void setHeaderId(Long headerId) {
      this.headerId = headerId;
   }
   public Long getLineId() {
      return lineId;
   }
   public void setLineId(Long lineId) {
      this.lineId = lineId;
   }
   public Long getLineNum() {
      return lineNum;
   }
   public void setLineNum(Long lineNum) {
      this.lineNum = lineNum;
   }
   public Long getInventoryItemId() {
      return inventoryItemId;
   }
   public void setInventoryItemId(Long inventoryItemId) {
      this.inventoryItemId = inventoryItemId;
   }
   public Long getShipFromOrgId() {
      return shipFromOrgId;
   }
   public void setShipFromOrgId(Long shipFromOrgId) {
      this.shipFromOrgId = shipFromOrgId;
   }
   public Long getOrgId() {
      return orgId;
   }
   public void setOrgId(Long orgId) {
      this.orgId = orgId;
   }
   public String getDescription() {
      return description;
   }
   public void setDescription(String description) {
      this.description = description;
   }
   public String getCarname() {
      return carname;
   }
   public void setCarname(String carname) {
      this.carname = carname;
   }
   public Long getOrderQuantity() {
      return orderQuantity;
   }
   public void setOrderQuantity(Long orderQuantity) {
      this.orderQuantity = orderQuantity;
   }
   public Long getSuggestUnitPrice() {
      return suggestUnitPrice;
   }
   public void setSuggestUnitPrice(Long suggestUnitPrice) {
      this.suggestUnitPrice = suggestUnitPrice;
   }
   public Long getUnitPrice() {
      return unitPrice;
   }
   public void setUnitPrice(Long unitPrice) {
      this.unitPrice = unitPrice;
   }
   public String getRemarks() {
      return remarks;
   }
   public void setRemarks(String remarks) {
      this.remarks = remarks;
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
     ContractLineVO h = null;  
     try{  
        h = (ContractLineVO)super.clone();  
     }catch(CloneNotSupportedException e) {  
        e.printStackTrace();  
     }  
     return h;  
   } 
    
   @Override
   public ContractLineVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      return (ContractLineVO) mapRowCreator(ContractLineVO.class,mapCol,rs,rowNum);
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
