<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sky_driver.aspx.cs" Inherits="main_sky_driver" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery-ui.js"></script>
    <script src="/files/js/libs.js"></script>
    <script src="/files/js/slide-js.js"></script>
    <script src="/files/js/dialog.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script src="/files/js/common.js"></script>
    <link href="/files/css/skydriver.css" rel="stylesheet" />

    <style type="text/css">
        .gamefrm_space {
            /*Set space game form*/
            padding-right: 0;
        }
    </style>

    <script>
        function detectmob() {
            if (navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)) {
                location.href = "/main/mobile/sky_driver.aspx";
            }
        }
        detectmob();
    </script>
</head>
<body>
   <form id="form1" runat="server">
        <table id="main_tbl" cellpadding="1" cellspacing="0" style="width: 100%; height:100%; text-align: center; border-collapse: collapse; position:absolute;">
            <tr>
                <!--Select language.-->
                <td style="height: 35px; background-image: url('/files/image/skydriver_top.png'); background-repeat: repeat-x" class="top">
                    <div class="w1000 clearfix">
                        <div class="top_right fr clearfix">
                            <div class="top_nav clearfix fl">
                                <a href="#">简体中文</a>
                                <a href="?act=5" runat="server">退出</a>
                            </div>
                            <a href="spare.html" class="spare_nav fl" indepth="true">备用网址</a>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <!--Logo-->
                <td style="height: 97px; background-image: url('/files/image/brand_bkg.png'); background-repeat: repeat-x; text-align: left;">
                    <div class="top_center">
                        <div class="w1000 clearfix">
                            <div class="logo fl">
                                <a href="/default.aspx" indepth="true">LOGO</a>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <!--Menu-->
                <td style="height: 20px" class="nav">
                    <div class="w1000 clearfix">
                        <ul id="menus">
                            <li id="home" class="on"><a href="javascript:menu_clicked(0)" style="background:none;">首页</a></li>
                            <li id="personal"><a href="javascript:menu_clicked(1)">个人中心</a></li>
                            <li><a href="https://...." target="_blank">在线客服</a></li>
                            <script>
                                function menu_clicked( menu_id )
                                {
                                    switch(menu_id)
                                    {
                                        case 0://home
                                            jQuery("#home").addClass("on");
                                            jQuery("#personal").removeClass("on");
                                            window.open("/main/home.aspx", "user_page", true);
                                            break;
                                        case 1://personal
                                            jQuery("#home").removeClass("on");
                                            jQuery("#personal").addClass("on");

                                            var gourl = PostAjax("/Ajax/goGeren.ashx");
                                            window.open(gourl, "user_page", true);
                                            jQuery("#user_page").height(750);
                                            break;
                                    }
                                }
                            </script>
                        </ul>
                    </div>
                </td>
            </tr>
            <tr style="height:auto;">
                <td>
                    <iframe id="user_page" name="user_page" style="border:0px hidden; width:100%; display:table;" onload="iframeLoaded2()" src="home.aspx" >
                    </iframe>
                    <script>
                        function iframeLoaded2() {                            
                            var iFrameID = document.getElementById('user_page');
                            if (iFrameID) {
                                // here you can make the height, I delete it first, then I make it again
                                iFrameID.height = "";
                                iFrameID.height = iFrameID.contentWindow.document.body.scrollHeight + "px";
                            }
                        }
                    </script>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;</td>
            </tr>        
            <tr>
                <!--Recent Adverse-->
                <td class="index_c2 clearfix">
                    <div class="index_c2 clearfix">
                        <div class="w1000 clearfix">
                            <div class="indexc2_slide clearfix">
                                <div class="indexc2_title fl">最新公告：</div>
                                <div class="bd fl">
                                    <ul style="position: relative; width: 842px; height: 45px;">

                                        <li style="position: absolute; width: 842px; left: 0px; top: 0px;"><a onclick="dialog.open('公告','/noticelist',800,400,1)" href="javascript:;">尊敬的会员您好！ 公司的招商银行（ 郭振波 ）已停用，请广大会员不要再往里充值，特此通知！谢谢 ！（收到通...  </a></li>

                                    </ul>
                                </div>
                                <a class="prev" href="javascript:void(0)"></a>
                                <a class="next" href="javascript:void(0)"></a>
                            </div>
                            <script type="text/javascript">
                                jQuery(".indexc2_slide").slide({ mainCell: ".bd ul", effect: "fold", autoPlay: true, autoPage: true, trigger: "click" });
                            </script>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 20px">&nbsp;</td>
            </tr>
        </table>
    </form>
   
</body>
</html>