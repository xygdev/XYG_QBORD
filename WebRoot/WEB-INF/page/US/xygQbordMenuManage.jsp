<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Menu Manage</title>
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
        .ui-widget.ui-widget-content{border:0;}
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
        <table id="main-table" data-table="MenuHeader">
          <tr>
            <th class="MENU_CODE" data-column="db">Code</th>
            <th class="MENU_NAME" data-column="db">Menu</th>
            <th class="DESCRIPTION" data-column="db">Description</th>
            <th class="ICON_PREVIEW" data-column="db">Icon</th>
            <th class="ACTION" data-column="normal">Action</th> 
            <th class="MENU_ID" style="display:none" data-column="hidden">&nbsp;</th>     
          </tr>
          <tr>
            <td class="MENU_CODE" data-column="db"></td>
            <td class="MENU_NAME" data-column="db"></td>
            <td class="DESCRIPTION" data-column="db"></td>
            <td class="ICON_PREVIEW" data-column="db"></td>
            <td class="ACTION" data-column="normal">
              <i class="fa fa-pencil fa-fw update pointer hidden" title="Update" data-show="true" data-reveal-id="ui" data-key="true" data-dismissmodalclass="close-ui-frame" data-crudtype="pre-update" data-preupdateurl="menu/preUpdateMenuHeader.do" data-type="update" data-updateparam=["MENU_ID",".MENU_ID"]></i>            
              <i class="fa fa fa-eye view pointer show_detail hidden" title="Detail" data-show="true" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame" ></i>
            </td>
            <td class="MENU_ID" style="display:none" data-column="hidden">&nbsp;</td>
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="MenuHeader">
        <div class="setting">
          <i class="fa fa-cog pointer" title="Table Setting" data-reveal-id="setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" title="Conditional Query" data-reveal-id="query" data-key="true" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i class="fa fa-plus-circle pointer" title="Insert" data-reveal-id="ui" data-key="true"  data-dismissmodalclass="close-ui-frame" data-crudtype="pre-insert" data-type="insert"></i>
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
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="MENU_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="menu/getMenuHeaderPage.do"/>
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
        <jsp:param name="tableId" value="#main-table"/>
      </jsp:include>
      <!-- 个人配置区域 end -->
      <!-- lov区域 start -->
      <jsp:include page="./public/lov.jsp"></jsp:include>
      <!-- lov区域 end -->
      <!-- 更新/新增菜单区域 start -->
      <div id="ui" class="pop_frame row-2">     
        <div class="title pointer">      
          <span data-type="update"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;Update</span>
          <span data-type="insert"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;Insert</span>
        </div>
        <a class="close-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-2">
          <form id="updateData">
            <input type="hidden" id="MENU_ID" name="MENU_ID" data-update="db"/>
            <label for="MENU_CODE" class="left md">Code</label>
            <input type="text" id="MENU_CODE" name="MENU_CODE" data-update="db" required="required" class="left lg"/>
            <label for="MENU_NAME" class="left md">Menu</label>
            <input type="text" id="MENU_NAME" name="MENU_NAME" data-update="db" required="required" class="left lg"/>
            <label for="DESCRIPTION" class="left md">Desc</label>
            <input type="text" id="DESCRIPTION" name="DESCRIPTION" data-update="db" class="left lg"/>
            <label for="ICON_CODE" class="left md">Icon</label> 
            <input type="text" id="ICON_CODE" name="ICON_CODE" data-update="db" class="left md"  readonly="readonly" required="required"/>
            <input type="hidden" id="ICON_ID" name="ICON_ID" data-update="db"/>
            <input type="button" id="ICON_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="图标查询" data-queryurl="lov/getIconPage.do" data-jsontype="icon" data-defaultquery="true" data-th=["Id","Code","Desc","Preview"] data-td=["ICON_ID&none","ICON_CODE","DESCRIPTION","PREVIEW"] data-selectname=["Code","Desc"] data-selectvalue=["ICON_CODE","ICON_DESC"] data-choose=[".ICON_ID",".ICON_CODE"] data-recid=["#ICON_ID","#ICON_CODE"] value="···"/>  
          </form>
        </div>
        <div class="foot">       
          <button class="right update_confirm pointer" data-type="update" data-keyup="enter" data-crudtype="update" data-pageframe="ui" data-updateurl="menu/updateMenuHeader.do" data-func="$().beforeInsert();">Update</button>
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="ui" data-inserturl="menu/insertMenuHeader.do" data-func="$().beforeInsert();">Insert</button>
        </div>    
      </div> 
      <!-- 更新/新增菜单区域 end -->
      <!-- 条件查询区域 start -->
      <div id="query" class="pop_frame row-1">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;Query</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-1">
          <form>
            <label for="MENU_CODE_Q" class="left md">Code:</label> 
            <input type="text" id="MENU_CODE_Q" name="MENU_CODE" class="left md" data-modify="true" data-suffixflag="true" data-pageframe="query" data-lovbtn="MENU_LOV_Q" data-param="MENU_CODE"/>
            <input type="hidden" id="MENU_ID_Q" name="MENU_ID"/>
            <input type="button" id="MENU_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Menu Query" data-queryurl="lov/getMenuPage.do" data-jsontype="menu" data-defaultquery="true" data-th=["ID","Code","Menu","Desc"] data-td=["MENU_ID&none","MENU_CODE","MENU_NAME","DESCRIPTION"] data-selectname=["Code","Menu"] data-selectvalue=["MENU_CODE","MENU_NAME"] data-choose=[".MENU_ID",".MENU_CODE",".MENU_NAME"] data-recid=["#MENU_ID_Q","#MENU_CODE_Q","#MENU_NAME_Q"] value="···"/>
            <label for="MENU_NAME_Q" class="left md">Menu:</label>
            <input type="text" id="MENU_NAME_Q" name="MENU_NAME"  class="left lg" readonly="readonly"/>
          </form>
        </div>
        <div class="foot">             
          <button class="right pointer" data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">Query</button>
        </div> 
      </div>
      <!-- 条件查询区域 end -->
   
<!----------------------------------------------菜单明细-------------------------------------------------------- -->      
      
      <div class="detail_frame" id="detail">
        <div class="title pointer">      
          <span><i class="fa fa-th-list"></i>&nbsp;Detail</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>    
        <div class="line"></div>             
        <div class="detail_header">
          <input type="hidden" id="MENU_ID_LINES" />
          <label class="mid" for="MENU_CODE_LINES">Code</label>
          <input type="text" id="MENU_CODE_LINES" class="long" readonly="readonly"/>
          <label class="mid" for="MENU_NAME_LINES">Menu</label>
          <input type="text" id="MENU_NAME_LINES" class="long" readonly="readonly"/>
        </div>     
        <!-- PO明细表格区域 start -->
        <div class="detail_table">
          <table id="mLine" data-table="MenuLine">
            <tr>
              <th class="MENU_SEQUENCE" data-column="db">Seq</th>
              <th class="SUB_MENU_CODE" data-column="db">Sub Code</th>
              <th class="SUB_MENU_NAME" data-column="db">Sub Menu</th>
              <th class="FUNCTION_CODE" data-column="db">Funciton Code</th>
              <th class="FUNCTION_NAME" data-column="db">Function</th>
              <th class="ACTION" data-column="normal">Action</th> 
              <th class="MENU_ID" style="display:none" data-column="hidden">&nbsp;</th>            
            </tr>
            <tr>
              <td class="MENU_SEQUENCE" data-column="db"></td>
              <td class="SUB_MENU_CODE" data-column="db"></td>
              <td class="SUB_MENU_NAME" data-column="db"></td>
              <td class="FUNCTION_CODE" data-column="db"></td>
              <td class="FUNCTION_NAME" data-column="db"></td>
              <td class="ACTION" data-column="normal">
                <i class="fa fa-trash fa-fw pointer hidden" data-show="true" title="Delete" data-refresh="sub_refresh" data-crudtype="del" data-delurl="menu/deleteL.do" data-delmsg="Delete Seq:" data-col="MENU_SEQUENCE" data-delparam=["MENU_SEQUENCE",".MENU_SEQUENCE"] data-func="$().setParam();"></i>
              </td>
              <td class="MENU_ID" style="display:none" data-column="hidden">&nbsp;</td>                          
            </tr>
          </table>
        </div>
        <!-- 菜单明细表格区域 end --> 
        <div class="table_button" id="sub_table" data-table="MenuLine">
          <div class="setting">
            <i class="fa fa-plus-circle pointer" data-key="true" data-reveal-id="detail_ui" data-bg="detail-modal-bg" data-dismissmodalclass="close-detail-ui-frame" data-crudtype="pre-insert" data-type="insert" data-func="$().autoAddSeq();"></i>
          </div>
          <div class="setting">
            <i id="sub_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="sub_table" data-func="$().setParam();"></i>
          </div>
          <div>
            <jsp:include page="./public/pageArrow.jsp">
              <jsp:param name="pageframe" value="sub_table"/>
              <jsp:param name="func" value="$().setParam();"/>
            </jsp:include>
            <input type="hidden" data-type="size" value="5"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="MENU_SEQUENCE ASC"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="menu/getMenuLinePage.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
            <input type="hidden" data-type="autoquery" value="N"/> 
          </div>
        </div>
      </div>    
      <!-- 菜单明细新增区域 start -->
      <div id="detail_ui" class="pop_frame row-3" style="z-index:104">     
        <div class="title pointer">          
          <span data-type="insert"><i class="fa fa-th-list fa-1x" aria-hidden="true"></i>&nbsp;Insert Detail</span>
        </div>
        <a class="close-detail-ui-frame" data-type="close">&#215;</a>
        <div class="line"></div>  
        <div class="content detail_ui_tabs" style="padding:0;height:127px;">   
          <form>
            <ul>
              <li><a href="#tabs-1">Sub Menu</a></li>
              <li><a href="#tabs-2">Function</a></li>
            </ul>
            <input type="hidden" id="MENU_ID_DETAIL" name="MENU_ID" data-update="db" value=""/>
            <label for="MENU_SEQUENCE" class="left md" style="margin-top:10px;">Seq.</label> 
            <input type="text" id="MENU_SEQUENCE" name="MENU_SEQUENCE" data-update="db" class="left lg" required="required"  style="margin-top:15px;"/>           
            <br style="clear:both"/>
            <div id="tabs-1" class="tab">            
              <div>
                <label for="SUB_MENU_CODE" class="left md">Code</label> 
                <input type="text" id="SUB_MENU_CODE" name="SUB_MENU_CODE" data-update="db" class="left md" data-modify="true" data-suffixflag="true" data-pageframe="detail_ui" data-lovbtn="SUB_MENU_LOV" data-param="MENU_CODE"/>
                <input type="hidden" id="SUB_MENU_ID" name="SUB_MENU_ID" data-update="db"/>
                <input type="button" id="SUB_MENU_LOV" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Menu Query" data-queryurl="lov/getMenuPage.do" data-jsontype="menu" data-defaultquery="true" data-th=["Id","Code","Name","Desc"] data-td=["MENU_ID&none","MENU_CODE","MENU_NAME","DESCRIPTION"] data-selectname=["Code","Name"] data-selectvalue=["MENU_CODE","MENU_NAME"] data-choose=[".MENU_ID",".MENU_CODE",".MENU_NAME"] data-recid=["#SUB_MENU_ID","#SUB_MENU_CODE","#SUB_MENU_NAME"] value="···"/>  
                <label for="SUB_MENU_NAME" class="left md">Name</label> 
                <input type="text" id="SUB_MENU_NAME" name="SUB_MENU_NAME" data-update="db" class="left lg" readonly="readonly"/>
              </div>              
            </div>
            <div id="tabs-2" class="tab">            
              <div>
                <label for="FUNCTION_CODE" class="left md">Code</label> 
                <input type="text" id="FUNCTION_CODE" name="FUNCTION_CODE" data-update="db" class="left md" data-modify="true" data-suffixflag="true" data-pageframe="detail_ui" data-lovbtn="FUNCTION_LOV_Q" data-param="FUNCTION_CODE"/>
                <input type="hidden" id="FUNCTION_ID" name="FUNCTION_ID" data-update="db"/>
                <input type="button" id="FUNCTION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="detail_ui" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="Function Query" data-queryurl="lov/getFuncPage.do" data-jsontype="func" data-defaultquery="true" data-th=["Id","Code","Name","Desc"] data-td=["FUNCTION_ID&none","FUNCTION_CODE","FUNCTION_NAME","DESCRIPTION"] data-selectname=["Code","Name"] data-selectvalue=["FUNCTION_CODE","FUNCTION_NAME"] data-choose=[".FUNCTION_ID",".FUNCTION_CODE",".FUNCTION_NAME"] data-recid=["#FUNCTION_ID","#FUNCTION_CODE","#FUNCTION_NAME"] value="···"/>                       
                <label for="FUNCTION_NAME" class="left md">Name</label> 
                <input type="text" id="FUNCTION_NAME" name="FUNCTION_NAME" data-update="db" class="left lg"  readonly="readonly"/>
              </div>              
            </div>            
          </form> 
        </div>
        <div class="foot">            
          <button class="right update_confirm pointer" data-type="insert" data-keyup="enter" data-crudtype="insert" data-pageframe="detail_ui" data-inserturl="menu/insertMenuLine.do" data-refresh="sub_refresh" data-func="$().setParam();">新增</button>
        </div>   
      </div>          
      <!-- 菜单明细新增/更新区域 end -->  
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="MENU_MANAGE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->         
    </div> 
    <script>       
        $(function() {    
            //设置拖拽
            $('#ui').draggable({ handle: '.title' });
            $('#detail').draggable({ handle: '.title' });
            $('#detail_ui').draggable({ handle: '.title' });
            $('#query').draggable({ handle: '.title' });
                     
            //设置新增更新菜单明细tab分栏        
            $('.detail_ui_tabs').tabs();
            
            //初始化CRUD和LOV条件查询
            $().crudListener(); 
            $().revealListener(); 
             
            $.fn.beforeInsert = function(){
                //RegExpValidate('^\\w+$','MENU_CODE','regExpError("菜单编码格式不符合规范!");');
                //RegExpValidate('^[\u4e00-\u9fa5\d0-9]{0,}$','MENU_NAME','regExpError("菜单名称必须为汉字和数字!");');
            }          
            
            $.fn.setParam = function(){
                menuId=$('#MENU_ID_LINES').val();
                param=param+'&MENU_ID='+menuId;
            }   
            
            $.fn.detailShow = function(){
                $('.show_detail').off('click');  
                $('.show_detail').on('click',function(){
                    tr=$(this).parent().parent();
                    menuId=tr.children('.MENU_ID').text();
                    menuCode=tr.children('.MENU_CODE').text();
                    menuName=tr.children('.MENU_NAME').text();
                    $('.detail_header input').val('');
                    $('#sub_table input[data-type="number"]').val('1');
                    $('#MENU_ID_LINES').val(menuId);
                    $('#MENU_CODE_LINES').val(menuCode);
                    $('#MENU_NAME_LINES').val(menuName);
                    $('#sub_refresh').click();
                });   
            }   
            
            $.fn.autoAddSeq = function(){
                menuId = $('#MENU_ID_LINES').val();
                param = 'MENU_ID='+menuId;
                $.ajax({
                    type:'post', 
                    data:param,
                    url:'menu/getAutoAddSeq.do',
                    dataType:'json',
                    success: function (data) {
                        $('#MENU_ID_DETAIL').val(menuId);
                        $('#MENU_SEQUENCE').val(data.rows[0].MENU_SEQUENCE);
                    },
                    error: function () {
                        layer.alert('Get Data Failed!',{title:'Warning',offset:[150]});
                    }           
                }); 
            }                      
        });
         
        jQuery.json={
            getContent:function(data,JSONtype){    
                if(JSONtype=='table'){
                    var mapRowArray=[
	                ['.MENU_ID','MENU_ID']    
	               ,['.MENU_CODE','MENU_CODE']
	               ,['.MENU_NAME','MENU_NAME']   
	               ,['.ICON_PREVIEW','ICON_CODE',
                       function(){
                           $('#main-table').find('tr:eq('+(i+1)+')').find('.ICON_PREVIEW').html('<i class="'+data.rows[i].ICON_CODE+'" style="color:black"></i>');
                       }
                    ]
	               ,['.DESCRIPTION','DESCRIPTION']
	                ];
	                $().mapContentJson(data,'#main-table',mapRowArray);
                    $().crudListener();
                    $().detailShow();
                    $().revealListener(); 
                }else if(JSONtype=='subtable'){            
                    var mapRowArray=[
                    ['.SUB_MENU_CODE','SUB_MENU_CODE']
                   ,['.SUB_MENU_NAME','SUB_MENU_NAME']
                   ,['.FUNCTION_CODE','FUNCTION_CODE']
                   ,['.FUNCTION_NAME','FUNCTION_NAME']                 
                   ,['.MENU_ID','MENU_ID']
                   ,['.MENU_SEQUENCE','MENU_SEQUENCE']
                    ];
                    $().mapContentJson(data,'#mLine',mapRowArray);
                    width='-'+parseInt($('#detail').css('width'))/2+'px';
                    $('#detail').css('margin-left',width); 
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
                }else if(JSONtype=='menu'){
                    var mapRowArray=[
	                    'MENU_ID'
	                   ,'MENU_NAME'
	                   ,'MENU_CODE'
	                   ,'DESCRIPTION'
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
            getUpdateJSON:function(data,pageframe){   
                if(pageframe=='ui'){         
                    var mapRowArray=[
                    ['#MENU_ID','MENU_ID']    
                   ,['#MENU_CODE','MENU_CODE']
                   ,['#MENU_NAME','MENU_NAME']   
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
 