<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Responsibility Manage</title>
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
          <i class="fa fa-spinner fa-pulse fa-4x" style="color:white;"></i>
       </div>
       <!-- 数据加载动画 end -->
       <!-- 主表格区域 start -->
       <div id="scrollbar" class="table pointer">
         <table  id="main-table" data-table="Resp">
           <tr> 
             <th class="RESP_CODE" data-column="db">Code</th>
             <th class="RESP_NAME" data-column="db">Responsibilities</th>
             <th class="DESCRIPTION" data-column="db">Description</th>               
             <th class="MENU_CODE" data-column="db">Menu Code</th>
             <th class="MENU_NAME" data-column="db">Menu</th>
             <th class="START_DATE" data-column="db">Start Date</th>
             <th class="END_DATE" data-column="db">End Date</th>
             <th class="ACTION" data-column="normal">Action</th>
             <th class="RESP_ID" style="display:none" data-column="hidden">&nbsp;</th>
           </tr>
           <tr> 
             <td class="RESP_CODE" data-column="db"></td>
             <td class="RESP_NAME" data-column="db"></td>
             <td class="DESCRIPTION" data-column="db"></td>
             <td class="MENU_CODE" data-column="db"></td>
             <td class="MENU_NAME" data-column="db"></td>
             <td class="START_DATE" data-column="db"></td>
             <td class="END_DATE" data-column="db"></td>
             <td class="ACTION" data-column="normal">
               <i class="fa fa-pencil fa-fw update pointer hidden" data-show="true" title="Update" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="resp/preUpdate.do" data-type="update" data-updateparam=["RESP_ID",".RESP_ID"]></i>  <!-- 2017/8/2  add data-key="true" -->
             </td>
             <td class="RESP_ID" style="display:none" data-column="hidden"></td>         
           </tr>
         </table>
       </div>
       <!-- 主表格区域 end -->
       <!-- 主表格按钮区域 start -->
       <div class="table_button" id="table" data-table="Resp">
         <div class="setting">
           <i class="fa fa-cog pointer" data-reveal-id="setting" title="Table Setting" data-dismissmodalclass="close-setting"></i>
         </div>
         <div class="setting">
           <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="Conditional Query" data-dismissmodalclass="close-query-frame"></i>
         </div>
         <div class="setting">
           <i class="fa fa-plus-circle pointer" data-reveal-id="ui" data-key="true" title="Insert" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="" data-revealfunc="$().afterReveal(); " ></i>
         </div>
         <div class="setting">
           <i id="refresh" class="fa fa-refresh pointer" title="Refresh Data" data-pagetype="refresh" data-pageframe="table"></i>
         </div>
         <div id="setting">
           <!-- 设置菜单区域 start -->
           <jsp:include page="./public/setting.jsp">
           <jsp:param name="rdtable" value="#main-table"/>
           <jsp:param name="odtable" value="#main-table"/>
           <jsp:param name="pageframe" value="table"/>
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
           <input type="hidden" data-type="orderby" id="ORDER_BY" value="RESP_ID ASC"/>
           <input type="hidden" data-type="cond"/>
           <input type="hidden" data-type="url" value="resp/getRespPage.do"/>
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
           <span><i class="fa fa-search"></i>&nbsp;Responsibilities Query</span>
         </div>
         <a class="close-query-frame" data-type="close">&#215;</a>
         <div class="line"></div>
         <div class="content row-3">
           <form>
             <label for="RESP_NAME_Q" class="left md">Resp:</label> 
             <input type="text" id="RESP_NAME_Q" name="RESP_NAME" class="left md" data-modify="true" data-suffixflag="true" data-pageframe="query"  data-lovbtn="RESP_LOV_Q"  data-param="RESP_NAME"/>
             <input type="hidden" id="RESP_ID_Q" name="RESP_ID"/>
             <input type="button" id="RESP_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Resp Query" data-queryurl="lov/getRespPage.do" data-jsontype="resp" data-defaultquery="true" data-th=["ID","Code","Resp","Desc"] data-td=["RESP_ID&none","RESP_CODE","RESP_NAME","DESCRIPTION"] data-selectname=["Resp","Code"] data-selectvalue=["RESP_NAME","RESP_CODE"] data-choose=[".RESP_ID",".RESP_NAME"] data-recid=["#RESP_ID_Q","#RESP_NAME_Q"] value="···"/>
             <br style="clear:both"/>
             <label for="MENU_NAME_Q" class="left md">Menu:</label> 
             <input type="text" id="MENU_NAME_Q" name="MENU_NAME" class="left md" data-modify="true"  data-suffixflag="true" data-pageframe="query"  data-lovbtn="MENU_LOV_Q"  data-param="MENU_NAME"/>
             <input type="hidden" id="MENU_ID_Q" name="MENU_ID"/>
             <input type="button" id="MENU_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Menu Query" data-queryurl="lov/getMenuPage.do" data-jsontype="menu" data-defaultquery="true" data-th=["ID","Code","Menu","Desc"] data-td=["MENU_ID&none","MENU_CODE","MENU_NAME","DESCRIPTION"] data-selectname=["Menu","Code"] data-selectvalue=["MENU_NAME","MENU_CODE"] data-choose=[".MENU_ID",".MENU_NAME"] data-recid=["#MENU_ID_Q","#MENU_NAME_Q"] value="···"/>
             <br style="clear:both"/>
             <label for="START_DATE_F" class="left md">Start Date:</label>
             <input type="text" id="START_DATE_F" name="START_DATE_F" class="left time" data-datatype="date" placeholder="Start Date From"/>
             <label class="left blank"></label>
             <input type="text" id="START_DATE_T" name="START_DATE_T" class="left time" data-datatype="date" placeholder="Start Date To"/>
             <br style="clear:both"/>
           </form>
         </div>
         <div class="foot">
           <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
         </div>
       </div>
       <!-- 条件查询区域end -->
       <!-- 更新/新增区域 start -->
       <div id="ui" class="pop_frame row-3" >
         <div class="title pointer">
           <span data-type="update"><i class="fa fa-briefcase fa-1x" aria-hidden="true"></i>&nbsp;Update</span>
           <span data-type="insert"><i class="fa fa-briefcase fa-1x" aria-hidden="true"></i>&nbsp;Insert</span>
         </div>
         <a class="close-ui-frame" data-type="close">&#215;</a>
         <div class="line"></div>
         <div class="content row-3">
           <form id="updateData">
             <input type="hidden" id="R_ID" name="R_ID" data-update="db"/>
             <label for="RESP_CODE" class="left md">Code</label>
             <input type="text" id="RESP_CODE" name="RESP_CODE" data-update="db" required="required" class="left lg"/>
             <label for="RESP_NAME" class="left md">Resp</label>
             <input type="text" id="RESP_NAME" name="RESP_NAME" data-update="db" required="required" class="left lg"/>
             <label for="DESCRIPTION" class="left md">Desc</label>
             <input type="text" id="DESCRIPTION" name="DESCRIPTION" data-update="db" class="left lg"/>         
             <label for="MENU_NAME" class="left md">Menu</label> 
             <input type="text" id="MENU_NAME" name="MENU_NAME" data-update="db" class="left md" data-modify="true"  data-suffixflag="true" required="required" data-pageframe="ui"  data-lovbtn="MENU_LOV"  data-param="MENU_NAME"/>                       
             <input type="hidden" id="MENU_ID" name="MENU_ID" data-update="db"/>
             <input type="button" id="MENU_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Menu Query" data-queryurl="lov/getMenuPage.do" data-jsontype="menu" data-defaultquery="true" data-th=["ID","CODE","MENU","DESC"] data-td=["MENU_ID&none","MENU_CODE","MENU_NAME","DESCRIPTION"] data-selectname=["Menu","Code"] data-selectvalue=["MENU_NAME","MENU_CODE"] data-choose=[".MENU_ID",".MENU_NAME"] data-recid=["#MENU_ID","#MENU_NAME"] value="···"/>
             <br style="clear:both"/> 
             <label for="START_DATE" class="left md">Start Date</label>
             <input type="text" id="START_DATE" name="START_DATE" data-update="db" data-datatype="date" required="required" class="left lg"/>
             <label for="END_DATE" class="left md">End Date</label>
             <input type="text" id="END_DATE" name="END_DATE" data-update="db" data-datatype="date" class="left lg"/>  
           </form>
         </div>
         <div class="foot">
           <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="resp/update.do" data-func="$().beforeInsert()">Update</button>
           <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="resp/insert.do" data-func="$().beforeInsert()">Insert</button>
         </div>
       </div>
       <!-- 更新/新增用户区域 end -->
       <!-- 用户信息存放区域 start -->
       <input type="hidden" id="USER_ID" value="${USER_ID}"/>
       <input type="hidden" id="INTERACT_CODE" value="RESP_MANAGE"/>
       <input type="hidden" id="HEADER_ID" value=""/> 
       <!-- 用户信息存放区域 end -->
     </div>
     
     <script>
          $(function() {
	          //设置拖拽
	          $('#ui').draggable({ handle: '.title'});
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
			      $('#START_DATE_T').val(sysDate.format('yyyy-MM-dd')+' 23:59:59');//modify by bird 2017.08.10  修改默认当前时间的时分秒为23:59:59
			  }	
			
			  $().defaultQueryDate();
              
	          $.fn.beforeInsert = function(){
	              RegExpValidate('^\\w+$','RESP_CODE','$("#RESP_CODE").val("");regExpError("职责编码格式不符合规范!");');
	              RegExpValidate('^[a-zA-Z0-9 ]+$','RESP_NAME','regExpError("职责名称必须为字母、数字和空格组合!");');
	          }
	           
	          $.fn.afterReveal = function(){
	              $('#START_DATE').val(new Date().format('yyyy-MM-dd hh:mm:ss'));
	              $('label[for="RESP_CODE"]').click();
              }  
             
	          //日期选择
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
			          ['.RESP_ID','RESP_ID']
			         ,['.RESP_CODE','RESP_CODE']
			         ,['.RESP_NAME','RESP_NAME']
			         ,['.DESCRIPTION','DESCRIPTION']
			         ,['.MENU_ID','MENU_ID'] 
			         ,['.MENU_CODE','MENU_CODE']
			         ,['.MENU_NAME','MENU_NAME']
			         ,['.MENU_DESC','MENU_DESC']
			         ,['.START_DATE','START_DATE']
			         ,['.END_DATE','END_DATE']	           		         
			          ];
			          $().mapContentJson(data,'#main-table',mapRowArray);
			          $().afterRowDefine();
			          $().crudListener();
			          $().revealListener();
			      }else if(JSONtype=='resp'){
	                  var mapRowArray=[
	                     'RESP_ID'
	                    ,'RESP_NAME'
	                    ,'RESP_CODE'
	                    ,'DESCRIPTION'
	                  ];
	                  $().mapContentJson(data,'#lov',mapRowArray);
                  }else if(JSONtype=='menu'){
                      var mapRowArray=[
	                      'MENU_ID'
	                     ,'MENU_CODE'
	                     ,'MENU_NAME'
	                     ,'DESCRIPTION'
                      ];
                      $().mapContentJson(data,'#lov',mapRowArray);
                  }
		      },  
		      getUpdateJSON:function(data){
		          if(pageframe=='ui'){
			          var mapRowArray=[
			          ['#R_ID','RESP_ID']
			         ,['#RESP_CODE','RESP_CODE']
			         ,['#RESP_NAME','RESP_NAME']
			         ,['#DESCRIPTION','DESCRIPTION']
			         ,['#MENU_ID','MENU_ID']
			         ,['#MENU_CODE','MENU_CODE']
			         ,['#MENU_NAME','MENU_NAME']
			         ,['#MENU_DESC','MENU_DESC']
			         ,['#START_DATE','START_DATE']
			         ,['#END_DATE','END_DATE']
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