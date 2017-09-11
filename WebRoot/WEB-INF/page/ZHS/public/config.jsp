<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" %>
<html>
  <body>
    <%
        String tableId = request.getParameter("tableId");
     %>
    <!-- 个人配置区域 start -->
    <div id="config">
      <div class="title pointer">
        <span class="title_name">个人配置</span>
      </div>
      <a class="close-reveal-modal">&#215;</a>
      <div class="line"></div>
      <div class="contain" id="configtabs">
        <ul>
          <li><a href="#tabs-1">保存配置</a></li>
          <li><a href="#tabs-2">加载配置</a></li>
        </ul>
        <div id="tabs-1" class="tab">
          <div class="item" style="text-indent:3rem">
            <label class="pointer" for="USER_INTERACT_NAME">自定义名称：</label>
            <input type="text" name="USER_INTERACT_NAME" id="USER_INTERACT_NAME">
          </div>
          <div class="item" style="text-indent:6rem">
            <label class="pointer" for="CONFIG_DESCRIPTION">描述：</label>
            <input type="text" name="DESCRIPTION" id="CONFIG_DESCRIPTION">
          </div>
          <div class="item" style="text-indent:6rem">
            <!--  
            <label class="pointer" for="PUBLIC_FLAG">共享</label>
            <input type="checkbox" name="PUBLIC_FLAG" id="PUBLIC_FLAG">
            -->
            <label class="pointer" for="DEFAULT_FLAG">默认</label>
            <input type="checkbox" name="DEFAULT_FLAG" id="DEFAULT_FLAG">
            <!--  
            <label class="pointer" for="AUTOQUERY_FLAG">自动查询</label>
            <input type="checkbox" name="AUTOQUERY_FLAG" id="AUTOQUERY_FLAG"> 
            -->
          </div>
          <div class="item">
            <button class="pointer" data-config="save" data-tableid=<%=tableId %>>保存</button>
          </div>
        </div>
        <div id="tabs-2" class="tab">
          <div class="item" style="text-indent:6rem;margin:50px auto 60px">
            <label class="pointer" for="loding_format">选择配置:</label>
            <select id="loding_format"></select>
          </div>
          <div class="item">
            <button class="pointer" data-config="load" data-tableid=<%=tableId %>>加载</button>
          </div>
        </div>
      </div>
    </div>
    <script>
         $('#config').draggable({ handle: '.title' });
         //设置tab分栏
    	 /**屏蔽<base>标签对JQuery UI tabs()的影响**/
         $.fn.__tabs = $.fn.tabs;
			$.fn.tabs = function (a, b, c, d, e, f) {
				var base = window.location.href.replace(/#.*$/, '');
				$('ul>li>a[href^="#"]', this).each(function () {
					var href = $(this).attr('href');
					$(this).attr('href', base + href);
				});
				$(this).__tabs(a, b, c, d, e, f);
			};
    		$('#configtabs').tabs();
    		
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
    <!-- 个人配置区域 end -->
  </body>
</html>