<%@ Page Language="C#" AutoEventWireup="true" CodeFile="novel_view.aspx.cs" Inherits="media_mobile_novel_view" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <link href="/files/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.min.js"></script>
    <link href="common.css" rel="stylesheet" />
</head>
<body style="margin: 0 0 0 0;">
    <table style="position: absolute; width: 100%; height: 100%;" class="table_form">
        <tr>
            <td style="height: 59px">
                <div style="background-color: #232323; height: 59px; width: 100%; display: table;" class="table_form">
                    <span style="padding-left: 10px; display: table-cell; vertical-align: middle;"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 98px">
                <div class="dropdown table_form" style="white-space: nowrap; background-color: #323232; height: 98px; text-align: left; display: table;">
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <div style="float: left; width: 80%; height: 100%; display: table;">
                        <span style="display: table-cell; vertical-align: middle;">
                            <marquee id="notice" behavior="scroll" direction="left" style="width: 100%; height: 60%; color: crimson; background-color: white; font-size: 40px; vertical-align: middle;"></marquee>
                            <script>
                                var noticetext = PostAjax("/Ajax/media_notice.ashx", "");
                                jQuery("#notice").text(noticetext);
                            </script>
                        </span>
                    </div>
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <img src="/files/image/mobile_menu.png" onclick="javascript:location.href='/media/mobile/Default.aspx';" class="dropbtn" style="vertical-align: middle;" />
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 100%;">
                <iframe style="margin: 0 0 0 0; height: 100%; width: 100%; background-image:url('/files/image/novel.png'); background-size:contain;" src="<% var url = GetBookUrl(); Response.Write(url);%>"></iframe>
            </td>
        </tr>
    </table>
</body>
</html>