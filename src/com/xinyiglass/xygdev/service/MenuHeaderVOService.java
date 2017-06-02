package com.xinyiglass.xygdev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;

import com.xinyiglass.xygdev.dao.MenuHeaderVODao;

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
}
