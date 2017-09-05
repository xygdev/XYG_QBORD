package com.xinyiglass.xygdev.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;




import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.*;

import xygdev.commons.util.TypeConvert;

/**
 * 短信验证
 * @author bird
 *
 */
@SuppressWarnings({ "deprecation", "unused" })
public class NeteaseMsg {
	//发送短信验证码,使用短信模板
    @SuppressWarnings("resource")
	public static String sendCode(Long mobile,Long templateId) throws Exception{
    	DefaultHttpClient httpClient = new DefaultHttpClient();
    	HttpPost httpPost = new HttpPost(Constant.SEND_CODE_URL);
    	String curTime = String.valueOf((new Date()).getTime() / 1000L);
    	String checkSum = CheckSumBuilder.getCheckSum(Constant.APP_SECRET, Constant.NONCE, curTime);
    	// 设置请求的header
        httpPost.addHeader("AppKey", Constant.APP_KEY);
        httpPost.addHeader("Nonce", Constant.NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        nvps.add(new BasicNameValuePair("mobile", TypeConvert.type2Str(mobile)));
        nvps.add(new BasicNameValuePair("codeLen", Constant.CODELEN));
        if(templateId!=null){
        	nvps.add(new BasicNameValuePair("templateid", TypeConvert.type2Str(templateId)));
        }
        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        
        return EntityUtils.toString(response.getEntity(), "utf-8");
    }
    
    //发送短信验证码,不使用短信模板
    public static String sendCode(Long mobile) throws Exception{
    	return sendCode(mobile,null);
    }
    
    //验证短信验证码
    @SuppressWarnings("resource")
	public static String verifyCode(Long mobile,String vCode) throws Exception{
    	DefaultHttpClient httpClient = new DefaultHttpClient();
    	HttpPost httpPost = new HttpPost(Constant.VERIFY_CODE_URL);
    	String curTime = String.valueOf((new Date()).getTime() / 1000L);
    	String checkSum = CheckSumBuilder.getCheckSum(Constant.APP_SECRET, Constant.NONCE, curTime);
    	// 设置请求的header
        httpPost.addHeader("AppKey", Constant.APP_KEY);
        httpPost.addHeader("Nonce", Constant.NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        nvps.add(new BasicNameValuePair("mobile", TypeConvert.type2Str(mobile)));
        nvps.add(new BasicNameValuePair("code", TypeConvert.type2Str(vCode)));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
        
        return EntityUtils.toString(response.getEntity(), "utf-8");
    }

    public static void main(String[] args) throws Exception {
    	/*
        DefaultHttpClient httpClient = new DefaultHttpClient();
        HttpPost httpPost = new HttpPost(SERVER_URL);
        String curTime = String.valueOf((new Date()).getTime() / 1000L);

        String checkSum = CheckSumBuilder.getCheckSum(Constant.APP_SECRET,Constant.NONCE, curTime);

        // 设置请求的header
        httpPost.addHeader("AppKey", Constant.APP_KEY);
        httpPost.addHeader("Nonce", Constant.NONCE);
        httpPost.addHeader("CurTime", curTime);
        httpPost.addHeader("CheckSum", checkSum);
        httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        // 设置请求的的参数，requestBody参数
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();

        //nvps.add(new BasicNameValuePair("templateid", TEMPLATEID));
        nvps.add(new BasicNameValuePair("mobile", "18664449216"));
        nvps.add(new BasicNameValuePair("codeLen", Constant.CODELEN));

        httpPost.setEntity(new UrlEncodedFormEntity(nvps, "utf-8"));

        // 执行请求
        HttpResponse response = httpClient.execute(httpPost);
   
        System.out.println(EntityUtils.toString(response.getEntity(), "utf-8"));
        */
    	//String result = sendCode("18664449216");
    	//System.out.println(result);
    	//String a = "[{\"code\":200,\"msg\":\"3\",\"obj\":\"294785\"}]";
    	//JSONObject j = new JSONObject();
    	//j.fromObject(a);
    	//System.out.println(j);
    	//System.out.println(verifyCode(18664449216L,220505L));
    	String a = "{\"code\":200,\"msg\":\"3\",\"obj\":\"294785\"}";
    	JSONObject strJson = new JSONObject(a);
    	System.out.println(strJson.get("code"));
    }
}