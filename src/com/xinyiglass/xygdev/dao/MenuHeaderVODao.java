package com.xinyiglass.xygdev.dao;

import xygdev.commons.entity.SqlResultSet;

public interface MenuHeaderVODao {
	public SqlResultSet findPersonalMenuById(Long menuId) throws Exception;
}
