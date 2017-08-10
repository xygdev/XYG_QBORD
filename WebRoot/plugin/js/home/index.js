// JavaScript Document

var height = $(window).height();
var header = $('#header').height();
var footer = $('#footer').height();
var lian = $('.lian').height();


$(function() {
  $('.nav li').hover(function() {
      $(this).find('.xiala').stop().slideDown("fast");
  }, function() {
      $(this).find('.xiala').stop().slideUp("fast");
  });

	if($("#tender-content-ajax").length > 0){

        var catid = $("#tender-content-ajax").data('id'),
        	limit = $("#tender-content-ajax").data('limit'),
        	next_page = 2,
        	already_rquery = '';
        $('.tender-more').click(function(){
        if(next_page != 0 && (already_rquery != next_page)){
            already_rquery = next_page;
            $.ajax({
              type: "post",
              url: "index.php?m=Ajax&a=tender_list",
              data: {page:next_page,catid:catid,limit:limit},
              beforeSend: function(XMLHttpRequest){
                $(".tender-more").text($(".tender-more").data('load'));
              },
              success: function(data, textStatus){
                var list = '', pic = '', bidding = '',url = '';
				if(data['list'] != null){
					$.each(data.list, function(i,item) {
						if(item.thumb){ pic =  item.thumb;}else{ pic ="/public/Pc/img/tender_nopic.gif";}
						if(item.bidding){ 
							bidding = "<span>正在招标</span>";
							url = '<a href="'+item.url+'" class="tender-cast cast-on">立即招标</a>';
						}else{ 
							bidding ="";
							url='<a href="javascript:void(0);" class="tender-cast">立即招标</a>';
						}

						list += '<li><div class="pic"><img src="'+pic+'" alt="" />'+bidding+'</div><div class="content"><div class="text"><h2>'+item.title+'</h2><p>'+item.createtime+'</p></div><div class="text-down clearfix"><a href="'+item.file+'" target="_blank" class="tender-see">查看详情</a>'+url+'</div></div></li>';
					});

					$(".tender ul").append(list);
					next_page = data.next_page;
				}else{
					$(".tender-more").text($(".tender-more").data('text'));
				}
              },
              complete: function(XMLHttpRequest, textStatus){
                $(".tender-more").text($(".tender-more").data('text'));
              },
              error: function(){
                ZENG.msgbox.show("请求出错处理", 1, 3000);
                //alert("请求出错处理");//请求出错处理
              },
              dataType:"json"
            });
        }
        });
	}


	/*---------- 来访联系 ----------*/
    $("#message").find('input[type="submit"]').click(function(){
        var url = $(this).attr('rel'),
            yourname = $('input[name="truename"]').val(),
            mobile = $('input[name="mobile"]').val(),
            email = $('input[name="email"]').val(),
            content = $('textarea[name="content"]').val();
        $.post(url,{truename:yourname,mobile:mobile,email:email,content:content},function(data){
            if(data.r){
                $("#message").find('input[type="text"]').val('');
                $("#message").find('textarea').val('');
                alert(data.msg);
            }else{
                alert(data.msg);
            }
        },"json")
    })


  if($('.marketing').length>0){ //营销网络
    getNetPage();
  }


})

function resetVerifyCode(){
    var timenow = new Date().getTime();
    document.getElementById('verifyImage').src= '/index.php?g=Home&m=Index&a=verify#'+timenow;
}

function sh(x){
    document.getElementById(x).style.display = document.getElementById(x).style.display? "" : "none";
}

function gets_value(id,str){
    document.getElementById('whole').value=str;
    document.getElementById('province').value=id;
    sh('hh');
    getNetPage();
}

function map_gets_value(id,str){
    document.getElementById('whole').value=str;
    document.getElementById('province').value=id;
    getNetPage();
}

function getNetPage(page) {
  var yewuid = $('.market-car a[class="head-on"]').data('id'),
      jdtype = $('#jdtype').val(),
      areaid = $('#province').val();
      yewuid =  Number(yewuid) > 0 ? Number(yewuid) : 0 ;

    if (page == undefined) {
        page = parseInt($(".pager").children('a.current').text());
    }
    $(".province").after("<div class='loading'>loading…?</div>")
    var page = page > 0 ? page : 1;
    $.post("index.php?m=Ajax&a=netlist", {p:page,aid:areaid,sid:yewuid,cid:jdtype}, function(data) {
        if (data == -1) {
            $(".province").nextAll().remove();
            $(".province").after("<div class='loading'>暂无数据！~</div>");
        } else {
            $(".province").nextAll().remove();
            $(".province").after(data);
        }
    })
}




function getcontent(obj){
  var id = obj;
  $.ajax({
  type:'post',
  url:'index.php?m=Ajax&a=nettext',
  data:{id:id},
  dataType:'json',
  success: function(data){    
    if(data.s){

           $("body").append('<div id="text"><h2>'+data.company+'</h2><div class="text">'+data.content+'</div><div class="close" id="guan"></div></div>'); 
           $(".hei").show();
            $('.close').click(function(){
            $('#text').remove();
            $(".hei").hide();
  });    
      }
    }
});
  
}

 
$(window).on("ready load resize",function(){
  var con = $('#content').height();
  var w_h = $(window).height();
  var header = $('#mo-header').height();
  // var footer = $('#footer').height();
  // var s_h=w_h-header-footer;
  // var con = $('#content').height();
  // if(con<=s_h){
  //   $('#content').css({'height':s_h})
  // } else{
  //   $('#content').css({'height':'auto'})
  // }
  
  var right = w_h-header;
  $('#right').css({'height':right})
})

$(function(){
  var w =$(window).width();
  var h =$(window).height();
  // $('#closeR').css({'width':w,'height':h})
  
  $('#mo-header .menu').click(function(){
    if($('#right').css('display') == 'none'){
      $('#right').css('display','block');
      $('#right').animate({'right':0});
    } else{
      $('#right').animate({'right':'-100%'},function(){
        $('#right').css('display','none');
      });
      
    }
  });
  
  $('#right ul .one').click(function(){
    var aa=$(this);
    if($(aa).next('.xia2').css('display') == 'block'){
      $(aa).next('.xia2').slideUp();
      $(aa).removeClass('one_on')
      
    }else{
      $(aa).next('.xia2').slideToggle(200)
      $(aa).siblings('.one').next('.xia2').slideUp();
      $(aa).addClass('one_on').siblings().removeClass('one_on');
    }
  })
  $('#right ul .second').click(function(){
    var aa=$(this);
    if($(aa).next('.xia3').css('display') == 'block'){
      $(aa).next('.xia3').slideUp();
      $(aa).removeClass('second_on')
    }else{
      $(aa).next('.xia3').slideToggle(200)
      $(aa).siblings('.second').next('.xia3').slideUp();
      $(aa).addClass('second_on').siblings().removeClass('second_on');
    }
  })
  
  // $('#header .header_search').click(function(){
  //   var s =$('#warpper #search');
  //   if(s.css('display') == 'none'){
  //     s.css('display','block')
  //   }else{
  //     s.css('display','none')
  //   }
    
  // })
  
  
  // 返回顶部按钮
  $(".scroll-top").on('click', function(event) {
    $("html,body").animate({scrollTop:0},800);
    
  });



  
})



