package com.xinyiglass.xygdev.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.RespVODao;

import xygdev.commons.page.PagePub;
import xygdev.commons.util.TypeConvert;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class RespVOService {
	@Autowired
	RespVODao respDao;
	@Autowired
	PagePub pagePub;
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Long findMenuId(Long respId,Long loginId) throws Exception{
		return TypeConvert.str2Long(respDao.findMenuId(respId));
	}
}
