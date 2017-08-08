/*********************************************************
                    基于Jquery1.11.3版本
                        Bootstrap
                      Juery动态菜单功能
                      creat by bird
*********************************************************/

	/*******************************************************
							修改日志
				2016.06.06 创建js文件,初始程序逻辑运行成功
				2016.06.07 根据BootstrapUI,修改程序内容
				2016.08.09 为功能新增icon设置功能
				2016.08.10 整个动态功能逻辑推倒重构，更改了JSON数据的格式，
				           参考后台数据的关系逻辑，使用了类似于一维数组的JSON格式，
				           用prev(menu)的方式，让父菜单与子菜单之间产生关联，
				           使用循环遍历的方式，动态生成菜单。
				           （之前的方法，存在过多Hard Code，且JSON格式
				           多层嵌套，过于复杂繁琐，不利于后端构造，且扩展性较差）
			    2016.11.25 修改面包屑跳转逻辑
			    2017.03.06 大规模改动 新增tab滑动条操作
			    2017.06.06 修改Function的HREF属性名称为URL
			               修改js文件名称为jQuery.automenu.js
			    2017.06.14 修改tabSelection方法中，refresh按钮的tab选择器
			    2017.07.03 修改AutoMenu菜单读取方法的逻辑
	*******************************************************/
    //监听浏览器尺寸变化,iframe高度随浏览器变化而动态变化
    var isResizing = false;
    window.onresize=function(){ 
    	if (!isResizing) { 
    		console.log('do resizing now!'); 
    		width=$(window).width();
            height=$(window).height();
            if(width>=768){
            	headerheight=$('section.content-header').outerHeight();
            	ifmheight=height-headerheight-50;
            	$('iframe').css('height',ifmheight+'px');
            }else{
                logoheight=$('a.logo').height();
            	headerheight=$('section.content-header').outerHeight();
            	ifmheight=height-logoheight-headerheight-50;
            	$('iframe').css('height',ifmheight+'px');
           	}
    		setTimeout(function () { 
    			isResizing = false; 
    		}, 1000); 
    	} 
    	isResizing = true; 
    }; 
    
    //初始化iframe,根据window高度 动态设定iframe高度
    $.fn.autoIframe = function(){
    	width=$(window).width();
        height=$(window).height();
        if(width>=768){
            headerheight=$('section.content-header').outerHeight();
            ifmheight=height-headerheight-50;
            $('iframe').css('height',ifmheight+'px');
        }else{
            logoheight=$('a.logo').height();
            headerheight=$('section.content-header').outerHeight();
            ifmheight=height-logoheight-headerheight-50;
            $('iframe').css('height',ifmheight+'px');
        }
    }
    
    //页面加载时,先执行一次初始化iframe
    $().autoIframe();
    
    //tab栏 按钮动作绑定
    $.fn.tabListener = function(){
    	$('a[data-tabfunc]').off('clcik');
    	$('i[data-tabclose]').off('clcik');
    	$('a[data-tabfunc]').on('click', function(e) {
    		e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
    		var func_id = $(this).data().tabfunc;
    		$('a[data-funcid]').css({'text-shadow':'','color':''});
		    $('a[data-funcid="'+func_id+'"]').css({'text-shadow':'#fff 1px 1px 5px','color':'#fff'});
    		$('.content_tab_frame a').removeClass('active');
    		$(this).addClass('active');
		    $.fn.scrollToTab(this);
		    $('#iframe_area iframe').css('display','none');
		    $('#iframe_area').find('iframe[data-tabfunc="'+func_id+'"]').css('display','block');
    	});
    	
    	$('i[data-tabclose]').on('click', function() {
    		var func_id = $(this).parent().data().tabfunc;
    		//console.log($(this).parent().css('color'));
    		//此处的颜色判定 暂时为hard code
    		var color = $(this).parent().css('color');
    		if(color =='rgb(255, 255, 255)'){
    			$(this).parent().prev().click();
    			//console.log('black');
    		};
    		$('#iframe_area').find('iframe[data-tabfunc="'+func_id+'"]').remove();
    		$('.content_tab_frame').find('a[data-tabfunc="'+func_id+'"]').remove();	
    	});
    }
    
    $.fn.calSumWidth = function(t) {
		var i = 0;
		return $(t).each(function() {
			i += $(this).outerWidth(!0)
		}),
		i
	}
    
    /**** 滑动到指定的tab按钮 ****/
    $.fn.scrollToTab = function(t) {
		var f = $().calSumWidth($(t).prevAll()),
		e = $().calSumWidth($(t).nextAll()),
		o = $().calSumWidth($("section.content-header").children().not(".content_tab_area")),
		r = $("section.content-header").outerWidth(!0) - o,
		i = 0,
		u;
		if ($(".content_tab_frame").outerWidth() < r) i = 0;
		else if (e <= r - $(t).outerWidth(!0) - $(t).next().outerWidth(!0)) {
			if (r - $(t).next().outerWidth(!0) > e) for (i = f, u = t; i - $(u).outerWidth() > $(".content_tab_frame").outerWidth() - r;) i -= $(u).prev().outerWidth(),
			u = $(u).prev()
		} else f > r - $(t).outerWidth(!0) - $(t).prev().outerWidth(!0) && (i = f - $(t).prev().outerWidth(!0));
		$('.content_tab_frame').css("margin-left",0 - i + "px");
		/*动画效果带有卡顿,影响体验,在解决前暂不使用animate动画效果
		$(".content_tab_frame").animate({
			marginLeft: 0 - i + "px"
		},
		"fast");
		*/	
	}
    
    
    /***** 全屏&取消全屏 调用的相关操作 start *****/
    function screenChange(){
    	console.log('screen change');
    	var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;
    	console.log(fullscreenElement);
    	if(typeof(fullscreenElement)!='undefined'&&fullscreenElement!=null){
    		$('a.tab_button_fullscreen[fullscreen="false"]').css('display','none');
			$('a.tab_button_fullscreen[fullscreen="true"]').css('display',''); 
		}else{
			$('a.tab_button_fullscreen[fullscreen="true"]').css('display','none');
			$('a.tab_button_fullscreen[fullscreen="false"]').css('display','');
		}
    }
    /***** 全屏&取消全屏 调用的相关操作 end *****/
    
    
    $.fn.tabBtn = function(){
    	$('a.tab_button_right').off('clcik');
    	$('a.tab_button_left').off('clcik');
    	$('a.tab_button_fullscreen').off('clcik');
    	
    	/**** 左滑按钮 ****/
    	$('a.tab_button_left').on('click', function(e) {
    		e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
    		var f = Math.abs(parseInt($(".content_tab_frame").css("margin-left"))),
    		g = $().calSumWidth($('section.content-header').children().not(".content_tab_area")),
    		h = $("section.content-header").outerWidth(!0) - g,
    		i, 
    		j,
    		k = 0;
    		if ($(".content_tab_frame").width() < h) return !1;
    		for (j = $(".content_tab:first"), i = 0; i + $(j).outerWidth(!0) <= f;) i += $(j).outerWidth(!0),
    		j = $(j).next();
    		if (i = 0, $().calSumWidth($(j).prevAll()) > h) {
				while (i + $(j).outerWidth(!0) < h && j.length > 0) i += $(j).outerWidth(!0),
				j = $(j).prev();
				k = $().calSumWidth($(j).prevAll())
			}
    		console.log('k:'+k);
    		$(".content_tab_frame").animate({
				marginLeft: 0 - k + "px"
			},
			"fast")
    	});
    	
    	/**** 右滑按钮 ****/
    	$('a.tab_button_right').on('click', function(e) {
    		e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
    		var f = Math.abs(parseInt($(".content_tab_frame").css("margin-left"))),
    		g = $().calSumWidth($('section.content-header').children().not(".content_tab_area")),
    		h = $("section.content-header").outerWidth(!0) - g,
    		i,
    		j,
    		k = 0;
    		if ($(".content_tab_frame").width() < h) return !1;
    		for (j = $(".content_tab:first"), i = 0; i + $(j).outerWidth(!0) <= f;) i += $(j).outerWidth(!0),
    		j = $(j).next();
    		
    		for (i = 0; i + $(j).outerWidth(!0) < h && j.length > 0;) i += $(j).outerWidth(!0),
			j = $(j).next();
			k = $().calSumWidth($(j).prevAll());
			console.log('k:'+k);
			k > 0 && $(".content_tab_frame").animate({
				marginLeft: 0 - k + "px"
			},
			"fast")
    	});
    	
    	/**** 开启全屏按钮 ****/
    	$('a.tab_button_fullscreen[fullscreen="false"]').on('click', function(e) {
    		e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
    		var n = document.documentElement;
    		var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;
    		console.log('debug1');
    		console.log(fullscreenElement);
    		if(typeof(fullscreenElement)=='undefined'||fullscreenElement==null){
    			n.requestFullscreen ? n.requestFullscreen() : n.mozRequestFullScreen ? n.mozRequestFullScreen() : n.webkitRequestFullScreen && n.webkitRequestFullScreen();	
    		}else{
    			return !1;
    		}  
    	});
    	
    	/**** 取消全屏按钮 ****/
    	$('a.tab_button_fullscreen[fullscreen="true"]').on('click', function(e) {
    		e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）    	
    		var n = document;
    		var fullscreenElement = document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement;
    		console.log('debug2');
    		console.log(fullscreenElement);
    		if(typeof(fullscreenElement)!='undefined'&&fullscreenElement!=null){
    			n.exitFullscreen ? n.exitFullscreen() : n.mozCancelFullScreen ? n.mozCancelFullScreen() : n.webkitCancelFullScreen && n.webkitCancelFullScreen();		
    			//$(this).css('display','none');
    			//$('a.tab_button_fullscreen[fullscreen="false"]').css('display','');
    		}else{
    			return !1;
    		}   		 
    	});
    	
    	/**** 多浏览器监听 全屏/取消全屏事件 ****/
    	document.addEventListener("fullscreenchange", function(e) {
    		screenChange();
    	});
    	document.addEventListener("mozfullscreenchange", function(e) {
    		screenChange();
    	});
    	document.addEventListener("webkitfullscreenchange", function(e) {
    		screenChange();
    	});
    	document.addEventListener("msfullscreenchange", function(e) {
    		screenChange();
    	});
    }
    
    $().tabBtn();
    
    
    $('a[data-tabtype]').on('click', function(e) {
    	e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
        $().tabSelection($(this).data('tabtype'));
    });
    
    $.fn.tabSelection = function(tabtype){
    	if(tabtype=='closeAll'){
    		$('a[data-tabfunc="0"]').click();
    		$('a.content_tab').not('a[data-tabfunc="0"]').remove();
    	}else if(tabtype=='closeOthers'){
    		$('a.content_tab.active').click();
    		$('a.content_tab').not('a[data-tabfunc="0"]').not('a.active').remove();
    	}else if(tabtype='refreshTab'){
    		var tabfunc = $('a.content_tab.active').attr('data-tabfunc');//选择器修改 MODIFY BY BIRD 2017.06.14
    		//console.log(tabfunc);
    		$('iframe[data-tabfunc="'+tabfunc+'"').attr('src', $('iframe[data-tabfunc="'+tabfunc+'"').attr('src'));
    	}
    }

	$.fn.menu=function(menu_url,set_funcid_url){
		$.ajax({
			type:'post', 
			url:menu_url,
			dataType:'json',
			success: function (data) {
				var count;
				for(i=0;i<data.length;i++){
					if(data[i].PREV_CODE==null||data[i].PREV_CODE==''){	
						if(data[i].CODE==null||data[i].CODE==''){
							$('ul.sidebar-menu').append("<li class=\"treeview\"><a href=\"#\" data-href=\""+data[i].URL+"\" data-funcid=\""+data[i].FUNC_ID+"\"><i class=\""+data[i].ICON+"\"></i><span>"+data[i].FUNC+"</span></a></li>");   
						}else if(data[i].CODE!=null||data[i].CODE!=''){
							$('ul.sidebar-menu').append("<li class=\"treeview "+data[i].CODE+"\"><a href=\"#\"><i class=\""+data[i].ICON+"\"></i><span>"+data[i].NAME+"</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu\"></ul></li>");

						}else{
							alert("error!")
						}
					}else{				
						if(data[i].FUNC==null||data[i].FUNC==''){
							var j = $('ul.sidebar-menu').find('.'+data[i].CODE).length;
							if(j){
								$('li.'+data[i].PREV_CODE+' ul').append($('ul.sidebar-menu').find('.'+data[i].CODE).clone());
							}else{
								$('.'+data[i].PREV_CODE+' ul:eq(0)').append("<li class=\"treeview "+data[i].CODE+"\"><a href=\"#\"><i class=\""+data[i].ICON+"\"></i><span>"+data[i].NAME+"</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu\"></ul></li>");
							}
							
						}else if(data[i].FUNC!=null&&data[i].FUNC!=''){
							var k = $(('a[data-funcid="'+data[i].FUNC_ID+'"]'),$('.'+data[i].PREV_CODE)).length;
							if(k){
								console.log('skip');
							}else{
								$('.'+data[i].PREV_CODE+' ul:eq(0)').append("<li><a href=\"#\" data-href=\""+data[i].URL+"\" data-funcid=\""+data[i].FUNC_ID+"\"><i class=\""+data[i].ICON+"\"></i>"+data[i].FUNC+"</a></li>");
							}
						}					
					}	
				}
				$('a[data-href]').on('click', function(e) {
					e.preventDefault();//阻止<a>标签默认的点击事件（超链接跳转）
				    value=$(this).data().href;	
				    var name=$(this).text();
				    /****modify by bird 2016.12.12****/
				    var func_id=$(this).data().funcid;
				    /*将Func_id保持到Session中,根据实际需求选择是否启用
				    var param='FUNC_ID='+func_id;
				    
				    $.ajax({
				    	type:'post', 
				    	data:param,
				    	url:set_funcid_url				    	
				    });
				    */
				    /****modify by bird 2016.12.12****/
				    
				    /****modify by bird 2016.12.20****/
				    $('a[data-funcid]').css({'text-shadow':'','color':''});
				    $(this).css({'text-shadow':'#fff 1px 1px 5px','color':'#fff'});
				    /****modify by bird 2016.12.20****/
				    
				    
				    if($('.content_tab_frame').find('a[data-tabfunc="'+func_id+'"]').length>0){
				    	$('.content_tab_frame').find('a[data-tabfunc="'+func_id+'"]').click();
				    }else{
				    	$('.content_tab_frame a').removeClass('active');
				    	$('.content_tab_frame').append('<a class="content_tab active pointer" data-tabfunc="'+func_id+'" data-tabactive="true">'+name+'&nbsp;<i class="fa fa-times" data-tabclose="true" style="color:gray"></i></a>');
				    	
				    	$.fn.scrollToTab($(".content_tab.active"));
				    	
				    	$('#iframe_area iframe').css('display','none');
				        $('#iframe_area').append('<iframe class="content_iframe" src="'+value+'" data-tabfunc="'+func_id+'" frameborder="0" scrolling="yes" framespacing="0" ></iframe>');
				        $().autoIframe();
				    }
				    $().tabListener();

					/***modify by bird 2017.3.7***/
				    $('iframe:visible').focus();//焦点foucs到可视的iframe中
					//$('#mainframe').focus();//焦点focus到iframe中,此处iframe选择器为hardcode,有待修改
					/***modify by bird 2017.3.7***/
				});
			},error: function(){
			    alert("获取json数据错误");
			}
	    });		
	}
	
	
	
