package com.xinyiglass.xygdev.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.service.ItemsService;
import com.xinyiglass.xygdev.util.IterateFtpDir;

@Controller
@RequestMapping("/ftp")
@Scope("prototype")
public class FtpImageController {
	
	@Autowired
	ItemsService is;
	
	protected HttpServletRequest req; 
    protected HttpServletResponse res; 
    protected HttpSession sess; 
    protected FTPClient ftpClient;
    
    @ModelAttribute 
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
        this.req = request; 
        this.res = response; 
        this.sess = request.getSession(); 
        req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");  
    }
    
    public void log(String logMessage){
		System.out.println(logMessage);
	}
    
    
    
    @RequestMapping(value = "/ftpImg.do", method = RequestMethod.GET)
    public void testpic() throws Exception {    
    	//String filePath = "/ebs/data/image/user/admin.png";
    	//String filePath = "/oracle/vis/apps/apps_st/appl/attchment/12.0.0/TECHNICALTPFILE/APT1834A-\\u98CE\\u795EAX7-R.RH.jpg";
    	Map<String,Object> conditionMap=new HashMap<String,Object>();
    	conditionMap.put("itemId", req.getParameter("ITEM_ID"));
		conditionMap.put("orgId", req.getParameter("ORG_ID"));
		conditionMap.put("fileTypeCode", req.getParameter("FILE_TYPE_CODE"));
		//conditionMap.put("rowNum", req.getParameter("RN"));
		log(conditionMap.toString());
    	String filePath = is.findPicUrlByItemId(conditionMap);
    	filePath = filePath.replace("/appl/prod/apps/apps_st/appl/attchment/12.0.0/", "/oracle/attchment/");
    	log("filePath:"+filePath);
    	String fileDownload=filePath;
    	String fileName = IterateFtpDir.getFileName(filePath);
    	log(fileName);
		if (fileDownload!=null&&fileDownload.trim().length()!=0){
	   		res.setContentType("image/jpeg");
			String agent = req.getHeader("USER-AGENT");
			if (agent!=null&&agent.toUpperCase().indexOf("MSIE") != -1) {//IE内核浏览器
				fileName = URLEncoder.encode(fileName, "UTF-8");
				fileName = fileName.replace("+", "%20");//处理IE文件名中有空格会变成+"的问题;
			} else {
				fileName = URLDecoder.decode(fileName,"UTF-8");
				Base64 b64=new Base64();//火狐文件名空格被截断问题
				fileName = "=?UTF-8?B?" + (new String (b64.encode(fileName.getBytes("UTF-8")))) + "?="; 
			}
			res.addHeader("Content-Disposition", "inline;filename="+fileName);//inline(打开),attachment下载
			java.io.OutputStream outp=null;
			java.io.FileInputStream in = null;
			java.io.InputStream ips = null;
			IterateFtpDir ftp=null;
			try{
				outp=res.getOutputStream();
				byte[] b=new byte[1024];
				int i=0;
				ftp=new IterateFtpDir(false);
				ftp.getFtp().setFileType(FTPClient.BINARY_FILE_TYPE);  
				ftp.getFtp().enterLocalPassiveMode(); 
				System.out.println("fileDownload:"+fileDownload);
				ips = ftp.getFtp().retrieveFileStream(IterateFtpDir.str2FtpCharset(fileDownload)); 
				System.out.println("ips:"+ips);
				if(ips!=null){
    				while((i=ips.read(b))>0){
    					outp.write(b,0,i);
    				}
				}else{
					throw new RuntimeException("文件不存在！");
				}
				outp.flush();
				outp.close();
				ftp.getFtp().getReply();
			}catch(Exception e){
				e.printStackTrace();
			}finally{			
				if(in!=null)in.close();
				if(outp!=null)outp.close();
				if(ips!=null)ips.close();
				if(ftp!=null)ftp.disConnection();
			}
		}else{
			throw new RuntimeException("fileDownload path is null!");
		}
		
        //FileInputStream fis = null;  
        //File file = new File("E://image/user/admin.png");  
        //File file = new File("home/images/test.png"); 服务器目录和本地图片的区别是图片路径  
        //fis = new FileInputStream(file);  
        //response.setContentType("image/png"); //设置返回的文件类型     
        //response.setHeader("Access-Control-Allow-Origin", "*");//设置该图片允许跨域访问  
        //IOUtils.copy(fis, response.getOutputStream());   
    }    
    
    public static void main(String[] args) {
		//System.out.println(a.replaceAll("\\","\\\\"));
    	
    }
}
