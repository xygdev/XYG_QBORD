<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>Inv Query</title>
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
      <div class="ajax_loading">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="Inv">
          <tr>
            <th class="ORGANIZATION_CODE" data-column="db">Inv Code</th>
            <th class="ORGANIZATION_NAME" data-column="db">Inv</th>
            <th class="ITEM_NUMBER" data-column="db">Item No</th>
            <th class="DESCRIPTION" data-column="db">Item</th>
            <th class="CARNAME" data-column="db">CN Desc</th> 
            <th class="EN_DESC" data-column="db">EN Desc</th>  
            <th class="SPEC" data-column="db">Spec</th>    
            <th class="LOAD_LOCATION_DESC" data-column="db">Load Location</th> 
            <th class="PRODUCT_TYPE_DESC" data-column="db">Product Type</th>
            <th class="PROCESS_TYPE_DESC" data-column="db">Process Type</th>      
            <th class="ONHAND_QTY_NC" data-column="db">NC Onhand Qty</th>
            <th class="AVAILABLE_QTY_NC" data-column="db">NC Available Qty</th>
            <th class="ONHAND_QTY_WC" data-column="db">WC Onhand Qty</th>
            <th class="AVAILABLE_QTY_WC" data-column="db">WC Available Qty</th>
            <th class="ORGANIZATION_ID" data-column="hidden" style="display:none;"></th>         
          </tr>
          <tr>
            <td class="ORGANIZATION_CODE" data-column="db"></td>
            <td class="ORGANIZATION_NAME" data-column="db"></td>
            <td class="ITEM_NUMBER" data-column="db"></td>
            <td class="DESCRIPTION text-left" data-column="db"></td>
            <td class="CARNAME text-left" data-column="db"></td>
            <td class="EN_DESC text-left" data-column="db"></td>
            <td class="SPEC" data-column="db"></td>    
            <td class="LOAD_LOCATION_DESC" data-column="db"></td> 
            <td class="PRODUCT_TYPE_DESC" data-column="db"></td>
            <td class="PROCESS_TYPE_DESC" data-column="db"></td>
            <td class="ONHAND_QTY_NC" data-column="db"></td>
            <td class="AVAILABLE_QTY_NC" data-column="db"></td>
            <td class="ONHAND_QTY_WC" data-column="db"></td>
            <td class="AVAILABLE_QTY_WC" data-column="db"></td>
            <td class="ORGANIZATION_ID" data-column="hidden" style="display:none;"></td>          
          </tr>
        </table>
      </div>
      <div class="table_button" id="table" data-table="Inv">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="Table Setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="Conditional Query" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="Refresh Data" data-pagetype="refresh" data-pageframe="table"  data-func="$().validateOrgan()"></i>
        </div>
        <div id="setting">
          <jsp:include page="./public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="alias" value="XQIO" />
          </jsp:include>
        </div>
        <div>
          <jsp:include page="./public/pageArrow.jsp" >
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="func" value="" />
          </jsp:include>
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" id="page_no" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="XQIO.ORGANIZATION_ID ASC"/>
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
      <div id="query" class="pop_frame row-5">
        <div class="title pointer">
          <span><i class="fa fa-search"></i>&nbsp;Inv Query</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-5">
          <form>
            <label for="ORGANIZATION_CODE_Q" class="left md">Code:</label> 
            <input type="text" id="ORGANIZATION_CODE_Q" name="ORGANIZATION_CODE" class="left md" readonly="readonly" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Inv Query" data-queryurl="lov/getUserOrganization.do" data-jsontype="organ" data-defaultquery="true" data-th=["ID","Code","Inv"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["Code","Inv"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_CODE",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_CODE_Q","#ORGANIZATION_NAME_Q"] value="···"/>    
            <label for="ORGANIZATION_NAME_Q" class="left md">Inv:</label>
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left lg" readonly="readonly"/>           
            <br style="clear:both"/>
            <label for="DESCRIPTION_Q" class="left md">Item:</label>
            <input type="text" id="DESCRIPTION_Q" name="DESCRIPTION" class="left lg upper-case" onkeyup="this.value=this.value.toUpperCase()"/>    
            <label for="CARNAME_Q" class="left md">CN DESC:</label>
            <input type="text" id="CARNAME_Q" name="CARNAME" class="left lg"/>   
            <br style="clear:both"/>
            <label for="WIDTH_F" class="left md">Long:</label>
            <input type="text" id="WIDTH_F" name="WIDTH_F" class="left xs" style="width:99px"/>
            <label class="left blank" style="width:11px;padding-top:8px">-</label>
            <input type="text" id="WIDTH_T" name="WIDTH_T" class="left xs" style="width:99px"/>
            <label for="HEIGHT_F" class="left md">Height:</label>
            <input type="text" id="HEIGHT_F" name="HEIGHT_F" class="left xs" style="width:99px"/>
            <label class="left blank" style="width:11px;padding-top:8px">-</label>
            <input type="text" id="HEIGHT_T" name="HEIGHT_T" class="left xs" style="width:99px"/>    
            <br style="clear:both"/>
            <label for="LOAD_LOCATION_DESC_Q" class="left md">Load:</label>
            <input type="text" id="LOAD_LOCATION_DESC_Q" name="LOAD_LOCATION_DESC" data-lovbtn="LOAD_LOCATION_DESC_LOV"  data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/> 
            <input type="hidden" id="LOAD_LOCATION_ID_Q" name="LOAD_LOCATION_ID"/>
            <input type="button" id="LOAD_LOCATION_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Load Location Query" data-queryurl="lov/getLoadPage.do" data-jsontype="loadLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Load&nbsp;Location"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Location"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#LOAD_LOCATION_ID_Q","#LOAD_LOCATION_DESC_Q"] value="···"/>    
            <label for="PRODUCT_TYPE_DESC_Q" class="left md">PRODUCT:</label>
            <input type="text" id="PRODUCT_TYPE_DESC_Q" name="PRODUCT_TYPE_DESC" data-lovbtn="PRODUCT_TYPE_DESC_LOV" data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/>
            <input type="hidden" id="PRODUCT_TYPE_ID_Q" name="PRODUCT_TYPE_ID"/>
            <input type="button" id="PRODUCT_TYPE_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Product Type Query" data-queryurl="lov/getProductPage.do" data-jsontype="productLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Product&nbsp;Type"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Product"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#PRODUCT_TYPE_ID_Q","#PRODUCT_TYPE_DESC_Q"] value="···"/>
            <br style="clear:both"/>
            <label for="PROCESS_TYPE_DESC_Q" class="left md">PROCESS:</label>       
            <input type="text" id="PROCESS_TYPE_DESC_Q" name="PROCESS_TYPE_DESC" data-lovbtn="PROCESS_TYPE_DESC_LOV" data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/>
            <input type="hidden" id="PROCESS_TYPE_ID_Q" name="PROCESS_TYPE_ID"/>
            <input type="button" id="PROCESS_TYPE_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Process Type Query" data-queryurl="lov/getProcessPage.do" data-jsontype="processLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Process&nbsp;Type"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Process"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#PROCESS_TYPE_ID_Q","#PROCESS_TYPE_DESC_Q"] value="···"/>        
            <br style="clear:both"/>
          </form>
        </div>
        <div class="foot">
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
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
                    layer.alert('You Must Select A Inv Before Query!',{skin:'layui-layer-lan',title:'警告',offset:[150]});
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
                   ,['.EN_DESC','EN_DESC'] 
                   ,['.SPEC','SPEC']  
                   ,['.LOAD_LOCATION_DESC','LOAD_LOCATION_DESC'] 
                   ,['.PRODUCT_TYPE_DESC','PRODUCT_TYPE_DESC'] 
                   ,['.PROCESS_TYPE_DESC','PROCESS_TYPE_DESC']          
                   ,['.ONHAND_QTY_NC','ONHAND_QTY_NC']           
                   ,['.AVAILABLE_QTY_NC','AVAILABLE_QTY_NC']  
                   ,['.ONHAND_QTY_WC','ONHAND_QTY_WC']           
                   ,['.AVAILABLE_QTY_WC','AVAILABLE_QTY_WC'] 
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
                }else if(JSONtype=='loadLov'){
                    var mapRowArray=[
                       'LOOKUP_CODE'
                      ,'DESCRIPTION'
                    ];
                    $().mapContentJson(data,'.contentbox',mapRowArray); 
                }else if(JSONtype=='productLov'||JSONtype=='processLov'){
                    var mapRowArray=[
                       'LOOKUP_CODE'
                      ,'DESCRIPTION'
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
