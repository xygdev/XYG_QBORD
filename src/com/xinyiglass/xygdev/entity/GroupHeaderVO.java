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
@Component("GroupHeaderVO")
public class GroupHeaderVO extends BaseEntity  implements FactoryBean,RowMapper<GroupHeaderVO>, Cloneable {
    //备注：该Entity对应的数据库对象是：XYG_ALD_GROUP_HEADERS_V
    public static final Map<String, String> mapCol = new HashMap<String, String>();
    static {
        mapCol.put("groupId", "GROUP_ID");
        mapCol.put("groupCode", "GROUP_CODE");
        mapCol.put("groupName", "GROUP_NAME");
        mapCol.put("applId", "APPL_ID");
        mapCol.put("applCode", "APPL_CODE");
        mapCol.put("applDesc", "APPL_DESC");
        mapCol.put("description", "DESCRIPTION");
        mapCol.put("createdBy", "CREATED_BY");
        mapCol.put("creationDate", "CREATION_DATE");
        mapCol.put("lastUpdatedBy", "LAST_UPDATED_BY");
        mapCol.put("lastUpdateDate", "LAST_UPDATE_DATE");
        mapCol.put("lastUpdateLogin", "LAST_UPDATE_LOGIN");
    }
 
    private Long groupId;
    private String groupCode;
    private String groupName;
    private Long applId;
    private String applCode;
    private String applDesc;
    private String description;
    private Long createdBy;
    private java.util.Date creationDate;
    private Long lastUpdatedBy;
    private java.util.Date lastUpdateDate;
    private Long lastUpdateLogin;
 
    //GET&SET Method
    public Long getGroupId() {
        return groupId;
    }
    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }
    public String getGroupCode() {
        return groupCode;
    }
    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }
    public String getGroupName() {
        return groupName;
    }
    public void setGroupName(String groupName) {
        this.groupName = groupName;
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
        GroupHeaderVO h = null;  
        try{  
            h = (GroupHeaderVO)super.clone();  
        }catch(CloneNotSupportedException e) {  
        	e.printStackTrace();  
        }  
        return h;  
    } 
    
    @Override
    public GroupHeaderVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        return (GroupHeaderVO) mapRowCreator(GroupHeaderVO.class,mapCol,rs,rowNum);
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
