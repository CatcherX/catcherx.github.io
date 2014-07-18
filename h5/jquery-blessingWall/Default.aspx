<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="blessingWall_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>小型婚礼</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/index.css"/>				
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.2.custom.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<!--<embed width="0" height="0" type="audio/x-pn-realaudio-plugin" autostart="true" controls="ControlPanel" src="sounds/TodayMerry.mp3">-->        
        <audio controls="controls" autoplay="autoplay" style="display:none">
            <source src="sounds/TodayMerry.mp3" type="audio/mp3" />
            <%--<source src="http://www.zhoucheng555.com/shared/sounds/TodayMerry.mp3" type="audio/mp3" />                               --%>
            Your browser does not support the audio element.
        </audio>
        <!--[if ie 6]>
        <style type="text/css">
            .mask {position: absolute; height: 800px;}
            .pop-box {_position: absolute;}
        </style>
        <![endif]-->
        <div class="box">
            <!-- 场景一 -->
            <div class="first-box">
                <div class="first-horn">
                    <img src="images/first_horn.jpg"/>
                </div>
                <div class="first-txt">
                    <div class="txt1"><img src="images/first_txt1.jpg"/></div>
                    <div class="txt2"><img src="images/first_txt2.jpg"/></div>
                </div>
            </div>

            <!-- 场景二 -->
            <div class="second-box">
                <div class="second-people">
                    <img src="images/second_people.jpg"/>
                </div>
                <div class="second-txt">
                    <img src="images/second_txt.jpg"/>
                </div>
            </div>

            <!-- 场景三 -->
            <div class="three-box">
                <div class="three-img">
                    <img src="images/three_img.jpg"/>
                </div>
            </div>

            <!-- 场景四 -->
            <div class="fore-box">
                <div class="fore-img">
                    <img src="images/fore_img.jpg"/>
                </div>
            </div>

            <!-- 场景五 -->
            <div class="five-box">
                <div class="five-img">
                    <img src="images/five_img.jpg"/>
                    <div class="u-enter">进入婚礼</div>
                </div>
            </div>

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
            <!-- 场景七 -->  
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
    </div>
    </form>
</body>
</html>
