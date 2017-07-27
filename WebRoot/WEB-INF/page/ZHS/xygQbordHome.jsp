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
        /* {margin: 0px;padding: 0px}*/
		#v3dTest {width: 100%;height: 100%;z-index:97}
		body {margin:0 auto;overflow:hidden;}  
		.box{position:absolute;bottom:10px; width: 600px; height: 268px; margin:0 auto; padding: 30px;z-index:103}
        .car{position:absolute;bottom:10px; width: 600px; height: 268px; margin:0 auto; padding: 30px;z-index:102}
		.bottom{position:absolute;bottom:-80px;width:726px;height: 256px;margin:0 auto; padding: 30px;background-repeat: no-repeat;background-image: url(/image/home/brench.png);z-index:101}
		
		.header{
			margin:0 auto;
			width:100%;
			height:640px;
			background-color:#000;
			position:relative;
		}
		.header canvas {
			width:100%;height:auto/*默认全屏显示 可自己设置高度640px*/;
			display:inline-block;vertical-align:baseline
			position:absolute;
			z-index:-1;
		}
		.header .canvaszz{  /*用来解决视频右键菜单，用于视频上面的遮罩层*/
			width:100%;
			background-image: url(/image/home/in_top_bj.jpg);
			height:640px;
			position:absolute;
			z-index:10;
			filter:alpha(opacity=40);  
      		-moz-opacity:0.4;  
      		-khtml-opacity: 0.4;  
      		opacity: 0.4;
		}
    </style>
  </head>
  
  <body>
    <!--  
    <button id="s" style="display:none">Session过期</button>
     
    <div class="header" id="demo">
      <div class="canvaszz"> </div>
  	  <canvas id="stars"></canvas>   
    </div>
    
    <div class="box"></div>		
    <div class="car">		
		<div id="v3dTest"></div>
	</div>
    <div class="bottom"></div>
    -->
  </body>
  <script type="text/javascript" src="plugin/js/3dControl/3d_control.js"></script>
  <script>
      /*
  	  var canvas = document.getElementById('stars'),
  	  ctx = canvas.getContext('2d'),
  	  w = canvas.width = window.innerWidth,
  	  h = canvas.height = window.innerHeight,

  	  hue = 217,
  	  stars = [],
  	  count = 0,
  	  maxStars = 300;//星星数量

	  var canvas2 = document.createElement('canvas'),
  	  ctx2 = canvas2.getContext('2d');
	  canvas2.width = 100;
	  canvas2.height = 100;
	  var half = canvas2.width / 2,
  	  gradient2 = ctx2.createRadialGradient(half, half, 0, half, half, half);
	  gradient2.addColorStop(0.025, '#CCC');
	  gradient2.addColorStop(0.1, 'hsl(' + hue + ', 61%, 33%)');
	  gradient2.addColorStop(0.25, 'hsl(' + hue + ', 64%, 6%)');
	  gradient2.addColorStop(1, 'transparent');

	  ctx2.fillStyle = gradient2;
	  ctx2.beginPath();
	  ctx2.arc(half, half, half, 0, Math.PI * 2);
	  ctx2.fill();
	  
 	  // End cache
       
	  function random(min, max) {
  		  if (arguments.length < 2) {
    		  max = min;
    		  min = 0;
  		  }

  		  if (min > max) {
    		  var hold = max;
    		  max = min;
    	  	  min = hold;
  	  	  }

  		  return Math.floor(Math.random() * (max - min + 1)) + min;
	  }

	  function maxOrbit(x, y) {
  		  var max = Math.max(x, y),
    	  diameter = Math.round(Math.sqrt(max * max + max * max));
  		  return diameter / 2;
  		  //星星移动范围，值越大范围越小，
	  }

	  var Star = function() {

  	  	  this.orbitRadius = random(maxOrbit(w, h));
  	  	  this.radius = random(60, this.orbitRadius) / 8; 
  	  	  //星星大小
  	  	  this.orbitX = w / 2;
  	  	  this.orbitY = h / 2;
  	  	  this.timePassed = random(0, maxStars);
  	  	  this.speed = random(this.orbitRadius) / 50000; 
  	  	  //星星移动速度
  	  	  this.alpha = random(2, 10) / 10;

  	  	  count++;
  	  	  stars[count] = this;
	  }

	  Star.prototype.draw = function() {
  		  var x = Math.sin(this.timePassed) * this.orbitRadius + this.orbitX,
    	  y = Math.cos(this.timePassed) * this.orbitRadius + this.orbitY,
    	  twinkle = random(10);

  		  if (twinkle === 1 && this.alpha > 0) {
    		  this.alpha -= 0.05;
  		  } else if (twinkle === 2 && this.alpha < 1) {
    		  this.alpha += 0.05;
  		  }

  		  ctx.globalAlpha = this.alpha;
  		  ctx.drawImage(canvas2, x - this.radius / 2, y - this.radius / 2, this.radius, this.radius);
  		  this.timePassed += this.speed;
	  }

	  for (var i = 0; i < maxStars; i++) {
  		  new Star();
	  }	 
	  
	  function animation() {
  		  ctx.globalCompositeOperation = 'source-over';
  		  ctx.globalAlpha = 0.5; //尾巴
  	  	  ctx.fillStyle = 'hsla(' + hue + ', 64%, 6%, 2)';
  		  ctx.fillRect(0, 0, w, h)

  		  ctx.globalCompositeOperation = 'lighter';
  		  for (var i = 1, l = stars.length; i < l; i++) {
    		  stars[i].draw();
  		  };

  		  window.requestAnimationFrame(animation);
	  }
	  
	  
	  animation();

      function initCar(){
          $(".box").css("left",(document.body.clientWidth/2-330)+"px");
          $(".car").css("left",(document.body.clientWidth/2-330)+"px");
          $(".bottom").css("left",(document.body.clientWidth/2-393)+"px"); 
      }
      
      $(document).ready(function () {
          initCar();
      	  
      	  $("#v3dTest").v3dControl({
              imgLength: 26,//必填
              width: 600,//插件宽   可填   默认为容器宽  如果不想放大缩小序列图则填写序列图的宽高反之则不填width
              height: 268,//插件高 可填   默认为容器高  如果不想放大缩小序列图则填写序列图的宽高反之则不填height
              imgPath: "/image/home/gallery/",//图片路径  可填  默认img/
              imgType: ".png",//图片类型  可填  默认.png
              isAuto: true//是否自动播放  可填      默认false
          });
          
          
      })
      
      window.onresize=function(){
          $('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click()
      };
      
      $('#s').on('click',function(){
          $.ajax({
          	  type:'post',
          	  url:'sessionDestroy.do'
          });
      });
      */
  </script>
</html>
