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
      <div class="table pointer">
        <table id="main-table" data-table="Broadcast">
          <tr>
            <th class="BROADCAST_TITLE" data-column="db">公告标题</th>
            <th class="USER_DESC" data-column="db">发布人</th>
     	    <th class="START_DATE" data-column="db">启用时间</th>
     	    <th class="END_DATE" data-column="db">失效时间</th>
     	    <th class="ACTION" data-column="normal">公告内容</th> 
     	    <th class="BROADCAST_ID" style="display:none" data-column="hidden">&nbsp;</th>
     	  </tr>
     	  <tr>
     	    <td class="BROADCAST_TITLE" data-column="db"></td>
            <td class="USER_DESC" data-column="db"></td>
     	    <td class="START_DATE" data-column="db"></td>
     	    <td class="END_DATE" data-column="db"></td>
     	    <td class="ACTION" data-column="normal">
     	      <i class="fa fa-file-text fa-fw detail pointer hidden" data-show="true" title="公告内容" data-reveal-id="detail" data-key="true" data-dismissmodalclass="close-detail-frame" data-crudtype="pre-update" data-preupdateurl="broadcast/getContent.do" data-updateparam=["BROADCAST_ID",".BROADCAST_ID"]></i>   	      
     	    </td>
     	    <td class="BROADCAST_ID" style="display:none" data-column="hidden">&nbsp;</td>
     	  </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="Broadcast">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus pointer" data-reveal-id="ui" data-key="true" title="发布公告" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
        </div>
        <div class="setting">
          <i id='refresh' class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
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
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="BROADCAST_ID"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="broadcast/getBcPage.do"/>
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
      <div id="query" class="pop_frame row-4">     
        <div class="title pointer">      
          <span><i class="fa fa-user"></i>&nbsp;公告查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class='line'></div>
        <div class="content row-4">
          <form>
            <label for="USER_DESC_Q" class="left md">发布人:</label> 
            <input type="text" id="USER_DESC_Q" name="DESCRIPTION" class="left md" data-modify="true" data-pageframe="query"  data-lovbtn='USER_LOV_Q'  data-param="DESCRIPTION" />          
            <input type="hidden" id="USER_ID_Q" name="USER_ID"/>
            <input type='button' id="USER_LOV_Q" class='left button pointer' data-pageframe="lov" data-reveal-id="lov"  data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="用户查询" data-queryurl="lov/getUserPage.do" data-jsontype="user" data-defaultquery="true" data-th=["用户id","用户账号","用户名"] data-td=["USER_ID&none","USER_NAME","DESCRIPTION"] data-selectname=["用户账号","用户名"] data-selectvalue=["USER_NAME","DESCRIPTION"] data-choose=[".USER_ID",".DESCRIPTION"] data-recid=["#USER_ID_Q","#USER_DESC_Q"] value="···"/>
            <br style="clear:both"/> 
            <label for="BROADCAST_TITLE_Q" class="left md">公告标题:</label> 
            <input type="text" id="BROADCAST_TITLE_Q" name="BROADCAST_TITLE" class="left lgx2"/>
            <br style="clear:both"/>
            <label for="START_DATE_F" class="left md">启用时间:</label>
            <input type="text" id="START_DATE_F" name="START_DATE_F" class="left time" data-datatype="date" placeholder="起始启用时间"/>
            <label for="START_DATE_T" class="left blank"></label>
            <input type="text" id="START_DATE_T" name="START_DATE_T" class="left time" data-datatype="date" placeholder="截止启用时间"/>
            <label for="END_DATE_F" class="left md">失效时间:</label>
            <input type="text" id="END_DATE_F" name="END_DATE_F" class="left time" data-datatype="date" placeholder="起始失效时间"/>
            <label for="END_DATE_T" class="left blank"></label>
            <input type="text" id="END_DATE_T" name="END_DATE_T" class="left time" data-datatype="date" placeholder="截止失效时间"/>
          </form> 
        </div>
        <div class='foot'>             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">用户查询</button>
        </div> 
      </div>
      <!-- 条件查询区域end -->
      
      <!-- 发布公告区域 start -->
      <div id="ui" class="pop_frame row-9">     
        <div class="title pointer">      
          <span data-type="insert"><i class="fa fa-user fa-1x" aria-hidden="true"></i>&nbsp;发布公告</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-9">
          <form style="padding:0 30px">
            <label for="BROADCAST_TITLE" class="left" style="padding:0 8px 0 0;width:34px;margin:5px 0">标题</label>
	        <input type="text" id="BROADCAST_TITLE" name="BROADCAST_TITLE" class="left" style="margin:4px 0;width:570px" data-update="db" required="required"/>
            <br style="clear:both"/>
            <label for="START_DATE" class="left" style="padding:8px 8px 0 0" data-datatype="date">启用时间</label>
            <input type="text" id="START_DATE" name="START_DATE" class="left" style="width:230px" data-datatype="date" data-update="db"/>
            <label for="END_DATE" class="left" style="padding:8px 8px 0 8px" data-datatype="date">失效时间</label>
            <input type="text" id="END_DATE" name="END_DATE" class="left" style="width:230px" data-datatype="date" required="required" data-update="db"/>  
            <textarea id="BROADCAST_CONTENT" name="BROADCAST_CONTENT" style="width:614px;height:190px" required="required" data-update="db"></textarea>
            <label for="BROADCAST_CONTENT" class="hidden" style="padding:0">公告内容</label>
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="broadcast/insert.do">发布</button>
        </div>    
      </div> 
      <!-- 发布公告区域 end -->
      
      <!-- 公告内容区域 start -->
      <div id="detail" class="pop_frame row-9"> 
        <div class="title pointer">      
          <span><i class="fa fa-bullhorn"></i>&nbsp;公告内容</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-9">
          <div style="padding:0 30px">
            <input type="hidden" id="BROADCAST_ID_D" data-update="db"/>
            <label for="BROADCAST_TITLE_D" class="left" style="padding:0 8px 0 0;width:34px">标题:</label>
	        <input type="text" id="BROADCAST_TITLE_D" class="left" style="border:0;margin:-2px 0;width:570px" data-update="db"/>
            <br style="clear:both"/>
            <br style="clear:both"/>
            <textarea id="BROADCAST_CONTENT_D" style="width:614px;height:220px;resize:none" readonly="readonly"></textarea>
            <br style="clear:both"/>
            <input id="START_DATE_D"type="text" class="right" style="margin:5px 0;border:0px;width:150px" data-update="db"/>
            <label for="START_DATE_D" class="right" style="margin:6px 0;width:70px">公告时间:</label>
            <br style="clear:both"/>
            <input id="USER_DESC_D"type="text" class="right" style="margin:-1px 0;border:0px;width:70px" data-update="db"/>
            <label for="USER_DESC_D" class="right" style="width:55px">发布人:</label>
          </div>
        </div>
      </div>
      <!-- 公告内容区域 end -->
      
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="BROADCAST_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end --> 
    </div>
    
    <script>
    	$(function() {
    		//设置拖拽
            $("#ui").draggable({ handle: ".title"});
    		$("#detail").draggable({ handle: ".title"});
    		$("#query").draggable({ handle: ".title"});
    		
    		//初始化CRUD和LOV条件查询
    		$().crudListener();	
    		$().revealListener();   
    				
    		$.fn.beforeInsert = function(){
    		    RegExpValidate('^[a-zA-Z]\\w{5,14}$','USER_NAME','regExpError("用户名格式错误，必须是由字母开头的6-15位字符");');
    		}
    		
    		$.fn.afterReveal = function(){
    		    $('#START_DATE').val(new Date().format('yyyy-MM-dd hh:mm:ss'));
    		    $('label[for="USER_NAME"]').click();
    		}   		
    		
    		$.fn.setParam = function(){
    		    userId=$('#USER_ID_LINES').val();
    		    param=param+'&USER_ID='+userId;
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
                     ['.BROADCAST_ID','BROADCAST_ID']
                    ,['.BROADCAST_TITLE','BROADCAST_TITLE']
                    ,['.USER_DESC','USER_DESC']
                    ,['.START_DATE','START_DATE']
                    ,['.END_DATE','END_DATE']
                    ,['.ACTIVE_DAYS','ACTIVE_DAYS']
                    ];
                    $().mapContentJson(data,'#main-table',mapRowArray);
                    $().afterRowDefine();
                	$().crudListener()
                	$().revealListener();
        	    }else if(JSONtype=='user'){
        	    	var mapRowArray=[
        	    	 'USER_ID'
        	    	,'USER_NAME'
        	    	,'DESCRIPTION'
        	    	];
        	    	$().mapContentJson(data,'#lov',mapRowArray);
        	    }   
        	},getUpdateJSON:function(data){  
                if(pageframe=='detail'){ 
                    var mapRowArray=[
                     ['#BROADCAST_ID_D','BROADCAST_ID']
                    ,['#BROADCAST_TITLE_D','BROADCAST_TITLE']
                    ,['#BROADCAST_CONTENT_D','BROADCAST_CONTENT']
                    ,['#START_DATE_D','START_DATE']
                    ,['#END_DATE_D','END_DATE']
                    ,['#USER_DESC_D','USER_DESC']
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
