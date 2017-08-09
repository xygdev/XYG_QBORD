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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="format-detection" content="telephone=no,email=no,adress=no"/>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0,user-scalable=no;"/>
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script> 
    <style>
        html,body{height:100%}
        /*
		#v3dTest {width: 100%;height: 100%;z-index:97}
		body {margin:0 auto;overflow:hidden;}  
		.bg{background-repeat: no-repeat;background-image: url(/image/home/bg1.png);background-position: top center;background-attachment: fixed;background-size: cover;}
		.box{position:absolute;/*top:65%;*/width:600px;height: 268px;margin:0 auto; padding:30px;z-index:103}
        .car{position:absolute;/*top:65%;*/width:600px;height: 268px;margin:0 auto; padding:30px;z-index:102} 
        */
		/*
		@media screen and (min-width:1441px){
		   .box{top:450px;}
           .car{top:450px;}
        }
        @media screen and (min-width: 1367px) and (max-width: 1440px){
		   .box{top:400px;width:540px;height:241px}
           .car{top:400px;width:540px;height:241px}
        }
        @media screen and (min-width: 1281px) and (max-width: 1366px){
		   .box{top:370px;width:540px;height:241px}
           .car{top:370px;width:540px;height:241px}
        }
        @media screen and (min-width: 1025px) and (max-width: 1280px){
		   .box{top:440px;width:540px;height:241px}
           .car{top:440px;width:540px;height:241px}
        }
        @media screen and (min-width: 801px) and (max-width: 1024px){
		   .box{top:305px;width:480px;height:215px}
           .car{top:305px;width:480px;height:215px}
        }
        */
    </style>
  </head>
  <!--  
  <body class="bg">
    <div class="box"></div>		
    <div class="car">		
		<div id="v3dTest"></div>
	</div>
	<div class="bottom"></div>
    <!--  
    <button id="s" style="display:none">Session过期</button>
    -->
  </body>
  <script type="text/javascript" src="plugin/js/3dControl/3d_control.js"></script>
  <script>
      /*
      function initCar(){
          var left = (document.body.clientWidth/2-($('.car').outerWidth()/2));
          var screen_code = window.screen.height/window.screen.width*16;
          if(screen_code==12.8){
             var top = parseInt((document.body.clientHeight-90)*0.6);
          }else if(screen_code==9){
             var top = parseInt((document.body.clientHeight-90)*0.75);
          }
          $('.box').css('left',left+'px');
          $('.car').css('left',left+'px');
          $('.box').css('top',top+'px');
          $('.car').css('top',top+'px');
      }
      
      $(document).ready(function () {
          initCar();
      	  
      	  $('#v3dTest').v3dControl({
              imgLength: 26,//必填
              imgPath: '/image/home/gallery/',//图片路径  可填  默认img/
              imgType: '.png',//图片类型  可填  默认.png
              isAuto: true//是否自动播放  可填      默认false
          });
          
          
      })
      
      window.onresize=function(){
          initCar();
      }
      */
  </script>
</html>
