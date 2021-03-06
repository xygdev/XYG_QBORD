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
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  <meta name="format-detection" content="telephone=no,email=no,adress=no"/>
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0,user-scalable=no;"/>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="xyg-bird">
  <meta name="copyright" content="xyg-bird" >
  <link rel="stylesheet" href="plugin/css/home/reset.css" />
  <link rel="stylesheet" href="plugin/css/home/index.css" />
  <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script> 
  <link rel="stylesheet" href="plugin/css/home/content.css" />
  <script type="text/javascript" src="plugin/js/home/jquery.SuperSlide.2.1.1.js"></script>
</head>
<body>
<div class="wrapper" name="wrapper" id="wrapper">
  <div class="inside_banner" style="background-image:url(/image/home/bg1.png)">
    <div class="tu">
      <img src="/image/home/bg1.png" width="100%" oncontextmenu="return false;" ondragstart="return false;"/>
    </div>
    <div class="title">
      <!-- 
      <h1>COMPANY</h1>
      <p class="subtit">Establish an Remarkable Glass Enterprise and Achievements of World Class Brand</p>
      -->
    </div>
  </div>
  <div id="content">
    <div class="company_info">
      <div class="warp">
        <div class="tit">Group Introduction<i></i></div>
        <div class="text">
	      <span> 
            <blockquote>
	          <blockquote>
		        <blockquote>
			      <blockquote>
				    <blockquote>
					  <blockquote>
						<p align="left">
							<span style="line-height:2;font-family:Microsoft YaHei;font-size:14px;">Xinyi Glass Holdings Limited, a major supplier in the global supply chain, was founded in 1988 and listed on the main board of the Hong Kong Stock Exchange in February 2005.（Stock Code：00868.HK）Xinyi&nbsp;is the world's leading integrated glass manufacturer which cover a wide range of product including high-quality float glass,&nbsp; automobile glass ,&nbsp; engineering glass and electronic Glass etc. Xinyi Seven industrial bases,Shenzhen, Dongguan, Jiangmen, Wuhu, Tianjin, Yingkou, Deyang are located inthe eastern Yangtze River delta area, the southern Pearl River delta area, the northern Beijing-Tianjin region and the western Chengdu-Chongqing region which are the most active domestic economy zones in China.In 2015, Xinyi Glass invested in the construction of large-scale production base in Malaysia in order to develop overseas markets.Currently , Xinyi Glass has been a listed company with total market capital of HK $&nbsp;23.3 billion and more than HK $ 10 billion annual revenue. Meanwhile,Xinyi glass has a total area of over&nbsp;5.3 millionsquare metersand around 12,000 employees.&nbsp;&nbsp;The Group is a constituent of Hang Seng Global Composite Index, Hang Seng Composite Index, Hang Seng Composite MidCap Index, Hang Seng Composite Industry Index-Industrials, as well as MSCI Hong Kong Small Cap Index.</span>
						</p>
						<p align="left">
							<span style="font-family:宋体;font-size:12pt;"><span style="font-family:宋体;font-size:12pt;"></span></span>&nbsp;
						</p>
						<p align="left">
							<span style="font-family:宋体;font-size:12pt;"><span style="font-family:宋体;font-size:12pt;"></span></span>&nbsp;
						</p>
						<p align="left">
							<span style="font-family:宋体;font-size:12pt;"><span style="font-family:宋体;font-size:12pt;"></span></span>&nbsp;
						</p>
						<p align="left">
							<span style="font-family:宋体;font-size:12pt;"><span style="font-family:宋体;font-size:12pt;"></span></span>&nbsp;
						</p>
					  </blockquote>
				    </blockquote>
			      </blockquote>
		        </blockquote>
	          </blockquote>
            </blockquote>
            <p>
	          <br />
            </p>
          </span> 
          <p>
	       <br />
          </p>                
		</div>
      </div>
    </div>
        
    <div class="company_honor">
      <div class="honor_list">
        <ul class="clearfix">
          <li>
            <div class="tu"><img src="/image/home/p01.jpg" width="100%" /></div>
            <p class="p1">Float Glass</p>
            <div class="honor_hover">
              <p>Xinyi Glass is a leading manufacturer of high-quality float glass, with daily melting capacity of 15,200 tons, is currently ranked first in the daily melting capacity in China. Xinyi Float Glass has a long term commitment to the development of high-tech and environmental friendly energy-saving products. Xinyi float glass is very few manufacturers in the industry can grasp production technology of 0.3mm thickness to 22mm thickness of ultra-thin and ultra-thick as well as ultra-long high-end float glass. </p>
            </div>
          </li>
          <li>
            <div class="tu"><img src="/image/home/p02.jpg" width="100%" /></div>
            <p class="p1">Automobile Glass</p>
            <div class="honor_hover">
              <p>Xinyi Glass is one of the world's largest automobile glass manufacturers, mainly produces SOLAR-X heat-reflecting automobile glass, HUD head-up display glass, laminated front windshield, tempered glass, Laminated glass with heating elements etc. Currently, Xinyi Glass accounts for over 20% of the world automobile glass replacement market share with products and solutions being applied in more than 140 countries and regions all over the world.</p>
            </div>
          </li>
          <li>
            <div class="tu"><img src="/image/home/p03.jpg" width="100%" /></div>
            <p class="p1">Architectural Glass</p>
            <div class="honor_hover">
              <p>Xinyi Glass is China's largest LOW-E energy-saving architectural glass manufacturer, accounting for about 15% of China LOW-E energy-saving glass market. Focus on producing low-emissivity coated glass (LOW-E glass), heat-reflective coated glass, insulating glass, tempered glass, laminated glass, glazed glass and other high energy-saving glass products. Xinyi glass has supplied high-quality engineering glass products to landmark buildings in big and medium cities of China and other countries, such as the Shanghai World Expo China Pavilion, the World University Games main stadium etc.</p>
            </div>
          </li>
        </ul>
      </div>
    </div>
	
    <div class="company_video clearfix">
      <div class="video_pic fl">
        <img src="/image/home/video_pic.jpg" width="100%" oncontextmenu="return false;" ondragstart="return false;"/>
        <div class="video_btn">
          <img src="/image/home/video_btn.png" />
        </div>
      </div>
      <div class="video_info fl">
        <div class="video_text">
          <p>
	        <span style="font-family:Microsoft YaHei;font-size:14px;"><span><span style="line-height:2;font-family:Microsoft YaHei;font-size:14px;">Xinyi boasts the domestic leading technical strength with a R&D center 
appraised as the provincial enterprise technical center in 1997. The company has 
been committed to R&D of energy-conservation and environmental-friendly 
products, and has developed the LOW-E glass capable of being tempered and 
hot-bended, SOLAR-X heat-reflecting automobile glass and other 
environmental-friendly products, HUD glass, water repelling glass, 
photocatalytic glass, superpower high penetration resistant high-speed train 
glass, and other new products. </span><br/>
            <span style="font-family:Microsoft YaHei;font-size:14px;"></span>
          </p>
          <p>
	        <span style="line-height:2;font-family:Microsoft YaHei;font-size:14px;">Xinyi Glass pursues new 
technology and invests in R&D to cope with the market and customer’s 
individualized needs. We endeavor to create win-win business cooperation with 
our partners and make contribution to the society.</span>
          </p>                
		</div>
      </div>
    </div>
  </div>   
  <!-- footer start 2017/11/8 sun-->
  <div class="footer" style="height:50px;padding-left:100px;">
    <div class="warp">
      <img src="/image/home/xyg.png" class="footer_logo" style="top:0px;left:0px;">
      <p class="copyright" style="margin:auto 0px;">Copyright  2017 信义玻璃控股有限公司 版权所有       粤ICP备17142189号 </p>
    </div>
  </div>
  <!-- footer end--> 
</div>
<script>
		$(function() {
		    $('.company_video').click(function() {
		        $('.video').stop().slideDown();
		    })  
		    $('.close').click(function() {
		        $('.video').stop().slideUp();
		        pauseVid()
		    })
		    
		})
		
		var myVideo=document.getElementById('example_video_1');
		function pauseVid(){myVideo.pause();}

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
            var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea") 
                         && vReadOnly=="readonly")?true:false;
            //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
            var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")
                         ?true:false;        
             
            //判断
            if(flag2){
                return false;
            }
            if(flag1){   
                return false;   
            }   
        }
     
        window.onload=function(){
            //禁止后退键 作用于Firefox、Opera
            document.onkeypress=banBackSpace;
            //禁止后退键  作用于IE、Chrome
            document.onkeydown=banBackSpace;
        }  
</script>

<div class="video">
  <div class="kuang">
    <video id="example_video_1" class="video-js vjs-default-skin"  controls preload="none" width="100%" height="100%" poster="/image/home/video.png">
      <source src="http://www.xinyiglass.com/en/Uploads/201608/57c5582d2023a.mp4" type="video/mp4" />
    </video>
    <div class="close"><img src="/image/home/close.png" /></div>
  </div>    
</div>
</body>
<link rel="stylesheet" href="plugin/css/home/public.css" />
<script type="text/javascript" src="plugin/js/home/index.js"></script>
</html>
