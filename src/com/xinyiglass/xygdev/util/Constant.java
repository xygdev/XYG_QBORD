package com.xinyiglass.xygdev.util;

import xygdev.commons.springjdbc.DevJdbcDaoSupport;


public class Constant extends DevJdbcDaoSupport{
	public static boolean DEBUG_MODE = false;
	public static String LOCAL_CHARSET= "GBK";
	public static String IMAGE_USER_PATH;// = "E:\\image\\user\\"
	public static String SERVER_CHARSET ;//= FTP.DEFAULT_CONTROL_ENCODING
	public static String DIR_SEP="/";//ftp和unix用：/    ；本地win系统用：\\\\ 
	
	//FTP参数
	public static final String FTP_HOST="192.168.88.32";//"192.168.0.7";//"192.168.88.32";
	public static final int    FTP_PORT=21;//51322; //21;
	public static final String FTP_USER="oracle";//"appl";//"oracle";
	public static final String FTP_PASS="erp";//"mantou2017";//"erp";
	
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
    
    
    /*
     * POI 配置参数*
     */
    public static final String OFFICE_EXCEL_2003_POSTFIX = "xls";
    public static final String OFFICE_EXCEL_2010_POSTFIX = "xlsx";
    public static final String EMPTY = "";
    public static final String POINT = ".";
    public static final String LIB_PATH = "E:\\Excel\\";//"/home/web/upload/";"E:\\Excel\\";
    public static final String LIB_TEMP_PATH = "E:\\Excel\\buffer";//"/home/web/upload/buffer/";"E:\\Excel\\buffer";
    public static final String LIB_MODEL_PATH = "E:\\Excel\\model\\";
    public static final String NOT_EXCEL_FILE = " : Not the Excel file!";
}
