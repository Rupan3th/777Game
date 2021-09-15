﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="main_home" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery-1.11.3.min.js"></script>
    <script src="/files/js/jquery-ui.js"></script>
    <script src="/files/js/libs.js"></script>
    <script src="/files/js/slide-js.js"></script>
    <script src="/files/js/dialog.js"></script>
    <link href="/files/css/skydriver.css" rel="stylesheet" />
    <style type="text/css">
        .gamefrm_space {
            /*Set space game form*/
            padding-right: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table id="main_tbl" cellpadding="1" cellspacing="0" style="width: 100%; text-align: center; border-collapse: collapse;">
            <tr>
                <!--Full Slide Bar-->
                <td style="height: 100px; text-align: center; margin: 0 0 0 0;" class="fullSlide">
                    <div class="bd">
                        <ul style="position: relative; width: 0px; height: 446px;">
                            <li style="background: transparent url(&quot;/files/image/1.jpg&quot;) no-repeat scroll center 0px; position: absolute; width: 0px; left: 0px; top: 0px;"><a href="javascript:;"></a></li>
                            <li style="background: transparent url(&quot;/files/image/2.jpg&quot;) no-repeat scroll center 0px; position: absolute; width: 0px; left: 0px; top: 0px; display: none;"><a href="javascript:;"></a></li>
                            <li style="background: transparent url(&quot;/files/image/3.jpg&quot;) no-repeat scroll center 0px; position: absolute; width: 0px; left: 0px; top: 0px; display: none;"><a href="javascript:;"></a></li>
                            <li style="background: transparent url(&quot;/files/image/4.jpg&quot;) no-repeat scroll center 0px; position: absolute; width: 0px; left: 0px; top: 0px; display: none;"><a href="javascript:;"></a></li>
                        </ul>
                    </div>
                    <div class="hd">
                        <ul>
                            <li class="on">1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                        </ul>
                    </div>
                    <a class="prev" href="javascript:void(0)" style="opacity: 0;"></a>
                    <a class="next" href="javascript:void(0)" style="opacity: 0;"></a>
                </td>
            </tr>
            <tr>
                <td style="">
                    <div class="index_c1 w1000 clearfix">
                        <ul id="games">
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        <li><a href="javascript:ClickYXDesc();" class="index_c1_ico1">北京赛车</a></li>
                                    </td>
                                    <td style="align:left;" >
                                        <img style="vertical-align: top;transform: scale(0.8);" alt="" src="/files/image/113.gif"/>
                                    </td>
                                    <td>
                                        <li><a href="javascript:GoUrl(1);" class="index_c1_ico2">北京赛车百家乐</a></li>
                                    </td>
                                    <td>
                                        <img style="vertical-align: top;transform: scale(0.8);" alt="" src="/files/image/223.gif" />
                                    </td>
                                </tr>
                                <tr style="display:">
                                    <td>
                                        <li><a href="javascript:GoUrl(2);" class="index_c1_ico3">时时彩</a></li>
                                    </td>
                                    <td>
                                        <img style="vertical-align: top;transform: scale(0.8);" alt="" src="/files/image/333.gif" />
                                    </td>
                                    <td>
                                        <li><a href="javascript:GoUrl(3);" class="index_c1_ico4">六合彩</a></li>
                                    </td>
                                    <td>
                                        <img style="vertical-align: top;transform: scale(0.8);" alt="" src="/files/image/443.gif" />
                                    </td>
                                </tr>
                            </table>
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
<script type="text/javascript">
    jQuery(".fullSlide").slide({ titCell: ".hd ul", mainCell: ".bd ul", effect: "fold", autoPlay: true, autoPage: true, trigger: "click" });
</script>
<script>
    function ClickYXDesc() {
        var gourl = PostAjax("/Ajax/godesk.ashx");
        window.open(gourl, '_blank');
        window.focus();
    }

    function GoUrl(mode)
    {
        switch(mode)
        {
            case 1: window.open('/777Game/main.aspx', '_blank'); break;
            case 2: window.open('/media/home.aspx', '_blank'); break;
            case 3: window.open('/build.aspx', '_blank'); break;
        }
        window.focus();
    }
</script>
