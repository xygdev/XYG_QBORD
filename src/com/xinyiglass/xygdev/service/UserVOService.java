package com.xinyiglass.xygdev.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xinyiglass.xygdev.dao.UserVODao;
import com.xinyiglass.xygdev.entity.UserVO;

import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.page.PagePub;
import xygdev.commons.springjdbc.DevJdbcSubProcess;
import xygdev.commons.sqlStmt.SqlStmtPub;

@Service
@Transactional(rollbackFor=Exception.class)//指定checked的异常Exception也要回滚！
public class UserVOService {
	
	@Autowired
	PagePub pagePub;
	@Autowired
	UserVODao userDao;

	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findForPage(Map<String,Object> conditionMap,Long loginId) throws Exception{
		Map<String,Object> paramMap=new HashMap<String,Object>();
		StringBuffer sqlBuff = new StringBuffer();
		sqlBuff.append("select A.*,XYG_ALD_COMMON_PKG.GET_LKM_BY_LKCODE('XYG_ALD_USER_TYPE',A.USER_TYPE) USER_TYPE_M from XYG_ALD_USER_V A WHERE 1=1");
		sqlBuff.append(SqlStmtPub.getAndStmt("USER_ID",conditionMap.get("userId"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("USER_TYPE",conditionMap.get("userType"),paramMap));
		sqlBuff.append(SqlStmtPub.getAndStmt("START_DATE",conditionMap.get("startDate_F"),conditionMap.get("startDate_T"),paramMap));
		//sqlBuff.append(SqlStmtPub.getAndStmt("END_DATE",conditionMap.get("endDate_F"),conditionMap.get("endDate_T"),paramMap));
		sqlBuff.append(" ORDER BY "+conditionMap.get("orderBy"));
		return pagePub.qPageForJson(sqlBuff.toString(), paramMap, (Integer)conditionMap.get("pageSize"), (Integer)conditionMap.get("pageNo"), (boolean)conditionMap.get("goLastPage"));
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public UserVO findForUserVOByName(String userName,Long loginId) throws Exception{
		return userDao.findByUserName(userName);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public UserVO findVOById(Long userId,Long loginId) throws Exception{
		return userDao.findVOById(userId);
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findJSONById(Long userId,Long loginId) throws Exception{
		return userDao.findJSONById(userId).toJsonStr();
	}
	
	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public String findAllUsers(Long loginId) throws Exception{
		return userDao.findAllUsers();
	}
	
	public PlsqlRetValue insert(UserVO u,Long loginId) throws Exception{
		PlsqlRetValue ret=userDao.insert(u);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue update(UserVO lockUserVO,UserVO updateUserVO,Long loginId) throws Exception
	{ 
		PlsqlRetValue ret=userDao.lock(lockUserVO);
		if(ret.getRetcode()==0){
			ret=userDao.update(updateUserVO);
		}else{
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
	
	public PlsqlRetValue updatePWD(Map<String,Object> conditionMap,Long loginId) throws Exception{
		PlsqlRetValue ret = userDao.updatePWD(conditionMap);
		if(ret.getRetcode()!=0){
			DevJdbcSubProcess.setRollbackOnly();//该事务必须要回滚！
		}
		return ret;
	}
}
