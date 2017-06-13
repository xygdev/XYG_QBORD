<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8"
	      import="java.util.*" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户管理</title>
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
	<!-- Scrollbar -->
	<link rel="stylesheet" href="plugin/mCustomScrollbar/css/jquery.mCustomScrollbar.css" type="text/css"/>
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
     	    <th class="EMP_NUMBER" data-column="db">员工工号</th>
     	    <th class="EMP_NAME" data-column="db">员工名称</th>
     	    <th class="WECHAT_CODE" data-column="db">微信</th>
     	    <th class="MOBILE_NUMBER" data-column="db">手机号</th>
     	    <th class="EMAIL_ADDR" data-column="db">邮箱地址</th>
     	    <th class="USER_IMG" data-column="normal">用户头像</th>
     	    <th class="ACTION" data-column="normal">操作</th> 
     	    <th class="USER_ID" style="display:none" data-column="hidden">&nbsp;</th>
     	    <th class="IMG_URL" style="display:none" data-column="hidden">&nbsp;</th>
     	  </tr>
     	  <tr>
     	    <td class="USER_NAME" data-column="db"></td>
            <td class="DESCRIPTION" data-column="db"></td>
     	    <td class="START_DATE" data-column="db"></td>
     	    <td class="END_DATE" data-column="db"></td>
     	    <td class="USER_TYPE" data-column="db"></td>
     	    <td class="EMP_NUMBER" data-column="db"></td>
     	    <td class="EMP_NAME" data-column="db"></td>
     	    <td class="WECHAT_CODE" data-column="db"></td>
     	    <td class="MOBILE_NUMBER" data-column="db"></td>
     	    <td class="EMAIL_ADDR" data-column="db"></td>
     	    <td class="USER_IMG" data-column="normal">
     	      <i class="fa fa-picture-o changeIMG pointer hidden" title="更改头像" data-show="true" data-reveal-id="headimg"></i>
     	    </td>
     	    <td class="ACTION" data-column="normal">
     	      <i class="fa fa-pencil fa-fw update pointer hidden" data-show="true" title="更新用户" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="user/preUpdate.do" data-type="update" data-updateparam=["USER_ID",".USER_ID"]  data-func="$().setUpdatePWD();"></i>
     	      <i class="fa fa-briefcase fa-fw pointer hidden resp_assign" data-show="true" title="职责分配" data-reveal-id="resp_assign" data-key="true" data-dismissmodalclass="close-resp-frame" data-crudtype="pre-update" data-preupdateurl="resp/getUserResp.do" data-updateparam=["USER_ID",".USER_ID"] data-func="$().getUserForAssign(tr,pageframe);"></i>
     	      <i class="fa fa-users fa-fw pointer hidden group_assign" data-show="true" title="工作组分配" data-reveal-id="group_assign" data-key="true" data-dismissmodalclass="close-group-frame" data-crudtype="pre-update" data-preupdateurl="group/getUserGroup.do" data-updateparam=["USER_ID",".USER_ID"] data-func="$().getUserForAssign(tr,pageframe);"></i>
     	      <i class="fa fa-user-circle fa-fw pointer hidden show_detail" data-show="true" title="客户分配" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame"></i>     	      
     	    </td>
     	    <td class="USER_ID" style="display:none" data-column="hidden">&nbsp;</td>
     	    <td class="IMG_URL" style="display:none" data-column="hidden">&nbsp;</td>
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
          <i id='refresh' class="fa fa-refresh pointer" title="刷新数据" data-pagetype='refresh' data-pageframe="table"></i>
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
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="USER_ID"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="user/getUserPage.do"/>
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
      <div id="query" class="pop_frame row-3">     
        <div class="title pointer">      
          <span><i class="fa fa-user"></i>&nbsp;用户查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class='line'></div>
        <div class="content row-3">
          <form>
            <label for='USER_NAME_Q' class="left md">用户账号:</label> 
            <input type="text" id="USER_NAME_Q" name="USER_NAME" class="left md" data-modify="true" data-pageframe="query"  data-lovbtn='USER_LOV_Q'  data-param="USER_NAME" />          
            <input type="hidden" id="USER_ID_Q" name="USER_ID"/>
            <input type='button' id="USER_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="用户查询" data-queryurl="lov/getUserPage.do" data-jsontype="user" data-defaultquery="true" data-th=["用户id","用户账号","用户名"] data-td=["USER_ID&none","USER_NAME","DESCRIPTION"] data-selectname=["用户账号","用户名"] data-selectvalue=["USER_NAME","DESCRIPTION"] data-choose=[".USER_ID",".USER_NAME",".DESCRIPTION"] data-recid=["#USER_ID_Q","#USER_NAME_Q","#DESCRIPTION_Q"] value="···"/>
            <label for='DESCRIPTION_Q' class='left md'>用户名称:</label> 
            <input type='text' id='DESCRIPTION_Q' name="DESCRIPTION" class="left lg" readonly="readonly"/>  
            <label for='USER_TYPE_Q' class='left md'>用户类型:</label>
            <select class='left lg' id='USER_TYPE_Q' name='USER_TYPE' data-update="db" required='required' data-notnull="true" data-listurl="list/getUserType.do"></select> 
            <br style="clear:both"/>
            <label for="START_DATE_F" class="left md">启用日期:</label>
            <input type="text" id="START_DATE_F" name="START_DATE_F" class="left lg" data-datatype="date" placeholder="起始启用日期"/>
            <label class="left blank"></label>
            <input type="text" id="START_DATE_T" name="START_DATE_T" class="left lg" data-datatype="date" placeholder="截止启用日期"/>
          </form> 
        </div>
        <div class='foot'>             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">用户查询</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      
      <!-- 更新/新增用户区域 start -->
      <div id="ui" class="pop_frame row-5">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;更新用户</span>
          <span data-type="insert"><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;新增用户</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-5">
          <form id='updateData'>
            <input type='hidden' id='U_ID' name="U_ID" data-update="db"/>
            <label for='USER_NAME' class="left md">用户账号</label>
            <input type='text' id="USER_NAME" name='USER_NAME' data-update="db" required='required' class="left lg" />    
            <label for="DESC" class="left md">用户名称</label>
            <input type="text" id="DESC" name="DESC" data-update="db" required="required" class="left lg"/>
            <br style="clear:both"/>
            <label for="USER_TYPE" class="left md">用户类型</label>
            <select class="left lg" id='USER_TYPE' name='USER_TYPE' data-update="db" required='required' data-notnull="true" data-listurl="list/getUserType.do"></select> 
            <label for='PASSWORD' class="left md">密码</label>
            <input type='password' id='PASSWORD' name='PASSWORD' data-update="db" class='left password'/>
            <i class="fa fa-eye-slash pointer left" data-pwd="show"></i>
            <i class="fa fa-eye pointer left hide" data-pwd="hide"></i>     
            <input type="hidden" id="ENCRYPTED_USER_PASSWORD" name="ENCRYPTED_USER_PASSWORD" data-update="db"/>
            <input type="hidden" id="PASSWORD_DATE" name="PASSWORD_DATE" data-update="db"/>
            <br style="clear:both"/>
            <label for="START_DATE" class="left md">启用日期</label>
            <input type='text' id='START_DATE' name='START_DATE' data-update="db" data-datatype="date" required='required' class="left lg"/>
            <label for='END_DATE' class="left md">失效日期</label>
            <input type='text' id='END_DATE' name='END_DATE' data-update="db" data-datatype="date" class="left lg"/>
            <br style="clear:both"/>
            <label for="MOBILE_NUMBER" class="left md">手机号</label>
            <input type="text" id="MOBILE_NUMBER" name="MOBILE_NUMBER" data-update="db" class="left lg" />  
            <label for="EMAIL_ADDR" class="left md">邮箱地址</label>
            <input type="text" id="EMAIL_ADDR" name="EMAIL_ADDR" data-update="db" class="left lg" />      
             <br style="clear:both"/>
            <label for="WECHAT_CODE" class="left md">微信</label>
            <input type="text" id="WECHAT_CODE" name="WECHAT_CODE" data-update="db" class="left lg" />    
            <label for="EMP_NAME" class="left md">员工名称</label> 
            <input type="text" id="EMP_NAME" name="EMP_NAME" data-update="db" class="left md" data-modify="true" data-pageframe="ui" data-lovbtn="EMP_LOV"  data-param="ENAME"/>
            <input type="hidden" id='EMP_ID' name="EMP_ID" data-update="db"/>
            <input type="button" id="EMP_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="员工查询" data-queryurl="lov/getEmpPage.do" data-jsontype="emp" data-defaultquery="true" data-th=["员工ID","员工姓名","工号"] data-td=["EMP_ID","ENAME","EMPNO"] data-selectname=["员工姓名","工号"] data-selectvalue=["ENAME","ENO"] data-choose=[".EMP_ID",".ENAME"] data-recid=["#EMP_ID","#EMP_NAME"] value="···"/>
            <input type="hidden" id="IMG_URL" name="IMG_URL" data-update="db"/> 
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="user/update.do" data-func="$().validateUserType();">提交更新</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="user/insert.do" data-func="$().beforeInsert();">新增</button>
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
            <input type='hidden' id='USER_ID_R' name="USER_ID" data-update="normal"/>
            <label for="RESP_NAME_R" class="left md">职责</label> 
            <input type="text" id="RESP_NAME_R" name="RESP_NAME" data-update="db" class="left md" data-modify="true" data-pageframe="resp_assign" required="required" data-lovbtn="RESP_LOV" data-param="RESP_NAME"/>
            <input type="hidden" id="RESP_ID_R" name="RESP_ID" data-update="db"/>
            <input type="button" id="RESP_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="resp_assign" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="职责查询" data-queryurl="lov/getRespPage.do" data-jsontype="resp" data-defaultquery="true" data-th=["职责ID","职责编码","职责名称","描述"] data-td=["RESP_ID","RESP_CODE","RESP_NAME","RESP_DESC"] data-selectname=["职责编码","职责名称"] data-selectvalue=["RESP_CODE","RESP_NAME"] data-choose=[".RESP_ID",".RESP_NAME"] data-recid=["#RESP_ID_R","#RESP_NAME_R"] value="···"/>
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
      
      <!-- 工作组分配区域 start -->
      <div id="group_assign" class="pop_frame row-2"> 
        <div class="title pointer">      
          <span><i class="fa fa-groups"></i>&nbsp;工作组分配</span>
        </div>
        <a class="close-group-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form>
            <input type='hidden' id='USER_ID_G' name="USER_ID" data-update="normal"/>
            <label for="GROUP_NAME" class="left md">工作组</label>
            <input type="text" id="GROUP_NAME_G" name="GROUP_NAME" data-update="db" class="left md" data-modify="true" data-pageframe="group_assign" required="required" data-lovbtn="GROUP_LOV"  data-param="groupName"/>
            <input type="hidden" id="GROUP_ID_G" name="GROUP_ID" data-update="db"/>
            <input type="button" id="GROUP_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="工作组查询" data-queryurl="lov/getGroupPage.do" data-jsontype="group" data-defaultquery="true" data-th=["工作组ID","工作组编码","工作组名称","描述"] data-td=["GROUP_ID","GROUP_CODE","GROUP_NAME","DESCRIPTION"] data-selectname=["工作组编码","工作组名称"] data-selectvalue=["GROUP_CODE","GROUP_NAME"] data-choose=[".GROUP_ID",".GROUP_NAME"] data-recid=["#GROUP_ID_G","#GROUP_NAME_G"]  value="···"/>
            
            <label for="ENABLED_FLAG_G" class="left md">是否启用</label> 
	        <select class="left lg" id="ENABLED_FLAG_G" name="ENABLED_FLAG" data-update="db" data-notnull="true" required="required" data-listurl="list/getEnableFlag.do"></select> 
	        <br style="clear:both"/>
          </form>
        </div>
        <div class="foot">
          <button class="right update_confirm pointer" data-keyup="enter" data-crudtype="update" data-pageframe="group_assign" data-updateurl="group/assignUserGroup.do">分配</button>
        </div>
      </div>
      <!-- 工作组分配区域 end -->
      
      <!-- 用户头像区域 start -->
      <jsp:include page="public/headImg.jsp">
        <jsp:param name="headImgType" value="admin" />
      </jsp:include>
      <!-- 用户头像区域 end -->
      
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="USER_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end --> 
    </div>
    
    <script>
    	$(function() {
    		//设置拖拽
            $("#ui").draggable({ handle: ".title"});
            $("#resp_assign").draggable({ handle: ".title"});
            $("#group_assign").draggable({ handle: ".title"});
    		//$("#detail").draggable({ handle: ".title"});
    		//$("#detail_ui").draggable({ handle: ".title"});
    		$("#query").draggable({ handle: ".title"});
    		
    		//设置非Webkit的滚动条
    		if (!/webkit/.test(navigator.userAgent.toLowerCase())) {
    		    //console.log("not webit");
				$(".table").mCustomScrollbar({
					axis:"x",
					scrollInertia:0
				});	
    		}
    		
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
    		
    		$.fn.changeIMG = function(){
    		    $('.changeIMG').off('click');
    		    $('.changeIMG').on('click',function(){
    		        $('.cropped_old img').removeAttr('src');
    		        $('.imageBox').css('background-image','');
    		        $('.cropped_new img').attr('src','/image/user/system_blank.png');
    		    	tr=$(this).parent().parent();
    		    	imgurl='/image/user/'+tr.children('.IMG_URL').text();
    		    	$('#headimg_uid').val(tr.children('.USER_ID').text());
    		    	$('#headimg_uname').val(tr.children('.USER_NAME').text());
    		    	$('.cropped_old img').attr('src',imgurl+'?temp=' + Math.random()); 
    			});
    		}
    		
    		$.fn.beforePreInsert = function(){	    
    		    $('#PASSWORD').attr('required','required');
    		    $('#USER_NAME').removeAttr('readonly');
    		}
    		
    		$.fn.beforeInsert = function(){
    		    RegExpValidate('^[a-zA-Z]\\w{5,14}$','USER_NAME','regExpError("用户名格式错误，必须是由字母开头的6-15位字符");');
                $().validateUserType();
    		}
    		
    		$.fn.afterReveal = function(){
    		    $('#START_DATE').val(new Date().format('yyyy-MM-dd hh:mm:ss'));
    		    $('label[for="USER_NAME"]').click();
    		}
    		
    		$.fn.setUpdatePWD = function(){
    		    $('#PASSWORD').removeAttr('required');
    		    $('#USER_NAME').attr('readonly','readonly');
    		}
    		
    		$.fn.validateUserType = function(){
    		    if($('#USER_TYPE').val()=='EMP'){
    		        if($('#EMP_ID').val()==null||$('#EMP_ID').val()==''){
    		            layer.alert('员工必须维护员工名称!',{title:'警告',offset: [150]});
    		            throw new error('员工必须维护员工名称!');
    		        }
    		    }else if($('#USER_TYPE').val()=='CUSTOMER'){
    		        if($('#EMP_ID').val()){
    		            layer.alert('客户不能维护员工名称!',{title:'警告',offset: [150]});
    		            throw new error('客户不能维护员工名称!');
    		        }
    		    }	    
    		}
    		
    		$.fn.setParam = function(){
    		    userId=$('#USER_ID_LINES').val();
    		    param=param+'&USER_ID='+userId;
    		}
    		
    		$.fn.getUserForAssign = function(tr,pageframe){
    		    //alert(pageframe);
    			//$('#USER_ID_R').val(tr.children('.USER_ID').text());
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
    		    	$('#USER_ID_LINES').val(userId);
    		    	$('#USER_NAME_LINES').val(userName);
    		    	$('#DESC_LINES').val(userDesc);
    		    	$('#sub_refresh').click();
    		    });    		   
    		} 
    		
    		$.fn.preInsertUC = function(){
    		    $('#START_DATE_DETAIL').removeAttr('readonly');
    		    $('#PARTY_NAME_LOV').removeAttr('disabled');
    		}
    		
    		$.fn.preUpdateUC = function(){
    		    $('#START_DATE_DETAIL').attr('readonly','readonly');
    		    $('#PARTY_NAME_LOV').attr('disabled','disabled');
    		}
    		
    		$('input[data-datatype="date"]').datetimepicker({
				  lang:"ch",           //语言选择中文
				  timepicker:true,    //启用时间选项
				  format:"Y-m-d H:i:s",      //格式化日期
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
                    ,['.ENCRYPTED_USER_PASSWORD','ENCRYPTED_USER_PASSWORD']
                    ,['.PASSWORD_DATE','PASSWORD_DATE']
                    ,['.USER_TYPE','USER_TYPE_M',
                     function(){
                     	if(data.rows[i].USER_TYPE=='CUSTOMER'){
                    	  //$('.ACTION i[data-reveal-id="detail"]',$('#main-table tr:eq('+(i+1)+')')).css('visibility','visible');
                    	    $('.ACTION i[data-reveal-id="detail"]',$('#main-table tr:eq('+(i+1)+')')).css('display','');
                    	    $('.ACTION i[data-reveal-id="group_assign"]',$('#main-table tr:eq('+(i+1)+')')).css('display','none');
                    	}else{
                    	    $('.ACTION i[data-reveal-id="detail"]',$('#main-table tr:eq('+(i+1)+')')).css('display','none');
                    	    $('.ACTION i[data-reveal-id="group_assign"]',$('#main-table tr:eq('+(i+1)+')')).css('display','');
                    	  //$('.ACTION i[data-reveal-id="detail"]',$('#main-table tr:eq('+(i+1)+')')).css('visibility','hidden');
                    	}
                     }
                    ]
                    ,['.EMP_ID','EMP_ID']
                    ,['.EMP_NAME','EMP_NAME']
                    ,['.EMP_NUMBER','EMP_NUMBER']
                    ,['.IMG_URL','IMG_URL']
                    ,['.WECHAT_CODE','WECHAT_CODE']
                    ,['.MOBILE_NUMBER','MOBILE_NUMBER']
                    ,['.EMAIL_ADDR','EMAIL_ADDR']
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                	$().crudListener();
                	$().detailShow();
                	$().changeIMG(); 
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
        	    }else if(JSONtype=='emp'){
        	    	var mapRowArray=[
        	    	 'EMP_ID'
        	    	,'ENAME'
        	    	,'EMPNO'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }else if(JSONtype=='group'){
        	    	var mapRowArray=[
        	    	 'GROUP_ID'
        	    	,'GROUP_CODE'
        	    	,'GROUP_NAME'
        	    	,'DESCRIPTION'
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
                    ,['#USER_TYPE','USER_TYPE']
                    ,['#EMP_ID','EMP_ID']
                    ,['#EMP_NAME','EMP_NAME']
                    ,['#IMG_URL','IMG_URL']
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
                }else if(pageframe=='group_assign'){ 
                    var mapRowArray=[
                     ['#GROUP_ID_G','GROUP_ID']
                    ,['#GROUP_NAME_G','GROUP_NAME']
                    ,['#ENABLED_FLAG_G','ENABLED_FLAG']
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
    <!-- Scrollbar -->
    <script type="text/javascript" src="plugin/mCustomScrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
