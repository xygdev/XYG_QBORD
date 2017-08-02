(function (e) {
    e.fn.extend({
        v3dControl: function (t) {
            new e.v3dControl(this, t);
            return
        }
    });
    e.v3dControl = function (dom, obj) {
        var tWidth = typeof(obj.width) == "undefined" ? dom.width() : obj.width;
        var tHeight = typeof(obj.height) == "undefined" ? dom.height() : obj.height;
        var imgLength = typeof(obj.imgLength) == "undefined" ? 0 : obj.imgLength;
        var imgPath = typeof(obj.imgPath) == "undefined" ? "img/" : obj.imgPath;
        var imgType = typeof(obj.imgType) == "undefined" ? ".png" : obj.imgType;
        var isAuto = typeof(obj.isAuto) == "undefined" ? false : obj.isAuto;
        var autoTime;
        var canvasapp = canvasApp();
        var tImgObj = [];
        var tIndex = 0;
        var imgWidth, imgHeight = 0;
        var canvas;
        var content;
        if (imgLength == 0) {
            alert("图片数量不能为空");
            return
        }
        function canvasSupport() {
            return !!document.createElement('canvas').getContext
        }

        function canvasApp() {
            if (!canvasSupport()) {
                return false
            }
            return true
        }

        function _initData() {
            dom.css({"position": "relative", "cursor": "move"});
            dom.append("<img id='loadding' src='/image/home/gallery/loadding.gif' style='position:absolute;width:32px;left:50%;top:50%;margin:-16px 0px 0px -16px;z-index:100;zoom:1'/>");
            //console.log("debug1");
            if (canvasapp) {
                dom.append("<img id='imgStart' src='" + imgPath + 1 + imgType + "' style='display: none;'/>");
                //console.log("debug2");
                $("#imgStart").load(function () {
                    imgWidth = $("#imgStart").width();
                    imgHeight = $("#imgStart").height();
                    dom.append("<canvas id=\"canvas\" width='" + tWidth + "' height='" + tHeight + "' style='position: absolute;left:50%;top:50%;-webkit-transform: translate(-50%,-50%);-moz-transform: translate(-50%,-50%);-ms-transform: translate(-50%,-50%);-o-transform: translate(-50%,-50%);transform: translate(-50%,-50%);'></canvas>");
                    canvas = document.getElementById("canvas");
                    content = canvas.getContext("2d");
                    console.log("imgLength:"+imgLength);
                    for (var i = 1; i <= imgLength; i++) {
                        var img2 = new Image();
                        img2.src = imgPath + i + imgType;
                        tImgObj.push(img2)
                    }
                    console.log("tImgObj:"+tImgObj.length);
                    //console.log("debug3");
                })
            } else {
                for (var i = 1; i <= imgLength; i++) {
                    dom.append("<img src='" + imgPath + i + imgType + "' style='display: none;' class='v3dcover'/>");
                    tImgObj.push(".v3dcover:eq(" + i + ")")
                }
            }
            //console.log("debug4");
            setTimeout(function () {
            	//console.log("debug5");
                _imgLoadEnd(function () {
                	//console.log("debug6");
                    $("#loadding").fadeOut("fast");
                    //console.log("debug7");
                    _move();
                    _initHScroll();
                    _autoPlay()
                })
            }, 500)
        }

        function _autoPlay() {
            if (isAuto) {
                setTimeout(function () {
                    autoTime = setInterval(function () {
                        _jian()
                    }, 80)
                }, 1000)
            }
        }

        function _imgLoadEnd(callBack) {
            var l = 0;
            //console.log("debug8");
            console.log("length:"+tImgObj.length);
            for (var i = 0; i < tImgObj.length; i++) {
                loadImage(tImgObj[i], function () {
                    l++;
                    if (l == tImgObj.length) {
                        callBack()
                    }
                })
            }
            //console.log("debug9");
            function loadImage(img, callback) {
            	 //console.log("debug11");
                if (img.complete) {
                    callback.call(img);
                    return
                }
                //console.log("debug12");
                img.onload = function () {
                    callback.call(img)
                };
                //console.log("debug13");
                if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE8.0") {
                    callback.call(img)
                }
                //console.log("debug14");
            }
            //console.log("debug10");
        }

        function _add() {
            tIndex++;
            if (tIndex > tImgObj.length - 1) {
                tIndex = 0
            }
            _move()
        }

        function _jian() {
            tIndex--;
            if (tIndex < 0) {
                tIndex = tImgObj.length - 1
            }
            _move()
        }

        function _move() {
            if (canvasapp) {
                content.clearRect(0, 0, tWidth, tHeight);
                content.drawImage(tImgObj[tIndex], 0, (tHeight - tWidth / imgWidth * imgHeight) / 2, tWidth, tWidth / imgWidth * imgHeight)
            } else {
                dom.css({"background": "url('" + $(tImgObj[tIndex]).attr("src") + "') no-repeat center center"})
            }
        }

        function _initHScroll() {
            var nHStartX;
            var isHMove = false;

            function _initHMoveStart(e) {
                if (e.type == "touchstart") {
                    nHStartX = event.touches[0].pageX
                } else {
                    nHStartX = e.x || e.pageX
                }
                isHMove = true
            }

            function _initHMoveMove(e) {
                e.preventDefault();
                if (isHMove) {
                    var moveP;
                    if (e.type == "touchmove") {
                        moveP = event.touches[0].pageX
                    } else {
                        moveP = e.x || e.pageX
                    }
                    var hm = nHStartX - moveP;
                    var m = $(window).width() > 1100 ? hm % 2 == 0 : hm % 1 == 0;
                    if (hm < 0 && m) {
                        if (isAuto) {
                            clearInterval(autoTime)
                        }
                        _add()
                    }
                    if (hm > 0 && m) {
                        if (isAuto) {
                            clearInterval(autoTime)
                        }
                        _jian()
                    }
                    nHStartX = moveP
                }
            }

            function _initHMoveEnd(e) {
                _autoPlay();
                isHMove = false
            }

            function _init() {
                dom.on("mousedown touchstart", _initHMoveStart);
                dom.on("mousemove touchmove", _initHMoveMove);
                dom.on("mouseup touchend", _initHMoveEnd)
            }

            _init()
        }

        _initData()
    }
})(jQuery)