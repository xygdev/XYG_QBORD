package com.xinyiglass.xygdev.util;

import org.apache.commons.net.ftp.FTP;

/** 
 * QBORD汽玻在线下单系统全局初始化。登录的时候使用！
 * @author Bird  2017-7-1
 */  
public class GlobalInit {  
    public static void init(Boolean debug){  
    	//注意！当切换环境的时候，要日志信息，必须要修改log4j.properties的file路径！
    	if(debug!=null){//实现一个效果：当登录的时候，不自动切换现有的调试状态。
    		xygdev.commons.util.Constant.DEBUG_MODE=debug;//common包的调试模式
        	Constant.DEBUG_MODE = debug;//调试模式
        	//System.out.println("debugMode:"+debug);
    	}
    	Constant.IMAGE_USER_PATH = "/home/web/image/user/";// "E:\\image\\user\\";
    	Constant.LOCAL_CHARSET = "GBK";
    	Constant.SERVER_CHARSET = FTP.DEFAULT_CONTROL_ENCODING;
    	Constant.DIR_SEP="/";//ftp和unix用：/    ；本地win系统用：\\\\
    	//报表输出文件夹路径。注意：不包括/结尾的！
    	//Constant.CONC_OUT="/XYGB2B/conc/out";
    	//Constant.FTP_HOST="192.168.88.30";
    	//Constant.FTP_PORT=21;
    	//Constant.FTP_USER="oracle";
    	//Constant.FTP_PASS="oracle";
    }    
}  


