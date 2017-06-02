package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import xygdev.commons.page.PagePub;
import xygdev.commons.sqlStmt.SqlStmtPub;

//正常应该是写在dao层的。Lov特殊处理，因为只有一个SQL就可以得到要的内容，所以先写在Service层。
//而且Lov的数据访问的重用性不是很高，以查询和验证数据为主，所以确实可以不用封装dao。
//关于分页处理的必须要封装。基本的逻辑是：给一个SQL，还有相关的条件，返回页的json数据结果-->2016.8.9已经完成
@Service
//不需要事务管理的(只查询的)方法，可以提高效率。
@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
public class LovService {

	@Autowired
	PagePub pagePub;
	
	/***人员选择LOV***/
	public String findEmpForPage(int pageSize,int pageNo,boolean goLastPage,String fullName,String employeeNumber,Long loginId) throws Exception{
		StringBuffer sqlBuf=new StringBuffer();
		Map<String,Object> paramMap=new HashMap<String,Object>();
		sqlBuf.append("SELECT FULL_NAME,EMPLOYEE_NUMBER,EMAIL_ADDRESS,WORK_TELEPHONE,PERSON_ID "
				+ " FROM XYG_ALH_PER_PEOPLE "
				+ "  WHERE SYSDATE BETWEEN EFFECTIVE_START_DATE AND NVL(EFFECTIVE_END_DATE,SYSDATE+1) ");
		sqlBuf.append(SqlStmtPub.getAndStmt("FULL_NAME", fullName,paramMap));
		sqlBuf.append(SqlStmtPub.getAndStmt("EMPLOYEE_NUMBER", employeeNumber,paramMap));
		sqlBuf.append(" ORDER BY 1 ");
		return pagePub.qPageForJson(sqlBuf.toString(), paramMap, pageSize, pageNo, goLastPage);
	}
}
