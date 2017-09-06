<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Item Query</title>
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
        <table id="main-table" data-table="items">
          <tr>
            <th class="ACTION" data-column="normal" style="min-width:50px"></th> 
            <th class="ORGANIZATION_NAME" data-column="db">Inv</th>
     	    <th class="ITEM_NUMBER" data-column="db">Item No</th>
     	    <th class="DESCRIPTION" data-column="db">Item</th>
     	    <th class="CARNAME" data-column="db">CN Desc</th>
     	    <th class="EN_DESC" data-column="db">EN Desc</th>
     	    <th class="SPEC" data-column="db">Spec</th>
     	    <th class="OEMNO" data-column="db">OEM No</th> 
     	    <th class="PRODUCT_TYPE_DESC" data-column="db">Product Type</th>
     	    <th class="PROCESS_TYPE_DESC" data-column="db">Process Type</th>
     	    <th class="LOAD_LOCATION_DESC" data-column="db">Load Location</th>
     	    <th class="ITEM_ID" style="display:none" data-column="hidden">&nbsp;</th> 
     	    <th class="ORGANIZATION_ID" style="display:none" data-column="hidden">&nbsp;</th>  	    
     	  </tr>
     	  <tr>
     	    <td class="ACTION" data-column="normal" style="min-width:50px">
     	      <i class="fa fa-eye fa-fw pointer hidden" data-show="true" title="Item Detail" ></i>
     	    </td>
            <td class="ORGANIZATION_NAME" data-column="db"></td>
     	    <td class="ITEM_NUMBER" data-column="db"></td>
     	    <td class="DESCRIPTION text-left" data-column="db"></td>
     	    <td class="CARNAME text-left" data-column="db"></td>
     	    <td class="EN_DESC text-left" data-column="db"></td>  
     	    <td class="SPEC" data-column="db"></td> 	
     	    <td class="OEMNO" data-column="db"></td>    
     	    <td class="PRODUCT_TYPE_DESC" data-column="db"></td>
     	    <td class="PROCESS_TYPE_DESC" data-column="db"></td>
     	    <td class="LOAD_LOCATION_DESC" data-column="db"></td>
     	    <td class="ITEM_ID" style="display:none" data-column="hidden">&nbsp;</td> 
     	    <td class="ORGANIZATION_ID" style="display:none" data-column="hidden">&nbsp;</td>   
     	  </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="items">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="Table Setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="Conditional Query" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="Refresh Data" data-pagetype="refresh" data-pageframe="table" data-func="$().validateOrgan()"></i>
        </div>
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp" >
			<jsp:param name="rdtable" value="#main-table" />
			<jsp:param name="odtable" value="#main-table" />
			<jsp:param name="pageframe" value="table" />
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
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="ITEM_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="items/getValidItemsPage.do"/>
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
      <div id="query" class="pop_frame row-6">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;Item Query</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-6">
          <form>
            <label for="ORGANIZATION_NAME_Q" class="left md">Inv:</label> 
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left md" readonly="readonly"/>
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORG_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Inv Query" data-queryurl="lov/getUserOrganization.do" data-jsontype="orgLov" data-defaultquery="true" data-th=["ID","Code","Inv"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["Code","Inv"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_NAME_Q"] value="···"/>
            <label for="ITEM_NUMBER_Q" class="left md">Item No:</label>
            <input type="text" id="ITEM_NUMBER_Q" name="ITEM_NUMBER" class="left lg"/>
            <br style="clear:both"/>
            <label for="DESCRIPTION_Q" class="left md">Item:</label>
            <input type="text" id="DESCRIPTION_Q" name="DESCRIPTION" class="left lg"/>
            <label for="CARNAME_Q" class="left md">CN Desc:</label>
            <input type="text" id="CARNAME_Q" name="CARNAME" class="left lg"/>
            <br style="clear:both"/>
            <label for="PRODUCT_TYPE_DESC_Q" class="left md">Product:</label>
            <input type="text" id="PRODUCT_TYPE_DESC_Q" name="PRODUCT_TYPE_DESC" data-lovbtn="PRODUCT_TYPE_DESC_LOV" data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/>
            <input type="hidden" id="PRODUCT_TYPE_ID_Q" name="PRODUCT_TYPE_ID"/>
            <input type="button" id="PRODUCT_TYPE_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Product Type Query" data-queryurl="lov/getProductPage.do" data-jsontype="productLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Product&nbsp;Type"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Product"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#PRODUCT_TYPE_ID_Q","#PRODUCT_TYPE_DESC_Q"] value="···"/>
            <label for="PROCESS_TYPE_DESC_Q" class="left md">Process:</label>       
            <input type="text" id="PROCESS_TYPE_DESC_Q" name="PROCESS_TYPE_DESC" data-lovbtn="PROCESS_TYPE_DESC_LOV" data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/>
            <input type="hidden" id="PROCESS_TYPE_ID_Q" name="PROCESS_TYPE_ID"/>
            <input type="button" id="PROCESS_TYPE_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Process Type Query" data-queryurl="lov/getProcessPage.do" data-jsontype="processLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Process&nsbp;Type"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Process"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#PROCESS_TYPE_ID_Q","#PROCESS_TYPE_DESC_Q"] value="···"/>        
            <br style="clear:both"/>
            <label for="LOAD_LOCATION_DESC_Q" class="left md">Load:</label>
            <input type="text" id="LOAD_LOCATION_DESC_Q" name="LOAD_LOCATION_DESC" data-lovbtn="LOAD_LOCATION_DESC_LOV"  data-pageframe="query" data-modify="true" data-param="DESCRIPTION" class="left md"/> 
            <input type="hidden" id="LOAD_LOCATION_ID_Q" name="LOAD_LOCATION_ID"/>
            <input type="button" id="LOAD_LOCATION_DESC_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Load Location Query" data-queryurl="lov/getLoadPage.do" data-jsontype="loadLov" data-defaultquery="true" data-th=["LOOKUP_CODE","Load&nbsp;Location"] data-td=["LOOKUP_CODE&none","DESCRIPTION"] data-selectname=["Location"] data-selectvalue=["DESCRIPTION"] data-choose=[".LOOKUP_CODE",".DESCRIPTION"] data-recid=["#LOAD_LOCATION_ID_Q","#LOAD_LOCATION_DESC_Q"] value="···"/>        
            <label for="EN_DESC_Q" class="left md">EN Desc:</label>
            <input type="text" id="EN_DESC_Q" name="EN_DESC" class="left lg"/>
            <br style="clear:both"/>
            <label for="CHANG_F" class="left md">Long:</label>
            <input type="text" id="CHANG_F" name="CHANG_F" class="left xs" style="width:99px"/>
            <label class="left blank" style="width:11px;padding-top:8px">-</label>
            <input type="text" id="CHANG_T" name="CHANG_T" class="left xs" style="width:99px"/>
            <label for="GAO_F" class="left md">Height:</label>
            <input type="text" id="GAO_F" name="GAO_F" class="left xs" style="width:99px"/>
            <label class="left blank" style="width:11px;padding-top:8px">-</label>
            <input type="text" id="GAO_T" name="GAO_T" class="left xs" style="width:99px"/>    
            <br style="clear:both"/>
            <label for="OEMNO_Q" class="left md">OEM No:</label>
            <input type="text" id="OEMNO_Q" name="OEMNO" class="left lg"/>
            <br style="clear:both"/>
          </form> 
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="ITEMS_QUERY"/> 
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
    		
    		//条件查询限制
    		$.fn.validateOrgan = function(){
    		    organizationId = $('#ORGANIZATION_ID_Q').val();
    		    if(organizationId==null||organizationId==''){
    		       $('.ajax_loading').hide();
    		       layer.alert('You Must Select A Inv Before Query',{skin:'layui-layer-lan',title:'警告',offset:[150]});
    		       throw ('必须选择库存组织才能查询物料！');
    		    }
    		}
    		
    		$.fn.detail = function(){
    		    $('.ACTION i').off('click');
    		    $('.ACTION i').on('click',function(){
    		    	var tr = $(this).parent().parent();
    		    	var id = tr.children('.ITEM_ID').text();
    		    	var orgid = tr.children('.ORGANIZATION_ID').text();
    		    	layer.open({
  						type: 2,
  						area: ['1000px', '620px'],
  						title:'Item Detail',
  						fixed: false, //不固定
  						maxmin: true,				
  						content: 'items/itemDetail.do?ITEM_ID='+id+'&ORG_ID='+orgid
					});
    			});
    		}
        });
        
        jQuery.json={
        	getContent:function(data,JSONtype){      
        	    if(JSONtype=='table'){
        	    	var mapRowArray=[
        	    	['.ITEM_ID','ITEM_ID']
        	       ,['.ORGANIZATION_NAME','ORGANIZATION_NAME']
        	       ,['.ITEM_NUMBER','ITEM_NUMBER']
        	   	   ,['.DESCRIPTION','DESCRIPTION']
        	   	   ,['.SPEC','SPEC']
        	       ,['.CARNAME','CARNAME']
        	   	   ,['.EN_DESC','EN_DESC']
        	   	   ,['.OEMNO','OEMNO']
        	   	   ,['.PRODUCT_TYPE_DESC','PRODUCT_TYPE_DESC']
        	   	   ,['.PROCESS_TYPE_DESC','PROCESS_TYPE_DESC']
        	   	   ,['.LOAD_LOCATION_DESC','LOAD_LOCATION_DESC']
        	   	   ,['.ORGANIZATION_ID','ORGANIZATION_ID']
        	     	];
        	    	$().mapContentJson(data,'#main-table',mapRowArray);
        	    	$().afterRowDefine();
                	$().crudListener();
                	$().detail();
                	$().revealListener(); 
        	    }else if(JSONtype=='orgLov'){
        	    	var mapRowArray=[
        	    	 'ORGANIZATION_ID'
        	    	,'ORGANIZATION_CODE'
        	    	,'ORGANIZATION_NAME'
        	    	];
        	    	$().mapContentJson(data,'.contentbox',mapRowArray);         	    
        	    }else if(JSONtype=='productLov'||JSONtype=='processLov'||JSONtype=='loadLov'){
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