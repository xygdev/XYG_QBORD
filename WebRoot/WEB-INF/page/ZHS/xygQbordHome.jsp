<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>主页</title>
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script> 
  </head>
  
  <body>
    <h1>这是主页</h1>
    <br/>
    <button id="s">Session过期</button>
    
  </body>
  <script>
      $('#s').on('click',function(){
          $.ajax({
          	  type:'post',
          	  url:'sessionDestroy.do'
          });
      });
  
  </script>
</html>
