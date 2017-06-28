package com.xinyiglass.xygdev.util;

import xygdev.commons.springjdbc.DevJdbcDaoSupport;


public class Constant extends DevJdbcDaoSupport{
	public static boolean DEBUG_MODE = false;
	public static String LOCAL_CHARSET= "GBK";
	public static String IMAGE_USER_PATH;// = "E:\\image\\user\\"
	public static String SERVER_CHARSET ;//= FTP.DEFAULT_CONTROL_ENCODING
	public static String DIR_SEP="/";//ftp和unix用：/    ；本地win系统用：\\\\ 
	
	//FTP参数
	public static final String FTP_HOST="192.168.139.9";
	public static final int    FTP_PORT= 21;
	public static final String FTP_USER="applvis";
	public static final String FTP_PASS="applvis";
	
	//系统编码 
	public static final String APPL_CODE = "XYG_QBORD";
	//盐值
    public static final String SALT = "@X@Y@G@";
}
