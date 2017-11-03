<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
          import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>发货单查询</title>
    <base href="<%=basePath%>"> 
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="plugin/css/public.css">
    <link rel="stylesheet" href="plugin/css/cutpic.css" type="text/css" /> 
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="plugin/jQuery/jquery-ui.min.js"></script>  
    <link rel="stylesheet" href="plugin/css/jquery.datetimepicker.css">
    <script src="plugin/jQuery/jquery.datetimepicker.full.js"></script> 
    <script src="plugin/js/xygdev.commons.js"></script> 
  </head> 
  <body>
    <div id="container">
      <!-- 数据加载动画 start -->
      <div class="ajax_loading">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <!-- 数据加载动画 end -->
      <!-- 主表格区域 start -->
      <div class="table">
        <table id="main-table" data-table="ship">
          <tr>
            <th class="SEND_NUM" data-column="db">发货单号</th>
            <th class="SHIP_BOX_NUM" data-column="db">箱号</th>
            <th class="ACTUAL_SHIP_DATE" data-column="db">发货日期</th>
            <th class="DESCRIPTION" data-column="db">本厂型号</th>
            <th class="CARNAME" data-column="db">中文描述</th>
            <th class="EN_DESC" data-column="db">英文描述</th>
            <th class="SPEC" data-column="db">规格</th>
            <th class="QUANTITY" data-column="db">片数</th>
            <th class="SUM_AREA" data-column="db">总面积</th>
            <th class="CUS_BATCH" data-column="db">采购订单</th>
            <th class="SHIP_HEADER_ID" style="display:none" data-column="hidden">&nbsp;</th>       
          </tr>
          <tr>
            <td class="SEND_NUM" data-column="db"></td>
            <td class="SHIP_BOX_NUM" data-column="db"></td>
            <td class="ACTUAL_SHIP_DATE" data-column="db"></td>
            <td class="DESCRIPTION text-left" data-column="db"></td>
            <td class="CARNAME text-left" data-column="db"></td>
            <td class="EN_DESC text-left" data-column="db"></td>
            <td class="SPEC" data-column="db"></td>
            <td class="QUANTITY" data-column="db"></td>
            <td class="SUM_AREA" data-column="db"></td>
            <td class="CUS_BATCH" data-column="db"></td>
            <td class="SHIP_HEADER_ID" style="display:none" data-column="hidden">&nbsp;</td>   
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="ship">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table" data-func=""></i>
        </div>
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="alias" value="XQSQ" />
          </jsp:include>
          <!-- 设置菜单区域 end -->    
        </div>
        <div>
          <!-- 分页按钮区域 start -->
          <jsp:include page="public/pageArrow.jsp" >
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="func" value="" />
          </jsp:include>
          <!-- 分页按钮区域 end -->
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" id="page_no" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="SHIP_HEADER_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="ship/getShipPage.do"/>
          <input type="hidden" data-type="jsontype" value="table"/> 
          <input type="hidden" data-type="autoquery" value="N"/> 
        </div>
      </div>
      <!-- 主表格按钮区域 end --> 
      <!-- 定义列区域 start --> 
      <jsp:include page="public/rowdefine.jsp"></jsp:include>
      <!-- 定义列区域 end -->
      <!-- 多维排序区域 start -->
      <jsp:include page="public/orderby.jsp"></jsp:include>
      <!-- 多维排序区域 end -->
      <!-- 个人配置区域 start -->
      <jsp:include page="public/config.jsp">
        <jsp:param name="tableId" value="#main-table" />
      </jsp:include>
      <!-- 个人配置区域 end -->  
      <!-- lov区域 start -->
      <jsp:include page="public/lov.jsp"></jsp:include>
      <!-- lov区域 end -->
      <!-- 条件查询区域start -->
      <div id="query" class="pop_frame row-2">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;发货单查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <label for="SEND_NUM_Q" class="left md">发货单号:</label>
            <input type="text" id="SEND_NUM_Q" name="SEND_NUM" class="left lg"/>  
            <label for="CUS_BATCH_Q" class="left md">采购订单:</label>
            <input type="text" id="CUS_BATCH_Q" name="CUS_BATCH" class="left lg"/>     
            <br style="clear:both"/>
            <label for="ACTUAL_SHIP_DATE_F" class="left md">发货日期:</label>
            <input type="text" id="START_DATE_F" name="ACTUAL_SHIP_DATE_F" class="left time" data-datatype="date" placeholder="起始发货日期"/>
            <label class="left blank"></label>
            <input type="text" id="START_DATE_T" name="ACTUAL_SHIP_DATE_T" class="left time" data-datatype="date" placeholder="截止发货日期"/>
          </form> 
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">查询</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="SHIP_QUERY"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->  
    </div>   
    
    <script>       
        $(function() {
            //设置拖拽
            $('#query').draggable({ handle: '.title'});
            
            //初始化CRUD和LOV条件查询
            $().crudListener(); 
            $().revealListener(); 
            
    		//默认查询时间
			$.fn.defaultQueryDate = function(){
			    var sysDate = new Date();
			    var firstDay;
			    firstDay = sysDate.getFullYear()
			              +'-'+(sysDate.getMonth()+1)
			              +'-01 00:00:00';
			    
			    $('#START_DATE_F').val(firstDay);
			    $('#START_DATE_T').val(sysDate.format('yyyy-MM-dd'+' 23:59:59'));//modify by bird 2017.08.10  修改默认当前时间的时分秒为23:59:59
			}	
			
			$().defaultQueryDate();             
            
            $('input[data-datatype="date"]').datetimepicker({
                  lang:'ch',           //语言选择中文
                  timepicker:true,    //启用时间选项
                  format:'Y-m-d H:i:s',      //格式化日期
                  step: 30,
                  showOnClick: true
            });
        });
        
        jQuery.json={
            getContent:function(data,JSONtype){      
                if(JSONtype=='table'){
                    var mapRowArray=[
                    ['.SHIP_HEADER_ID','SHIP_HEADER_ID']
                   ,['.SEND_NUM','SEND_NUM']
                   ,['.SHIP_BOX_NUM','SHIP_BOX_NUM']
                   ,['.DESCRIPTION','DESCRIPTION']
                   ,['.CARNAME','CARNAME']
                   ,['.EN_DESC','EN_DESC']
                   ,['.SPEC','SPEC']
                   ,['.QUANTITY','QUANTITY']
                   ,['.SUM_AREA','SUM_AREA']
                   ,['.CUS_BATCH','CUS_BATCH']
                   ,['.ACTUAL_SHIP_DATE','ACTUAL_SHIP_DATE']
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                    $().crudListener();
                    //$().detail();
                    $().revealListener(); 
                }
            },
            getMSG:function(data){
                pageMinRow=parseInt(data.pageMinRow);
                pageMaxRow=parseInt(data.pageMaxRow);
                firstPageFlag=data.firstPageFlag;
                lastPageFlag=data.lastPageFlag;
                totalPages=data.totalPages;
            }
        }   
    </script>
    <script type="text/javascript" src="plugin/layer/layer.js"></script>
    <script type="text/javascript" src="plugin/js/data.validate.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.reveal.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.page.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.lov.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.crud.js"></script> 
    <script type="text/javascript" src="plugin/js/jQuery.rowdefine.js"></script>
    <script type="text/javascript" src="plugin/js/jQuery.irr.orderby.js"></script>  
    <script type="text/javascript" src="plugin/js/jQuery.irr.init.js"></script>    
  </body>
</html>