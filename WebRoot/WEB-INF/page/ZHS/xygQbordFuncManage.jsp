<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>功能管理</title>
    <base href="<%=basePath%>">
    <meta http-equiv="content-typFe" content="text/html;charset=gb2312">
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
      <!-- 数据加载动画 start -->
      <div class="ajax_loading">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <!-- 数据加载动画 end -->
      <!-- 主表格区域 start -->
      <div id="scrollbar" class="table pointer">
        <table  id="main-table" data-table="Func">
          <tr>
	        <th class="FUNCTION_CODE" data-column="db">功能编码</th>
	        <th class="FUNCTION_NAME" data-column="db">功能名称</th>
	        <th class="FUNCTION_URL" data-column="db">功能链接</th>
	        <th class="DESCRIPTION" data-column="db">功能描述</th>
	        <th class="ICON_PREVIEW" data-column="db">图标预览</th>
	        <th class="ACTION" data-column="normal">操作</th>
	        <th class="FUNCTION_ID" style="display:none" data-column="hidden">&nbsp;</th> 
          </tr>
          <tr>
            <td class="FUNCTION_CODE" data-column="db"></td>
            <td class="FUNCTION_NAME" data-column="db"></td>
            <td class="FUNCTION_URL" data-column="db"></td>
            <td class="DESCRIPTION" data-column="db"></td>
            <td class="ICON_PREVIEW" data-column="db"></td>
            <td class="ACTION" data-column="normal">
              <i class="fa fa-pencil fa-fw update pointer hidden" data-show="true" data-reveal-id="ui" data-key="true"  data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="func/preUpdate.do" data-type="update" data-updateparam=["FUNCTION_ID",".FUNCTION_ID"]></i>
            </td>
            <td class="FUNCTION_ID" style="display:none" data-column="hidden">&nbsp;</td>  
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
    
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="Func">
        <div class="setting">
          <i class="fa fa-cog pointer" data-reveal-id="setting" title="表格设置" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" data-reveal-id="query" data-key="true" title="条件查询" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">            
          <i class="fa fa-plus-circle pointer" title="新增功能" data-reveal-id="ui" data-key="true"  data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert" ></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
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
	      <input type="hidden" data-type="orderby" id="ORDER_BY" value="FUNCTION_ID ASC"/>
	      <input type="hidden" data-type="cond"/>
	      <input type="hidden" data-type="url" value="func/getFuncPage.do"/>
	      <input type="hidden" data-type="jsontype" value="table"/>
	      <input type="hidden" data-type="autoquery" value="N"/> 
	    </div>
      </div>
      <!-- 主表格按钮区域 end --> 
      <!-- 定义列区域 start -->
      <jsp:include page="./public/rowdefine.jsp"></jsp:include>
      <!-- 定义列区域 end -->
      <!-- 多维排序区域 start -->
      <jsp:include page="./public/orderby.jsp"></jsp:include>
      <!-- 多维排序区域 end -->
      <!-- 个人配置区域 start -->
      <jsp:include page="./public/config.jsp">
        <jsp:param name="tableId" value="#main-table" />
      </jsp:include>
      <!-- 个人配置区域 end -->
	  <!-- lov区域 start -->
	  <jsp:include page="./public/lov.jsp"></jsp:include>
	  <!-- lov区域 end -->
      <!-- 条件查询区域start -->
      <div id="query" class="pop_frame row-1">
        <div class="title pointer">
          <span><i class="fa fa-search"></i>&nbsp;查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-1">
	      <form>
            <label for="FUNCTION_CODE_Q" class="left md">功能编码:</label> 
            <input type="text" id="FUNCTION_CODE_Q" name="FUNCTION_CODE" class="left md" data-modify="true"  data-suffixflag="true" data-pageframe="query" data-lovbtn="FUNCTION_LOV_Q" data-param="FUNCTION_CODE" />
            <input type="hidden" id="FUNCTION_ID_Q" name="FUNCTION_ID"/>
            <input type="button" id="FUNCTION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="功能查询" data-queryurl="lov/getFuncPage.do" data-jsontype="func" data-defaultquery="true" data-th=["功能ID","功能编码","功能名称","描述"] data-td=["FUNCTION_ID&none","FUNCTION_CODE","FUNCTION_NAME","DESCRIPTION"] data-selectname=["功能编码","功能名称"] data-selectvalue=["FUNCTION_CODE","FUNCTION_NAME"] data-choose=[".FUNCTION_ID",".FUNCTION_CODE",".FUNCTION_NAME"] data-recid=["#FUNCTION_ID_Q","#FUNCTION_CODE_Q","#FUNCTION_NAME_Q"] value="···"/>  
            <label for="FUNCTION_NAME_Q" class="left md">功能名称:</label> 
            <input type="text" id="FUNCTION_NAME_Q" name="FUNCTION_NAME" class="left lg"  readonly="readonly"/>
	      </form>
	    </div>
	    <div class="foot">
	      <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">查询</button>
	    </div>
	  </div>
	  <!-- 条件查询区域end -->
      <!-- 更新/新增区域 start -->
	  <div id="ui" class="pop_frame row-3" >
        <div class="title pointer">
          <span data-type="update"><i class="fa fa-puzzle-piece fa-1x" aria-hidden="true"></i>&nbsp;更新</span>
	      <span data-type="insert"><i class="fa fa-puzzle-piece fa-1x" aria-hidden="true"></i>&nbsp;新增</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-3">
	      <form id="updateData">
	        <input type="hidden" id="FUNCTION_ID" name="FUNCTION_ID" data-update="db"/>
	        <label for="FUNCTION_CODE" class="left md">功能编码</label>
	        <input type="text" id="FUNCTION_CODE" name="FUNCTION_CODE" data-update="db" required="required" class="left lg"/>
	        <label for="FUNCTION_NAME" class="left md">功能名称</label>
	        <input type="text" id="FUNCTION_NAME" name="FUNCTION_NAME" data-update="db" required="required" class="left lg"/>
	        <label for="FUNCTION_URL" class="left md">功能链接</label>
	        <input type="text" id="FUNCTION_URL" name="FUNCTION_URL" data-update="db" required="required" class="left lg"/>
	        <label for="DESCRIPTION" class="left md">功能描述</label>
	        <input type="text" id="DESCRIPTION" name="DESCRIPTION" data-update="db" class="left lg"/>
	        <label for="ICON_CODE" class="left md">图标编码</label> 
	        <input type="text" id="ICON_CODE" name="ICON_CODE" data-update="db" class="left md" required="required" readonly="readonly"/>
	        <input type="hidden" id="ICON_ID" name="ICON_ID" data-update="db"/>
	        <input type="button" id="ICON_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="图标查询" data-queryurl="lov/getIconPage.do" data-jsontype="icon" data-defaultquery="true" data-th=["图标ID","图标编码","图标描述","预览"] data-td=["ICON_ID&none","ICON_CODE","DESCRIPTION","PREVIEW"] data-selectname=["图标编码","图标描述"] data-selectvalue=["ICON_CODE","ICON_DESC"] data-choose=[".ICON_ID",".ICON_CODE"] data-recid=["#ICON_ID","#ICON_CODE"] value="···"/>              
	      </form>
	    </div>
	    <div class="foot">       
	      <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="func/update.do" data-func="$().beforeInsert();">提交更新</button>
	      <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="func/insert.do" data-func="$().beforeInsert();">新增</button>
	    </div>    
	  </div> 
	  <!-- 更新/新增用户区域 end -->
	  <!-- 用户信息存放区域 start -->
	  <input type="hidden" id="USER_ID" value="${USER_ID}"/>
	  <input type="hidden" id="INTERACT_CODE" value="FUNC_MANAGE"/>
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
      
	        $.fn.beforeInsert = function(){
                RegExpValidate('^\\w+$','FUNCTION_CODE','regExpError("功能编码格式不符合规范!");');
                RegExpValidate('^[\u4e00-\u9fa5]{0,}$','FUNCTION_NAME','regExpError("功能名称必须为汉字!");');
                RegExpValidate('[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?','FUNCTION_URL','regExpError("功能链接格式不符合url规范!");');
            }
        }); 
	
		jQuery.json={
			getContent:function(data,JSONtype){
			    if(JSONtype=='table'){
				    var mapRowArray=[
				    ['.FUNCTION_ID','FUNCTION_ID']	
			   	   ,['.FUNCTION_CODE','FUNCTION_CODE']
				   ,['.FUNCTION_NAME','FUNCTION_NAME']
				   ,['.FUNCTION_URL','FUNCTION_URL']
				   ,['.ICON_PREVIEW','ICON_CODE',
					   function(){
	                       $('#main-table').find('tr:eq('+(i+1)+')').find('.ICON_PREVIEW').html('<i class="'+data.rows[i].ICON_CODE+'" style="color:black"></i>');
                       }
				    ]
				   ,['.DESCRIPTION','DESCRIPTION']
				    ];
				    $().mapContentJson(data,'#main-table',mapRowArray);
				    $().afterRowDefine();
				    $().crudListener();
				    $().revealListener();
			    }else if(JSONtype=='icon'){
		            var mapRowArray=[
                        'ICON_ID'          
                       ,'ICON_CODE'       
                       ,'DESCRIPTION'
                       ,['.PREVIEW','ICON_CODE',
                           function(){
                               $('#lov').find('tr:eq('+(i+1)+')').find('.PREVIEW').html('<i class="'+data.rows[i].ICON_CODE+'" style="color:black"></i>');
                           }
                        ]
                    ];
	                $().mapContentJson(data,'#lov',mapRowArray);                
	            }else if(JSONtype=='func'){
	                var mapRowArray=[
	                    'FUNCTION_ID'
	                   ,'FUNCTION_NAME'
	                   ,'FUNCTION_CODE'
	                   ,'DESCRIPTION'
	                ];
	                $().mapContentJson(data,'#lov',mapRowArray);
	            }
		    },
      		getUpdateJSON:function(data){
			    if(pageframe=='ui'){
			        var mapRowArray=[
				    ['#FUNCTION_ID','FUNCTION_ID']
				   ,['#FUNCTION_CODE','FUNCTION_CODE']
			       ,['#FUNCTION_NAME','FUNCTION_NAME']
				   ,['#FUNCTION_URL','FUNCTION_URL']
				   ,['#ICON_ID','ICON_ID']
				   ,['#ICON_CODE','ICON_CODE']
				   ,['#DESCRIPTION','DESCRIPTION']
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