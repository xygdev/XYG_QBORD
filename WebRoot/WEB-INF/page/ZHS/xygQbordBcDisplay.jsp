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
    <style>
      #accordion{width:100%;height:435px;overflow-y:auto}
      .content{width:100%;border:0;resize:none;}
      .right{float:right}
      .ui-state-active{background:#00a65a;border:1px solid #00a65a}
    </style>
  </head>
  
  <body >
    <div>
      <div id="accordion">
  		<h3>集团简介</h3>
  		<div>
  		  <p>
  		    <textarea class="content" readonly="readonly">
  		             信义玻璃控股有限公司创建于1988年，2005年2月在香港联交所主板上市（股票代码00868HK），是全球领先的综合玻璃制造商。产品涵盖优质浮法玻璃、汽车玻璃、建筑节能玻璃及超薄电子玻璃产品等领域。国内七大生产基地分别位于中国经济发 展最活跃的珠三角、长三角、京津冀、西部成渝经济带，在深圳、东莞、江门、芜湖、天津、营口、德阳建有大型生产基地。为开拓海外市场，信义玻璃于2015年在马来西亚投资建设大规模生产基地。公司目前总资产233亿元，年收入超过100亿港元，总占地面积超过530万平方米，员工约1.2万人。集团股份现为恒生环球综合指数、恒生综合指数、恒生综合中型股指数及恒生综合行业指数-工业及MSCI香港小型股指数的成分股。
  		    </textarea>
  		    <br/>
  		    <br/>
  		    <span class="right">管理员</span>
  		    <span class="right">2017-08-08 08:08:08&nbsp;&nbsp;&nbsp;</span>
  		  </p>
  		</div>
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
					console.log(data.rows.length);
					for(var i = 0;i<data.rows.length;i++){			
						$('#accordion').prepend('<div><p><textarea class="content" readonly="readonly">'
											  +data.rows[i].BROADCAST_CONTENT
											  +'</textarea><br/><br/><span class="right">'
											  +data.rows[i].USER_DESC
											  +'</span><br/><span class="right">'
											  +data.rows[i].START_DATE
											  +'</span></p></div>');
		                $('#accordion').prepend('<h3>'+data.rows[i].BROADCAST_TITLE+'</h3>');
					}
					
					$('textarea').each(function () {
					    var uA = navigator.userAgent.toLowerCase();
					    if(uA.indexOf('msie') > -1 || uA.indexOf('rv:11') > -1){  
					       this.style.fontSize = '16.3px'; 
					    }else{
					       this.style.fontSize = '18px';
					    }
  						this.setAttribute('style', 'height:' + (this.scrollHeight+0) + 'px;overflow-y:hidden;');
					}).on('input', function () {
  						this.style.height = 'auto';
  						this.style.height = (this.scrollHeight+0) + 'px';
					});
					
					$('#accordion').accordion({ 
    					heightStyle: 'content' 
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

  </body>
</html>
