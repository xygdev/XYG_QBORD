package com.xinyiglass.xygdev.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyiglass.xygdev.entity.BatchExcel;
import com.xinyiglass.xygdev.service.ContractLineVOService;
import com.xinyiglass.xygdev.util.Constant;
import com.xinyiglass.xygdev.util.ReadExcel;

import xygdev.commons.core.BaseController;
import xygdev.commons.entity.PlsqlRetValue;
import xygdev.commons.util.TypeConvert;

@Controller
@RequestMapping("/file")
@Scope("prototype")
public class FileUploadController extends BaseController {	
	
    @Autowired
	ContractLineVOService CLS;
    
    private String tempPath = Constant.LIB_TEMP_PATH; //"E:\\Excel\\buffer\\";
    //定义文件的后缀名限制
    private String Ext_Name = "xls,xlsx";
    File tempPathFile = new File(tempPath);   
    
    @RequestMapping(value = "/batchInsert.do", method = RequestMethod.POST)
	public void batchInsert() throws Exception
	{    	
    	Long headerId = TypeConvert.str2Long(this.getSessionAttr("CONTRACT_HEADER_ID").toString());
    	int colCount = 5;
    	List<BatchExcel> list = null;
    	PlsqlRetValue rv = new PlsqlRetValue();

    	// 1.创建DiskFileItemFactory  
        DiskFileItemFactory factory = new DiskFileItemFactory();  
        //factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是4kb
        factory.setSizeThreshold(1024*1024);//设置创建缓冲区大小 1MB  
        factory.setRepository(tempPathFile);
        // 2.创建  
        ServletFileUpload upload = new ServletFileUpload(factory); 
        //解决上传文件名的中文乱码
        upload.setHeaderEncoding("UTF-8"); 
        //设置文件最大为20M
        upload.setSizeMax(1024*1024*20);
        
        // 底层通过request获取数据，进行解析，将解析的数据封装到List<FileItem>  
        List<FileItem> items = upload.parseRequest(request);  
        
        for (FileItem item : items) {  
            if (item.isFormField()) {  
            	return;
            } else {  
            	String name = item.getName();
                name = name.substring(name.lastIndexOf("\\") + 1);  
                String fileExt = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
                if(!Ext_Name.contains(fileExt))
                {
                	rv.setRetcode(2);
                	rv.setErrbuf("文件上传失败,不支持"+fileExt+"格式文件的上传");
                	this.renderStr(rv.toJsonStr());
                	return;
                	//System.out.println("不支持该"+fileExt+"格式文件的上传");
                }else{
                	String path = Constant.LIB_PATH+this.getSessionAttr("USER_ID")+Constant.POINT+fileExt;
                	FileOutputStream fos = new FileOutputStream(path);  
                	IOUtils.copy(item.getInputStream(), fos);
                	//关闭IO流
                	item.getInputStream().close();
                	fos.close();
                	//解析Excel
                	try{
                		list = new ReadExcel().readExcel(path,colCount);
                	}catch(Exception e){
                		rv.setRetcode(2);
                		rv.setErrbuf(e.getMessage());
                		this.renderStr(rv.toJsonStr());
                		return;
                	}
                	/*
                    if (list != null) {
                        for (BatchExcel be : list) {
                            System.out.println("Col1 : " + be.getCol1() + ", Col2 : " + be.getCol2() + ", Col3 : " + be.getCol3()+ ", Col4 : " + be.getCol4());
                        }
                    }
                    */
                    Map<String,Object> conditionMap=new HashMap<String,Object>();
            		conditionMap.put("docType", "excel");
            		conditionMap.put("headerId", headerId);
            		this.renderStr(CLS.batchInsert(list, conditionMap));
                    //System.out.println(result);   
                    
                    File file = new File(path);  
                    
                    if (file.delete()) {  
                      System.out.println(file.getName() + " is deleted");  
                    } else {  
                      System.out.println("Delete failed.");  
                    } 
                    
                }
               	  
            }
        }       
	}
    
    @RequestMapping(value = "/downloadXlsx.do", method = RequestMethod.GET)
	public void downloadXlsxModel() throws Exception
	{
    	String fileName = "批量导入模板.xlsx";
    	download(fileName);
	}
    
    @RequestMapping(value = "/downloadXls.do", method = RequestMethod.GET)
	public void downloadXlsModel() throws Exception
	{
    	String fileName = "批量导入模板.xls";
    	download(fileName);
	}
    
    public void download(String fileName) throws Exception
	{
    	BufferedInputStream bis = null;  
        BufferedOutputStream bos = null;
        String path = Constant.LIB_MODEL_PATH+fileName;
        long fileLength = new File(path).length();  
        this.response.setCharacterEncoding("utf-8");
        this.response.setContentType("application/octet-stream");  
        this.response.setHeader("Content-disposition", "attachment; filename="+new String(fileName.getBytes("utf-8"), "ISO8859-1")); 
        this.response.setHeader("Content-Length", String.valueOf(fileLength));  
        bis = new BufferedInputStream(new FileInputStream(path));  
        //输出流
        bos = new BufferedOutputStream(response.getOutputStream());  
        byte[] buff = new byte[2048];  
        int bytesRead;  
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
          bos.write(buff, 0, bytesRead);  
        }  
        //关闭流
        bis.close();  
        bos.close();  
	}
	
}
