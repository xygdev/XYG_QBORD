<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>公告展示</title>
    <base href="<%=basePath%>"> 
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
	<link rel="stylesheet" href="plugin/css/font-awesome.min.css">
	<link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
	<!-- AdminLTE Skins -->
    <link rel="stylesheet" href="plugin/bootstrap/css/skins/_all-skins.min.css"> 
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="plugin/jQuery/jquery-ui.min.js"></script>
	<!-- Scrollbar -->
	<link rel="stylesheet" href="plugin/mCustomScrollbar/css/jquery.mCustomScrollbar.css" type="text/css"/>
    <style>
      #accordion{width:100%;height:635px;overflow-y:auto}
      .content{width:100%;border:0;resize:none;}
      .right{float:right}
      .ui-state-active{background:#00a65a;border:1px solid #00a65a}
    </style>
  </head>
  
  <body >
    <div>
      <div id="accordion">
  		
	  </div>
    </div>
    
    <script>
  		$(function() {
  			$.ajax({
  				type:'post', 
				url:'broadcast/getValidBc.do',
				dataType:'json',
				success:function(data){
					//alert(data.rows.length);
					for(var i = 0;i<data.rows.length;i++){
						$('#accordion').append('<h3>'+data.rows[i].BROADCAST_TITLE+'</h3>');
						$('#accordion').append('<div><p><textarea class="content" readonly="readonly">'
											  +data.rows[i].BROADCAST_CONTENT
											  +'</textarea><br/><br/><span class="right">'
											  +data.rows[i].USER_DESC
											  +'</span><br/><span class="right">'
											  +data.rows[i].START_DATE
											  +'</span></p></div>');
					}
					
					$('textarea').each(function () {
  						this.setAttribute('style', 'height:' + (this.scrollHeight+30) + 'px;overflow-y:hidden;');
					}).on('input', function () {
  						this.style.height = 'auto';
  						this.style.height = (this.scrollHeight+30) + 'px';
					});
					
					$('#accordion').accordion({ 
    					heightStyle: 'content' 
    				});
    				
    				$('#accordion').mCustomScrollbar({
						axis:'y',
						scrollInertia:0
					});
				},
				error:function(){
					layer.msg('获取JSON数据失败');
					if(window.frameElement != null){
						location.reload(true);
					}
				}
  			});
  		
    		
    		
    		
  		});
  	</script>
  	<!-- Scrollbar -->
    <script type="text/javascript" src="plugin/mCustomScrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
  </body>
</html>
