<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>信义玻璃</title>    
    <!-- 图标cdn引入 -->
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="plugin/bootstrap/css/bootstrap.min.css">
	<!-- 核心布局 CSS文件 -->
	<link rel="stylesheet" href="plugin/css/login.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="plugin/jQuery/jquery-ui.min.js"></script>	
	<style>
	    .layui-layer-tips .layui-layer-content{
	        font-size:0.9em !important;
	        padding:4px 15px !important;
	    }
	</style>
  </head>
  
  <body>
    
    <!-- 欢迎页区域 start -->
    <div id="welcome-page" style="opacity:1">
      <div class="reveal-modal-bg"></div>
      <!-- 右上角区域 start -->
      <div class="dropdown langue-frame">
   		<button type="button" class="btn dropdown-toggle langue-btn" id="dropdownMenu1" data-toggle="dropdown">
                            语言<span class="caret"></span>
   		</button>
   		<ul class="dropdown-menu" role="menu" style="min-width:100px" aria-labelledby="dropdownMenu1">
      	  <li role="presentation">
            <a role="menuitem" tabindex="-1" href="loginZHS.do">中文</a>
          </li>
          <li role="presentation">
            <a role="menuitem" tabindex="-1" href="loginUS.do">英文</a>
          </li>
        </ul>
      </div>
      <!-- 右上角区域 end -->
      <!-- 左上角区域 start -->
      <div class="logo-frame">
        <img src="/image/login/xyg.png" class="logo-img">
        <h1 class="logo-desc">信义汽车玻璃在线平台</h1>
        <i class="fa fa-car start-btn pointer"></i>
      </div>
      <!-- 左上角区域 end -->
      <!-- 正中间区域 start -->
       <!-- <div class="center-text">
        <h1 class="welcome-text">欢 迎 来 到 信 义 汽 车 玻 璃 在 线 平 台</h1> 
        <button type="button" class="btn start-btn">点击进入</button>   
      </div>  -->
      <!-- 正中间区域 end -->  
      <!-- 背景图轮播区域 start -->
      <div id="myCarousel" class="carousel slide">   	  
   	    <div class="carousel-inner">
      	  <div class="item active bg-img bg1">
      	    <div class="img-desc">
      	    </div>
      	  </div>
      	  <div class="item bg-img bg2">
      	    <div class="img-desc">
      	    </div>
      	  </div>
      	  <div class="item bg-img bg3">
      	    <div class="img-desc">
      	    </div>
      	  </div>
      	  <div class="item bg-img bg4">
      	    <div class="img-desc">
      	    </div>
      	  </div>
   	    </div>
	  </div> 
	  <!-- 背景图轮播区域 end -->
	</div>
	<!-- 欢迎页区域 end -->
	
	<!-- 登录页区域 start -->
	<div id='login-page'>
	  <!-- 右上角区域 start -->
	  <button type='button' class="go-back white">
	    <i class="fa fa-reply fa-2x" aria-hidden="true"></i>	    
	  </button>
	  <!-- 右上角区域 end -->
	  <!-- 正中间区域 start -->
	  <div class="login-frame" >
	    <img src="/image/login/xyg.gif" style="width:100%">
	    <form role="form" id="loginFrom" name="loginFrom" method="post" action="login.do">
   		  <div class="form-group" style="padding:0 25px">
     	    <label for="username">用户名</label>
      	    <input type="text" class="form-control" id="username" name="username" placeholder="请填入用户名" required="required"/>
   		  </div>
   		  <div class="form-group" style="padding:0 25px">
     	    <label for="password">密码</label>
      	    <input type="password" class="form-control" id="password" name="password" placeholder="请填入密码" required="required"/>
   		  </div>
   		  <div  class="form-group" style="padding:0 25px;overflow:hidden;">
   		    <label for="textMsg" style="width:100%">短信验证码</label>  		   
   		    <input type="text" id="textMsg" name="textMsg"  class="form-control textMsg left" placeholder="请输入短信"/>
   		    <button id="getMessage" class="getMessage pointer left">获取短信</button>
   		  </div>
   		  <input type="hidden" id="lang" name="lang" value="ZHS"/>
   		  <button type="submit" class="btn btn-defult login-btn">登录</button>
	    </form>
	    <button class="forgetPassWord btn pointer"  data-reveal-id="findPWD" data-bg="pwd-modal-bg" data-dismissmodalclass="close-pwd-frame">忘记密码</button>
        <div style="height:15px"></div>
        
        
        <!-- 找回密码框 start -->
        <div class="pwd-modal-bg"></div>
        <div id="findPWD" class="pwd_frame ">
          <div class='title pointer'>      
            <span><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;找回密码</span>
          </div>
          <a class="close-pwd-frame" data-type="close">&#215;</a>
          <div class='line'></div>
          <div class='content'>
            <form id='updateData'>
              <div class="form-group" style="padding:0 25px">
                <label for="username_F" >用户名</label>
                <input type="text" id="username_F" class="form-control" name="username" autocomplete="off" placeholder="请填入用户名" required="required"/>
              </div>   
              <div class="form-group" style="padding:0 25px;overflow:hidden;">
                <label for="textMsg_F" class="left" style="width:100%;margin-top:10px;">短信验证码</label>     
                <input type="text" id="textMsg_F"  class="form-control textMsg left" name="textMsg" autocomplete="off" placeholder="请输入短信"  required="required" />
                <button id="getMessage_F" class="getMessage pointer left" >获取短信</button>
              </div>
              <div class="form-group" style="padding:0 25px">
                <label for='N_PASSWORD_F'>新密码</label>
                <input type='password' id='N_PASSWORD_F' class="form-control left N_PASSWORD" name='N_PASSWORD_F' autocomplete="off" data-update="db" class=' password'/>
                <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="N_PASSWORD_F"></i>
                <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="N_PASSWORD_F"></i>
              </div>
            </form>
          </div>
          <div class='foot'>       
            <button id="confirm" class="right update_confirm pointer">修改</button>
          </div>   
        </div>
        <!-- 找回密码弹出框 end-->   
	    
	  </div>
	  <input type="hidden" id="errorMsg" value=${errorMsg} >
	  <%
	     session.setAttribute("errorMsg",null); 
	   %>
	  <!-- 正中间区域 end -->
	</div>
	<!-- 登录页区域 end -->
	
  <script type="text/javascript" src="plugin/layer/layer.js"></script>
  <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
  <script type="text/javascript" src="plugin/js/data.validate.js"></script>
  <script type="text/javascript" src="plugin/layer/layer.js"></script>
  
  <script>
    $(document).ready(function(){
	    layer.tips('点此进入', '.start-btn', {
            tips: [2, '#2b9152'],
            time: 0
        });
	   
	});
	
  	$('#myCarousel').carousel({
  		interval: 5000
	})
	
	errorMSG=$('#errorMsg').val();
	if(errorMSG!=null&&errorMSG!=''){
	    $("#welcome-page").css("display","none");
	    $("#login-page").css("display","block");
	    $('.start-btn')[0].click();
	    layer.alert(errorMSG,{title:'警告',offset:[150]});
	}
	
	$('.start-btn').on('click',function(){
	    $("#layui-layer1").hide();
	    $("#welcome-page").css("display","none");
	    $("#login-page").css("display","block");
	});
	
	$('.go-back').on('click',function(){	 
        $("#layui-layer1").show();  
	    $("#welcome-page").css("display","block");
	    $("#login-page").css("display","none")
	});
	
	$("#findPWD").draggable({ handle: ".title" });
	$('i[data-pwd]').on('click',function(){
        if($(this).data('pwd')=='show'){
            $('.fa-eye[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:block!important');
            $(this).css('display','none');
            $('#'+$(this).data('frame')).attr('type','text');
        }else if($(this).data('pwd')=='hide'){
            $('.fa-eye-slash[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:block!important');
            $(this).css('display','none');
            $('#'+$(this).data('frame')).attr('type','password');
        }
    });

  </script>
  </body>
</html>