package com.xinyiglass.xygdev.util;

import xygdev.commons.springjdbc.DevJdbcDaoSupport;


public class Constant extends DevJdbcDaoSupport{
	public static boolean DEBUG_MODE = false;
	public static String LOCAL_CHARSET= "GBK";
	public static String IMAGE_USER_PATH;// = "E:\\image\\user\\"
	public static String SERVER_CHARSET ;//= FTP.DEFAULT_CONTROL_ENCODING
	public static String DIR_SEP="/";//ftp和unix用：/    ；本地win系统用：\\\\ 
	
	//FTP参数
	public static final String FTP_HOST="192.168.88.32";
	public static final int    FTP_PORT= 21;
	public static final String FTP_USER="oracle";
	public static final String FTP_PASS="erp";
	
	//系统编码 
	public static final String APPL_CODE = "XYG_QBORD";
	//盐值
    public static final String SALT = "@X@Y@G@";
    
    /*
     * 网易云短信配置参数
     * */
    //发送验证码URL
    public static final String SEND_CODE_URL="https://api.netease.im/sms/sendcode.action";
    //检验验证码URL
    public static final String VERIFY_CODE_URL = "https://api.netease.im/sms/verifycode.action";
    //随机数
    public static final String NONCE="123456";
    //网易云信分配的账号
    public static final String APP_KEY="06a4a1a7459106d7153648bddb378c96";
    //网易云信分配的密钥
    public static final String APP_SECRET="f0bbcde0f259";
    //验证码长度，范围4～10，默认为4
    public static final String CODELEN="6";
}
