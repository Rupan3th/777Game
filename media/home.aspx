<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="media_home" %>

<%@ Register Src="~/media/recent_movie.ascx" TagPrefix="uc1" TagName="recent_movie" %>
<%@ Register Src="~/media/recent_image.ascx" TagPrefix="uc1" TagName="recent_image" %>
<%@ Register Src="~/media/recent_novel.ascx" TagPrefix="uc1" TagName="recent_novel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <link href="global.css" rel="stylesheet" />
    <link href="/files/css/bootstrap.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script src="/files/js/common.js"></script>
    <script>
        function detectmob() {
            if (navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)
            ) {
                location.href = "/media/mobile/Default.aspx";
            }
        }
        detectmob();
    </script>
<script>
        var user_id = '<%= Session["user_id"] %>';
        var login_state = PostAjax("/Ajax/loginstate.ashx", "category=3&user_id=" + user_id + "&loginfir=" + 1);
        setInterval(function () {
            login_state = PostAjax("/Ajax/loginstate.ashx", "category=3&user_id=" + user_id);
        }, 5 * 60 * 1000);
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="table_form media_page ax_default">
                <tr>
                    <td>
                        <div></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="btnMainPage" Style="width: 92px; background-color: rgba(102, 102, 102, 1);" runat="server" CssClass="round-button" ForeColor="White" Text="主页" PostBackUrl="/main/sky_driver.aspx" />
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="btnHomePage" Style="width: 92px; background-color: rgba(102, 102, 102, 1);" runat="server" CssClass="round-button" ForeColor="White" Text="首页" PostBackUrl="/media/home.aspx" />
                                </td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="ddlMovieClss" Style="width: 92px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="kname" DataValueField="id" OnDataBound="ddlMovieClss_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlMovieClss_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                        SelectCommand="SELECT id, kname FROM kinds2 WHERE (detail_id = ?)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="25" Name="detail_id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="ddlPhotoClss" Style="width: 92px;" runat="server" DataSourceID="SqlDataSource2" DataTextField="kname" DataValueField="id" OnDataBound="ddlPhotoClss_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlPhotoClss_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="
                                        <%$ ConnectionStrings:mysql_connectstring %>"
                                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                        SelectCommand="SELECT id, kname FROM kinds2 WHERE (detail_id = ?)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="26" Name="detail_id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td style="width: 100px">
                                    <asp:DropDownList ID="ddlNovelClss" Style="width: 92px;" runat="server" DataSourceID="SqlDataSource3" DataTextField="kname" DataValueField="id" OnDataBound="ddlNovelClss_DataBound" AutoPostBack="true" OnSelectedIndexChanged="ddlNovelClss_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                        SelectCommand="SELECT id, kname FROM kinds2 WHERE (detail_id = ?)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="27" Name="detail_id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td></td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Label ID="lblCoin" runat="server" Text="账户余额"></asp:Label>
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Image ID="imgSelfMail" runat="server" Height="22px" ImageUrl="~/files/image/selfmail.png" Width="23px" Style="opacity: 0.4;" />
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Label ID="lblVip" runat="server" Text="显示是普通会员或会员VIP"></asp:Label>
                                </td>
                                <td style="width: 100px; text-align: right;">
                                    <asp:Button ID="btnCash" Style="width: 92px; background-color: rgba(102, 102, 102, 1);" runat="server" CssClass="round-button" ForeColor="White" Text="充值" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 2px; background-color: rgba(153, 153, 153, 1);">
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center; height: 50px">
                        <marquee id="notice" behavior="scroll" direction="left" style="width: 80%; color: crimson; background-color: rgba(102, 102, 102, 0.1); border-width: 1px; border-color: rgba(102, 102, 102, 1);"></marquee>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ax_title madiatype0">最新上传视频</span>

                    </td>
                </tr>
                <tr style="height: 1px; background-color: rgba(153, 153, 153, 1);">
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <uc1:recent_movie runat="server" ID="recent_movie" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ax_title madiatype1">最新上传图片</span>
                    </td>
                </tr>
                <tr style="height: 1px; background-color: rgba(153, 153, 153, 1);">
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <uc1:recent_image runat="server" ID="recent_image" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="ax_title madiatype2">最新上传小说</span>
                    </td>
                </tr>
                <tr style="height: 1px; background-color: rgba(153, 153, 153, 1);">
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <uc1:recent_novel runat="server" ID="recent_novel" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!--Left Scroll Top Bar { -->
            <style>
                sidebar {
                    width: 40px;
                    height: auto;
                    position: absolute;
                    right: 10px;
                    top: 170px;
                    padding-right: 5px;
                    border-right: 2px solid #eaeaea;
                }
            </style>
            <div style="position: fixed; z-index: 999; width: 40px; right: 50px; bottom: 30px;">
                <div class="sidebar">
                    <div style="">
                        <a href="http://uriminzokkiri.com/#" class="updown" id="go_up" style="top: 0px;">
                            <img alt="" src="/files/image/scroll_top.png" />
                        </a>
                    </div>
                </div>
            </div>
        <script type="text/javascript">
            jQuery(document).ready(function () {
                jQuery(window).scroll(function () {
                    if (jQuery(this).scrollTop() > 50) {
                        jQuery('#go_up').fadeIn();
                    } else {
                        jQuery('#go_up').fadeOut();
                    }
                });
                jQuery('#go_up').click(function () {
                    jQuery("html, body").animate({
                        scrollTop: 0
                    }, 600);
                    return false;
                });
            });
                </script>
        <!--Left Scroll Top Bar } -->
        </div>
    </form>
</body>
</html>
<script>
    var noticetext = PostAjax("/Ajax/media_notice.ashx", "");
    jQuery("#notice").text(noticetext);

    var IsSM = PostAjax("/Ajax/GetSMail.ashx", "");
    if (IsSM == "1") {
        jQuery("#imgSelfMail").css("opacity", "1");
        jQuery("#imgSelfMail").css("cursor", "pointer");
        jQuery("#imgSelfMail").click(function () {
            window.open("SMView.aspx", "_blank", 'width=400,height=200,directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=no,resizable=no');
        });
    }
    else {
        jQuery("#imgSelfMail").css("opacity", "0.2");
    }

    jQuery(".madiatype0").css("cursor", "pointer");
    jQuery(".madiatype0").click(function () {
        window.open("/media/Default.aspx?type=0", "_self", true);
    });
    jQuery(".madiatype1").css("cursor", "pointer");
    jQuery(".madiatype1").click(function () {
        window.open("/media/Default.aspx?type=1", "_self", true);
    });
    jQuery(".madiatype2").css("cursor", "pointer");
    jQuery(".madiatype2").click(function () {
        window.open("/media/Default.aspx?type=2", "_self", true);
    });
</script>
