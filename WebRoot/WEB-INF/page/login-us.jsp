<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>Xinyi Glass(Test Only)</title>    
    <!-- 图标cdn引入 -->
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
	<!-- 核心布局 CSS文件 -->
	<link rel="stylesheet" href="plugin/css/login.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="plugin/bootstrap/js/bootstrap.min.js"></script>
	<script src="plugin/jQuery/jquery-ui.min.js"></script>	
	<script type="text/javascript" src="plugin/layer/layer.js"></script>
	<style>
		
	</style>
	<script>
	    var IE = function (version){
	        document.write('<div class="cover"><div class="browers"><div class="title"><br/><span>点击图标</span><br/><span>跳转到相应的浏览器下载页面</span></div><a href="http://www.firefox.com.cn/"><img width="140" style="margin-left:20px" src="/image/login/ff.png"/></a><a href="https://www.google.cn/chrome/browser/desktop/index.html"><img width="140" src="/image/login/chrome.png"/></a><a href="https://www.microsoft.com/zh-cn/download/internet-explorer-11-for-windows-7-details.aspx"><img width="130" src="/image/login/ie.png"/></a></div></div>');
	    	alert(version+'浏览器不支持访问本站点，请更换浏览器重新访问');
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
	<div style="opacity:1;height:100%">
	  <div class="modal-bg"></div>
	  <div class="bg"></div>
	  <div class="left_top">
	  	<a href="loginZHS.do">中文</a>
	  	<span> | </span>
	  	<a href="loginUS.do">English</a>
	  </div>
	  <div class="right_top">
	    <img src="/image/login/xyg-auto.png" oncontextmenu="return false;" ondragstart="return false;" style="width:100%">
	  </div>
	  <!-- 登录框 -->
	  <div class="login-page">
	    <div class="login-frame">
	      <div class="top-frame">
	        <span style="font-size:50px;margin-bottom:10px">
		      <i class="fa fa-user-circle-o" aria-hidden="true"></i>
			</span>
	    	<span style="font-size:20px;margin-bottom:10px;letter-spacing:0">Login Here</span>
	      </div>
	      <form role="form" id="loginFrom" name="loginFrom" method="post" action="login.do">
   		    <div class="form-group" style="padding:0 25px">
   		      <label for="username" style="padding-right:1px">
   		        <i class="fa fa-user-o" aria-hidden="true"></i>
   		      </label>
      	      <input type="text" class="form-control" id="username" name="username" autocomplete="off" placeholder="User" required="required"/>
   		    </div>
   		    <div class="form-group" style="padding:0 25px">
   		      <label for="password" style="padding-right:6px">
   		        <i class="fa fa-lock" aria-hidden="true"></i>	
   		      </label>
     	      <input type="text" style="display:none;"/>
      	      <input type="text" class="form-control" id="password" name="password" autocomplete="off" onfocus="this.type='password'" onBlur="if(this.value==null||this.value==''){this.type='text'}" placeholder="Password" required="required"/>
   		      <input type="text" style="display:none;"/>
   		    </div>
   		    <div  class="form-group" style="padding:0 25px">	   
   		      <label for="textMsg" >
   		        <i class="fa fa-key" aria-hidden="true"></i>
			  </label>  		   
   		      <input type="text" id="textMsg" name="textMsg" style="width:120px"  class="form-control textMsg left" autocomplete="off" placeholder="Valid Code" required="required"/>
   		  	  <input id="getMessage" type="button" class="btn-op pointer" value="Get Code"/>
   		  	</div>
   		    <input type="hidden" id="lang" name="lang" value="US"/>
			<input id="login" type="submit" class="btn pointer" value="Login Now"/>
			<input type="button" data-select="modify" style="width:150px" class="forget-pwd pointer" value="Forget Password？"/>
	    </form>
	    </div>
	  </div>
	  
	  <!-- 忘记密码框  -->
	  <div class="pwd-page">
	    <div class="login-frame" id="find_pwd">
	      <div class="top-frame">
	        <span style="font-size:50px;margin-bottom:10px">
		      <i class="fa fa-unlock-alt" aria-hidden="true"></i>
			</span>
	    	<span style="font-size:20px;margin-bottom:10px;letter-spacing:0">Retrieve Password</span>
	      </div>
	      <form role="form" id="loginFrom" name="loginFrom" method="post" action="login.do">
   		    <div class="form-group" style="padding:0 25px">
   		      <label for="username_F" style="padding-right:1px">
   		        <i class="fa fa-user-o" aria-hidden="true"></i>
   		      </label>
      	      <input type="text" class="form-control" id="username_F" name="username" autocomplete="off" placeholder="User" required="required"/>
   		    </div>
   		    <div class="form-group" style="padding:0 25px;color:white">
   		      <label for="password_F" style="padding-right:6px">
   		        <i class="fa fa-lock" aria-hidden="true"></i>	
   		      </label>
     	      <input type="text" style="display:none;"/>
      	      <input type="text" class="form-control" style="width:185px" id="password_F" name="N_PASSWORD_F" autocomplete="off" onfocus="this.type='password'" onBlur="if(this.value==null||this.value==''){this.type='text'}" placeholder="New Password" required="required"/>
   		      <input type="text" style="display:none;"/>
   		      <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="password_F"></i>
              <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="password_F"></i>
   		    </div>
   		    <div  class="form-group" style="padding:0 25px">	   
   		      <label for="textMsg_F" >
   		        <i class="fa fa-key" aria-hidden="true"></i>
			  </label>  		   
   		      <input type="text" id="textMsg_F" name="textMsg" style="width:120px"  class="form-control textMsg left" autocomplete="off" placeholder="Valid Code" required="required"/>
   		  	  <input id="getMessage_F" type="button" class="btn-op pointer" value="Get Code"/>
   		  	</div>
   		    <input type="hidden" id="lang" name="lang" value="ZHS"/>
			<input id="confirm" type="button" class="btn pointer" data-crudtype="update" data-pageframe="find_pwd" data-updateurl="forgetPwd.do" data-func="$().findPWD();" value="Modify Password"/>
			<input type="button" data-select="goback" class="forget-pwd pointer" style="width:150px" value="Go Back Login Page"/>
	    </form>
	    </div>
	  </div>
	</div>
        
   
	    

	<input type="hidden" id="errorMsg" value=${errorMsg} >
	<%
	    session.setAttribute("errorMsg",null); 
	%>
  <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
  <script type="text/javascript" src="plugin/js/data.validate.js"></script>
  <script type="text/javascript" src="plugin/js/jQuery.crud.js"></script> 
  <script>
    //获取cookie
    function getCookie(cname) {
    	var arr = document.cookie.split(';');
    	var name = cname + '=';
    	for (var i = 0; i < arr.length; i++) {
        	var c = arr[i].trim();
        	if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    	}
    	return "";
	}
	
	//添加cookie
	function addCookie(name, exMinutes) {
		var d = new Date();
    	d.setTime(d.getTime() + (exMinutes*60*1000));
    	var expires = 'expires='+d.toUTCString();
    	document.cookie = name + '=' + d + ';' + expires;
	}
	
	//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
    function banBackSpace(e){   
        var ev = e || window.event;//获取event对象   
        var obj = ev.target || ev.srcElement;//获取事件源   
        var t = obj.type || obj.getAttribute('type');//获取事件源类型  
        //获取作为判断条件的事件类型
        var vReadOnly = obj.getAttribute('readonly');
        //处理null值情况
        vReadOnly = (vReadOnly == "") ? false : vReadOnly;
        //当敲Backspace键时，事件源类型为密码或单行、多行文本的，
        //并且readonly属性为true或enabled属性为false的，则退格键失效
        var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") && vReadOnly=="readonly")?true:false;
        //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
        var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")?true:false;        
             
        //判断
        if(flag2){
            return false;
        }
        if(flag1){   
            return false;   
        }   
    }    
	
	window.onload = function(){
        $().crudListener();
        var userName = getCookie('USER_NAME');
        $('#username').val(userName);
        errorMSG=$('#errorMsg').val();
        if(errorMSG!=null&&errorMSG!=''){ 
            $('.start-btn').click();
            layer.alert(errorMSG,{title:'Warning',offset:[150]});
        }
        //禁止后退键 作用于Firefox、Opera
        document.onkeypress=banBackSpace;
        //禁止后退键  作用于IE、Chrome
        document.onkeydown=banBackSpace;
    }
    
    //获取短信验证码按钮
    $('#getMessage,#getMessage_F').on('click',function(e){
		e.preventDefault();
		console.log('短信验证码测试时暂时移除');
		/*
		var id = $(this).attr('id');
		var username;
		if(id=='getMessage'){
		    username = $('#username').val();
		}else if(id=='getMessage_F'){
			username = $('#username_F').val();
		}else{
			layer.alert('按钮事件绑定错误，请联系开发部门',{title:'警告',offset:[150]});
			return;
		}
		if(username==''||username==''){
			layer.alert('请先输入用户名再获取验证码',{title:'警告',offset:[150]});
			return;
		}else{
			var msgCookie = getCookie(username.toUpperCase());
			if(msgCookie!=''&&msgCookie!=null){
				var res = msgCookie.split(' ');
				layer.alert('此用户已获取过短信验证码，请勿在十分钟内频繁重复获取，'+res[4]+'可再次获取短信验证码',{title:'警告',offset:[150]});
				return;
			}else{
			var param = 'USER_NAME='+username;
			$.ajax({
				type:'post', 
				data:param,
				url:'sendMsgCode.do',
				dataType:'json',
				success: function (data) {
					if(data.code=='200'){
						layer.msg('验证码已成功发送至手机，请注意查收！');
						addCookie(username.toUpperCase(),10);
				    }else{
				    	if(data.code=='8888'){
				    		layer.alert('您输入的用户名不存在,请检查后重新输入！',{title:'警告',offset:[150]});
				    	}else{
				    		layer.alert('获取验证码错误！错误代码:'+data.code,{title:'警告',offset:[150]});
				    	}
				    }	
				},
				error: function () {
					layer.msg('获取JSON数据失败');	
					if(window.frameElement != null){
						//console.log("处于一个iframe中");
						$('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
					}	
				}
			});
			}
		}
		*/
	});
	
	//忘记密码&返回登录 按钮
   	$('input[data-select]').on('click',function(e){
		e.preventDefault();
		var select = $(this).data('select');
		if(select=='modify'){
			$('.login-page').fadeOut();
			$('.pwd-page').fadeIn();
		}else if(select=='goback'){
			$('.login-page').fadeIn();
			$('.pwd-page').fadeOut();
		}else{
			
		}
	});
	
	$('i[data-pwd]').on('click',function(){
        if($(this).data('pwd')=='show'){
            $('.fa-eye[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:inline-block!important');
            $(this).css('display','none');
            $('#'+$(this).data('frame')).attr('type','text');
            if($('#'+$(this).data('frame')).attr('onfocus').length!=0){
            	$('#'+$(this).data('frame')).removeAttr('onfocus');
            	$('#'+$(this).data('frame')).removeAttr('onBlur');
            } 
        }else if($(this).data('pwd')=='hide'){
            $('.fa-eye-slash[data-frame="'+$(this).data('frame')+'"]').css('cssText', 'display:inline-block!important');
            $(this).css('display','none');
            $('#'+$(this).data('frame')).attr('type','password');
        }
    });
    
    $.fn.findPWD = function(){
        RegExpValidate('^[a-zA-Z0-9]{5,14}$','password_F','$("#password_F").val("");regExpError("Password Format Error!");');
    }
  </script>
  
  </body>
</html>