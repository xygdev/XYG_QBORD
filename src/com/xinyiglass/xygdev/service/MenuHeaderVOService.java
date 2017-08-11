package com.xinyiglass.xygdev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;

import com.xinyiglass.xygdev.dao.MenuHeaderVODao;

import java.util.HashMap;
import java.util.Map;

import com.xinyiglass.xygdev.entity.MenuHeaderVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class MenuHeaderVOService {
	@Autowired
	MenuHeaderVODao menuDao;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findPersonalMenuById(Long menuId,Long loginId) throws Exception{
		return menuDao.findPersonalMenuById(menuId).toArrayStr();
	}
	
	public PlsqlRetValue insert(MenuHeaderVO mh,Long loginId) throws Exception{
		PlsqlRetValue ret=menuDao.insert(mh);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();
		}
		return ret;
	}
	
	public PlsqlRetValue update(MenuHeaderVO mh,MenuHeaderVO updateMH,Long loginId) throws Exception
	{
		PlsqlRetValue ret=menuDao.lock(mh);
		if(ret.getRetcode()==0){
			ret=menuDao.update(updateMH);
		}else{
			DevJdbcSubProcess.setRollbackOnly();
		}
		return ret;
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForMenuHPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
	    StringBuffer sqlBuff = new StringBuffer();
        sqlBuff.append("select * from XYG_ALD_MENU_HEADERS_VL WHERE 1=1");
        sqlBuff.append("   AND APPL_ID = XYG_ALD_GLOBAL_PKG.appl_id");
        sqlBuff.append(SqlStmtPub.getAndStmt("MENU_ID",conditionMap.get("menuId"),paramMap));
	    sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
	    return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public MenuHeaderVO findById(Long id,Long loginId) throws Exception{
		return menuDao.findById(id);
	}
		
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findByIdForJSON(Long id,Long loginId) throws Exception{
		return menuDao.findByIdForJSON(id).toJsonStr();
	}
	
}



