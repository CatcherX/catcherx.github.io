<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SevenBox.aspx.cs" Inherits="blessingWall_SevenBox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>祝福墙</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/index.css"/>				
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.2.custom.js"></script>
    <%--<script type="text/javascript" src="js/index.js"></script>--%>
</head>
<body>
    <form id="form1" runat="server">
      <!--<embed width="0" height="0" type="audio/x-pn-realaudio-plugin" autostart="true" controls="ControlPanel" src="sounds/TodayMerry.mp3">-->        
        <audio controls="controls" autoplay="autoplay" style="display:none">
            <source src="sounds/TodayMerry.mp3" type="audio/mp3" />
            <%--<source src="http://www.zhoucheng555.com/shared/sounds/TodayMerry.mp3" type="audio/mp3" />   --%>   <%--IE中声音会颤抖--%>
            Your browser does not support the audio element.
        </audio>
        <!--[if ie 6]>
        <style type="text/css">
            .mask {position: absolute; height: 800px;}
            .pop-box {_position: absolute;}
        </style>
        <![endif]-->
        <div class="box">
        <!-- 场景六 -->
            <div class="six-box">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="seven-box">
                <div class="clickMe">点我送祝福</div>
                <div class="seven-content">        
                    <div class="note-a1"></div>
                    <div class="note-a2"></div>
                    <div class="note-a3"></div>
                    <div class="note-a4"></div>
                    <div class="note-a5"></div>
                    <div class="note-a6"></div>
                    <div class="note-a7"></div>
                    <div class="note-a8"></div>
                    <div class="note-a9"></div>
                    <div class="note-a10"></div>
                    <div class="note-a11"></div>
                    <div class="note-a12"></div>          
                    <asp:Repeater ID="rptLeaveContent" runat="server">
                        <ItemTemplate>                            
                            <%#string.Format("<div class='note-{0}'>{1}</div>", this.GetRomNum(), Eval("LeaveContent")) %>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <!-- 遮罩层 -->
        <div class="mask"></div>
        <div class="pop-box">
            <h1>送上祝福语</h1>
            <textarea id="write">写上您的祝福吧~</textarea>
            <div class="u-sure" id="uSure">确定</div>
        </div>
        <script>
        $sixBox = $(".six-box"), /* 场景六box */
        $sixDiv = $sixBox.find("div"), /* 场景六里面小块div */
        sixDivWidth = $sixDiv.width(), /* 场景六里面小块div的宽度 */
        sixDivHeight = $sixDiv.height(), /* 场景六里面小块div的高度 */
        sixBoxWidth = $sixBox.width(), /* 场景六宽度 */
        sixBoxHeight = $sixBox.height(), /* 场景六高度 */
        $sevenBox = $(".seven-box");

        /* 场景六 */
        var colCount = 4, /* 多少列 */
            rowCount = 4; /* 多少行 */
        function scene6() {
            $sixBox.fadeIn();
            /* 聚合 */
            $sixDiv.each(function () {
                var _index = $(this).index(),
            col = _index % colCount, /* 第几列 */
            row = Math.floor(_index / rowCount), /* 第几行 */
            cssLeft = sixBoxWidth / 2 - colCount / 2 * sixDivWidth + col * sixDivWidth, /* left的值 */
            cssTop = sixBoxHeight / 2 - rowCount / 2 * sixDivHeight + row * sixDivHeight, /* top的值 */
            divLeft = -col * sixDivWidth, /* 背景定位的宽度 */
            divTop = -row * sixDivHeight; /* 背景定位的高度 */
                $(this).css({ "left": cssLeft, "top": cssTop, "background-position": divLeft + "px " + divTop + "px" }); /* 先设置成为聚合，定位好背景图片 */
                setTimeout(scatter, 1600); /* 调用散开 */
            })
            setTimeout(scene7, 3000); /* 进入第七场景 */
        }
        /* 散开 */
        function scatter() {
            $sixDiv.each(function () {
                var _index = $(this).index(),
            col = _index % colCount, /* 第几列 */
            row = Math.floor(_index / rowCount), /* 第几行 */
            cssLeft = (col - 1) * (sixBoxWidth + sixDivWidth) - sixDivWidth, /* 我这里的水平间距大小为盒子大小加上它自身的宽度 */
            cssTop = (row - 1) * (sixBoxHeight + sixDivHeight) - sixDivWidth; /* 我这里的水平间距大小为盒子大小加上它自身的宽度 */
                $(this).animate({ "left": cssLeft, "top": cssTop }, 1200);
            })
        }

            /* 场景七 */
            var $sevenDiv = $(".seven-content div"),
        $clickMe = $(".clickMe"),
            /* 送上祝福 */
        $mask = $(".mask"),
        $popBox = $(".pop-box"),
        $write = $("#write"),
        $uSure = $("#uSure"),
        $sevenContent = $(".seven-content");

            function scene7() {
                $sixBox.hide();
                $sevenBox.fadeIn(1000);
                $sevenDiv.each(function () {
                    defineSevenDiv($(this));
                })

                function defineSevenDiv($own) {
                    var _obj = defineRandom();
                    $own.css({ "transform": "rotate(" + _obj.rotate + "deg)" }); /* 设置随机旋转值 */
                    $own.animate({ left: _obj.left + "px", top: _obj.top + "px" }); /* 随机排布 */
                }

                /* 定义随机left，top和旋转值 */
                function defineRandom() {
                    var randomLeft = Math.floor(680 * (Math.random())) + 30, /* 图片left值 */
                randomTop = Math.floor(400 * Math.random()) + 30, /* 图片top值 */
                randomRotate = 20 - Math.floor(40 * Math.random()); /* 图片旋转角度 */
                    return {
                        left: randomLeft,
                        top: randomTop,
                        rotate: randomRotate
                    }
                }

                /* 拖动祝福卡片 */
                draggableNote();
                /* 拖动图片 */
                function draggableNote() {
                    $(".seven-content div").draggable({
                        containment: $sevenContent,
                        zIndex: 2700,
                        start: function () {
                            $(this).css({ "transform": "rotate(0deg)", "cursor": "crosshair" }); /* 开始拖动图片旋转为0，鼠标样式改变 */
                        },
                        stop: function () {
                            var _obj = defineRandom();
                            $(this).css({ "transform": "rotate(" + _obj.rotate + "deg)", "cursor": "pointer" }); /* 停止拖动，旋转为随机的 */
                        }
                    })
                }

                /* 点我送祝福 */
                $clickMe.click(function () {
                    $write.val("送上您的祝福吧~");
                    $mask.fadeIn();
                    $popBox.animate({ top: "50%" });
                })

                /* 获取焦点时 */
                $write.focus(function () {
                    var _val = $(this).val();
                    if (_val == "送上您的祝福吧~") {
                        $(this).val("");
                    }
                })
                /* 丢失焦点时 */
                $write.blur(function () {
                    var _val = $(this).val();
                    if (_val.length == 0) {
                        $(this).val("送上您的祝福吧~");
                    }
                })

                /* 点击确定 */
                $uSure.click(function () {
                    var _writeVal = $write.val();
                    var _randomNum = Math.ceil(Math.random() * 6);
                    if (_writeVal != "送上您的祝福吧~") { //考虑乱码问题
                        //console.log(_writeVal); 使用Ajax传递到服务器保存起来                    
                        $.get("/Ashx/LeaveHandler.ashx?t=0&mobile=" + escape(_writeVal), function (data) {
                            if (data != "1")
                                alert('保存失败,请重试');
                        });
                        var _div = '<div class="note-' + _randomNum + '">' + _writeVal + '</div>';
                        $sevenContent.append(_div); /* 如果输入祝福语，将此标签添加的尾部 */
                        defineSevenDiv($sevenContent.find("div:last"));
                        $popBox.animate({ top: "-300px" }, function () {
                            $mask.fadeOut();
                            draggableNote(); /* 可拖动卡片，给新添加的标签赋予拖动功能 */
                        });
                    } else {
                        alert("请输入祝福语！");
                    }
                })
            }

            scene6();
        </script>
    </form>
</body>
</html>
