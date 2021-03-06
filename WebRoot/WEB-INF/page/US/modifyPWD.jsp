<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>重置密码</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugin/css/index/modifyPWD.css"> 
    <!-- jQuery文件  -->
	<script src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
  </head> 
  <body>
    <div class="pwd-modal-bg"></div>
    <div id="modifyPWD" class="pwd_frame">
      <div class="title">      
          <span><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;Retrieve Password</span>
      </div>
      <div class="line"></div>
      <div class="content">
        <form id="updateData" name="updateData" method="post" action="user/updatePWD.do">
          <label for="O_PASSWORD" class="left">Old</label>
          <input type="password" id="O_PASSWORD" name="O_PASSWORD" data-update="db" class="left password"/>
          <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="O_PASSWORD"></i>
          <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="O_PASSWORD"></i>
          <label for="N_PASSWORD" class="left">New</label>
          <input type="password" id="N_PASSWORD" name="N_PASSWORD" data-update="db" class="left password"/>
          <i class="fa fa-eye-slash pointer left" data-pwd="show" data-frame="N_PASSWORD"></i>
          <i class="fa fa-eye pointer left hide" data-pwd="hide" data-frame="N_PASSWORD"></i>
        </form>
      </div>
      <div class="foot">     
        <form id="logoutFrom" name="logoutFrom" method="post" action="logout.do">
          <button id="confirm" class="right update_confirm pointer">Confirm</button>
          <button type="submit" class="right update_confirm pointer">Cancel</button> 
        </form>
      </div>   
    </div>
    <input type="hidden" id="errorMsg" value=${errorMsg} >
	<%
	   session.setAttribute("errorMsg",null); 
	 %>
	 <script>
	 $(function() {
	 	errorMSG=$('#errorMsg').val();
	 	if(errorMSG!=null&&errorMSG!=''){
			layer.alert(errorMSG,{title:'Warning',offset:[150]});
	 	}
	 	
	 	$('i[data-pwd]').on('click',function(){
    		if($(this).data('pwd')=='show'){
    			$('.fa-eye[data-frame="'+$(this).data('frame')+'"]').css('display','block');
    			$(this).css('display','none');
    			$('#'+$(this).data('frame')).attr('type','text');
    		}else if($(this).data('pwd')=='hide'){
    			$('.fa-eye-slash[data-frame="'+$(this).data('frame')+'"]').css('display','block');
    			$(this).css('display','none');
    			$('#'+$(this).data('frame')).attr('type','password');
    		}
     	});
     	
     	$('#confirm').on('click',function(e){
     	    e.preventDefault();
     	    newPwd=$('#N_PASSWORD').val();
     	    oldPwd=$('#O_PASSWORD').val();
     	    if(oldPwd==null||oldPwd==''){
				layer.alert('The Old Password Is Null!',{title:'Warning',offset:[150]});
				return;
     	    }else if(newPwd==null||newPwd==''){
     	        layer.alert('The New Password Is Null!',{title:'Warning',offset:[150]});
     	        return;
     	    }
     	    //RegExpValidate('^[a-zA-Z]\\w{5,14}$','N_PASSWORD','regExpError("Incorrect Password Format!The New Password Should Be 6-15 Characters Consisting Of Letter and Number");');
     	    RegExpValidate('^[a-zA-Z0-9]{5,14}$','O_PASSWORD','$("#O_PASSWORD").val("");regExpError("密码格式错误，必须是由字母或数字组成的6-15位字符");');    
            RegExpValidate('^[a-zA-Z0-9]{5,14}$','N_PASSWORD','$("#N_PASSWORD").val("");regExpError("密码格式错误，必须是由字母或数字组成的6-15位字符");');    
     	    if(newPwd==oldPwd){
				layer.alert('The New Password Can Not Be The Same As The Old!',{title:'Warning',offset:[150]});
     	        return;
     	    }    
     	    $('#updateData').submit();
     	});
     	
     	
     	$('body').off().keyup();
		$('body').keyup(function(e) {
		    if(e.which===13){
                $('#confirm').trigger('click');
		    }
		 });	
     });
	 </script>
	 <script type="text/javascript" src="plugin/layer/layer.js"></script>
     <script type="text/javascript" src="plugin/js/data.validate.js"></script>
  </body>
</html>
