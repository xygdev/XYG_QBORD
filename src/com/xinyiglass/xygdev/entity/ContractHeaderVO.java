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
@Component("ContractHeaderVO")
public class ContractHeaderVO extends BaseEntity  implements FactoryBean,RowMapper<ContractHeaderVO>, Cloneable {
   //备注：该Entity对应的数据库对象是：XYG_QBORD_CONTRACT_HEADERS_V
   public static final Map<String, String> mapCol = new HashMap<String, String>();
   static {
      mapCol.put("headerId", "HEADER_ID");
      mapCol.put("contractNumber", "CONTRACT_NUMBER");
      mapCol.put("partyName", "PARTY_NAME");
      mapCol.put("accountNumber", "ACCOUNT_NUMBER");
      mapCol.put("customerId", "CUSTOMER_ID");
      mapCol.put("salesOrgId", "SALES_ORG_ID");
      mapCol.put("salesOrgName", "SALES_ORG_NAME");
      mapCol.put("shipFromOrgId", "SHIP_FROM_ORG_ID");
      mapCol.put("shipFromOrgName", "SHIP_FROM_ORG_NAME");
      mapCol.put("orgId", "ORG_ID");
      mapCol.put("currCode", "CURR_CODE");
      mapCol.put("priceListName", "PRICE_LIST_NAME");
      mapCol.put("priceListId", "PRICE_LIST_ID");
      mapCol.put("orderTypeName", "ORDER_TYPE_NAME");
      mapCol.put("orderTypeId", "ORDER_TYPE_ID");
      mapCol.put("customerPo", "CUSTOMER_PO");
      mapCol.put("remarks", "REMARKS");
      mapCol.put("status", "STATUS");
      mapCol.put("statusBookUid", "STATUS_BOOK_UID");
      mapCol.put("statusBookDate", "STATUS_BOOK_DATE");
      mapCol.put("statusReceiveUid", "STATUS_RECEIVE_UID");
      mapCol.put("statusReceiveDate", "STATUS_RECEIVE_DATE");
      mapCol.put("statusCheckUid", "STATUS_CHECK_UID");
      mapCol.put("statusCheckDate", "STATUS_CHECK_DATE");
      mapCol.put("statusConfirmUid", "STATUS_CONFIRM_UID");
      mapCol.put("statusConfirmDate", "STATUS_CONFIRM_DATE");
      mapCol.put("statusTransferUid", "STATUS_TRANSFER_UID");
      mapCol.put("statusTransferDate", "STATUS_TRANSFER_DATE");
      mapCol.put("statusCancelUid", "STATUS_CANCEL_UID");
      mapCol.put("statusCancelDate", "STATUS_CANCEL_DATE");
      mapCol.put("createdBy", "CREATED_BY");
      mapCol.put("creationDate", "CREATION_DATE");
      mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
      mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
      mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
   }
 
   private Long headerId;
   private String contractNumber;
   private String partyName;
   private String accountNumber;
   private Long customerId;
   private Long salesOrgId;
   private String salesOrgName;
   private Long shipFromOrgId;
   private String shipFromOrgName;
   private Long orgId;
   private String currCode;
   private String priceListName;
   private Long priceListId;
   private String orderTypeName;
   private Long orderTypeId;
   private String customerPo;
   private String remarks;
   private String status;
   private Long statusBookUid;
   private java.util.Date statusBookDate;
   private Long statusReceiveUid;
   private java.util.Date statusReceiveDate;
   private Long statusCheckUid;
   private java.util.Date statusCheckDate;
   private Long statusConfirmUid;
   private java.util.Date statusConfirmDate;
   private Long statusTransferUid;
   private java.util.Date statusTransferDate;
   private Long statusCancelUid;
   private java.util.Date statusCancelDate;
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
   public String getContractNumber() {
      return contractNumber;
   }
   public void setContractNumber(String contractNumber) {
      this.contractNumber = contractNumber;
   }
   public String getPartyName() {
      return partyName;
   }
   public void setPartyName(String partyName) {
      this.partyName = partyName;
   }
   public String getAccountNumber() {
      return accountNumber;
   }
   public void setAccountNumber(String accountNumber) {
      this.accountNumber = accountNumber;
   }
   public Long getCustomerId() {
      return customerId;
   }
   public void setCustomerId(Long customerId) {
      this.customerId = customerId;
   }
   public Long getSalesOrgId() {
      return salesOrgId;
   }
   public void setSalesOrgId(Long salesOrgId) {
      this.salesOrgId = salesOrgId;
   }
   public String getSalesOrgName() {
      return salesOrgName;
   }
   public void setSalesOrgName(String salesOrgName) {
      this.salesOrgName = salesOrgName;
   }
   public Long getShipFromOrgId() {
      return shipFromOrgId;
   }
   public void setShipFromOrgId(Long shipFromOrgId) {
      this.shipFromOrgId = shipFromOrgId;
   }
   public String getShipFromOrgName() {
      return shipFromOrgName;
   }
   public void setShipFromOrgName(String shipFromOrgName) {
      this.shipFromOrgName = shipFromOrgName;
   }
   public Long getOrgId() {
      return orgId;
   }
   public void setOrgId(Long orgId) {
      this.orgId = orgId;
   }
   public String getCurrCode() {
      return currCode;
   }
   public void setCurrCode(String currCode) {
      this.currCode = currCode;
   }
   public String getPriceListName() {
      return priceListName;
   }
   public void setPriceListName(String priceListName) {
      this.priceListName = priceListName;
   }
   public Long getPriceListId() {
      return priceListId;
   }
   public void setPriceListId(Long priceListId) {
      this.priceListId = priceListId;
   }
   public String getOrderTypeName() {
      return orderTypeName;
   }
   public void setOrderTypeName(String orderTypeName) {
      this.orderTypeName = orderTypeName;
   }
   public Long getOrderTypeId() {
      return orderTypeId;
   }
   public void setOrderTypeId(Long orderTypeId) {
      this.orderTypeId = orderTypeId;
   }
   public String getCustomerPo() {
      return customerPo;
   }
   public void setCustomerPo(String customerPo) {
      this.customerPo = customerPo;
   }
   public String getRemarks() {
      return remarks;
   }
   public void setRemarks(String remarks) {
      this.remarks = remarks;
   }
   public String getStatus() {
      return status;
   }
   public void setStatus(String status) {
      this.status = status;
   }
   public Long getStatusBookUid() {
      return statusBookUid;
   }
   public void setStatusBookUid(Long statusBookUid) {
      this.statusBookUid = statusBookUid;
   }
   public java.util.Date getStatusBookDate() {
      return statusBookDate;
   }
   public void setStatusBookDate(java.util.Date statusBookDate) {
      this.statusBookDate = statusBookDate;
   }
   public Long getStatusReceiveUid() {
      return statusReceiveUid;
   }
   public void setStatusReceiveUid(Long statusReceiveUid) {
      this.statusReceiveUid = statusReceiveUid;
   }
   public java.util.Date getStatusReceiveDate() {
      return statusReceiveDate;
   }
   public void setStatusReceiveDate(java.util.Date statusReceiveDate) {
      this.statusReceiveDate = statusReceiveDate;
   }
   public Long getStatusCheckUid() {
      return statusCheckUid;
   }
   public void setStatusCheckUid(Long statusCheckUid) {
      this.statusCheckUid = statusCheckUid;
   }
   public java.util.Date getStatusCheckDate() {
      return statusCheckDate;
   }
   public void setStatusCheckDate(java.util.Date statusCheckDate) {
      this.statusCheckDate = statusCheckDate;
   }
   public Long getStatusConfirmUid() {
      return statusConfirmUid;
   }
   public void setStatusConfirmUid(Long statusConfirmUid) {
      this.statusConfirmUid = statusConfirmUid;
   }
   public java.util.Date getStatusConfirmDate() {
      return statusConfirmDate;
   }
   public void setStatusConfirmDate(java.util.Date statusConfirmDate) {
      this.statusConfirmDate = statusConfirmDate;
   }
   public Long getStatusTransferUid() {
      return statusTransferUid;
   }
   public void setStatusTransferUid(Long statusTransferUid) {
      this.statusTransferUid = statusTransferUid;
   }
   public java.util.Date getStatusTransferDate() {
      return statusTransferDate;
   }
   public void setStatusTransferDate(java.util.Date statusTransferDate) {
      this.statusTransferDate = statusTransferDate;
   }
   public Long getStatusCancelUid() {
      return statusCancelUid;
   }
   public void setStatusCancelUid(Long statusCancelUid) {
      this.statusCancelUid = statusCancelUid;
   }
   public java.util.Date getStatusCancelDate() {
      return statusCancelDate;
   }
   public void setStatusCancelDate(java.util.Date statusCancelDate) {
      this.statusCancelDate = statusCancelDate;
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
     ContractHeaderVO h = null;  
     try{  
        h = (ContractHeaderVO)super.clone();  
     }catch(CloneNotSupportedException e) {  
        e.printStackTrace();  
     }  
     return h;  
   } 
    
   @Override
   public ContractHeaderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      return (ContractHeaderVO) mapRowCreator(ContractHeaderVO.class,mapCol,rs,rowNum);
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
 