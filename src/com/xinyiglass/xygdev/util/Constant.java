package com.xinyiglass.xygdev.util;

import xygdev.commons.springjdbc.DevJdbcDaoSupport;


public class Constant extends DevJdbcDaoSupport{
	public static boolean DEBUG_MODE = false;
	public static String LOCAL_CHARSET= "GBK";
	public static String IMAGE_USER_PATH;// = "E:\\image\\user\\"
	public static String SERVER_CHARSET ;//= FTP.DEFAULT_CONTROL_ENCODING
	public static String DIR_SEP="/";//ftp和unix用：/    ；本地win系统用：\\\\ 
	//报表输出文件夹路径。注意：不包括/结尾的！
	//public static String CONC_OUT;//="/home/oracle/conc/out"
	//public static String FTP_HOST;//="192.168.0.26"
	//public static int FTP_PORT;//=21
	//public static String FTP_USER;//="oracle"
	//public static String FTP_PASS;//="oracle"
	
	//系统编码 
	public static final String APPL_CODE = "XYG_QBORD";
	//盐值
    public static final String SALT = "@X@Y@G@";
}
