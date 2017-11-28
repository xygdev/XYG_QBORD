<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>客户管理</title>
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
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="User">
          <tr>
            <th class="USER_NAME" data-column="db">用户账号</th>
            <th class="DESCRIPTION" data-column="db">用户名称</th>
     	    <th class="START_DATE" data-column="db">启用日期</th>
     	    <th class="END_DATE" data-column="db">失效日期</th>
     	    <th class="USER_TYPE" data-column="db">用户类别</th>
     	    <th class="WECHAT_CODE" data-column="db">微信</th>
     	    <th class="MOBILE_NUMBER" data-column="db">手机号</th>
     	    <th class="EMAIL_ADDR" data-column="db">邮箱地址</th>
     	    <th class="ACTION" data-column="normal">操作</th> 
     	    <th class="USER_ID" style="display:none" data-column="hidden">&nbsp;</th>
     	  </tr>
     	  <tr>
     	    <td class="USER_NAME" data-column="db"></td>
            <td class="DESCRIPTION" data-column="db"></td>
     	    <td class="START_DATE" data-column="db"></td>
     	    <td class="END_DATE" data-column="db"></td>
     	    <td class="USER_TYPE" data-column="db"></td>
     	    <td class="WECHAT_CODE" data-column="db"></td>
     	    <td class="MOBILE_NUMBER" data-column="db"></td>
     	    <td class="EMAIL_ADDR" data-column="db"></td>
     	    <td class="ACTION" data-column="normal">
     	      <i class="fa fa-pencil fa-fw update pointer hidden" data-show="true" title="更新用户" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="user/preUpdate.do" data-type="update" data-updateparam=["USER_ID",".USER_ID"]  data-func="$().beforePreUpdate();"></i>
     	      <i class="fa fa-briefcase fa-fw pointer hidden resp_assign" data-show="true" title="职责分配" data-reveal-id="resp_assign" data-key="true" data-dismissmodalclass="close-resp-frame" data-crudtype="pre-update" data-preupdateurl="resp/getUserResp.do" data-updateparam=["USER_ID",".USER_ID"] data-func="$().getUserForAssign(tr,pageframe);"></i>     	      
     	      <i class="fa fa-user-circle fa-fw pointer hidden show_detail" data-show="true" title="客户分配" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame"></i>     	      
     	    </td>
     	    <td class="USER_ID" style="display:none" data-column="hidden">&nbsp;</td>
     	  </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="User">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-user-plus pointer" data-reveal-id="ui" data-key="true" title="新增用户" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().beforePreInsert();" data-revealfunc="$().afterReveal(); " ></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
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
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="USER_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="user/getCustPage.do"/>
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
          <span><i class="fa fa-search"></i>&nbsp;客户账号查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <label for="USER_NAME_Q" class="left md">用户账号:</label> 
            <input type="text" id="USER_NAME_Q" name="USER_NAME" class="left md" data-modify="true" data-pageframe="query"  data-lovbtn="USER_LOV_Q"  data-param="USER_NAME" />          
            <input type="hidden" id="USER_ID_Q" name="USER_ID"/>
            <input type="button" id="USER_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="用户查询" data-queryurl="lov/getCustUserPage.do" data-jsontype="user" data-defaultquery="true" data-th=["用户id","用户账号","用户名"] data-td=["USER_ID&none","USER_NAME","DESCRIPTION"] data-selectname=["用户账号","用户名"] data-selectvalue=["USER_NAME","DESCRIPTION"] data-choose=[".USER_ID",".USER_NAME",".DESCRIPTION"] data-recid=["#USER_ID_Q","#USER_NAME_Q","#DESCRIPTION_Q"] value="···"/>
            <label for="DESCRIPTION_Q" class="left md">用户名称:</label> 
            <input type="text" id="DESCRIPTION_Q" name="DESCRIPTION" class="left lg" readonly="readonly"/>  
            <br style="clear:both"/>
            <label for="START_DATE_F" class="left md">启用日期:</label>
            <input type="text" id="START_DATE_F" name="START_DATE_F" class="left time" data-datatype="date" placeholder="起始启用日期"/>
            <label class="left blank"></label>
            <input type="text" id="START_DATE_T" name="START_DATE_T" class="left time" data-datatype="date" placeholder="截止启用日期"/>
          </form> 
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">用户查询</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      
      <!-- 更新/新增用户区域 start -->
      <div id="ui" class="pop_frame row-4">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-user-circle-o fa-1x" aria-hidden="true"></i>&nbsp;更新客户</span>
          <span data-type="insert"><i class="fa fa-user-plus fa-1x" aria-hidden="true"></i>&nbsp;新增客户</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-4">
          <form id="updateData">
            <input type="hidden" id="U_ID" name="U_ID" data-update="db"/>
            <label for="USER_NAME" class="left md">用户账号</label>
            <input type="text" id="USER_NAME" name="USER_NAME" data-update="db" required="required" class="left lg" />    
            <label for="DESC" class="left md">用户名称</label>
            <input type="text" id="DESC" name="DESC" data-update="db" required="required" class="left lg"/>
            <br style="clear:both"/>
            <label for="PASSWORD" class="left md">密码</label>
            <input type="password" id="PASSWORD" name="PASSWORD" data-update="db" class="left password"/>
            <i class="fa fa-eye-slash pointer left" data-pwd="show"></i>
            <i class="fa fa-eye pointer left hide" data-pwd="hide"></i>     
            <input type="hidden" id="ENCRYPTED_USER_PASSWORD" name="ENCRYPTED_USER_PASSWORD" data-update="db"/>
            <input type="hidden" id="PASSWORD_DATE" name="PASSWORD_DATE" data-update="db"/>
            <label for="MOBILE_NUMBER" class="left md">手机号</label>
            <input type="text" id="MOBILE_NUMBER" name="MOBILE_NUMBER" data-update="db" required="required" class="left lg" />  
            <br style="clear:both"/>
            <label for="START_DATE" class="left md">启用日期</label>
            <input type="text" id="START_DATE" name="START_DATE" data-update="db" data-datatype="date" required="required" class="left lg"/>
            <label for="END_DATE" class="left md">失效日期</label>
            <input type="text" id="END_DATE" name="END_DATE" data-update="db" data-datatype="date" class="left lg"/>
            <br style="clear:both"/>
            <label for="EMAIL_ADDR" class="left md">邮箱地址</label>
            <input type="text" id="EMAIL_ADDR" name="EMAIL_ADDR" data-update="db" class="left lg" />      
            <label for="WECHAT_CODE" class="left md">微信</label>
            <input type="text" id="WECHAT_CODE" name="WECHAT_CODE" data-update="db" class="left lg" />
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="user/update.do" data-func="$().validateUserType();">提交更新</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="user/insertCust.do" data-func="$().beforeInsert();">新增</button>
        </div>    
      </div> 
      <!-- 更新/新增用户区域 end -->
      
      <!-- 职责分配区域 start -->
      <div id="resp_assign" class="pop_frame row-2"> 
        <div class="title pointer">      
          <span><i class="fa fa-briefcase"></i>&nbsp;职责分配</span>
        </div>
        <a class="close-resp-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <input type="hidden" id="USER_ID_R" name="USER_ID" data-update="normal"/>
            <label for="RESP_NAME_R" class="left md">职责名称</label> 
            <input type="text" id="RESP_NAME_R" name="RESP_NAME" data-update="db" class="left md" data-modify="true" data-pageframe="resp_assign" required="required" data-lovbtn="RESP_LOV" data-param="RESP_NAME"/>
            <input type="hidden" id="RESP_ID_R" name="RESP_ID" data-update="db"/>
            <input type="button" id="RESP_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="resp_assign" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="职责查询" data-queryurl="lov/getCustRespPage.do" data-jsontype="resp" data-defaultquery="true" data-th=["职责ID","职责编码","职责名称","描述"] data-td=["RESP_ID&none","RESP_CODE","RESP_NAME","DESCRIPTION"] data-selectname=["职责名称","职责编码"] data-selectvalue=["RESP_NAME","RESP_CODE"] data-choose=[".RESP_ID",".RESP_NAME"] data-recid=["#RESP_ID_R","#RESP_NAME_R"] value="···"/>
            <label for="ENABLED_FLAG_R" class="left md">是否启用</label> 
	        <select class="left lg" id="ENABLED_FLAG_R" name="ENABLED_FLAG" data-update="db" data-notnull="true" required="required" data-listurl="list/getEnableFlag.do"></select> 
	        <br style="clear:both"/>
          </form>
        </div>
        <div class="foot">
          <button class="right update_confirm pointer" data-keyup="enter" data-crudtype="update" data-pageframe="resp_assign" data-updateurl="resp/assignUserResp.do">分配</button>
        </div>
      </div>
      <!-- 职责分配区域 end -->

      <!-- 用户客户账号区域 start --> 
      <div class="detail_frame" id="detail">
        <div class="title pointer">      
          <span><i class="fa fa-handshake-o"></i>&nbsp;客户账号分配</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>
        <div class="detail_header">
          <input type="hidden" id="USER_ID_D" />
          <label class="mid" for="USER_NAME_D">用户账号</label>
          <input type="text" id="USER_NAME_D" class="long" readonly="readonly"/>
          <label class="mid" for="DESC_D">用户名</label>
          <input type="text" id="DESC_D" class="long" readonly="readonly"/>
          <br style="clear:both"/>
        </div>
        
        <div class="detail_table">
          <table id="sub-table" data-table="custLine">
            <tr>
              <th class="ORG_NAME" data-column="db">销售公司</th>
              <th class="PARTY_NAME" data-column="db">客户名称</th>
              <th class="ACCOUNT_NUMBER" data-column="db">客户账号</th>
     	      <th class="ACCOUNT_NAME" data-column="db">账号名称</th>
     	      <th class="ENABLED_FLAG" data-column="db">是否有效</th>
     	      <th class="USER_CUST_ID" style="display:none" data-column="hidden">&nbsp;</th>
     	    </tr>
     	    <tr>
     	      <td class="ORG_NAME" data-column="db"></td>
     	      <td class="PARTY_NAME" data-column="db"></td>
              <td class="ACCOUNT_NUMBER" data-column="db"></td>
     	      <td class="ACCOUNT_NAME" data-column="db"></td>
     	      <td class="ENABLED_FLAG" data-column="db"></td>
     	      <td class="USER_CUST_ID" style="display:none" data-column="hidden">&nbsp;</td>     	     
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
			  <jsp:param name="pageframe" value="sub_table" />
			  <jsp:param name="func" value="$().setParam();" />
		    </jsp:include>
            <input type="hidden" data-type="size" value="5"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="USER_CUST_ID ASC"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="cust/getUserCustPage.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
          </div>
        </div>
      </div>
      <!-- 用户客户账号区域 end -->
      
      <!-- 用户客户账号分配区域 start -->
      <div id="detail_ui" class="pop_frame row-3" style="z-index:104">     
        <div class="title pointer">      
          <span data-type="insert"><i class="fa fa-handshake-o fa-1x" aria-hidden="true"></i>&nbsp;客户选择</span>
        </div>
        <a class="close-detail-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-3">
          <form>
            <label for="PARTY_NAME" class="left md">客户名称</label> 
            <input type="text" id="PARTY_NAME" name="PARTY_NAME" data-update="db" class="left lglov" readonly="readonly" required="required"/>
            <input type="hidden" id="CUSTOMER_ID" name="CUSTOMER_ID" data-update="db"/>
            <input type="button" id="PARTY_NAME_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="客户查询" data-queryurl="lov/getCustAllPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","销售公司","客户ID","客户名称","客户账号"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME&text-left","ACCOUNT_NUMBER"] data-selectname=["客户名称","客户账号"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID","#ORG_NAME","#CUSTOMER_ID","#PARTY_NAME"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME" class="left md">销售公司</label> 
            <input type="text" id="ORG_NAME" name="ORG_NAME" data-update="db" class="left lgx2" readonly="readonly" required="required"/>
            <input type="hidden" id="ORG_ID" name="ORG_ID" data-update="db" readonly="readonly"/>
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="detail_ui" data-inserturl="cust/insert.do" data-refresh="sub_refresh" data-func="$().setParam();">分配</button>
        </div>    
      </div>
      <!-- 用户客户账号分配区域 end -->   
      
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="CUST_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end --> 
    </div>
    
    <script>
    	$(function() {
    		//设置拖拽
            $('#ui').draggable({ handle: '.title'});
            $('#resp_assign').draggable({ handle: '.title'});
    		$('#detail').draggable({ handle: '.title'});
    		$('#detail_ui').draggable({ handle: '.title'});
    		$('#query').draggable({ handle: '.title'});
    		
    		//初始化CRUD和LOV条件查询
    		$().crudListener();	
    		$().revealListener();   
    		
    		$('i[data-pwd]').on('click',function(){
    		    if($(this).data('pwd')=='show'){
    		        $('i[data-pwd="hide"]').css('display','block');
    		        $(this).css('display','none');
    		        $('#PASSWORD').attr('type','text');
    		    }else if($(this).data('pwd')=='hide'){
    		        $('i[data-pwd="show"]').css('display','block');
    		        $(this).css('display','none');
    		        $('#PASSWORD').attr('type','password');
    		    }
    		});
    		
    		//默认查询时间
			$.fn.defaultQueryDate = function(){
			    var sysDate = new Date();
			    var firstDay;
			    firstDay = sysDate.getFullYear()
			              +'-'+(sysDate.getMonth()+1)
			              +'-01 00:00:00';
			    
			    $('#START_DATE_F').val(firstDay);
			    $('#START_DATE_T').val(sysDate.format('yyyy-MM-dd')+' 23:59:59');//modify by bird 2017.08.10  修改默认当前时间的时分秒为23:59:59
			}	
			
			$().defaultQueryDate();			
    		
    		$.fn.beforePreInsert = function(){	    
    		    $('#PASSWORD').attr('required','required');
    		    $('#USER_NAME').removeAttr('readonly');
    		}
    		
    		$.fn.beforeInsert = function(){
    		    //RegExpValidate('^[a-zA-Z]\\w{5,14}$','USER_NAME','regExpError("用户名格式错误，必须是由字母开头的6-15位字符");');
                RegExpValidate('^[A-Z][A-Z0-9_]{5,14}$','USER_NAME','$("#USER_NAME").val("");regExpError("用户账号格式错误，包含数字、下划线和字母的6-15位字符，并且必须是由大写字母开头、字母全部大写");');
                $().validateUserType();
    		}
    		
    		$.fn.afterReveal = function(){
    		    $('#START_DATE').val(new Date().format('yyyy-MM-dd hh:mm:ss'));
    		    $('label[for="USER_NAME"]').click();
    		}    	
    		
    		$.fn.beforePreUpdate = function(){
    			$('#PASSWORD').removeAttr('required');
    		    $('#USER_NAME').attr('readonly','readonly');
    		}
    		
    		$.fn.validateUserType = function(){	
    		    if($('#PASSWORD').val()) RegExpValidate('^[a-zA-Z0-9]{5,14}$','PASSWORD','$("#PASSWORD").val("");regExpError("密码格式错误，必须是由字母或数字组成的6-15位字符");');
                if($('#MOBILE_NUMBER').val()) RegExpValidate('^(1)\\d{10}$','MOBILE_NUMBER','$("#MOBILE_NUMBER").val("");regExpError("请输入正确的手机号码!");');
                if($('#EMAIL_ADDR').val())  RegExpValidate('^.*\[@\].*$','EMAIL_ADDR','$("#EMAIL_ADDR").val("");regExpError("请输入正确的邮箱地址!");');
                if($('#WECHAT_CODE').val()) RegExpValidate('^[a-zA-Z]{1}[-_a-zA-Z0-9]{5,19}$','WECHAT_CODE','$("#WECHAT_CODE").val("");regExpError("请输入正确的微信号码!");');    
    		}
    		
    		$.fn.setParam = function(){
    		    userId=$('#USER_ID_D').val();
    		    param=param+'&USER_ID='+userId;
    		}
    		
    		$.fn.getUserForAssign = function(tr,pageframe){
    			$('#'+pageframe+' input[name="USER_ID"]').val(tr.children('.USER_ID').text());
    		}
    		
    		$.fn.detailShow = function(){
    		    $('.show_detail').off('click');
    		    $('.show_detail').on('click',function(){
    		        $('#detail').css('margin-left','-400px'); 
    		        tr=$(this).parent().parent();
    		        userId=tr.children('.USER_ID').text();
    		    	userName=tr.children('.USER_NAME').text();
    		    	userDesc=tr.children('.DESCRIPTION').text();
    		    	$('.detail_header input').val('');
    		    	$('#sub_table input[data-type="number"]').val('1');
    		    	$('#USER_ID_D').val(userId);
    		    	$('#USER_NAME_D').val(userName);
    		    	$('#DESC_D').val(userDesc);
    		    	$('#sub_refresh').click();
    		    });    		   
    		} 
    		
    		$.fn.validateUserCust = function(){
    		    $('[data-enable]').off('click');
    		    $('[data-enable]').on('click',function(){
    		        var action = $(this).attr('data-enable');
    		        var tr=$(this).parent().parent();
    		        var userCustId=tr.children('.USER_CUST_ID').text();
    		        var param = 'USER_CUST_ID='+userCustId+'&ACTION='+action;
    		        $.ajax({
    		        	type:'post', 
						data:param,
						url:'cust/validate.do',
						dataType:'json',
						success:function(data){
							if(data.retcode=='0'){
							    if(action == 'OFF'){
							        layer.msg('失效成功!');
							    }else if(action == 'ON'){
							    	layer.msg('启用成功!');
							    }
				    			$('#sub_refresh').click();/****点击刷新当前页按钮，刷新数据****/	
				    		}else{
				    			layer.alert('更新失败！错误信息:'+data.errbuf,{title:'警告',offset:[150]});
				    		}
						},error:function(){
						    layer.msg('获取JSON数据失败');	
							if(window.frameElement != null){
							    //console.log("处于一个iframe中");
							    $('body',parent.document).find('a[data-tabtype="refreshTab"]')[0].click(); 
							}	
						}
    		        });
    		    });
    		} 				
    		
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
                     ['.USER_ID','USER_ID']
                    ,['.USER_NAME','USER_NAME']
                    ,['.DESCRIPTION','DESCRIPTION']
                    ,['.START_DATE','START_DATE']
                    ,['.END_DATE','END_DATE']
                    ,['.USER_TYPE','USER_TYPE_M']
                    ,['.WECHAT_CODE','WECHAT_CODE']
                    ,['.MOBILE_NUMBER','MOBILE_NUMBER']
                    ,['.EMAIL_ADDR','EMAIL_ADDR']
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                	$().crudListener();
                	$().detailShow(); 
                	$().revealListener();
        	    }else if(JSONtype=='subtable'){
        	        var mapRowArray=[
                     ['.USER_CUST_ID','USER_CUST_ID']
                    ,['.ORG_NAME','ORG_NAME']
                    ,['.PARTY_NAME','PARTY_NAME']
                    ,['.ENABLED_FLAG','ENABLED_FLAG',
        	    	  function(){
        	    	     if(data.rows[i].ENABLED_FLAG=='Y'){ 
        	    	         $('#sub-table').find('tr:eq('+(i+1)+')').find('.ENABLED_FLAG').html('<i class="pointer fa fa-toggle-on green" data-enable="OFF" data-show="true"></i>');
        	    	     }else{
        	    	         $('#sub-table').find('tr:eq('+(i+1)+')').find('.ENABLED_FLAG').html('<i class="pointer fa fa-toggle-off" data-enable="ON" data-show="true"></i>');
        	    	     }                                              
        	    	  }]
                    ,['.ACCOUNT_NUMBER','ACCOUNT_NUMBER']
                    ,['.ACCOUNT_NAME','ACCOUNT_NAME']
        	    	];
        	    	$().mapContentJson(data,'#sub-table',mapRowArray);
        	    	width='-'+parseInt($('#detail').css('width'))/2+'px';
			        $('#detail').css('margin-left',width); 
        	        $().crudListener();
        	        $().validateUserCust();
                	$().revealListener(); 
        	    }else if(JSONtype=='user'){
        	    	var mapRowArray=[
        	    	 'USER_ID'
        	    	,'USER_NAME'
        	    	,'DESCRIPTION'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='resp'){
        	    	var mapRowArray=[
        	    	 'RESP_ID'
        	    	,'RESP_NAME'
        	    	,'RESP_CODE'
        	    	,'DESCRIPTION'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='cust'){
        	        var mapRowArray=[
        	    	 'ORG_ID'
        	    	,'ORG_NAME'
        	    	,'CUST_ACCOUNT_ID'
        	    	,'PARTY_NAME'
        	    	,'ACCOUNT_NUMBER'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }    
        	},getUpdateJSON:function(data){  
                if(pageframe=='ui'){ 
                    var mapRowArray=[
                     ['#U_ID','USER_ID']
                    ,['#USER_NAME','USER_NAME']
                    ,['#DESC','DESCRIPTION']
                    ,['#START_DATE','START_DATE']
                    ,['#END_DATE','END_DATE']
                    ,['#ENCRYPTED_USER_PASSWORD','ENCRYPTED_USER_PASSWORD']
                    ,['#PASSWORD_DATE','PASSWORD_DATE']
                    ,['#WECHAT_CODE','WECHAT_CODE']
                    ,['#MOBILE_NUMBER','MOBILE_NUMBER']
                    ,['#EMAIL_ADDR','EMAIL_ADDR']
                    ];
                    $().mapUpdateJson(data,mapRowArray);    
                }else if(pageframe=='resp_assign'){ 
                    var mapRowArray=[
                     ['#RESP_ID_R','RESP_ID']
                    ,['#RESP_NAME_R','RESP_NAME']
                    ,['#ENABLED_FLAG_R','ENABLED_FLAG']
                    ]
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
