
$(document).ready(function(){
    if($(window).width()<=768){
        $(".inside_banner").css("height",$(window).height()-$("#mo-header").height());
        $("#footer .scroll-top,#footer .nav_contact").css("height","auto");
        var subnav_liW = $(".subnav li").length * ($(".subnav li:eq(0)").width() + parseInt($(".subnav li:eq(0)").css("marginRight")));
        $(".subnav ul").css("width",subnav_liW);
        // 手机�?-视频中心
        var video_navW = $(".video_nav li").width() * $(".video_nav li").length ;
        $(".video_nav ul").css("width",video_navW+10);

    }else{
        $(".inside_banner").css("height","auto");
        var footH = $("#footer .company-guide").height();
        $("#footer .scroll-top,#footer .nav_contact").css("height",footH);
        $(".subnav ul").css("width","auto");
        $(".video_nav ul").css("width","auto");



    }
    
    $(window).on('load resize',function(event) {
        var winH = $(window).height();
        var winW = $(window).width();
        if ($(window).width() > 768)  {

            var footH = $("#footer .company-guide").height();
            $("#footer .scroll-top,#footer .nav_contact").css("height",footH);
        }else{
            $("#footer .scroll-top,#footer .nav_contact").css("height","auto");

        }
        var pro_detail_textH = $(".pro-detail-focus").height();
        $(".pro-detail-text").css("height",pro_detail_textH);
        if($(window).width()<=768){
            $(".inside_banner").css("height",$(window).height()-$("#mo-header").height());
            var subnav_liW = $(".subnav li").length * ($(".subnav li").width() + parseInt($(".subnav li").css("marginRight")));
            $(".subnav ul").css("width",subnav_liW);

            // 手机�?-视频中心
            var video_navW = $(".video_nav li").width() * $(".video_nav li").length;
            $(".video_nav ul").css("width",video_navW+10);

        }else{
            $(".inside_banner").css("height","auto");
            $(".subnav ul").css("width","auto");
            $(".video_nav ul").css("width","auto");
        }

    });
    $(".project-content textarea,.invest-contact textarea").focus(function(event) {
        var user=$(this).val();
        if(user=="留言内容"){
            $(this).val("");
        }
    }).blur(function(event) {
        if($(".project-content textarea,.invest-contact textarea").val()==""){
            $(".project-content textarea,.invest-contact textarea").val("留言内容");
        }
    });
    // 人力资源-校园招聘
    $(".campus-question li").click(function(event) {
        $(this).toggleClass('li-on').siblings('li').removeClass('li-on');
        $(this).children('.body').slideToggle("slow");
        $(this).siblings('li').children('.body').slideUp("slow");
    });
    // 投资者关�?-通告函告
    $(".notice-toggle .notice-body").eq(0).show();
    $(".notice-title a").click(function(event) {
        $(this).addClass('title-on').siblings('a').removeClass('title-on');
        var index = $(this).index();
        $(".notice-toggle .notice-body").eq(index).show().siblings('.notice-body').hide();
    });

    // 营销网络-汽车玻璃
    $(".marketing .toggle-body").eq(0).show();
    $(".marketing .toggle-head").find('a').click(function(event) {
        $(this).addClass('head-on').siblings('a').removeClass('head-on');
        var index = $(this).index();
        $(".marketing .toggle-body").eq(index).show(function(){
            $('.se').insertBefore(".marketing .toggle-body .contact .l").eq(index);
            $('#whole').val($('#whole').attr("rel"));
            $('#province').val(0);
        }).siblings('.toggle-body').hide(function(){
            $(this).find('.se').remove();
            $('#whole').val($('#whole').attr("rel"));
            $('#province').val(0);
        });
    });

    // 产品与服务-产品列表
    $(".product-list").find('a').hover(function() {
        $(this).children('.pro-content').children('.pro-body').stop().slideDown("slow");
    }, function() {
        $(this).children('.pro-content').children('.pro-body').stop().slideUp("slow");
    });


    // 产品详情
    $(".product-details .details-body .toggle").eq(0).show();
    $(".product-details .details-title").find('a').click(function(event) {
        $(this).addClass('detail-on').siblings('a').removeClass('detail-on');
        var index = $(this).index();
        $(".product-details .details-body .toggle").eq(index).show().siblings('.toggle').hide();

    });

    // 内页背景
    var bg_src = $(".inside_banner .tu img").attr('src');
    $(".inside_banner").css('background-image',"url(.."+ bg_src+")");
    



});