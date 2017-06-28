<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String itemId = request.getParameter("ITEM_ID");
  String orgId = request.getParameter("ORG_ID");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>汽玻技术资料明细</title>
    <base href="<%=basePath%>"> 
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="plugin/bootstrap/css/bootstrap.min.css">
    <script src="plugin/bootstrap/js/bootstrap.min.js"></script>
    <!-- Jquery UI -->
    <link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
    <script src="plugin/jQuery/jquery-ui.min.js"></script>	
    <link rel="stylesheet" href="plugin/css/items/itemsDetail.css">
  </head>
  <body>
    <div class="contain" id="itemtabs" style="border:0">
      <ul>
        <li><a href="#tabs-1" style="font-size:1.8em">产品参数</a></li>
        <li><a href="#tabs-2" data-tab="#tabs-2" data-filetype="VEHICLETPFILE" style="font-size:1.8em">整车图</a></li>
        <li><a href="#tabs-3" data-tab="#tabs-3" data-filetype="GLASSTPFILE" style="font-size:1.8em">玻璃图</a></li>
        <li><a href="#tabs-4" data-tab="#tabs-4" data-filetype="PTPFILE" style="font-size:1.8em">镜座图</a></li>
        <li><a href="#tabs-5" data-tab="#tabs-5" data-filetype="STPFILE" style="font-size:1.8em">感应座图</a></li>
        <li><a href="#tabs-6" data-tab="#tabs-6" data-filetype="GLUETPFILE" style="font-size:1.8em">胶条图</a></li>
        <li><a href="#tabs-7" data-tab="#tabs-7" data-filetype="WTPFILE" style="font-size:1.8em">五金件图</a></li>
      </ul>
      <div id="tabs-1" class='tab'>
        <div class="container">
          <div class="row">
        	<div class="col-md-6 col">
          	  <span class="left">库存组织:</span>
          	  <p class="left" id="ORG_NAME"></p>
        	</div>
        	<div class="col-md-6 col">
          	  <span class="left">物料编码:</span>
              <p class="left" id="ITEM_NUMBER"></p> 
        	</div>
      	  </div>
      	  <div class="row">
            <div class="col-md-6 col">
              <span class="left">物料描述:</span>
          	  <p class="left" id="DESCRIPTION"></p>
            </div>
            <div class="col-md-6 col">
          	  <span class="left">OEM编码:</span>
          	  <p class="left" id="OEMNO"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-12 col">
          	  <span class="left">中文名称:</span>
          	  <p class="left" id="CARNAME"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-12 col">
          	  <span class="left">英文名称:</span>
          	  <p class="left" id="EN_DESC"></p>
            </div>
      	  </div>
          <div class="row">
            <div class="col-md-6 col">
          	  <span class="left">规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</span>
          	  <p class="left" id="SPEC"></p>
            </div>
            <div class="col-md-6 col">
          	  <span class="left">产品种类:</span>
          	  <p class="left" id="PRODUCT_TYPE_DESC"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-6 col">
          	  <span class="left">加工类型:</span>
          	  <p class="left" id="PROCESS_TYPE_DESC"></p>
            </div>
            <div class="col-md-6 col">
          	  <span class="left">装车位置:</span>
          	  <p class="left" id="LOAD_LOCATION_DESC"></p>
            </div>
      	  </div>
          <div class="line_f"></div>
          <div class="line_t"></div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">中高对角:</span>
          	  <p class="left" id="BEVEL"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">孔&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数:</span>
          	  <p class="left" id="HOLE"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">天&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;线:</span>
          	  <p class="left" id="ANTENNA"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">磨边类型:</span>
          	  <p class="left" id="POLISH"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">玻璃厚度:</span>
          	  <p class="left" id="HEIGHT"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">彩条颜色:</span>
          	  <p class="left" id="BANDCOLOR"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">感&nbsp;应&nbsp;座&nbsp;:</span>
          	  <p class="left" id="TELEPATHY"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">镜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;座:</span>
          	  <p class="left" id="MSEAT"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">镜座高度:</span>
          	  <p class="left" id="MHEIGHT"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">五&nbsp;金&nbsp;件&nbsp;:</span>
          	  <p class="left" id="METAL"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">胶&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;条:</span>
          	  <p class="left" id="MUCUS"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">拱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高:</span>
          	  <p class="left" id="COVE"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">中心球面:</span>
          	  <p class="left" id="SPHERE"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">木箱装箱数:</span>
          	  <p class="left" id="ZXSL"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">纸箱装箱数:</span>
          	  <p class="left" id="ZXSL1"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">欧洲编码:</span>
          	  <p class="left" id="EURCODE"></p>
            </div>
            <div class="col-md-4">
          	  <span class="left col">美洲编码:</span>
          	  <p class="left" id="USACODE"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">澳洲编码:</span>
          	  <p class="left" id="AUCODE"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">有无附件备注:</span>
          	  <p class="left" id="HASFJ"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">附件明细:</span>
          	  <p class="left" id="FJDETAIL"></p>
            </div>
            <div class="col-md-4 col">
          	  <span class="left">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</span>
          	  <p class="left" id="MEMO"></p>
            </div>
      	  </div>
      	  <div class="row">
            <div class="col-md-4 col">
          	  <span class="left">通用型号:</span>
          	  <p class="left" id="CCARSTYLE"></p>
            </div>
            <div class="col col-md-4 col">
          	  <span class="left">设备名称:</span>
          	  <p class="left" id="EQUIPMENT"></p>
            </div>
          </div>
        </div>
      </div>
      <div id="tabs-2" class='tab'>
        <input type="hidden" class="file_type_code" value="VEHICLETPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="整车图"/>
        <div class="img_area">
        </div>
      </div>
      <div id="tabs-3" class='tab'>
        <input type="hidden" class="file_type_code" value="GLASSTPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="玻璃图"/>
        <div class="img_area">
        </div>
      </div>
      <div id="tabs-4" class='tab'>
        <input type="hidden" class="file_type_code" value="PTPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="镜座图"/>
        <div class="img_area">
        </div>
      </div>
      <div id="tabs-5" class='tab'>
        <input type="hidden" class="file_type_code" value="STPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="感应座图"/>
        <div class="img_area">
        </div>
      </div>
      <div id="tabs-6" class='tab'>
        <input type="hidden" class="file_type_code" value="GLUETPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="胶条图"/>
        <div class="img_area">
        </div>
      </div>
      <div id="tabs-7" class='tab'>
        <input type="hidden" class="file_type_code" value="WTPFILE"/>
        <input type="hidden" class="file_type_code_zhs" value="五金件图"/>
        <div class="img_area">
        </div>
      </div>
    </div>
    
    <input type="hidden" id="ITEM_ID" value="<%=itemId %>"/>
    <input type="hidden" id="ORG_ID" value="<%=orgId %>"/>
    <script>
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
    	$('#itemtabs').tabs();
    	
    	var item_id = $('#ITEM_ID').val();
    	var org_id = $('#ORG_ID').val();
    	
    	$('a[data-filetype]').on('click',function(){
    	    var tab = $($(this).attr('data-tab'));
    	    tab.find('.img_area').html('');
    		var file_type_code = tab.find('.file_type_code').val();
    		var file_type_zhs = tab.find('.file_type_code_zhs').val();
    		var param = 'ITEM_ID='+item_id+'&ORG_ID='+org_id+'&FILE_TYPE_CODE='+file_type_code;
    		$.ajax({
				type:'post', 
				data:param,
				url:'items/countPic.do',
				dataType:'json',
				success: function (data) {
				    if(data.result!='0'){
				        var index = layer.load(0, {shade: false});
				        tab.find('.img_area').append('<img src="ftp/ftpImg.do?ITEM_ID='+item_id+'&ORG_ID='+org_id+'&FILE_TYPE_CODE='+file_type_code+'"/>');
				        layer.close(index);
				    }else{
				        //tab.find('.img_area').append('<h3>该物料暂无'+file_type_zhs+'</h3>');
				        tab.find('.img_area').append('<img src="/image/items/nopic.png" style="padding:100px 150px"/>');
				        layer.msg('该物料暂无'+file_type_zhs,{time:1000});
				    }
				},
				error: function () {
					alert('json格式错误');
				}
    		});
    	});
    	
    	var param = 'ITEM_ID='+item_id+'&ORG_ID='+org_id;
    	$.ajax({
			type:'post', 
			data:param,
			url:'items/getItemsDetail.do',
			dataType:'json',
			success: function (data) {
                $('#ORG_NAME').text(data.rows[0].ORGANIZATION_NAME);
                $('#ITEM_NUMBER').text(data.rows[0].ITEM_NUMBER);
                $('#DESCRIPTION').text(data.rows[0].DESCRIPTION);
                $('#OEMNO').text(data.rows[0].OEMNO);
                $('#CARNAME').text(data.rows[0].CARNAME);
                $('#EN_DESC').text(data.rows[0].EN_DESC);
                $('#SPEC').text(data.rows[0].SPEC);
                $('#PRODUCT_TYPE_DESC').text(data.rows[0].PRODUCT_TYPE_DESC);
                $('#PROCESS_TYPE_DESC').text(data.rows[0].PROCESS_TYPE_DESC);
                $('#LOAD_LOCATION_DESC').text(data.rows[0].LOAD_LOCATION_DESC);
                $('#BEVEL').text(data.rows[0].BEVEL);
                $('#HOLE').text(data.rows[0].HOLE);
                $('#ANTENNA').text(data.rows[0].ANTENNA);
                $('#POLISH').text(data.rows[0].POLISH);
                $('#HEIGHT').text(data.rows[0].HEIGHT);
                $('#BANDCOLOR').text(data.rows[0].BANDCOLOR);TELEPATHY
                $('#TELEPATHY').text(data.rows[0].TELEPATHY);
                $('#MSEAT').text(data.rows[0].MSEAT);
                $('#MHEIGHT').text(data.rows[0].MHEIGHT);
                $('#METAL').text(data.rows[0].METAL);
                $('#MUCUS').text(data.rows[0].MUCUS);
                $('#COVE').text(data.rows[0].COVE);
                $('#SPHERE').text(data.rows[0].SPHERE);
                $('#ZXSL').text(data.rows[0].ZXSL);
                $('#ZXSL1').text(data.rows[0].ZXSL1);
                $('#EURCODE').text(data.rows[0].EURCODE);
                $('#USACODE').text(data.rows[0].USACODE);
                $('#AUCODE').text(data.rows[0].AUCODE);
                $('#HASFJ').text(data.rows[0].HASFJ);
                $('#FJDETAIL').text(data.rows[0].FJDETAIL);
                $('#MEMO').text(data.rows[0].MEMO);  
                $('#CCARSTYLE').text(data.rows[0].CCARSTYLE);
                $('#EQUIPMENT').text(data.rows[0].EQUIPMENT)
			},
			error: function () {
				alert('json格式错误');
				//layer.alert('获取Json数据失败',{title:'警告',offset:[150]});
			}
		}); 

    </script>
    <script type="text/javascript" src="plugin/layer/layer.js"></script>
  </body>
</html>
