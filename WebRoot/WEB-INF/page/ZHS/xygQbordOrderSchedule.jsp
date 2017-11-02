<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>订单进度查询</title>
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
      <div class="ajax_loading" style="z-index:102">
        <i class="fa fa-spinner fa-pulse fa-4x" style="color:white"></i>
      </div>
      <!-- 数据加载动画 end -->
      <!-- 主表格区域 start -->
      <div id="scrollbar" class="table pointer">
        <table id="main-table" data-table="OrderScheduleH">
          <tr>
            <th class="CONTRACT_NUMBER" data-column="db">订单号码</th>
            <th class="PARTY_NAME" data-column="db">客户名称</th>
            <th class="ACCOUNT_NUMBER" data-column="db">客户账号</th>
            <th class="SALES_ORG_NAME" data-column="db">销售公司</th> 
            <th class="SHIP_FROM_ORG_NAME" data-column="db">发货组织</th> 
            <th class="CURR_CODE" data-column="db">币种</th>
            <th class="PRICE_LIST_NAME" data-column="db">价目表</th>
            <th class="ORDER_TYPE_NAME" data-column="db">订单类型</th>
            <th class="STATUS_DESC" data-column="normal">状态</th>
            <th class="CREATION_DATE" data-column="db">创建日期</th>  
            <th class="CUSTOMER_PO" data-column="db">客订PO</th>
            <th class="REMARKS" data-column="db">备注</th>
            <th class="ACTION" data-column="normal">操作</th> 
            <th class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</th> 
            <th class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</th>    
            <th class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</th>      
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
            <td class="CUSTOMER_PO" data-column="db"></td>
            <td class="REMARKS" data-column="db"></td>
            <td class="ACTION" data-column="normal">  
              <i class="fa fa fa-eye view pointer show_detail hidden" title="订单明细" data-show="true" data-reveal-id="detail" data-dismissmodalclass="close-detail-frame" data-dblclick="true"></i>       
            </td>
            <td class="HEADER_ID" style="display:none" data-column="hidden">&nbsp;</td>
            <td class="CUSTOMER_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SALES_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="SHIP_FROM_ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="ORG_ID" style="display:none" data-column="hidden">&nbsp;</td> 
            <td class="PRICE_LIST_ID" style="display:none" data-column="hidden">&nbsp;</td>      
          </tr>
        </table>
      </div>
      <!-- 主表格区域 end -->
      <!-- 主表格按钮区域 start -->
      <div class="table_button" id="table" data-table="OrderScheduleH">
        <div class="setting">
          <i class="fa fa-cog pointer" title="表格设置" data-reveal-id="setting" data-dismissmodalclass="close-setting"></i>
        </div>
        <div class="setting">
          <i class="fa fa-search pointer" title="条件查询" data-reveal-id="query" data-key="true" data-dismissmodalclass="close-query-frame"></i>
        </div>
        <div class="setting">
          <i id="refresh" class="fa fa-refresh pointer" title="刷新数据" data-pagetype="refresh" data-pageframe="table"></i>
        </div>  
        <div id="setting">
          <!-- 设置菜单区域 start -->
          <jsp:include page="public/setting.jsp">
            <jsp:param name="rdtable" value="#main-table"/>
            <jsp:param name="odtable" value="#main-table"/>
            <jsp:param name="pageframe" value="table"/>
            <jsp:param name="alias" value="XQCH" />
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
          <input type="hidden" data-type="number" value="1"/>
          <input type="hidden" data-type="orderby" id="ORDER_BY" value="HEADER_ID ASC"/> 
          <input type="hidden" data-type="cond"/>
          <input type="hidden" data-type="url" value="contract/getTransferContractH.do"/>
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
      <!-- 条件查询区域 start -->
      <div id="query" class="pop_frame row-4">     
        <div class="title pointer">      
          <span><i class="fa fa-search"></i>&nbsp;订单进度查询</span>
        </div>
        <a class="close-query-frame" data-type="close">&#215;</a>
        <div class="line"></div>
        <div class="content row-4">
          <form>
            <label for="CONTRACT_NUMBER_Q" class="left md">订单号码:</label>
            <input type="text" class="left lgx2" id="CONTRACT_NUMBER_Q" name="CONTRACT_NUMBER"/>  
            <br style="clear:both"/>
            <label for="PARTY_NAME_Q" class="left md">客户名称:</label> 
            <input type="text" id="PARTY_NAME_Q" name="PARTY_NAME" class="left lglov" readonly="readonly"/>
            <input type="hidden" id="CUSTOMER_ID_Q" name="CUSTOMER_ID"/>
            <input type="button" id="PARTY_NAME_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="客户查询" data-queryurl="lov/getUserCustPage.do" data-jsontype="cust" data-defaultquery="true" data-th=["销售公司ID","销售公司","客户ID","客户名称","客户账号"] data-td=["ORG_ID&none","ORG_NAME","CUST_ACCOUNT_ID&none","PARTY_NAME&text-left","ACCOUNT_NUMBER"] data-selectname=["客户名称","客户账号"] data-selectvalue=["PARTY_NAME","ACCOUNT_NUMBER"] data-choose=[".ORG_ID",".ORG_NAME",".CUST_ACCOUNT_ID",".PARTY_NAME"] data-recid=["#ORG_ID_Q","#ORG_NAME_Q","#CUSTOMER_ID_Q","#PARTY_NAME_Q"] value="···"/>  
            <br style="clear:both"/>
            <label for="ORG_NAME_Q" class="left md">销售公司:</label> 
            <input type="text" id="ORG_NAME_Q" name="ORG_NAME" class="left lg" readonly="readonly" />
            <input type="hidden" id="ORG_ID_Q" name="ORG_ID" readonly="readonly"/>
            <label for="ORGANIZATION_NAME_Q" class="left md">发货组织:</label> 
            <input type="text" id="ORGANIZATION_NAME_Q" name="ORGANIZATION_NAME" class="left md"  data-modify="true" data-pageframe="query"  data-lovbtn="ORGANIZATION_LOV_Q"  data-param="ORGANIZATION_NAME" />
            <input type="hidden" id="ORGANIZATION_ID_Q" name="ORGANIZATION_ID"/>
            <input type="button" id="ORGANIZATION_LOV_Q" class="left button pointer" data-pageframe="lov" data-reveal-id="lov" data-key="true" data-callback="query" data-bg="lov-modal-bg" data-dismissmodalclass="close-lov" data-lovname="库存组织查询" data-queryurl="lov/getUserOrganization.do" data-jsontype="organ" data-defaultquery="true" data-th=["库存ID","库存编码","库存组织"] data-td=["ORGANIZATION_ID&none","ORGANIZATION_CODE","ORGANIZATION_NAME"] data-selectname=["库存组织","库存代号"] data-selectvalue=["ORGANIZATION_NAME","ORGANIZATION_CODE"] data-choose=[".ORGANIZATION_ID",".ORGANIZATION_NAME"] data-recid=["#ORGANIZATION_ID_Q","#ORGANIZATION_NAME_Q"] value="···"/>         
            <br style="clear:both"/>
            <label for="CREATION_DATE_F" class="left md">创建日期:</label>
            <input type="text" id="CREATION_DATE_F" name="CREATION_DATE_F" class="left time" data-datatype="date" placeholder="起始创建日期"/>
            <label class="left blank"></label>
            <input type="text" id="CREATION_DATE_T" name="CREATION_DATE_T" class="left time" data-datatype="date" placeholder="截止创建日期"/>
            <br style="clear:both"/> 
          </form>
        </div>
        <div class="foot">             
          <button class="right pointer"  data-buttonframe="table" data-keyup="enter" data-crudtype="query" data-pageframe="query">订单查询</button>
        </div> 
      </div>
      <!-- 条件查询区域 end -->
      
<!----------------------------------------------订单明细-------------------------------------------------------- -->      
      
      <div class="detail_frame" id="detail" style="height:577px">
        <div class="title pointer">      
          <span><i class="fa fa-th-list"></i>&nbsp;订单明细</span>
        </div>
        <a class="close-detail-frame" data-type="close">&#215;</a>    
        <div class="line"></div>             
        <div class="detail_header" style="height:182px">
          <input type="hidden" id="CUS_BATCH_L" />
          <label class="mid" for="CONTRACT_NUMBER_L">订单号码</label>
          <input type="text" id="CONTRACT_NUMBER_L" class="long" readonly="readonly"/>
          <label class="mid" for="CURR_CODE_L">币别</label>
          <input type="text" id="CURR_CODE_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <input type="hidden" id="SALES_ORG_ID_L"/>
          <label class="mid" for="PARTY_NAME_L">客户名称</label>
          <input type="text" id="PARTY_NAME_L" class="long" readonly="readonly"/>
          <input type="hidden" id="CUSTOMER_ID_L"/>
          <input type="hidden" id="SHIP_FROM_ORG_ID_L"/>
          <input type="hidden" id="ORG_ID_L"/>
          <label class="mid" for="CUSTOMER_PO_L">客订PO</label>
          <input type="text" id="CUSTOMER_PO_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <input type="hidden" id="PRICE_LIST_ID_L"/>
          <label class="mid" for="STATUS_DESC_L">状态</label>
          <input type="text" id="STATUS_DESC_L" class="long" readonly="readonly"/>
          <label class="mid" for="ERP_STATUS_L">ERP状态</label>
          <input type="text" id="ERP_STATUS_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <label class="mid" for="REQUIRED_QTY_L">总需求量</label>
          <input type="text" id="REQUIRED_QTY_L" class="long" readonly="readonly"/>
          <label class="mid" for="ORDER_QTY_L">总订单量</label>
          <input type="text" id="ORDER_QTY_L" class="long" readonly="readonly"/>
          <br style="clear:both"/>
          <label class="mid" for="BH_QTY_L">总备货量</label>
          <input type="text" id="BH_QTY_L" class="long" readonly="readonly"/>
          <label class="mid" for="FH_QTY_L">总发货量</label>
          <input type="text" id="FH_QTY_L" class="long" readonly="readonly"/>
          <br style="clear:both"/> 
        </div>     
        <!-- 订单明细表格区域 start -->
        <div class="detail_table" style="min-height:293px">
          <table id="oLine" data-table="OrderLine">
            <tr>
              <th class="LINE_NUM" data-column="db" style="min-width:50px">序号</th>
              <th class="DESCRIPTION" data-column="db">本厂型号</th>
              <th class="CARNAME" data-column="db">中文描述</th>
              <th class="SPEC" data-column="db">规格</th>
              <th class="REQUIRED_QUANTITY" data-column="db" style="min-width:50px">需求量</th>
              <th class="ORDER_QUANTITY" data-column="db" style="min-width:50px">订单量</th>
              <th class="BH_QTY" data-column="db" style="min-width:50px">备货量</th>
              <th class="FH_QTY" data-column="db" style="min-width:50px">发货量</th>  
            </tr>
            <tr>
              <td class="LINE_NUM" data-column="db" style="min-width:50px"></td>
              <td class="DESCRIPTION text-left" data-column="db"></td>
              <td class="CARNAME" data-column="db"></td>
              <td class="SPEC" data-column="db"></td>
              <td class="REQUIRED_QUANTITY" data-column="db" style="min-width:50px"></td>
              <td class="ORDER_QUANTITY" data-column="db" style="min-width:50px"></td>        
              <td class="BH_QTY" data-column="db" style="min-width:50px"></td>
              <td class="FH_QTY" data-column="db" style="min-width:50px"></td>
            </tr>
          </table>
        </div>
        <!-- 订单明细表格区域 end --> 
        <div class="table_button" id="sub_table" data-table="OrderLine">
          <div class="setting">
            <i id="sub_refresh" class="fa fa-refresh pointer" data-pagetype="refresh" data-pageframe="sub_table" data-func="$().setParam();"></i>
          </div>
          <div>
            <jsp:include page="./public/pageArrow.jsp" >
              <jsp:param name="pageframe" value="sub_table" />
              <jsp:param name="func" value="$().setParam()" />
            </jsp:include>
            <input type="hidden" data-type="size" value="8"/>
            <input type="hidden" data-type="number" value="1"/>
            <input type="hidden" data-type="orderby" value="XQCQ.LINE_NUM"/> 
            <input type="hidden" data-type="cond"/>
            <input type="hidden" data-type="url" value="contract/getTransferContractL.do"/>
            <input type="hidden" data-type="jsontype" value="subtable"/> 
            <input type="hidden" data-type="autoquery" value="N"/> 
          </div>
        </div>
      </div> 
      <!-- 用户信息存放区域 start -->
      <input type="hidden" id="USER_ID" value="${USER_ID}"/>  
      <input type="hidden" id="INTERACT_CODE" value="ORDER_SCHEDULE"/> 
      <input type="hidden" id="HEADER_ID" value=""/> 
      <!-- 用户信息存放区域 end -->         
    </div> 
    <script>       
        $(function() {
            
            //设置拖拽
            $('#detail').draggable({ handle: '.title' });
            $('#query').draggable({ handle: '.title' }); 
            
            //初始化CRUD和LOV条件查询
            $().crudListener(); 
            $().revealListener(); 

            //设置订单明细查询参数
            $.fn.setParam = function(){
                cusBatch=$('#CUS_BATCH_L').val();
                param=param+'&CUS_BATCH='+cusBatch;
            }  
            
            //汇总需求量，订单量，备货量，发货量
			$.fn.sumLines = function(){
			    var contractNumber = $('#CONTRACT_NUMBER_L').val();
			    param = 'CONTRACT_NUMBER=' + contractNumber;
			    $.ajax({
					type:'post', 
					data:param,
					url:'contract/sumQuantity.do',
					dataType:'json',
					success: function (data) {
					    console.log('sum');
					    $('#REQUIRED_QTY_L').val(data.rows[0].REQUIRED_QTY);
					    $('#ORDER_QTY_L').val(data.rows[0].ORDER_QTY);
					    $('#BH_QTY_L').val(data.rows[0].BH_QTY);
					    $('#FH_QTY_L').val(data.rows[0].FH_QTY);
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
            
            $.fn.detailShow = function(){
                $('.show_detail').off('click');  
                $('.show_detail').on('click',function(){
                    var userType = '${USER_TYPE}';
                    if(userType=='EMP'){
                        //null;
                        $('i[data-status="BOOK"]').parent().css("display","none");
                        $('i[data-status="CONFIRM"]').parent().css("display","none");
                    }else if(userType='CUSTOMER'){
                        $('i[data-status="RECEIVE"]').parent().css("display","none");
                        $('i[data-status="CHECK"]').parent().css("display","none");
                        $('#change_price_btn').css("display","none");
                    }
                    tr=$(this).parent().parent();
                    $('.detail_header input').val('');
                    $('#sub_table input[data-type="number"]').val('1');
                    $('#CONTRACT_NUMBER_L').val(tr.children('.CONTRACT_NUMBER').text());
                    $('#PARTY_NAME_L').val(tr.children('.PARTY_NAME').text());
                    $('#CUS_BATCH_L').val(tr.children('.CONTRACT_NUMBER').text());
                    $('#CUSTOMER_ID_L').val(tr.children('.CUSTOMER_ID').text());
                    $('#SALES_ORG_ID_L').val(tr.children('.SALES_ORG_ID').text());
                    $('#CURR_CODE_L').val(tr.children('.CURR_CODE').text());
                    $('#SHIP_FROM_ORG_ID_L').val(tr.children('.SHIP_FROM_ORG_ID').text());
                    $('#ORG_ID_L').val(tr.children('.ORG_ID').text());
                    $('#CUSTOMER_PO_L').val(tr.children('.CUSTOMER_PO').text());
                    $('#PRICE_LIST_ID_L').val(tr.children('.PRICE_LIST_ID').text());
                    $('#STATUS_DESC_L').val(tr.children('.STATUS_DESC').text());
                    $().sumLines();
                    $('#sub_refresh').click();
                });   
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
                     ,['.STATUS_DESC','STATUS_DESC']
                     ,['.CREATION_DATE','CREATION_DATE']  
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
                    ,['.SPEC','SPEC']
                    ,['.REQUIRED_QUANTITY','REQUIRED_QUANTITY']
                    ,['.ORDER_QUANTITY','ORDER_QUANTITY']
                    ,['.BH_QTY','BH_QTY']
                    ,['.FH_QTY','FH_QTY']
                    ,['.STATUS_DESC','STATUS_DESC',
                        function(){
                        	if(i==0){
                        	    $('#ERP_STATUS_L').val(data.rows[i].STATUS_DESC);
                        	} 	
                        }
                     ]
                     ];
                    $().mapContentJson(data,'#oLine',mapRowArray);
                    width='-'+parseInt($('#detail').css('width'))/2+'px';
                    $('#detail').css('margin-left',width); 
                    $().crudListener();             
                    $().revealListener();                    
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