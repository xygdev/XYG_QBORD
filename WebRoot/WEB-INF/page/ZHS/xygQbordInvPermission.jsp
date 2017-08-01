<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>库存组织权限分配</title>
    <base href="<%=basePath%>"> 
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
        <table  id="main-table" data-table="Perm">
          <tr> 
            <th class="USER_NAME" data-column="db">用户账号</th>
            <th class="USER_DESC" data-column="db">用户姓名</th>
            <th class="ORGANIZATION_CODE" data-column="db">库存编码</th>
            <th class="ORGANIZATION_NAME" data-column="db">库存组织</th>
            <th class="START_DATE_ACTIVE" data-column="db">启用日期</th>
            <th class="ENABLED_FLAG" data-column="db">是否有效</th>
            <th class="ACTION" data-column="normal">操作</th> 
            <th class="PERMISSION_ID" style="display:none" data-column="hidden">&nbsp;</th>
          </tr>         
          <tr>
            <td class="USER_NAME" data-column="db"></td>
            <td class="USER_DESC" data-column="db"></td>
            <td class="ORGANIZATION_CODE" data-column="db"></td>
            <td class="ORGANIZATION_NAME" data-column="db"></td>
            <td class="START_DATE_ACTIVE" data-column="db"></td>
            <td class="ENABLED_FLAG" data-column="db"></td>
            <td class="ACTION" data-column="normal">       
              <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="删除" data-refresh="refresh"  data-col="USER_NAME" data-crudtype="del" data-delurl="perm/deleteInvPermission.do" data-delmsg="是否删除用户账号：" data-delparam=["PERMISSION_ID",".PERMISSION_ID"] ></i>       
            </td>
            <td class="PERMISSION_ID" style="display:none" data-column="hidden">&nbsp;</td>
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="Perm">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-user-plus pointer" data-reveal-id="ui" data-key="true" title="新增" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
        </div>
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="./public/setting.jsp" >
            <jsp:param name="rdtable" value="#main-table" />
            <jsp:param name="odtable" value="#main-table" />
            <jsp:param name="pageframe" value="table" />
          </jsp:include>
          <!-- 设置菜单区域 end -->
        </div>
        <div>
          <!-- 分页按钮区域 start -->
          <jsp:include page="./public/pageArrow.jsp">
            <jsp:param name="pageframe" value="table"/>
            <jsp:param name="func" value=""/>
          </jsp:include>
          <!-- 分页按钮区域 end -->
          <input type="hidden" data-type="size" id="page_size" value="10"/>
          <input type="hidden" data-type="number" id="page_no" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="PERMISSION_ID"/>
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="perm/getInvPermission.do"/>
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
          <span><i class="fa fa-user"></i>&nbsp;库存权限查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-3">
          <form>
            <label for='USER_NAME_Q' class='left md'>用户账号:</label> 
            <input type='text' id='USER_NAME_Q' name='USER_NAME' class='left md' data-modify='true' data-pageframe="query"  data-lovbtn='USER_LOV_Q'  data-param="USER_NAME" />          
            <input type='hidden' id='USER_ID_Q' name='USER_ID'/>
            <input type='button' id="USER_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="用户查询" data-queryurl="lov/getUserPage.do" data-jsontype="user" data-defaultquery="true" data-th=["用户id","发件账号","发件人"] data-td=["USER_ID&none","USER_NAME","DESCRIPTION"] data-selectname=["发件账号","发件人"] data-selectvalue=["USER_NAME","DESCRIPTION"] data-choose=[".USER_ID",".USER_NAME",".DESCRIPTION"] data-recid=["#USER_ID_Q","#USER_NAME_Q","#DESCRIPTION_Q"] value="···"/>
            <label for='DESCRIPTION_Q' class='left md'>用户名称:</label> 
            <input type='text' id='DESCRIPTION_Q' name="DESCRIPTION" class="left lg" readonly="readonly"/>                                   
            <br style="clear:both"/>
            <label for="ORGANIZATION_CODE_Q" class="left md">库存编码:</label> 
            <input type="text" id="ORGANIZATION_CODE_Q" name="ORGANIZATION_CODE" class="left md"  data-modify='true' data-pageframe="query"  data-lovbtn='ORGANIZATION_LOV_Q'  data-param="ORGANIZATION_CODE" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="库存组织查询" data-queryurl="lov/getOrganizationPage.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存代号","库存组织"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_CODE",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_CODE_Q","#ORGANIZATION_NAME_Q"] value="···"/>    
            <label for='ORGANIZATION_NAME_Q' class='left md'>库存组织</label>
            <input type='text' id='ORGANIZATION_NAME_Q' name='ORGANIZATION_NAME' data-update="db" class='left lg' readonly="readonly"/>           
            <br style="clear:both"/>
            <label for="START_DATE_ACTIVE_F" class="left md">启用日期:</label>
            <input type="text" id="START_DATE_ACTIVE_F" name="START_DATE_ACTIVE_F" class="left lg" data-datatype="date" placeholder="起始启用日期"/>
            <label class="left blank"></label>
            <input type="text" id="START_DATE_ACTIVE_T" name="START_DATE_ACTIVE_T" class="left lg" data-datatype="date" placeholder="截止启用日期"/>
          </form>     
        </div>
        <div class="foot">
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">查询</button>
        </div>
      </div>
      <!-- 条件查询区域end -->
         
      <!-- 更新/新增区域 start -->
      <div id="ui" class="pop_frame row-2" >
        <div class="title pointer">
          <span data-type="insert"><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;新增</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form id="updateData">  
            <input type="hidden" id="PERMISSION_ID" name="PERMISSION_ID" data-update="db"/>
            <label for="USER_NAME" class="left md">用户账号:</label> 
            <input type="text" id="USER_NAME" name="USER_NAME" class="left md" data-update="db" data-modify='true' data-pageframe="query"  data-lovbtn="USER_LOV"  data-param="USER_NAME" required="required"/>          
            <input type="hidden" id="U_ID" name="USER_ID" data-update="db"/>
            <input type="button" id="USER_LOV" class='left button pointer' data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="用户查询" data-queryurl="lov/getUserPage.do" data-jsontype="user" data-defaultquery="true" data-th=["用户id","发件账号","发件人"] data-td=["USER_ID&none","USER_NAME","DESCRIPTION"] data-selectname=["发件账号","发件人"] data-selectvalue=["USER_NAME","DESCRIPTION"] data-choose=[".USER_ID",".USER_NAME",".DESCRIPTION"] data-recid=["#U_ID","#USER_NAME","#DESCRIPTION"] value="···"/>
            <label for='DESCRIPTION' class='left md'>用户名称:</label> 
            <input type='text' id='DESCRIPTION' name="DESCRIPTION" data-update="db" class="left lg" readonly="readonly" required="required"/>         
            <label for='ORGANIZATION_CODE' class='left md'>库存编码</label> 
            <input type='text' id='ORGANIZATION_CODE' name='ORGANIZATION_CODE' class='left md' data-update="db" required="required" data-modify="true" data-pageframe="query" data-lovbtn="ORGANIZATION_LOV" data-param="ORGANIZATION_CODE"/>          
            <input type='hidden' id='ORGANIZATION_ID' name='ORGANIZATION_ID'/>
            <input type='button' id="ORGANIZATION_LOV" class='left button pointer' data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass='close-lov' data-lovname="库存组织查询" data-queryurl="lov/getOrganizationPage.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存id","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存编码","库存组织"] data-selectvalue=["ORGANIZATION_CODE","ORGANIZATION_NAME"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_CODE",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID","#ORGANIZATION_CODE","#ORGANIZATION_NAME"] value="···"/>           
            <label for='ORGANIZATION_NAME' class='left md'>库存组织</label>
            <input type='text' id='ORGANIZATION_NAME' name='ORGANIZATION_NAME' data-update="db" required='required' class='left lg' readonly="readonly"/>             
          </form>    
        </div>
        <div class="foot">
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="perm/insertInvPermission.do" data-func="">新增</button>
        </div>
      </div>
      <!-- 更新/新增用户区域 end -->

      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="PERMISSION"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->      
      <script>       
          $(function() {
	          //设置拖拽
	          $("#ui").draggable({handle: ".title"});
	          $("#query").draggable({handle: ".title"});
	                  
	          //初始化CRUD和LOV条件查询
	          $().crudListener(); 
	          $().revealListener(); 
	                 
	          $('input[data-datatype="date"]').datetimepicker({
	              lang:"ch",           //语言选择中文
	              timepicker:true,    //启用时间选项
	              format:"Y-m-d H:i:s",      //格式化日期
	              step: 30,
	              showOnClick: true
	          });  
             
	          $.fn.validatePerm = function(){
	              $('[data-enable]').off('click');
	              $('[data-enable]').on('click',function(){
	                  var action = $(this).attr('data-enable');
		              var tr=$(this).parent().parent();
		              var permissionId=tr.children('.PERMISSION_ID').text();
		              var param = 'PERMISSION_ID='+permissionId+'&ACTION='+action;
	                  $.ajax({
		                  type:'post', 
		                  data:param,
		                  url:'perm/validate.do',
		                  dataType:'json',
		                  success:function(data){
			                  if(data.retcode=='0'){
			                      if(action == 'OFF'){
			                          layer.msg('失效成功!');
			                      }else if(action == 'ON'){
			                          layer.msg('启用成功!');
			                      }
			                      $('#refresh').click();/****点击刷新当前页按钮，刷新数据****/  
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
          }); 
       
          jQuery.json={
              getContent:function(data,JSONtype){  
	              if(JSONtype=='table'){   
	                  var mapRowArray=[
	                      ['.USER_NAME','USER_NAME']
	                     ,['.USER_DESC','USER_DESC']
		                 ,['.ORGANIZATION_CODE','ORGANIZATION_CODE']
		                 ,['.ORGANIZATION_NAME','ORGANIZATION_NAME']
		                 ,['.START_DATE_ACTIVE','START_DATE_ACTIVE']
		                 ,['.ENABLED_FLAG','ENABLED_FLAG',
		                  function(){
		                      if(data.rows[i].ENABLED_FLAG=='Y'){ 
		                          $('#main-table').find('tr:eq('+(i+1)+')').find('.ENABLED_FLAG').html('<i class="pointer fa fa-toggle-on green" data-enable="OFF" data-show="true"></i>');
		                      }else{
		                          $('#main-table').find('tr:eq('+(i+1)+')').find('.ENABLED_FLAG').html('<i class="pointer fa fa-toggle-off" data-enable="ON" data-show="true"></i>');
		                      } 
		                  }
		                  ]                  
		                  ,['.PERMISSION_ID','PERMISSION_ID']                      
		              ];
		              $().mapContentJson(data,'#main-table',mapRowArray);
		              $().afterRowDefine();
		              $().crudListener();
		              $().validatePerm();
		              $().revealListener(); 
	              }else if(JSONtype=='user'){
		              var mapRowArray=[
		                 'USER_ID'
		                ,'USER_NAME'
		                ,'DESCRIPTION'
		              ];
		              $().mapContentJson(data,'#lov',mapRowArray);                          
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
