<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
	<script>
	    var IE = function (version){
	        document.write('<div class="cover"><div class="browers"><div class="title"><br/><span>Choose A Browers</span><br/><span>Go To The Download Page.</span></div><a href="http://www.firefox.com.cn/"><img width="150" src="/image/login/ff.png"/></a><a href="https://www.google.cn/chrome/browser/desktop/index.html"><img width="150" src="/image/login/chrome.png"/></a><a href="https://www.microsoft.com/zh-cn/download/internet-explorer-11-for-windows-7-details.aspx"><img width="120" src="/image/login/ie.png"/></a></div></div>');
	    	alert('The Browers '+version+' Could Not Support Visiting Our Website.Please Download Another Browers And Try Again.');
	    }	    
	    
	    if (document.all && document.compatMode && !window.XMLHttpRequest) {
			IE('IE6');
		}else if (document.all && window.XMLHttpRequest && !document.querySelector) {
			IE('IE7');
		}else if (document.all && document.querySelector && !document.addEventListener) {
			IE('IE8');
		}else if (document.all && document.addEventListener && !window.atob) {
			IE('IE9');
		}else if (document.all && document.addEventListener && window.atob) {
			IE('IE10');
		}else{
		    null;
		}
		
	</script>
  </head>
  
  <body>
    
    <!-- 欢迎页区域 start -->
    <div id="welcome-page" style="opacity:1;height:100%">
      <div class="reveal-modal-bg"></div>
      <!-- 右上角区域 start -->
      <div class="dropdown langue-frame">
   		<button type="button" class="btn dropdown-toggle langue-btn" id="dropdownMenu1" data-toggle="dropdown">
          Language<span class="caret"></span>
   		</button>
   		<ul class="dropdown-menu" role="menu" style="min-width:100px" aria-labelledby="dropdownMenu1">
      	  <li role="presentation">
            <a role="menuitem" tabindex="-1" href="loginZHS.do">CN</a>
          </li>
          <li role="presentation">
            <a role="menuitem" tabindex="-1" href="loginUS.do">EN</a>
          </li>
        </ul>
      </div>
      <!-- 右上角区域 end -->
      <!-- 左上角区域 start -->
      <div class="logo-frame">
        <img src="/image/login/xyg.png" class="logo-img">
        <h1 class="logo-desc">XYG Automobile Glass Online Platform</h1>
        <i class="fa fa-circle green start-btn pointer">
          <i class="fa fa-user-circle-o"></i>
        </i>
      </div>
      <!-- 左上角区域 end -->

      <!-- 背景图轮播区域 start -->
      <div id="myCarousel" class="carousel slide" style="height:inherit;">   	  
   	    <div class="carousel-inner" style="height:inherit;">
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
	<div id="login-page">
	  <!-- 右上角区域 start -->
	  <button type="button" class="go-back white" style="z-index:106;">
	    <i class="fa fa-reply fa-2x" aria-hidden="true"></i>	    
	  </button>
	  <!-- 右上角区域 end -->
	  <!-- 正中间区域 start -->
	  <div class="login-modal-bg"></div> 
	  <div class="login-frame" >
	    <img src="/image/login/xyg.gif" style="width:100%">
	    <form role="form" id="loginFrom" name="loginFrom" method="post" action="login.do">
   		  <div class="form-group" style="padding:0 25px">
     	    <label for="username">Username</label>
      	    <input type="text" class="form-control" id="username" name="username" autocomplete="off" placeholder="Please Enter Your User Name" required="required"/>
   		  </div>
   		  <div class="form-group" style="padding:0 25px">
     	    <label for="password">Password</label>
     	    <input type="text" style="display:none;" />
      	    <input type="text" class="form-control" id="password" name="password" autocomplete="off" onfocus="this.type='password'" onBlur="if(this.value==null||this.value==''){this.type='text'}" placeholder="Please Enter Your Password" required="required"/>
   		    <input type="text" style="display:none;" />
   		  </div>
   		  <div  class="form-group" style="padding:0 25px;overflow:hidden;">
   		    <label for="textMsg" style="width:100%">Message Code</label>  		   
   		    <input type="text" id="textMsg" name="textMsg"  class="form-control textMsg left" autocomplete="off" placeholder="Please Enter Your Message Code"/>
   		    <button id="getMessage" class="getMessage pointer left">Send Msg</button>
   		  </div>
   		  <input type="hidden" id="lang" name="lang" value="US"/>
   		  <button type="submit" class="btn btn-defult login-btn">Login</button>
	    </form>
	    <button class="forgetPassWord btn pointer"  data-reveal-id="findPWD" data-bg="pwd-modal-bg" data-dismissmodalclass="close-pwd-frame">Forget Password</button>
        <div style="height:15px"></div>
        
        
        <!-- 找回密码框 start -->
        <div class="pwd-modal-bg"></div>
        <div id="findPWD" class="pwd_frame ">
          <div class="title pointer">      
            <span><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;Retrieve Password</span>
          </div>
          <a class="close-pwd-frame" data-type="close">&#215;</a>
          <div class="line"></div>
          <div class="content">
            <form id="updateData">
              <div class="form-group" style="padding:0 25px">
                <label for="username_F" >Username</label>
                <input type="text" id="username_F" class="form-control" name="username" autocomplete="off" placeholder="Please Enter Your User Name" required="required"/>
              </div>   
              <div class="form-group" style="padding:0 25px;overflow:hidden;">
                <label for="textMsg_F" class="left" style="width:100%;margin-top:10px;">Message Code</label>     
                <input type="text" id="textMsg_F"  class="form-control textMsg left" name="textMsg" autocomplete="off" placeholder="Please Enter Your Message Code"  required="required" />
                <button id="getMessage_F" class="getMessage pointer left" >Send Msg</button>
              </div>
              <div class="form-group" style="padding:0 25px">
                <label for="N_PASSWORD_F">New Password</label>
                <input type="text" style="display:none;" />
                <input type="text" id="N_PASSWORD_F" class="form-control left N_PASSWORD" name="N_PASSWORD_F" onfocus="this.type='password'" onBlur="if(this.value==null||this.value==''){this.type='text'}" autocomplete="off" data-update="db" class=" password"/>
                <input type="text" style="display:none;" />
                <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="N_PASSWORD_F"></i>
                <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="N_PASSWORD_F"></i>
              </div>
            </form>
          </div>
          <div class="foot">       
            <button id="confirm" class="right update_confirm pointer">Confirm</button>
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
    function getCookie(cname) {
    	var arr = document.cookie.split(';');
    	var name = cname + '=';
    	for (var i = 0; i < arr.length; i++) {
        	var c = arr[i].trim();
        	if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    	}
    	return "";
	}
    
    $.fn.symbol = function(){
    	var screen_h = $(window).height();//screen.height;
		var screen_w = $(window).width();//screen.width;
		var h_w = (screen_h/screen_w)*16;
		if(h_w>7.5&&h_w<=8.5){
	    	//layer.alert('屏幕分辨率为16:9');
	    	$('.bg1').html('');
	    	$('.bg1').append('<img src="/image/login/en-1-symbol.png" style="position:absolute;width:35%;top:27vh;left:35vh"/>');
	    	$('.bg2').html('');
	    	$('.bg2').append('<img src="/image/login/en-2-symbol.png" style="position:absolute;width:35%;top:15vh;left:30vh"/>');
	    	$('.bg3').html('');
	    	$('.bg3').append('<img src="/image/login/en-3-symbol.png" style="position:absolute;width:35%;top:10vh;left:23vh"/>');
	    	$('.bg4').html('');
	    	$('.bg4').append('<img src="/image/login/en-4-symbol.png" style="position:absolute;width:35%;top:18vh;right:15vh"/>');
		}else if(h_w>8.5&&h_w<=9.5){
			//layer.alert('屏幕分辨率为16:10');
			$('.bg1').html('');
			$('.bg1').append('<img src="/image/login/en-1-symbol.png" style="position:absolute;width:35%;top:30vh;left:30vh"/>');
			$('.bg2').html('');
	    	$('.bg2').append('<img src="/image/login/en-2-symbol.png" style="position:absolute;width:35%;top:18vh;left:25vh"/>');
	    	$('.bg3').html('');
	    	$('.bg3').append('<img src="/image/login/en-3-symbol.png" style="position:absolute;width:35%;top:14vh;left:20vh"/>');
	    	$('.bg4').html('');
	    	$('.bg4').append('<img src="/image/login/en-4-symbol.png" style="position:absolute;width:35%;top:20vh;right:13vh"/>');
		}else if(h_w>9.5&&h_w<=11.5){
			//layer.alert('屏幕分辨率为4:3');
			$('.bg1').html('');
			$('.bg1').append('<img src="/image/login/en-1-symbol.png" style="position:absolute;width:45%;top:30vh;left:10vh"/>');
			$('.bg2').html('');
	    	$('.bg2').append('<img src="/image/login/en-2-symbol.png" style="position:absolute;width:45%;top:16vh;left:10vh"/>');
	    	$('.bg3').html('');
	    	$('.bg3').append('<img src="/image/login/en-3-symbol.png" style="position:absolute;width:45%;top:11vh;left:1.5vh"/>');
	    	$('.bg4').html('');
	    	$('.bg4').append('<img src="/image/login/en-4-symbol.png" style="position:absolute;width:45%;top:21vh;right:-8vh"/>');
		}else{
			$('.bg1').html('');
			$('.bg2').html('');
			$('.bg3').html('');
			$('.bg4').html('');
		}
	}
	
	$.fn.tips = function(){
		layer.tips('Login Here', '.start-btn', {
            tips: [2, 'green'],
            time: 0
        });
	}
	
	// $(document).ready  改成   window.onload  2017/8/23 sun
	window.onload = function(){
	    $().symbol();
        $().tips();
        var userName = getCookie('USER_NAME');
        $('#username').val(userName);
        errorMSG=$('#errorMsg').val();
        if(errorMSG!=null&&errorMSG!=''){ 
            $('.start-btn').click();
            layer.alert(errorMSG,{title:'Warning',offset:[150]});
        }
	}
	
	window.onresize=function(){
	    $().symbol();
	}
	
  	$('#myCarousel').carousel({
  		interval: 5000
	})
	
	
	
	$('.start-btn').on('click',function(){ 
	    //$("#welcome-page").css("display","none");
	    //$("#login-page").css("display","block");
	    $('#login-page').fadeIn();
	    layer.closeAll('tips'); 
	});
	
	$('.go-back').on('click',function(){	 
  	    //$("#welcome-page").css("display","block");
	    //$("#login-page").css("display","none");
	    $('#login-page').fadeOut('fast');
	    $().tips();
	});
	
	
	
	$('#findPWD').draggable({ handle: '.title' });
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