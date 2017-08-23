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
  		<h3>Group Introduction</h3>
  		<div>
  		  <p>
  		    <textarea class="content" readonly="readonly">
  		    Xinyi Glass Holdings Limited, a major supplier in the global supply chain, was founded in 1988 and listed on the main board of the Hong Kong Stock Exchange in February 2005.（Stock Code：00868.HK）Xinyi is the world's leading integrated glass manufacturer which cover a wide range of product including high-quality float glass,  automobile glass ,  engineering glass and electronic Glass etc. Xinyi Seven industrial bases,Shenzhen, Dongguan, Jiangmen, Wuhu, Tianjin, Yingkou, Deyang are located inthe eastern Yangtze River delta area, the southern Pearl River delta area, the northern Beijing-Tianjin region and the western Chengdu-Chongqing region which are the most active domestic economy zones in China.In 2015, Xinyi Glass invested in the construction of large-scale production base in Malaysia in order to develop overseas markets.Currently , Xinyi Glass has been a listed company with total market capital of HK $ 23.3 billion and more than HK $ 10 billion annual revenue. Meanwhile,Xinyi glass has a total area of over 5.3 millionsquare metersand around 12,000 employees.  The Group is a constituent of Hang Seng Global Composite Index, Hang Seng Composite Index, Hang Seng Composite MidCap Index, Hang Seng Composite Industry Index-Industrials, as well as MSCI Hong Kong Small Cap Index.
  		    </textarea>
  		    <br/>
  		    <br/>
  		    <span class="right">Admin</span>
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
  						this.setAttribute('style', 'height:' + (this.scrollHeight+30) + 'px;overflow-y:hidden;');
					}).on('input', function () {
  						this.style.height = 'auto';
  						this.style.height = (this.scrollHeight+30) + 'px';
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
