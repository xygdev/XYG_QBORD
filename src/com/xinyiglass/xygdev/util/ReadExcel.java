package com.xinyiglass.xygdev.util;


import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import xygdev.commons.util.TypeConvert;

import com.xinyiglass.xygdev.entity.BatchExcel;

public class ReadExcel {
    
	private String setName = null;
	
    /**
     * read the Excel file
     * @param path the path of the Excel file
     * @return
     * @throws Exception 
     */
    public List<BatchExcel> readExcel(String path,int colConut) throws Exception {
        if (path == null || Constant.EMPTY.equals(path)) {
            return null;
        } else {
            String postfix = LogUtil.getPostfix(path);
            if (!Constant.EMPTY.equals(postfix)) {
                if (Constant.OFFICE_EXCEL_2003_POSTFIX.equals(postfix)) {
                    return readXls(path,colConut);
                } else if (Constant.OFFICE_EXCEL_2010_POSTFIX.equals(postfix)) {
                    return readXlsx(path,colConut);
                }
            } else {
                System.out.println(path + Constant.NOT_EXCEL_FILE);
            }
        }
        return null;
    }

    /**
     * 读取 Excel 2010 以上版本
     * @param path 文件路径
     * @return List<>
     * @throws Exception 
     */
    @SuppressWarnings("resource")
	public List<BatchExcel> readXlsx(String path,int colCount) throws Exception {
        InputStream is = new FileInputStream(path);
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
        Class<?> c = Class.forName("com.xinyiglass.xygdev.entity.BatchExcel");
        List<BatchExcel> list = new ArrayList<BatchExcel>();
        int numSheet = xssfWorkbook.getNumberOfSheets();
        if(numSheet != 1){
        	throw new Exception("一个Excel只允许存在一个Sheet，不允许存在多个Sheet，请检查当前Excel");
        }else{
        	XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(0);
            //读取行
            for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                if (xssfRow != null) {
                    Object obj = c.newInstance();
                    for(int i = 0;i < colCount;i ++){
                    	setName = "setCol" + TypeConvert.type2Str(i+1);
                    	Method method=c.getMethod(setName, String.class);
                    	XSSFCell xc = xssfRow.getCell(i);
                    	String value = getValue(xc);
                    	method.invoke(obj, value);
                    }
                    list.add((BatchExcel) obj);
                }
            }
        }
        return list;
    }

    /**
     * 读取 Excel 2003-2007 版本
     * @param path 文件路径
     * @return List<>
     * @throws Exception 
     */
    @SuppressWarnings("resource")
	public List<BatchExcel> readXls(String path,int colCount) throws Exception {
        InputStream is = new FileInputStream(path);
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
        List<BatchExcel> list = new ArrayList<BatchExcel>();
        Class<?> c = Class.forName("com.xinyiglass.xygdev.entity.BatchExcel");
        int numSheet = hssfWorkbook.getNumberOfSheets();
        if(numSheet != 1){
        	throw new Exception("一个Excel只允许存在一个Sheet，不允许存在多个Sheet，请检查当前Excel");
        }else{
        	HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
            //读取行
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);
                if (hssfRow != null) {             	 	
                    Object obj = c.newInstance();
                    for(int i = 0;i < colCount;i ++){
                    	setName = "setCol" + TypeConvert.type2Str(i+1);
                    	Method method=c.getMethod(setName, String.class);
                    	HSSFCell hc = hssfRow.getCell(i);
                    	String value = getValue(hc);
                    	method.invoke(obj, value);
                    }
                    list.add((BatchExcel)obj);
                }
            }
        }
        return list;
    }

    private String getValue(XSSFCell xssfRow) {   	
    	if(xssfRow!=null){
	        if (xssfRow.getCellTypeEnum() == CellType.BOOLEAN) {
	            return String.valueOf(xssfRow.getBooleanCellValue());
	        } else if (xssfRow.getCellTypeEnum() == CellType.NUMERIC) {
	            return String.valueOf(xssfRow.getNumericCellValue());
	        } else {
	        	return TypeConvert.type2Str(xssfRow.getStringCellValue());
	        }
    	}else{
    		return "";
    	}
    }

    private String getValue(HSSFCell hssfCell) {
    	if(hssfCell!=null){
	        if (hssfCell.getCellTypeEnum() == CellType.BOOLEAN) {
	            return String.valueOf(hssfCell.getBooleanCellValue());
	        } else if (hssfCell.getCellTypeEnum() == CellType.NUMERIC) {
	            return String.valueOf(hssfCell.getNumericCellValue());
	        } else {
	        	return String.valueOf(hssfCell.getStringCellValue());
	        }
    	}else{
    		return "";
    	}
    }
}

