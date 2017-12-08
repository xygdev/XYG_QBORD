<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Contract Manage</title>
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
		.EN_DESC{
		    width:110px;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		}
		.EN_DESC P{
		    color:black;
			background:#C0C0C0;
			position:absolute;
			margin-top:-25px;
			height:31px;
			line-height:31px;
			font-weight:bold;
			border-right:1px solid #ccc;
			display:none;
		}
        .detail_frame .detail_table{height:355px;overflow:auto;}
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
        <table id="main-table" data-table="OrderHeader">
          <tr>
            <th class="CONTRACT_NUMBER" data-column="db">Contract No</th>
            <th class="PARTY_NAME" data-column="db">Customer</th>
            <th class="ACCOUNT_NUMBER" data-column="db">Account No</th>
            <th class="SALES_ORG_NAME" data-column="db">Sales OU</th> 
            <th class="SHIP_FROM_ORG_NAME" data-column="db">Ship Inv</th> 
            <th class="CURR_CODE" data-column="db">Currency</th>
            <th class="PRICE_LIST_NAME" data-column="db">Price List</th>
            <th class="ORDER_TYPE_NAME" data-column="db">Order Type</th>
            <th class="STATUS_DESC" data-column="normal">Status</th>
            <th class="CREATION_DATE" data-column="db">Creation Date</th>
            <th class="CREATED_USER_DESC" data-column="db">Created By</th>
            <th class="STATUS_BOOK_DATE" data-column="db">Book Date</th>
            <th class="STATUS_RECEIVE_DATE" data-column="db">Receive Date</th>
            <th class="STATUS_CHECK_DATE" data-column="db">Check Date</th>
            <th class="STATUS_CONFIRM_DATE" data-column="db">Confirm Date</th>
            <th class="CUSTOMER_PO" data-column="db">Cust PO</th>
            <th class="REMARKS" data-column="db">Remarks</th>
            <th class="ACTION" data-column="normal">Action</th> 
            <th class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</th>    
            <th class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</th>   
            <th class="STATUS" style="display:none" data-column="hidden">&nbsp;</th>   
          </tr>
          <tr>
            <td class="CONTRACT_NUMBER" data-column="db"></td>
            <td class="PARTY_NAME" data-column="db"></td>
            <td class="ACCOUNT_NUMBER" data-column="db"></td>
            <td class="SALES_ORG_NAME" data-column="db"></td> 
            <td class="SHIP_FROM_ORG_NAME" data-column="db"></td> 
            <td class="CURR_CODE" data-column="db"></td>
            <td class="PRICE_LIST_NAME" data-column="db"></td>
            <td class="ORDER_TYPE_NAME" data-column="db"></td>
            <td class="STATUS_DESC" data-column="db"></td>
            <td class="CREATION_DATE" data-column="db"></td>
            <td class="CREATED_USER_DESC" data-column="db"></td>
            <td class="STATUS_BOOK_DATE" data-column="db"></td>
            <td class="STATUS_RECEIVE_DATE" data-column="db"></td>
            <td class="STATUS_CHECK_DATE" data-column="db"></td>
            <td class="STATUS_CONFIRM_DATE" data-column="db"></td>
            <td class="CUSTOMER_PO" data-column="db"></td>
            <td class="REMARKS" data-column="db"></td>
            <td class="ACTION" data-column="normal">
              <i class="fa fa-pencil fa-fw update pointer hidden" title="Modify Contract" data-show="true" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="contract/preUpdateH.do" data-type="update" data-func="$().beforePreUpdateH()" data-updateparam=["HEADER_ID",".HEADER_ID"]></i>            
              <i class="fa fa fa-eye view pointer show_detail hidden" title="Contract Detail" data-show="true" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame" data-dblclick="true"></i>
              <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="Delete" data-refresh="refresh"  data-col="CONTRACT_NUMBER" data-crudtype="del" data-delurl="contract/deleteH.do" data-delmsg="是否删除合同号：" data-delparam=["HEADER_ID",".HEADER_ID"] ></i>
            </td>
            <td class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</td>
            <td class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</td>
            <td class="STATUS" style="display:none" data-column="hidden">&nbsp;</td>       
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="OrderHeader">
        <div class="setting">
          <i class="fa fa-cog pointer" title="Table Setting" data-reveal-id="setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" title="Conditional Query" data-reveal-id="query" data-key="true" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus-circle pointer" title="Creat Contract" data-reveal-id="ui" data-key="true"  data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().beforePreInsertH();"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="Refresh Data" data-pagetype="refresh" data-pageframe="table"></i>
        </div>  
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
            <jsp:param name="alias" value="XQCH" />
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
          <input type="hidden" data-type="number" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="HEADER_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="contract/getContractH.do"/>
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
     
      <!-- 更新/新增菜单区域 start -->
      <div id="ui" class="pop_frame row-6">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;Update Contract</span>
          <span data-type="insert"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;Creat Contract</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-6">
          <form>
            <input type="hidden" id="HEADER_ID" name="HEADER_ID" data-update="db"/>
            <label for="CONTRACT_NUMBER" class="left md">Contract:</label>
            <input type="text" data-update="db" class="left lgx2" id="CONTRACT_NUMBER" name="CONTRACT_NUMBER" readonly="readonly" placeholder="合同号由系统自动生成"/>
            <br style="clear:both"/> 
            <label for="PARTY_NAME" class="left md">Customer:</label> 
            <input type="text" required="required" id="PARTY_NAME" name="PARTY_NAME" data-update="db" class="left lglov" readonly="readonly"/>
            <input type="hidden" id="CUSTOMER_ID" name="CUSTOMER_ID" data-update="db"/>
            <input type="button" id="PARTY_NAME_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Customer Query" data-queryurl="lov/getUserCustPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","Sales&nbsp;OU","客户ID","Customer","Account"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME&text-left","ACCOUNT_NUMBER"] data-selectname=["Customer","Account"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID","#ORG_NAME","#CUSTOMER_ID","#PARTY_NAME"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME" class="left md">Sales OU:</label> 
            <input type="text" required="required" data-update="db" id="ORG_NAME" name="ORG_NAME" data-update="db" class="left lg" readonly="readonly" />
            <input type="hidden" id="ORG_ID" name="SALES_ORG_ID" data-update="db" readonly="readonly"/>
            <label for="ORGANIZATION_NAME" class="left md">Ship Inv:</label> 
            <input type="text" required="required" data-update="db" id="ORGANIZATION_NAME" name="ORGANIZATION_NAME" class="left md"  data-modify="true" data-pageframe="query"  data-lovbtn="ORGANIZATION_LOV" data-param="ORGANIZATION_NAME" />
            <input type="hidden" data-update="db" id="ORGANIZATION_ID" name="SHIP_FROM_ORG_ID"/>
            <input type="button" id="ORGANIZATION_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Inv Query" data-queryurl="lov/getOrganizationForContr.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","Code","Inv"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["Inve","Code"] data-selectvalue=["ORGANIZATION_NAME","ORGANIZATION_CODE"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID","#ORGANIZATION_NAME"] value="···"/>         
            <br style="clear:both"/>
            <label for="ORDER_TYPE_ID" class="left md none">OrderType:</label>
            <select class="left lgx2 none" id="ORDER_TYPE_ID" name="ORDER_TYPE_ID" data-update="db" data-notnull="true" data-listurl="list/getOrderType.do" data-extparam=["CURR_CODE"] data-extparamid=["#CURR_CODE"]></select> 
            <label for="CUSTOMER_PO" class="left md">Cust PO:</label>
            <input type="text" data-update="db" class="left lg" id="CUSTOMER_PO" name="CUSTOMER_PO"/>
            <label for="CURR_CODE" class="left md">Currency:</label>
            <select class="left lg" id="CURR_CODE" name="CURR_CODE" data-notnull="true" data-default="CNY" data-listurl="list/getCurrency.do"></select>
            <br style="clear:both"/>
            <label for="REMARKS" class="left md">Remarks:</label>
            <input type="text" data-update="db" class="left lgx2" id="REMARKS" name="REMARKS"/>
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="contract/updateH.do">Update</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="contract/insertH.do">Creat</button>
        </div>    
      </div> 
      <!-- 更新/新增菜单区域 end -->
     
      <!-- 条件查询区域 start -->
      <div id="query" class="pop_frame row-5">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;Contract</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-5">
          <form>
            <label for="CONTRACT_NUMBER_Q" class="left md">Contract:</label>
            <input type="text" class="left lgx2" id="CONTRACT_NUMBER_Q" name="CONTRACT_NUMBER"/>  
            <br style="clear:both"/>
            <label for="PARTY_NAME_Q" class="left md">Customer:</label> 
            <input type="text" id="PARTY_NAME_Q" name="PARTY_NAME" class="left lglov" readonly="readonly"/>
            <input type="hidden" id="CUSTOMER_ID_Q" name="CUSTOMER_ID" />
            <input type="button" id="PARTY_NAME_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Customer Query" data-queryurl="lov/getUserCustPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","Sales&nbsp;OU","客户ID","Customer","Account"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME&text-left","ACCOUNT_NUMBER"] data-selectname=["Customer","Account"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID_Q","#ORG_NAME_Q","#CUSTOMER_ID_Q","#PARTY_NAME_Q"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME_Q" class="left md">Sales OU:</label> 
            <input type="text" id="ORG_NAME_Q" name="ORG_NAME" class="left lg" readonly="readonly" />
            <input type="hidden" id="ORG_ID_Q" name="ORG_ID" readonly="readonly"/>
            <label for="ORGANIZATION_NAME_Q" class="left md">Ship Inv:</label> 
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left md"  data-modify="true" data-pageframe="query"  data-lovbtn="ORGANIZATION_LOV_Q"  data-param="ORGANIZATION_NAME" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Inv Query" data-queryurl="lov/getOrganizationForContr.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","Code","Inv"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["Inv","Code"] data-selectvalue=["ORGANIZATION_NAME","ORGANIZATION_CODE"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_NAME_Q"] value="···"/>         
            <br style="clear:both"/>
            <label for="CREATION_DATE_F" class="left md">Creation:</label>
            <input type="text" id="CREATION_DATE_F" name="CREATION_DATE_F" class="left time" data-datatype="date" placeholder="Creation Date From"/>
            <label class="left blank"></label>
            <input type="text" id="CREATION_DATE_T" name="CREATION_DATE_T" class="left time" data-datatype="date" placeholder="Creation Date To"/>
            <br style="clear:both"/>
            <label for="STATUS_Q" class="left md">Status:</label>
            <select class="left lg" id="STATUS_Q" name="STATUS" data-notnull="false" data-listurl="list/getContractStatus.do"></select>  
            <br style="clear:both"/>
          </form>
        </div>
        <div class="foot">             
          <button class="right pointer" data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
        </div> 
      </div>
      <!-- 条件查询区域 end -->
      
      <!-- 维护订单类型区域 start -->
      <div id="update_ot" class="pop_frame row-2" style="z-index:104">
        <div class="title pointer">      
          <span><i class="fa fa-file-text"></i>&nbsp;Order Type</span>
        </div>
        <a class="close-ot-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <input type="hidden" id="HEADER_ID_UOT" name="HEADER_ID"/>
            <input type="hidden" id="CURR_CODE_UOT" name="CURR_CODE"/>
            <label for="ORDER_TYPE_ID_UOT" class="left md">OrderType:</label>
            <select class="left lgx2" id="ORDER_TYPE_ID_UOT" name="ORDER_TYPE_ID" data-notnull="true" data-listurl="list/getOrderType.do" data-extparam=["CURR_CODE"] data-extparamid=["#CURR_CODE_UOT"]></select> 
          </form>
        </div>
        <div class="foot">             
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="update_ot" data-updateurl="contract/updateOT.do">Commit</button>
        </div> 
      </div>
      <!-- 维护订单类型区域 end  -->
   
<!----------------------------------------------订单明细-------------------------------------------------------- -->      
      
      <div class="detail_frame" id="detail" style="width:100%;">
        <div class="title pointer">      
          <span><i class="fa fa-th-list"></i>&nbsp;Contract Detail</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>    
        <div class="line"></div>             
        <div class="detail_header" style="height:146px">
          <input type="hidden" id="HEADER_ID_L" />
          <label class="mid" for="CONTRACT_NUMBER_L">Contract</label>
          <input type="text" id="CONTRACT_NUMBER_L" class="long" readonly="readonly"/>
          <label class="mid" for="STATUS_DESC_L">Status</label>
          <input type="text" id="STATUS_DESC_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <input type="hidden" id="SALES_ORG_ID_L"/>
          <label class="mid" for="PARTY_NAME_L">Customer</label>
          <input type="text" id="PARTY_NAME_L" class="long" readonly="readonly"/>
          <input type="hidden" id="CUSTOMER_ID_L"/>
          <label class="mid" for="CUSTOMER_PO_L">Cust PO</label>
          <input type="text" id="CUSTOMER_PO_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <label class="mid" for="SHIP_FROM_ORG_NAME_L">Ship Inv</label>
          <input type="text" id="SHIP_FROM_ORG_NAME_L" class="long" readonly="readonly"/>
          <label class="mid" for="CURR_CODE_L">Currency</label>
          <input type="text" id="CURR_CODE_L" class="long" readonly="readonly"/>
          <input type="hidden" id="SHIP_FROM_ORG_ID_L"/>
          <input type="hidden" id="ORG_ID_L"/>
          <input type="hidden" id="PRICE_LIST_ID_L"/>
          <br style="clear:both"/>
          <label class="mid" for="TOTAL_QUANTITY_L">Qty</label>
          <input type="text" id="TOTAL_QUANTITY_L" class="long" readonly="readonly"/>
          <label class="mid" for="TOTAL_PRICE_L">Price</label>
          <input type="text" id="TOTAL_PRICE_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
        </div>     
        <!-- 订单明细表格区域 start -->
        <div class="detail_table">
          <table id="oLine" data-table="OrderLine">
            <tr>   
              <th class="LINE_NUM" data-column="db" style="min-width:50px">Seq</th>
              <th class="DESCRIPTION" data-column="db">Item</th>
              <th class="CARNAME" data-column="db">CN Desc</th>
              <th class="EN_DESC" data-column="db">EN Desc</th>
              <th class="SPEC" data-column="db" style="min-width:50px">Spec</th>
              <th class="BEVEL" data-column="db" style="min-width:80px">Bevel</th>
              <th class="UNIT_PRICE" data-column="db" style="min-width:50px">Unit Price</th>
              <th class="ORDER_QUANTITY" data-column="db" style="min-width:50px">Order Qty</th>
              <th class="LINE_PRICE" data-column="db" style="min-width:50px">Line Price</th>
              <th class="REMARKS" data-column="db" style="min-width:30px">Remarks</th>  
              <th class="ACTION" data-column="normal">Action</th> 
              <th class="LINE_ID" style="display:none" data-column="hidden">&nbsp;</th>            
            </tr>
            <tr class="pointer">
              <td class="LINE_NUM" data-column="db" style="min-width:50px"></td>
              <td class="DESCRIPTION text-left" data-column="db"></td>
              <td class="CARNAME text-left" data-column="db"></td>
              <td class="EN_DESC text-left" data-column="db"></td>
              <td class="SPEC" data-column="db" style="min-width:50px"></td>
              <td class="BEVEL" data-column="db" style="min-width:80px"></td>
              <td class="UNIT_PRICE" data-column="db" style="min-width:50px"></td>
              <td class="ORDER_QUANTITY" data-column="db" style="min-width:50px"></td>
              <td class="LINE_PRICE" data-column="db" style="min-width:50px"></td>
              <td class="REMARKS" data-column="db" style="min-width:30px"></td>
              <td class="ACTION" data-column="normal">
                <i class="fa fa-pencil-square-o fa-fw update pointer hidden" id="change_price_btn" title="modify" data-show="true" data-reveal-id="detail_ui" data-bg="detail-modal-bg" data-key="true" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-update" data-preupdateurl="contract/preUpdateL.do" data-type="update" data-func="$().beforePreUpdateL()" data-updateparam=["LINE_ID",".LINE_ID"] data-dblclick="true"></i>         
                <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="delete" data-refresh="sub_refresh"  data-col="LINE_NUM" data-crudtype="del" data-delurl="contract/deleteL.do" data-delmsg="Delete Line：" data-delparam=["LINE_ID",".LINE_ID"] data-afterdatafunc="$().sumLines();"></i>
              </td>
              <td class="LINE_ID" style="display:none" data-column="hidden">&nbsp;</td>                          
            </tr>
          </table>
        </div>
        <!-- 订单明细表格区域 end --> 
        
        <div class="table_button" id="sub_table" data-table="OrderLine">
          <div class="setting">
            <i class="fa fa-plus-circle pointer" data-key="true"  data-reveal-id="detail_ui" data-bg="detail-modal-bg" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().beforePreInsertL();"></i>
          </div>
          <div class="setting">
            <i id="sub_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="sub_table" data-func="$().setParam();"></i>
          </div>
          <div class="setting">
            <i class="fa fa-upload pointer" title="Book" data-status="BOOK" data-statusdesc="Book"></i>
          </div>
          <div class="setting">
            <i class="fa fa-download pointer" title="Receive" data-status="RECEIVE" data-statusdesc="Receive"></i>
          </div>
          <div class="setting">
            <i class="fa fa-book pointer" title="Check" data-status="CHECK" data-statusdesc="Check"></i>
          </div>
          <div class="setting">
            <i class="fa fa-check-square pointer" title="Confirm" data-status="CONFIRM" data-statusdesc="Confirm"></i>
          </div>
          <div class="setting">
            <i class="fa fa-times pointer" title="Cancel" data-status="CANCEL" data-statusdesc="Cancel"></i>
          </div>
          <div class="setting">
            <i class="fa fa-file-text pointer none" data-reveal-id="update_ot" data-bg="detail-modal-bg" data-key="true"  data-dismissmodalclass="close-ot-frame"  title="Order Type"></i>
          </div>
          <div>
            <jsp:include page="./public/pageArrow.jsp" >
              <jsp:param name="pageframe" value="sub_table" />
              <jsp:param name="func" value="$().setParam()" />
            </jsp:include>
            <input type="hidden" data-type="size" value="20"/>
            <input type="hidden" data-type="displaysize" value="10"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="LINE_NUM"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="contract/getContractL.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
            <input type="hidden" data-type="autoquery" value="N"/> 
          </div>
        </div>
      </div> 
      
      <!-- 订单明细新增区域 start -->
      <div id="detail_ui" class="pop_frame row-5" style="z-index:104">     
        <div class="title pointer">          
          <span data-type="insert"><i class="fa fa-th-list  fa-1x" aria-hidden="true"></i>&nbsp;Creat Detail Line</span>
          <span data-type="update"><i class="fa fa-th-list  fa-1x" aria-hidden="true"></i>&nbsp;Modify</span>
        </div>
        <a class="close-detail-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>  
        <div class="content row-5">   
          <form>
            <input type="hidden" id="LINE_ID_D" name="LINE_ID" data-update="db"/>
            <input type="hidden" id="HEADER_ID_D" name="HEADER_ID"/>
            <input type="hidden" id="CURR_CODE_D" name="CURR_CODE"/>
            <input type="hidden" id="PRICE_LIST_ID_D" name="PRICE_LIST_ID"/>
            <input type="hidden" id="SHIP_FROM_ORG_ID_D" name="SHIP_FROM_ORG_ID"/>
            <label class="left md">Line No</label>
            <input type="text" id="LINE_NUM_D" name="LINE_NUM" class="lg left" readonly="readonly"/>
            <br style="clear:both"/>
            <label for="DESCRIPTION_D" class="md left">Item</label> 
            <input type="text" id="DESCRIPTION_D" name="DESCRIPTION" data-update="db" class="left lglov upper-case" onblur="this.value=this.value.toUpperCase()"" data-suffixflag="true" data-pageframe="detail_ui" required="required" data-modify="true" data-lovbtn="ITEM_LOV"  data-param="DESCRIPTION"/>          
            <input type="hidden" id="INVENTORY_ITEM_ID_D" name="INVENTORY_ITEM_ID" data-update="db"/>
            <input type="button" id="ITEM_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Item Query" data-queryurl="lov/getItemPage.do" data-jsontype="item" data-defaultquery="false" data-extparam=["ORGANIZATION_ID","CUSTOMER_ID","SALES_ORG_ID"] data-extparamid=["#SHIP_FROM_ORG_ID_L","#CUSTOMER_ID_L","#SALES_ORG_ID_L"] data-th=["物料ID","Code","Item","CN&nbsp;Desc"] data-td=["INVENTORY_ITEM_ID&none","ITEM_NUMBER","DESCRIPTION&text-left","CARNAME&text-left"] data-selectname=["Item","CN&nbsp;Desc"] data-selectvalue=["DESCRIPTION","CARNAME"] data-choose=[".INVENTORY_ITEM_ID",".DESCRIPTION",".CARNAME","NONE","NONE"] data-recid=["#INVENTORY_ITEM_ID_D","#DESCRIPTION_D","#CARNAME_D","#ORDER_QUANTITY_D","#UNIT_PRICE_D"] data-func="$().upperCase();" value="···"/> 
            <label for="CARNAME" class="md left">CN Desc</label> 
            <input type="text" id="CARNAME_D" name="CARNAME" data-update="db" class="left lgx2" data-update="db" required="required" readonly="readonly"/> 
          	<br style="clear:both"/>
          	<label for="ORDER_QUANTITY_D" class="md left">Order Qty</label>
          	<input type="text" id="ORDER_QUANTITY_D" name="ORDER_QUANTITY" class="lg left" data-update="db" required="required"/>
          	<label for="UNIT_PRICE_D" class="md left">Unit Price</label>
          	<input type="text" id="UNIT_PRICE_D" name="UNIT_PRICE" class="md left" data-update="db" readonly="readonly" required="required"/>
          	<input type="button" id="PRICE_LIST_BTN" class="left button pointer" data-reveal-id="product_list_d" data-bg="lov-modal-bg" data-dismissmodalclass="close-pl-frame" title="Price List" value="￥"/>
          	<br style="clear:both"/>
          	<label for="REMARKS_D" class="md left">Remarks</label>
          	<input type="text" id="REMARKS_D" name="REMARKS" class="left lgx2" data-update="db"/>
          </form> 
        </div>
        <div class="foot">            
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="detail_ui" data-inserturl="contract/insertL.do" data-afterdatafunc="$().sumLines();" data-refresh="sub_refresh" data-func="$().beforeConfirm();">Insert</button>
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="detail_ui" data-updateurl="contract/updateL.do" data-afterdatafunc="$().sumLines();" data-refresh="sub_refresh" data-func="$().beforeConfirm();">Confirm</button>
        </div>    
      </div>          
      <!-- 订单明细新增/更新区域 end --> 
      
      <!-- 价目表明细区域 start -->
      <div id="product_list_d" class="pop_frame" style="z-index:201">
        <div class="title pointer">      
          <span><i class="fa fa-file-text"></i>&nbsp;Price List</span>
        </div>
        <a class="close-pl-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content" style="padding-bottom:0">
          <div class="pl_header">
            <form>
              <label class="left md" for="REBATE_PRICE">Rebate</label>
              <input type="text" id="REBATE_PRICE" class="lg left" readonly="readonly"/>
              <label class="left md" for="COST_PRICE">Cost</label>
              <input type="text" id="COST_PRICE" class="lg left" readonly="readonly"/>
              <br style="clear:both"/>
              <label class="left md" for="pList">Batch</label>
            </form>
          </div>
          <div class="pl_title" style="padding:2px">
            <table id="pList" data-table="ProductList" style="width:100%">
              <tr>
                <th class="AREA_PRICE" data-column="db">Price</th>
                <th class="GREATE_PRICE" data-column="db">Higher</th>
                <th class="NO_GREAT_PRICE" data-column="db">Lower</th>
              </tr>
              <tr>
                <td class="AREA_PRICE" data-column="db"></td>
                <td class="GREATE_PRICE" data-column="db"></td>
                <td class="NO_GREAT_PRICE" data-column="db"></td>
              </tr>
            </table>
          </div>
        </div>
 
        <div class="table_button" id="3rd_table" data-table="ProductList">
          <div class="setting">
            <i id="3rd_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="3rd_table" data-func="$().setPlParam();"></i>
          </div>
          <div>
            <jsp:include page="./public/pageArrow.jsp" >
              <jsp:param name="pageframe" value="3rd_table" />
              <jsp:param name="func" value="$().setPlParam();" />
            </jsp:include>
            <input type="hidden" data-type="size" value="5"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="LIST_BATCH_NUMBER"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="contract/getProductList.do"/>
            <input type="hidden" data-type="jsontype" value="3rdtable"/> 
            <input type="hidden" data-type="autoquery" value="N"/> 
          </div>   
        </div>
  
      </div>
      <!-- 价目表明细区域 end -->
      
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="CONTRACT_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->         
    </div> 
    
    <script>       
        $(function() {
            
            //设置拖拽
            $('#ui').draggable({ handle: '.title' });
            /* $('#detail').draggable({ handle: '.title' }); */
            $('#detail_ui').draggable({ handle: '.title' });
            $('#query').draggable({ handle: '.title' }); 
            $('#update_ot').draggable({ handle: '.title' }); 
            $('#product_list_d').draggable({ handle: '.title' }); 
            
            //初始化CRUD和LOV条件查询
            $().crudListener(); 
            $().revealListener(); 
            
            //设置价目表查询参数
			$.fn.setPlParam = function(){
                itemId = $('#INVENTORY_ITEM_ID_D').val();
                productListId = $('#PRICE_LIST_ID_L').val();
                param=param+'&ITEM_ID='+itemId+'&PRODUCT_LIST_ID='+productListId;
            }   
            
            //设置订单明细查询参数
            $.fn.setParam = function(){
                headerId=$('#HEADER_ID_L').val();
                param=param+'&HEADER_ID='+headerId;
            }  
			
			//默认查询时间
			$.fn.defaultQueryDate = function(){
			    var sysDate = new Date();
			    var firstDay;
			    firstDay = sysDate.getFullYear()
			              +'-'+(sysDate.getMonth()+1)
			              +'-01 00:00:00';
			    
			    $('#CREATION_DATE_F').val(firstDay);
			    $('#CREATION_DATE_T').val(sysDate.format('yyyy-MM-dd')+' 23:59:59');//modify by bird 2017.08.10  修改默认当前时间的时分秒为23:59:59
			}		
			
			$().defaultQueryDate();
			
			$.fn.beforeConfirm = function(){
                RegExpValidate('^[0-9]*[1-9][0-9]*$','ORDER_QUANTITY_D','$("#ORDER_QUANTITY_D").val("");regExpError("数量必须为正整数!");');
                RegExpValidate('^[0-9]*$','UNIT_PRICE_D','$("#UNIT_PRICE_D").val("");regExpError("单价必须为整数!");');
            }
			
			//汇总订单明细 总数量&总金额
			$.fn.sumLines = function(){
			    var contractNumber = $('#CONTRACT_NUMBER_L').val();
			    param = 'CONTRACT_NUMBER=' + contractNumber;
			    $.ajax({
					type:'post', 
					data:param,
					url:'contract/sumQuantityAndPrice.do',
					dataType:'json',
					success: function (data) {
					    console.log('sum');
					    $('#TOTAL_QUANTITY_L').val(data.rows[0].TOTAL_QUANTITY);
					    $('#TOTAL_PRICE_L').val(data.rows[0].TOTAL_PRICE);
					},
					error: function () {
						layer.msg('获取JSON数据失败');	
						if(window.frameElement != null){
							//console.log("处于一个iframe中");
							$('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
						}
					}
			    });
			}	
			
			$('#ORDER_QUANTITY_D').on('change',function(){
			   var itemId = $('#INVENTORY_ITEM_ID_D').val();
			   if(itemId == null||itemId == ''){
			       $('#ORDER_QUANTITY_D').val('');
			       layer.alert('Please Select An Item Before Entering Order Qty！',{title:'Warning',offset:[150]});
			       return;
			   }
			   var qty = $('#ORDER_QUANTITY_D').val();
			   if(qty == null||qty == ''){
			       $('#UNIT_PRICE_D').val('');
			   }else{
			       RegExpValidate('^[0-9]*[1-9][0-9]*$','ORDER_QUANTITY_D','$("#ORDER_QUANTITY_D").val("");regExpError("数量必须为正整数!");');
			       var orgId = $('#ORG_ID_L').val();
			       var currCode = $('#CURR_CODE_L').val();
			       var priceListId = $('#PRICE_LIST_ID_L').val();
			       var param = 'INVENTORY_ITEM_ID='+itemId+'&ORG_ID='+orgId+'&CURR_CODE='+currCode+'&PRICE_LIST_ID='+priceListId+'&ORDER_QUANTITY='+qty;
			       $.ajax({
					   type:'post', 
					    data:param,
					    url:'contract/getUnitPrice.do',
					    dataType:'json',
					    success: function (data) {
					        if(data.retcode=='0'){
					            $('#UNIT_PRICE_D').val(data.param2);
					        }else{
					            layer.alert('Get Unit Price Failed！Error Msg:'+data.errbuf,{title:'Warning',offset:[150]});
					        }
					    },
						error: function () {
						    layer.msg('Get Json Data Failed!');	
							if(window.frameElement != null){
							    //console.log("处于一个iframe中");
							    $('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
							}
						}
			       });
			   }
			
			}); 
			
			//自动转换大写
			$.fn.upperCase = function(){
				$('option[value="CARNAME"]').off('click');
				$('option[value="DESCRIPTION"]').off('click');
				$('option[value="CARNAME"]').on('click',function(){
					$('#lov input[data-type="query_val"]').removeClass('upper-case');
					$('#lov input[data-type="query_val"]').off('blur');
					$('#lov input[data-type="query_val"]').val('%%');
				});
				$('option[value="DESCRIPTION"]').on('click',function(){
					$('#lov input[data-type="query_val"]').addClass('upper-case');
					$('#lov input[data-type="query_val"]').on('blur',function(){
						this.value=this.value.toUpperCase();
					});
					$('#lov input[data-type="query_val"]').val('');
				});
				$('option[value="DESCRIPTION"]').click();
			}
			
			$.fn.beforePreInsertH = function(){
			    var display = $('#ORDER_TYPE_ID').css('display');
			    if(display!='none'){
			    	$('#ORDER_TYPE_ID').addClass('none');
			    	$('label[for="ORDER_TYPE_ID"]').addClass('none');
			    }
			} 
			
			$.fn.beforePreUpdateH = function(){
			    var userType = '${USER_TYPE}';
			    if(userType=='EMP'){
			    	$('#ORDER_TYPE_ID').removeClass('none');
			    	$('label[for="ORDER_TYPE_ID"]').removeClass('none');
			    	$('#CURR_CODE').attr('disabled','disabled');
			    }
			} 
			
			$.fn.beforePreInsertL = function(){
			    $('#ITEM_LOV').attr('disabled',false);
			    $('#DESCRIPTION_D').removeAttr('readonly');
			    //自动获取行号
				headerId = $('#HEADER_ID_L').val();
                param = 'HEADER_ID='+headerId;
                $.ajax({
                    type:'post', 
                    data:param,
                    url:'contract/getAutoLineNum.do',
                    dataType:'json',
                    success: function (data) {
                        $('#HEADER_ID_D').val(headerId);
                        $('#LINE_NUM_D').val(data.rows[0].LINE_NUM);
                    },
                    error: function () {
                        layer.msg('Get Json Data Failed!');	
						if(window.frameElement != null){
							$('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
						}	
                    }           
                }); 
                $('#CURR_CODE_D').val($('#CURR_CODE_L').val());
                $('#SHIP_FROM_ORG_ID_D').val($('#SHIP_FROM_ORG_ID_L').val());
                $('#PRICE_LIST_ID_D').val($('#PRICE_LIST_ID_L').val());
                //改变readonly状态
                //$('#ORDER_QUANTITY_D').removeAttr('readonly');
				$('#REMARKS_D').removeAttr('readonly');
			}
			
			$.fn.beforePreUpdateL = function(){
				$('#ITEM_LOV').attr('disabled',true);
			    $('#DESCRIPTION_D').attr('readonly','readonly');
			    //$('#ORDER_QUANTITY_D').attr('readonly','readonly');
				$('#REMARKS_D').attr('readonly','readonly');
			}
             
            
            $.fn.detailShow = function(){
                $('.show_detail').off('click');  
                $('.show_detail').on('click',function(){
                    
                    width=$(window).width();
                    height=$(window).height();
                    if(width>=768){
                        headerheight=$('section.content-header').outerHeight();
                        ifmheight=height-headerheight;
                    }else{
                        logoheight=$('a.logo').height();
                        headerheight=$('section.content-header').outerHeight();
                        ifmheight=height-logoheight-headerheight;
                    }
                    var detailTabH = ifmheight-$('#detail').find('.title').outerHeight()-$('#detail').find('.detail_header').outerHeight()-$('#detail').find('#sub_table').outerHeight()-4;
                    //$('#detail').css('height',ifmheight+'px');
                    $('.detail_table').css('min-height',detailTabH);
                    $('#detail').css({'height':ifmheight+'px','top':'0','margin-left':'-50%'});
                    
                    window.onresize=function(){
                        width=$(window).width();
                        height=$(window).height();
                        if(width>=768){
                            headerheight=$('section.content-header').outerHeight();
                            ifmheight=height-headerheight;
                        }else{
                            logoheight=$('a.logo').height();
                            headerheight=$('section.content-header').outerHeight();
                            ifmheight=height-logoheight-headerheight;
                        }
                        var detailTabH = ifmheight-$('#detail').find('.title').outerHeight()-$('#detail').find('.detail_header').outerHeight()-$('#detail').find('#sub_table').outerHeight()-4;
                        $('#detail').css({'height':ifmheight+'px','top':'0','margin-left':'-50%'});
                        $('.detail_table').css('min-height',detailTabH);

                    }
                    
                    var width='-'+parseInt($('#detail').css('width'))/2+'px';
                    //$('#detail').css({'margin-left':width,'top':'0'}); //add by Bird   2017.08.21
                    var userType = '${USER_TYPE}';
                    var tr=$(this).parent().parent();
                    var status = tr.children('.STATUS').text(); 
                    $('#ORDER_QUANTITY_D').attr('readonly','readonly');
                    $('#UNIT_PRICE_D').attr('readonly','readonly');
			    	if(userType=='EMP'){    
			    	    $('i[data-reveal-id="detail_ui"]').parent('.setting').css('display','none');
			    	    $('i[data-status="RECEIVE"]').parent().css('display','');
			    	    $('i[data-status="CHECK"]').parent().css('display','');
			    	    if(status=='BOOK'){
			    	        $('i[data-status="CHECK"]').parent().css('display','none');
			    	    }else if(status=='RECEIVE'){
			    	        $('i[data-reveal-id="detail_ui"]').parent('.setting').css('display','');
			    	        $('i[data-status="RECEIVE"]').parent().css('display','none');
			    	        $('#ORDER_QUANTITY_D').removeAttr('readonly');
			    	        $('#UNIT_PRICE_D').removeAttr('readonly');
			    	    }else{
			    	        $('i[data-status="RECEIVE"]').parent().css('display','none');
			    	        $('i[data-status="CHECK"]').parent().css('display','none');
			    	    }
			    		$('i[data-status="BOOK"]').parent().css('display','none');
			    		$('i[data-status="CONFIRM"]').parent().css('display','none');
			    	}else if(userType='CUSTOMER'){
			    	    $('i[data-reveal-id="detail_ui"]').parent('.setting').css('display','none');
			    	    $('i[data-status="BOOK"]').parent().css('display','');
			    		$('i[data-status="CONFIRM"]').parent().css('display','');
			    	    if(status=='INPUT'){
			    	        $('i[data-status="CONFIRM"]').parent().css('display','none');
			    	        $('i[data-reveal-id="detail_ui"]').parent('.setting').css('display','');
			    	        $('#ORDER_QUANTITY_D').removeAttr('readonly');
			    	    }else if(status=='CHECK'){
			    	        $('i[data-status="BOOK"]').parent().css('display','none');
			    	    }else{
			    	        $('i[data-status="BOOK"]').parent().css('display','none');
			    		    $('i[data-status="CONFIRM"]').parent().css('display','none');
			    	    }
			    	    $('i[data-status="RECEIVE"]').parent().css('display','none');
			    	    $('i[data-status="CHECK"]').parent().css('display','none');
			    	    //$('#change_price_btn').css('display','none');
			    	}
                    $('.detail_header input').val('');
                    $('#sub_table input[data-type="number"]').val('1');
                    $('#CONTRACT_NUMBER_L').val(tr.children('.CONTRACT_NUMBER').text());
                    $('#PARTY_NAME_L').val(tr.children('.PARTY_NAME').text());
                    $('#HEADER_ID_L').val(tr.children('.HEADER_ID').text());
                    $('#CUSTOMER_ID_L').val(tr.children('.CUSTOMER_ID').text());
                    $('#SALES_ORG_ID_L').val(tr.children('.SALES_ORG_ID').text());
                    $('#CURR_CODE_L').val(tr.children('.CURR_CODE').text());
                    $('#SHIP_FROM_ORG_ID_L').val(tr.children('.SHIP_FROM_ORG_ID').text());
                    $('#SHIP_FROM_ORG_NAME_L').val(tr.children('.SHIP_FROM_ORG_NAME').text());
                    $('#ORG_ID_L').val(tr.children('.ORG_ID').text());
                    $('#CUSTOMER_PO_L').val(tr.children('.CUSTOMER_PO').text());
                    $('#PRICE_LIST_ID_L').val(tr.children('.PRICE_LIST_ID').text());
                    $('#STATUS_DESC_L').val(tr.children('.STATUS_DESC').text());
                    $().sumLines();
                    $('#sub_refresh').click();
                });   
            }   
            
            //改变订单状态
            $.fn.changeStatus = function(new_status,header_id,status_desc) {
                param = 'HEADER_ID='+header_id+'&NEW_STATUS='+new_status;
       		    $.ajax({
                    type:'post', 
                    data:param,
                    url:'contract/changeStatus.do',
                    dataType:'json',
                    success: function (data) {
                        if(data.retcode=='0'){
				    		layer.msg(status_desc+' Succeed!');
				    		$('#STATUS_DESC_L').val(status_desc);
				    		$('i[data-status]:not(i[data-status="CANCEL"])').parent().css('display','none');
				    		if(new_status=='RECEIVE'){
				    		    $('i[data-status="CHECK"]').parent().css('display','');
				    		}
				    		//$('#'+options.pageframe+' a[data-type="close"]').click();/****点击关闭更新框按钮****/
				    		$('#refresh').click();/****点击刷新当前页按钮，刷新数据****/
				    	}else{
				    	    if(new_status=='RECEIVE'){
				    	        if(data.errbuf == '请先维护好订单类型，再审核'){
				    	            layer.alert(status_desc+' Failed！Error Msg:'+data.errbuf
				    	                   ,{title:'Warning',offset:[150],btn:['Update Order Type','Cancel'] }
				    	                   ,function(){
				    	                       $('[data-reveal-id="update_ot"]').click();
				    	                       layer.closeAll('dialog');
				    	                   }
				    	            );
				    	        }else{
				    	            layer.alert(status_desc+' Failed！Error Msg:'+data.errbuf,{title:'Warning',offset:[150]});
				    	        }	    	        
				    	    }else{
				    	        layer.alert(status_desc+' Failed！Error Msg:'+data.errbuf,{title:'Warning',offset:[150]});
				    	    }	
				    	}
                    },
                    error: function () {
                        layer.msg('Get Json Data Failed');	
						if(window.frameElement != null){
							$('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
						}	
                    }           
                }); 
            }
            
       		//改变订单状态按钮事件
       		$('i[data-status]').on('click',function(){
       		    var new_status = $(this).data('status');
       		    var header_id = $('#HEADER_ID_L').val();
       		    var status_desc = $(this).data('statusdesc');
       		    layer.alert('Do You Want To '+status_desc+' This Contract?'
				    ,{title:'Warning',offset:[150],btn:['Yea','No'] }
				    ,function(){
				    	layer.closeAll('dialog');
				    	$().changeStatus(new_status,header_id,status_desc);
				    }
				    ,function(){
				    	return;
				    }
				);   		    
       		});
       		
       		//修改订单类型
       		$('[data-reveal-id="update_ot"]').click('on',function(){
       		    $('#HEADER_ID_UOT').val($('#HEADER_ID_L').val());
       		    $('#CURR_CODE_UOT').val($('#CURR_CODE_L').val());
       		    $('#ORDER_TYPE_ID_UOT').val('');
       		    $().listRef();
       		});
       		
       		//价目表明细
       		$('[data-reveal-id="product_list_d"]').click('on',function(){
       		    $('#REBATE_PRICE').val('');
                $('#COST_PRICE').val('');
       		    var itemId = $('#INVENTORY_ITEM_ID_D').val(); 
       		    if(itemId==null||itemId==''){
       		        layer.msg('需先选择产品，才能查看价目表');
       		    }
       		    var productListId = $('#PRICE_LIST_ID_L').val();       
                param='ITEM_ID='+itemId+'&PRODUCT_LIST_ID='+productListId;
                $.ajax({
                    type:'post', 
                    data:param,
                    url:'contract/getStandardPrice.do',
                    dataType:'json',
                    success: function (data) {
                        $('#REBATE_PRICE').val(data.rows[0].REBATE_PRICE);
                    	var userType = '${USER_TYPE}';
                    	if(userType == 'EMP'){	
                        	$('#COST_PRICE').val(data.rows[0].COST_PRICE);
                    	}else if(userType == 'CUSTOMER'){
                    		$('#COST_PRICE').val('无');
                    	} 
                    },
                    error: function () {
                        layer.msg('获取JSON数据失败');	
						if(window.frameElement != null){
							$('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
						}	
                    }           
                });
       		    $('#3rd_refresh').click();
       		});
       		
       		//日期选择
            $('input[data-datatype="date"]').datetimepicker({
                lang:'ch',           //语言选择中文
                timepicker:true,    //启用时间选项
                format:'Y-m-d H:i:s',      //格式化日期
                step: 30,
                showOnClick: true
            });
            
            //明细表固定表头
            var tableCont = document.getElementsByClassName('detail_table')[0];
            function scrollHandle (e){
                var scrollTop = this.scrollTop;
                //console.log('scrollTop'+scrollTop);
                $('#oLine').css('border-collapse','inherit');
                $('.detail_table').find('th').css({'transform':'translateY('+scrollTop+'px)','z-index':'102'});
            }
            tableCont.addEventListener('scroll',scrollHandle);   
            
            //处理tab切换 导致的th错乱问题
			var tabfunc = $('iframe:visible',parent.document).data(tabfunc).tabfunc;
            $('a[data-tabfunc="'+tabfunc+'"]',parent.document).on('click',function(){
            	var scrollTop =document.getElementsByClassName('detail_table')[0].scrollTop;
            	$('.detail_table').find('th').css({'transform':'translateY('+scrollTop+'px)','z-index':'102'});
            });   
        });
         
        jQuery.json={
            getContent:function(data,JSONtype){    
                if(JSONtype=='table'){
                      var mapRowArray=[
	                  ['.HEADER_ID','HEADER_ID']    
	                 ,['.CONTRACT_NUMBER','CONTRACT_NUMBER']
	                 ,['.PARTY_NAME','PARTY_NAME']   
	                 ,['.ACCOUNT_NUMBER','ACCOUNT_NUMBER']   
	                 ,['.CUSTOMER_ID','CUSTOMER_ID']   
	                 ,['.SALES_ORG_ID','SALES_ORG_ID']   
	                 ,['.SALES_ORG_NAME','SALES_ORG_NAME']
	                 ,['.SHIP_FROM_ORG_ID','SHIP_FROM_ORG_ID']
	                 ,['.ORG_ID','ORG_ID']
	                 ,['.SHIP_FROM_ORG_NAME','SHIP_FROM_ORG_NAME']
	                 ,['.CURR_CODE','CURR_CODE']
	                 ,['.PRICE_LIST_ID','PRICE_LIST_ID']
	                 ,['.PRICE_LIST_NAME','PRICE_LIST_NAME']
	                 ,['.ORDER_TYPE_NAME','ORDER_TYPE_NAME']
	                 ,['.STATUS','STATUS']
	                 ,['.STATUS_DESC','STATUS_DESC']
	                 ,['.CREATION_DATE','CREATION_DATE']
	                 ,['.CREATED_USER_DESC','CREATED_USER_DESC']
	                 ,['.STATUS_BOOK_DATE','STATUS_BOOK_DATE']
	                 ,['.STATUS_RECEIVE_DATE','STATUS_RECEIVE_DATE']
	                 ,['.STATUS_CHECK_DATE','STATUS_CHECK_DATE']
	                 ,['.STATUS_CONFIRM_DATE','STATUS_CONFIRM_DATE']
	                 ,['.CUSTOMER_PO','CUSTOMER_PO']
	                 ,['.REMARKS','REMARKS']
	                  ];
	                 $().mapContentJson(data,'#main-table',mapRowArray);
	                 $().afterRowDefine();
                     $().crudListener();
                     $().detailShow();  
                     $().revealListener(); 
                }else if(JSONtype=='subtable'){            
                     var mapRowArray=[
                     ['.LINE_NUM','LINE_NUM']
                    ,['.DESCRIPTION','DESCRIPTION']
                    ,['.CARNAME','CARNAME']
                    ,['.EN_DESC','EN_DESC',
                        function(){
                            if(data.rows[i].EN_DESC == ''){
                                null;
                            }else{
                                $('#oLine').find('tr:eq('+(i+1)+')').find('.EN_DESC').html('<div class="EN_DESC">'+data.rows[i].EN_DESC+'</div><p>'+data.rows[i].EN_DESC+'</p>');
                                $('#oLine').find('tr:eq('+(i+1)+')').find('.EN_DESC').hover(function(){
                                    $(this).children('p').css('display','block')
                                },function(){
                                    $(this).children('p').css('display','none')
                                });
                            }
                        }
                     ]
                    ,['.SPEC','SPEC']
                    ,['.BEVEL','BEVEL']
                    ,['.UNIT_PRICE','UNIT_PRICE']                 
                    ,['.ORDER_QUANTITY','ORDER_QUANTITY']
                    ,['.LINE_PRICE','LINE_PRICE']
                    ,['.REMARKS','REMARKS']
                    ,['.LINE_ID','LINE_ID']
                     ];
                    $().mapContentJson(data,'#oLine',mapRowArray);
                    //width='-'+parseInt($('#detail').css('width'))/2+'px';
                    //$('#detail').css('margin-left',width); 
                    $().crudListener();             
                    $().revealListener();                    
                    
                }else if(JSONtype=='3rdtable'){            
                     var mapRowArray=[
                     ['.AREA_PRICE','AREA_PRICE']
                    ,['.GREATE_PRICE','GREATE_PRICE']
                    ,['.NO_GREAT_PRICE','NO_GREAT_PRICE']
                     ];
                    $().mapContentJson(data,'#pList',mapRowArray);
                   // width='-'+parseInt($('#detail').css('width'))/2+'px';
                   //$('#detail').css('margin-left',width); 
                   //$().crudListener();             
                   //$().revealListener();                         
                }else if(JSONtype=='organ'){
                    var mapRowArray=[
                       'ORGANIZATION_ID'
                      ,'ORGANIZATION_CODE'
                      ,'ORGANIZATION_NAME'
                    ];
                    $().mapContentJson(data,'.contentbox',mapRowArray);                     
                }else if(JSONtype=='cust'){
        	        var mapRowArray=[
        	    	 'ORG_ID'
        	    	,'ORG_NAME'
        	    	,'CUST_ACCOUNT_ID'
        	    	,'PARTY_NAME'
        	    	,'ACCOUNT_NUMBER'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='item'){
        	        var mapRowArray=[
        	    	 'INVENTORY_ITEM_ID'
        	    	,'ITEM_NUMBER'
        	    	,'DESCRIPTION'
        	    	,'CARNAME'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }                              
            },  
            getUpdateJSON:function(data,pageframe){   
                if(pageframe=='ui'){         
                    var mapRowArray=[
                      ['#HEADER_ID','HEADER_ID']    
                     ,['#CONTRACT_NUMBER','CONTRACT_NUMBER']
                     ,['#PARTY_NAME','PARTY_NAME']   
                     ,['#CUSTOMER_ID','CUSTOMER_ID']
                     ,['#ORG_ID','SALES_ORG_ID']
                     ,['#ORG_NAME','SALES_ORG_NAME']
                     ,['#ORGANIZATION_ID','SHIP_FROM_ORG_ID']
                     ,['#ORGANIZATION_NAME','SHIP_FROM_ORG_NAME']
                     ,['#ORDER_TYPE_ID','ORDER_TYPE_ID']
                     ,['#CUSTOMER_PO','CUSTOMER_PO']
                     ,['#CURR_CODE','CURR_CODE']
                     ,['#REMARKS','REMARKS']
                     ];
                    $().mapUpdateJson(data,mapRowArray);
                    $().listRef();
                }else if(pageframe=='detail_ui'){
                    var mapRowArray=[
                      ['#LINE_ID_D','LINE_ID']    
                     ,['#LINE_NUM_D','LINE_NUM']
                     ,['#DESCRIPTION_D','DESCRIPTION']   
                     ,['#CARNAME_D','CARNAME']
                     ,['#INVENTORY_ITEM_ID_D','INVENTORY_ITEM_ID']
                     ,['#ORDER_QUANTITY_D','ORDER_QUANTITY']
                     ,['#UNIT_PRICE_D','UNIT_PRICE']
                     ,['#REMARKS_D','REMARKS']
                     ];
                    $().mapUpdateJson(data,mapRowArray);
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