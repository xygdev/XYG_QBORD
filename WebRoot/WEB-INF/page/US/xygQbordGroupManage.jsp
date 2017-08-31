<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Group Manage</title>
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
    <style type="text/css">
        .ui-widget.ui-widget-content{border:0px;}  
        .pop_frame>.content .ui-tabs-panel{padding:0;}
    </style>
  </head>
  <body>
    <div id="container">
      <!-- 数据加载动画 start -->
  	  <div class="ajax_loading">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <!-- 数据加载动画 end -->
      <!-- 主表格区域 start -->
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="GroupH">
          <tr>
            <th class="GROUP_CODE" data-column="db">Code</th>
            <th class="GROUP_NAME" data-column="db">Group</th>
            <th class="DESCRIPTION" data-column="db">Description</th>
     	    <th class="ACTION" data-column="normal">Action</th> 
     	    <th class="GROUP_ID" style="display:none" data-column="hidden">&nbsp;</th>
     	  </tr>
     	  <tr>
     	    <td class="GROUP_CODE" data-column="db"></td>
     	    <td class="GROUP_NAME" data-column="db"></td>
            <td class="DESCRIPTION" data-column="db"></td>
     	    <td class="ACTION" data-column="normal">
     	      <i class="fa fa-pencil fa-fw update pointer hidden" data-show="true" title="Update" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="group/preUpdateH.do" data-type="update" data-updateparam=["GROUP_ID",".GROUP_ID"]></i>
     	      <i class="fa fa-eye fa-fw pointer hidden show_detail" data-show="true" title="Detail" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame"></i>
     	    </td>
     	    <td class="GROUP_ID" style="display:none" data-column="hidden">&nbsp;</td>
     	  </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="GroupH">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="Table Setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="Conditional Query" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus-circle pointer" data-reveal-id="ui" data-key="true" title="Insert" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="Refresh Data" data-pagetype="refresh" data-pageframe="table"></i>
        </div>
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp">
			<jsp:param name="rdtable" value="#main-table"/>
			<jsp:param name="odtable" value="#main-table"/>
			<jsp:param name="pageframe" value="table"/>
		  </jsp:include>
          <!-- 设置菜单区域 end -->    
        </div>
        <div>
          <!-- 分页按钮区域 start -->
          <jsp:include page="public/pageArrow.jsp">
			<jsp:param name="pageframe" value="table"/>
			<jsp:param name="func" value=""/>
		  </jsp:include>
          <!-- 分页按钮区域 end -->
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" id="page_no" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="GROUP_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="group/getGroupHPage.do"/>
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
      <div id="query" class="pop_frame row-1">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;Query</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-1">
          <form>
            <label for="GROUP_NAME_Q" class="left md">Group：</label>
            <input type="text" id="GROUP_NAME_Q" name="GROUP_NAME" class="left md" data-modify="true" data-suffixflag="true" data-pageframe="query" data-lovbtn="GROUP_LOV_Q"  data-param="GROUP_NAME"/>
            <input type="hidden" id="GROUP_ID_Q" name="GROUP_ID" />
            <input type="button" id="GROUP_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Group Query" data-queryurl="lov/getGroupPage.do" data-jsontype="group" data-defaultquery="true" data-th=["ID","Code","Group","Desc"] data-td=["GROUP_ID&none","GROUP_CODE","GROUP_NAME","DESCRIPTION"] data-selectname=["Group","Code"] data-selectvalue=["GROUP_NAME","GROUP_CODE"] data-choose=[".GROUP_ID",".GROUP_NAME"] data-recid=["#GROUP_ID_Q","#GROUP_NAME_Q"]  value="···"/>         <!-- 2017/8/2 data-callback -->
          	<label for="ONLY_CUST_Q" class="left md">Cust：</label>
          	<select class="left lg" id="ONLY_CUST_Q" name="ONLY_CUST" data-notnull="false" data-listurl="list/getEnableFlag.do"></select> 
          </form> 
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      <!-- 更新/新增工作组区域 start -->
      <div id="ui" class="pop_frame row-3">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-group fa-1x" aria-hidden="true"></i>&nbsp;Update</span>
          <span data-type="insert"><i class="fa fa-group fa-1x" aria-hidden="true"></i>&nbsp;Insert</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-3">
          <form id="updateData">
            <input type="hidden" id="GROUP_ID" name="GROUP_ID" data-update="db"/>
            <label for="GROUP_CODE" class="left md">Code</label>
            <input type="text" id="GROUP_CODE" name="GROUP_CODE" data-update="db" required="required" class="left lg" />   
            <br style="clear:both"/> 
            <label for="GROUP_NAME" class="left md">Group</label>
            <input type="text" id="GROUP_NAME" name="GROUP_NAME" data-update="db" required="required" class="left lg" /> 
            <br style="clear:both"/>
            <label for="DESC" class="left md">Desc</label>
            <input type="text" id="DESC" name="DESC" data-update="db" class="left lgx2"/>  <!-- 2017/8/4 去掉required  sun -->
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="group/updateH.do" data-func="$().beforeInsert();">Update</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="group/insertH.do" data-func="$().beforeInsert();">Insert</button>
        </div>    
      </div> 
      <!-- 更新/新增工作组区域 end -->
      <!-- 工作组明细区域 start --> 
      <div class="detail_frame" id="detail">
        <div class="title pointer">      
          <span><i class="fa fa-group"></i>&nbsp;Group Detail</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>
        <div class="detail_header">
          <input type="hidden" id="GROUP_ID_D" />
          <label class="mid" for="GROUP_CODE_D">Code</label>
          <input type="text" id="GROUP_CODE_D" class="long" readonly="readonly"/>
          <label class="mid" for="GROUP_NAME_D">Group</label>
          <input type="text" id="GROUP_NAME_D" class="long" readonly="readonly"/>
          <br style="clear:both"/>
        </div>
        <div class="detail_table">
          <table id="sub-table" data-table="custLine">
            <tr>
              <th class="GROUP_SEQUENCE" data-column="db">Seq.</th>
              <th class="SUB_GROUP_NAME" data-column="db">Sub Group</th>
              <th class="ORG_NAME" data-column="db">Sales OU</th>
              <th class="PARTY_NAME" data-column="db">Customer</th>
              <th class="ACCOUNT_NUMBER" data-column="db">Account Number</th>
     	      <th class="ACCOUNT_NAME" data-column="db">Account Name</th>
     	      <th class="ACTION" data-column="normal">Action</th> 
     	    </tr>
     	    <tr>
     	      <td class="GROUP_SEQUENCE" data-column="db"></td>
              <td class="SUB_GROUP_NAME" data-column="db"></td>
              <td class="ORG_NAME" data-column="db"></td>
              <td class="PARTY_NAME" data-column="db"></td>
              <td class="ACCOUNT_NUMBER" data-column="db"></td>
     	      <td class="ACCOUNT_NAME" data-column="db"></td>
     	      <td class="ACTION" data-column="normal">
     	        <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="Delete" data-refresh="sub_refresh" data-crudtype="del" data-delurl="group/deleteL.do" data-delmsg="是否删除序列:" data-col="GROUP_SEQUENCE" data-delparam=["GROUP_SEQUENCE",".GROUP_SEQUENCE"] data-func="$().setParam();"></i>
     	      </td>    	     
     	    </tr>
          </table>
        </div>
        <div class="table_button" id="sub_table" data-table="custLine">
          <div class="setting">
            <i class="fa fa-plus-circle pointer" data-reveal-id="detail_ui" data-key="true" data-bg="detail-modal-bg" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
          </div>
          <div class="setting">
            <i id="sub_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="sub_table" data-func="$().setParam();"></i>
          </div>
          <div>
            <jsp:include page="public/pageArrow.jsp" >
			  <jsp:param name="pageframe" value="sub_table"/>
			  <jsp:param name="func" value="$().setParam();"/>
		    </jsp:include>
            <input type="hidden" data-type="size" value="5"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="GROUP_SEQUENCE ASC"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="group/getGroupLPage.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
          </div>
        </div>
      </div>
      <!-- 工作组明细区域 end -->
      <!-- 工作组明细新增区域 start -->
      <div id="detail_ui" class="pop_frame row-3" style="z-index:104">     
        <div class="title pointer">      
          <span data-type="insert"><i class="fa fa-group fa-1x" aria-hidden="true"></i>&nbsp;Insert Group Detail</span>
        </div>
        <a class="close-detail-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-3 detail_ui_tabs" style="padding:0;height:127px;">
          <form>
             <ul>
               <li><a href="#tabs-1">Sub Group Assign</a></li>
               <li><a href="#tabs-2">Customer Assign</a></li>
             </ul>
             <div id="tabs-1" class="tab">
               <div style="margin-top:28px;">
                 <label for="GROUP_NAME_D" class="left md">Group</label>
	             <input type="text" id="SUB_GROUP_NAME_D" name="GROUP_NAME" data-update="db" class="left lglov" data-modify="true" data-suffixflag="true" data-pageframe="detail_ui" data-lovbtn="GROUP_LOV_D"  data-param="GROUP_NAME"/>
	             <input type="hidden" id="SUB_GROUP_ID_D" name="SUB_GROUP_ID" data-update="db"/>
	             <input type="button" id="GROUP_LOV_D" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Group Query" data-queryurl="lov/getGroupPage.do" data-jsontype="group" data-defaultquery="true" data-th=["Id","Code","Name","Desc"] data-td=["GROUP_ID&none","GROUP_CODE","GROUP_NAME","DESCRIPTION"] data-selectname=["Code","Name"] data-selectvalue=["GROUP_CODE","GROUP_NAME"] data-choose=[".GROUP_ID",".GROUP_NAME"] data-recid=["#SUB_GROUP_ID_D","#SUB_GROUP_NAME_D"]  value="···"/>      <!-- 2017/8/2 data-callback -->
	           </div>
             </div>
             <div id="tabs-2" class="tab">
               <div style="margin-top:12px;">
                 <label for="PARTY_NAME" class="left md">Customer</label> 
                 <input type="text" id="PARTY_NAME" name="PARTY_NAME" data-update="db" class="left lglov" data-modify="true" data-suffixflag="true" data-pageframe="detail_ui" data-lovbtn="PARTY_NAME_LOV" data-param="PARTY_NAME"/>
                 <input type="hidden" id="ACT_ID" name="ACT_ID" data-update="db"/>
                 <input type="button" id="PARTY_NAME_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Customer Query" data-queryurl="lov/getCustAllPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["Id","SalesOU","CustId","Customer","Account"] data-td=["ORG_ID&none","ORG_NAME","ACT_ID&none","PARTY_NAME","ACCOUNT_NUMBER"] data-selectname=["Customer","Account"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".ACT_ID",".PARTY_NAME"] data-recid=["#ORG_ID","#ORG_NAME","#ACT_ID","#PARTY_NAME"] value="···"/>  
                 <br style="clear:both"/>
                 <label for="ORG_NAME" class="left md">Sales OU</label> 
                 <input type="text" id="ORG_NAME" name="ORG_NAME" data-update="db" class="left lgx2" readonly="readonly"/>
                 <input type="hidden" id="ORG_ID" name="ORG_ID" data-update="db" readonly="readonly"/>
               </div>
             </div>
           </form>    
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="detail_ui" data-inserturl="group/insertL.do" data-refresh="sub_refresh" data-func="$().setParam();">Assign</button>
        </div>    
      </div>
      <!-- 工作组明细新增区域 end -->         
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="GROUP_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end --> 
    </div>
    <script>
    	$(function() {
    		//设置拖拽
            $('#ui').draggable({ handle: '.title'});
    		$('#detail').draggable({ handle: '.title'});
    		$('#detail_ui').draggable({ handle: '.title'});
    		$('#query').draggable({ handle: '.title'});
    		
    		//设置新增更新菜单明细tab分栏        
            $('.detail_ui_tabs').tabs();           
    		
    		//初始化CRUD和LOV条件查询
    		$().crudListener();	
    		$().revealListener();
    		
    		$.fn.beforeInsert = function(){
                RegExpValidate('^\\w+$','GROUP_CODE','regExpError("工作组编码格式不符合规范!");');
                RegExpValidate('^[\u4e00-\u9fa5]{0,}$','GROUP_NAME','regExpError("工作组名称必须为汉字!");');
            }       		
    		
    		$.fn.setParam = function(){
    		    groupId=$('#GROUP_ID_D').val();
    		    param=param+'&GROUP_ID='+groupId;
    		}   		
    		
    		$.fn.detailShow = function(){
    		    $('.show_detail').off('click');
    		    $('.show_detail').on('click',function(){
    		        width='-'+parseInt($('#detail').css('width'))/2+'px';
                    $('#detail').css('margin-left',width);            // 2017/8/1   sun
    		        tr=$(this).parent().parent();
    		        groupId=tr.children('.GROUP_ID').text();
    		    	groupName=tr.children('.GROUP_NAME').text();
    		    	groupCode=tr.children('.GROUP_CODE').text();
    		    	$('.detail_header input').val('');
    		    	$('#sub_table input[data-type="number"]').val('1');
    		    	$('#GROUP_ID_D').val(groupId);
    		    	$('#GROUP_NAME_D').val(groupName);
    		    	$('#GROUP_CODE_D').val(groupCode);
    		    	$('#sub_refresh').click();
    		    });    		   
    		} 	
    	});

    	jQuery.json={
        	getContent:function(data,JSONtype){  
        	    if(JSONtype=='table'){
        	    	var mapRowArray=[
                    ['.GROUP_ID','GROUP_ID']
                   ,['.GROUP_CODE','GROUP_CODE']
                   ,['.GROUP_NAME','GROUP_NAME']
                   ,['.DESCRIPTION','DESCRIPTION']
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                	$().crudListener();
                	$().detailShow();
                	$().revealListener();
        	    }else if(JSONtype=='subtable'){
        	        var mapRowArray=[
        	        ['.GROUP_SEQUENCE','GROUP_SEQUENCE']
                   ,['.SUB_GROUP_NAME','SUB_GROUP_NAME']
                   ,['.ORG_NAME','ORG_NAME']
                   ,['.PARTY_NAME','PARTY_NAME']
                   ,['.ACCOUNT_NUMBER','ACCOUNT_NUMBER']
                   ,['.ACCOUNT_NAME','ACCOUNT_NAME']
        	    	];
        	    	$().mapContentJson(data,'#sub-table',mapRowArray);
        	    	width='-'+parseInt($('#detail').css('width'))/2+'px';
			        $('#detail').css('margin-left',width); 
			        $().afterRowDefine();
        	        $().crudListener();
                	$().revealListener(); 
        	    }else if(JSONtype=='group'){
        	    	var mapRowArray=[
        	    	    'GROUP_ID'
        	    	   ,'GROUP_CODE'
        	    	   ,'GROUP_NAME'
        	    	   ,'DESCRIPTION'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='cust'){
        	        var mapRowArray=[
        	    	    'ORG_ID'
        	         	,'ORG_NAME'
        	    	    ,'ACT_ID'
        	    	    ,'PARTY_NAME'
        	    	    ,'ACCOUNT_NUMBER'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }   
        	},getUpdateJSON:function(data){  
                if(pageframe=='ui'){ 
                    var mapRowArray=[
                    ['#GROUP_ID','GROUP_ID']
                   ,['#GROUP_CODE','GROUP_CODE'] 
                   ,['#GROUP_NAME','GROUP_NAME']
                   ,['#DESC','DESCRIPTION']
                    ];
                    $().mapUpdateJson(data,mapRowArray);    
                }         
            },getMSG:function(data){
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
