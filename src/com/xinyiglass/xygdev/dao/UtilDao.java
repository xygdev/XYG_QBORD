package com.xinyiglass.xygdev.dao;

import xygdev.commons.entity.PlsqlRetValue;

//公用dao处理。目前是添加环境变量的初始化的动作
public interface UtilDao {
	public PlsqlRetValue applInit(Long loginId) throws Exception;
	public Long getLoginId() throws Exception;
}