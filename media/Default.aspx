<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="media_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <link href="global.css" rel="stylesheet" />
    <link href="/files/css/bootstrap.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="common.js"></script>
    <style>
        .table_form {
            width: 100%;
            padding: 0 0 0 0;
            border: 0;
            border-collapse: collapse;
            border-spacing: 0 0;
        }
    </style>
    <script>
        function onclick_menu(id, byMenu) {
            var mvid = getParameterByName('mvid');
            var clss = getParameterByName('clss');

            var smvid = "";
            if (mvid != null && byMenu == null) smvid = "?mvid=" + mvid;
            if (clss != null && byMenu == null) smvid = "?clss=" + clss;
            switch (id) {
                case 0:
                    {
                        jQuery("#Menu1n0 table").addClass("Menu1_4");
                        jQuery("#Menu1n1 table").removeClass("Menu1_4");
                        jQuery("#Menu1n2 table").removeClass("Menu1_4");
                        window.open("/media/movie.aspx" + smvid, "media_page", "", true);
                        break;
                    }
                case 1:
                    {
                        jQuery("#Menu1n0 table").removeClass("Menu1_4");
                        jQuery("#Menu1n1 table").addClass("Menu1_4");
                        jQuery("#Menu1n2 table").removeClass("Menu1_4");
                        window.open("/media/image.aspx" + smvid, "media_page", "", true);
                        break;
                    }
                case 2:
                    {
                        jQuery("#Menu1n0 table").removeClass("Menu1_4");
                        jQuery("#Menu1n1 table").removeClass("Menu1_4");
                        jQuery("#Menu1n2 table").addClass("Menu1_4");
                        window.open("/media/novel.aspx" + smvid, "media_page", "", true);
                        break;
                    }
            }
        }

        var user_id = '<%= Session["user_id"] %>';
        var login_state = PostAjax("/Ajax/loginstate.ashx", "category=3&user_id=" + user_id + "&loginfir=" + 1);
        setInterval(function () {
            login_state = PostAjax("/Ajax/loginstate.ashx", "category=3&user_id=" + user_id);
        }, 5 * 60 * 1000);
    </script>
</head>
<body style="margin: 0 0 0 0;">
    <form id="form1" runat="server">
        <table class="table_form" style="position: absolute; width: 100%; height: 100%; align-content:center; margin: 0px auto;" align="center">
            <tr>
                <td style="height:25px; background-color: #232323;">&nbsp</td>
            </tr>
            <tr>
                <td style="height:57px; background-color: #323232; text-align:center">
                    <table class="table_form" style="height:100%; margin: 0px auto;width:80%" align="center">
                        <tr>
                            <td style="width:80px; color: #FFFFFF;">
                                <asp:Menu ID="Menu2" runat="server" ForeColor="White" Height="100%" Orientation="Horizontal" RenderingMode="Table" Width="100%">
                                    <Items>
                                        <asp:MenuItem Text="首页" Value="0" NavigateUrl="~/media/home.aspx"></asp:MenuItem>
                                    </Items>
                                    <StaticSelectedStyle BackColor="#3C3C3C" Height="100%" />
                                </asp:Menu>
                            </td>
                            <td>
                                <marquee id="notice" behavior="scroll" direction="left" style="width:100%;color:crimson; background-color:white"></marquee>
                            </td>
                            <td style="width:50px">
                            </td>
                            <td style="width:250px">
                                <asp:Menu ID="Menu1" runat="server" ForeColor="White" Height="100%" Orientation="Horizontal" RenderingMode="Table" Width="100%">
                                    <Items>
                                        <asp:MenuItem Text="视频" Value="0" NavigateUrl="javascript:onclick_menu(0, true);"></asp:MenuItem>
                                        <asp:MenuItem Text="图片" Value="1" NavigateUrl="javascript:onclick_menu(1, true);"></asp:MenuItem>
                                        <asp:MenuItem Text="小说" Value="2" NavigateUrl="javascript:onclick_menu(2, true);"></asp:MenuItem>
                                    </Items>
                                    <StaticSelectedStyle BackColor="#3C3C3C" Height="100%" />
                                </asp:Menu>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top;text-align:center;background-color:#ececec">
                    <iframe id="media_page" name="media_page" style="width:80%; height:100%; border:hidden;" scrolling=no  src="" onload="iframeLoaded2()">

                    </iframe>
                    <script>
                        function iframeLoaded2() {                            
                            var iFrameID = document.getElementById('media_page');
                            if (iFrameID) {
                                // here you can make the height, I delete it first, then I make it again
                                iFrameID.height = "";
                                jQuery("#media_page").height(iFrameID.contentWindow.document.body.scrollHeight + "px");
                            }
                        }
                    </script>
                </td>
            </tr>
            <tr style="display:none">
                <td style="height:46px; background-color: #959595;">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
<script>
    var noticetext = PostAjax("/Ajax/media_notice.ashx", "");
    jQuery("#notice").text(noticetext);

    var page_type = getParameterByName("type"); 
    if (page_type == null) page_type = "0";
    onclick_menu(eval(page_type));
</script>
