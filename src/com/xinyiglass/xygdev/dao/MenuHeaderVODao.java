package com.xinyiglass.xygdev.dao;

import xygdev.commons.entity.SqlResultSet;
import com.xinyiglass.xygdev.entity.MenuHeaderVO;
import xygdev.commons.entity.PlsqlRetValue;


public interface MenuHeaderVODao {
	
	public SqlResultSet findPersonalMenuById(Long menuId) throws Exception;
	
	public PlsqlRetValue insert(MenuHeaderVO vo) throws Exception;
	
	public PlsqlRetValue lock(MenuHeaderVO vo) throws Exception;
	
	public PlsqlRetValue update(MenuHeaderVO vo) throws Exception;	
	
	public MenuHeaderVO findById(Long id) throws Exception;
	
	public SqlResultSet findByIdForJSON(Long id) throws Exception;
		
}
