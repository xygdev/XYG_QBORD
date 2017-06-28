package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.MenuLineDao;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class MenuLineService {
	@Autowired
	MenuLineDao menuLDao;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findAutoAddSequence(Long menuId,Long loginId) throws Exception{
		Long Seq = menuLDao.autoAddSequence(menuId);
		return "{\"rows\":[{\"MENU_SEQUENCE\":\""+Seq+"\"}]}";
	}	
	
	public PlsqlRetValue insert(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret= menuLDao.insert(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	

	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForDetailPage(Map<String,Object> conditionMap,Long loginId) throws Exception{		
		Map<String,Object> paramMap=new HashMap<String,Object>();
	    StringBuffer sqlBuff = new StringBuffer();
        sqlBuff.append("select * from XYG_ALD_MENU_LINES_V WHERE 1=1");
        sqlBuff.append("   AND MENU_ID = :1");
	    sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
	    paramMap.put("1", conditionMap.get("menuId"));
	    return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));		
	}

	
	public PlsqlRetValue delete(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = menuLDao.delete(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
}