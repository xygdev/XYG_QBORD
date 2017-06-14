
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head> 
    <title>系统错误页面</title>
    <base href="<%=basePath%>">    
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="keywords" content="this by them, txt, custom websites, custom web applications, web development, mobile development, roadmapping, custom cms website, design with purpose">
    <!-- 2017/6/8	 -->
    <link href="plugin/css/error/publicError.css" rel="stylesheet" type="text/css" media="screen, projection" />
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>    
  </head>
  <body class="x404 x404_index">
	<input type="hidden" id="errorCode" value="${errorCode}" />
	<div class="road"></div>
	<img src="/image/error/car.png" class="carimage" > 
	<div class="container session">
	  <h3>
	    <span class="slogan" >当前浏览页面的Session已过期</span><br><b>请点击<a class="quit" href="javascript:void(0)">此处</a>重新登录</b>
	  </h3>
	</div>
	<div class="container error hidden">
	  <h3>
	    <span class="slogan" >404 NOT FOUND</span><br><b>当前页面正在建设中，请点击<a class="quit" href="javascript:void(0)">此处</a>返回地球</b>
	  </h3>
	</div>
	
  	<script>  	
  		 var  err = $('#errorCode').val();
  		 if(err == "error"){
  		 	$(".error").removeClass("hidden");
  		 	$(".session").addClass("hidden");
  		 }else if(err == "sessionTO"){
  		 	$(".error").addClass("hidden");
  		 	$(".session").removeClass("hidden");
  		 }else{

  		 } 
  		      
		 $('.quit').on('click',function(){
	          if (top != self) {
	             parent.$('#signout').click();
	          }else{
	             $(this).attr('href',$('base').attr('href'));
	             window.location.href($('base').attr('href'));
	          }  
	      });
	      window.analytics||(window.analytics=[]),window.analytics.methods=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group","on","once","off"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;window.analytics.methods.length>i;i++){var method=window.analytics.methods[i];window.analytics[method]=window.analytics.factory(method)}window.analytics.load=function(t){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)},window.analytics.SNIPPET_VERSION="2.0.8",
		  window.analytics.load("04kof9hy7t");
	      window.analytics.page();
	</script> 
  </body>
</html>
   
