<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>库存查询</title>
	<meta http-equiv="content-type" content="text/html;charset=gb2312">
    <link rel="stylesheet" href="plugin/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugin/css/jquery-ui.min.css">
    <link rel="stylesheet" type="text/css" href="plugin/css/public.css">
    <link rel="stylesheet" href="plugin/css/cutpic.css" type="text/css" />
    <script src="plugin/js/webSocket.js"></script>
    <script type="text/javascript" src="plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="plugin/jQuery/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="plugin/css/jquery.datetimepicker.css">
    <script src="plugin/jQuery/jquery.datetimepicker.full.js"></script>
    <script src="plugin/js/xygdev.commons.js"></script>
  </head> 
  <body>
    <div id="container">
      <div class="ajax_loading">
        <i class="fa fa-spinner fa-fulse fa-4x" style="color:white"></i>
      </div>
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="Inv">
          <tr>
            <th class="ORGANIZATION_CODE" data-column="db">库存编码</th>
            <th class="ORGANIZATION_NAME" data-column="db">库存组织</th>
            <th class="ITEM_NUMBER" data-column="db">物料编码</th>
            <th class="DESCRIPTION" data-column="db">本厂型号</th>
            <th class="CARNAME" data-column="db">中文描述</th>     
            <th class="ONHAND_QTY" data-column="db">现有量</th>
            <th class="AVAILABLE_QTY" data-column="db">可用量</th>
            <th class="ORGANIZATION_ID" data-column="hidden" style="display:none;"></th>         
          </tr>
          <tr>
            <td class="ORGANIZATION_CODE" data-column="db"></td>
            <td class="ORGANIZATION_NAME" data-column="db"></td>
            <td class="ITEM_NUMBER" data-column="db"></td>
            <td class="DESCRIPTION text-left" data-column="db"></td>
            <td class="CARNAME text-left" data-column="db"></td>
            <td class="ONHAND_QTY" data-column="db"></td>
            <td class="AVAILABLE_QTY" data-column="db"></td>
            <td class="ORGANIZATION_ID" data-column="hidden" style="display:none;"></td>          
          </tr>
        </table>
      </div>
      <div class="table_button" id="table" data-table="Inv">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"  data-func="$().validateOrgan()"></i>
        </div>
        <div id="setting">
          <jsp:include page="./public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
          </jsp:include>
        </div>
        <div>
          <jsp:include page="./public/pageArrow.jsp" >
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="func" value="" />
          </jsp:include>
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" id="page_no" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="ORGANIZATION_ID ASC"/>
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="perm/getInvPage.do"/>
          <input type="hidden" data-type="jsontype" value="table"/> 
          <input type="hidden" data-type="autoquery" value="N"/> 
        </div>
      </div>
      <jsp:include page="public/rowdefine.jsp"></jsp:include>
      <jsp:include page="public/orderby.jsp"></jsp:include>
      <jsp:include page="public/config.jsp">
        <jsp:param name="tableId" value="#main-table"/>
      </jsp:include>
      <jsp:include page="public/lov.jsp"></jsp:include>
      <div id="query" class="pop_frame row-2">
        <div class="title pointer">
          <span><i class="fa fa-search"></i>&nbsp;库存查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <label for="ORGANIZATION_CODE_Q" class="left md">库存编码:</label> 
            <input type="text" id="ORGANIZATION_CODE_Q" name="ORGANIZATION_CODE" class="left md" readonly="readonly" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="库存组织查询" data-queryurl="lov/getUserOrganization.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存代号","库存组织"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_CODE",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_CODE_Q","#ORGANIZATION_NAME_Q"] value="···"/>    
            <label for="ORGANIZATION_NAME_Q" class="left md">库存组织:</label>
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left lg" readonly="readonly"/>           
            <br style="clear:both"/>
            <label for="DESCRIPTION_Q" class="left md">本厂型号:</label>
            <input type="text" id="DESCRIPTION_Q" name="DESCRIPTION" class="left lg"/>    
            <label for="CARNAME_Q" class="left md">中文描述:</label>
            <input type="text" id="CARNAME_Q" name="CARNAME" class="left lg"/>           
          </form>
        </div>
        <div class="foot">
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">查询</button>
        </div>
      </div>
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>
      <input type="hidden" id="INTERACT_CODE" value="INV_QUERY"/>
      <input type="hidden" id="HEADER_ID" value=""/> 
    </div>
    <script>
        $(function() {
            //设置拖拽
            $('#query').draggable({ handle: '.title'});
           
            //初始化CRUD和LOV条件查询
            $().crudListener();
            $().revealListener();             
   
            //条件查询限制
            $.fn.validateOrgan = function(){
                organizationId = $('#ORGANIZATION_ID_Q').val();
                if(organizationId==null||organizationId==''){
                    $('.ajax_loading').hide();
                    layer.alert('必须选择库存组织才能查询库存信息！',{skin:'layui-layer-lan',title:'警告',offset:[150]});
                    throw ('必须选择库存组织才能查询库存信息！');
                }
            }   
        }); 
        jQuery.json={
            getContent:function(data,JSONtype){
                if(JSONtype=='table'){
                    var mapRowArray=[
                    ['.ORGANIZATION_CODE','ORGANIZATION_CODE']
                   ,['.ORGANIZATION_NAME','ORGANIZATION_NAME']
                   ,['.ITEM_NUMBER','ITEM_NUMBER']
                   ,['.DESCRIPTION','DESCRIPTION'] 
                   ,['.CARNAME','CARNAME']          
                   ,['.ONHAND_QTY','ONHAND_QTY']           
                   ,['.AVAILABLE_QTY','AVAILABLE_QTY']  
                   ,['.ORGANIZATION_ID','ORGANIZATION_ID']                      
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                    $().crudListener();
                    $().revealListener();
                }else if(JSONtype=='organ'){
                    var mapRowArray=[
                        'ORGANIZATION_ID'
                       ,'ORGANIZATION_CODE'
                       ,'ORGANIZATION_NAME'
                    ];
                    $().mapContentJson(data,'.contentbox',mapRowArray);                     
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
