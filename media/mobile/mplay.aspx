<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mplay.aspx.cs" Inherits="media_mobile_mplay" %>

<html>
<head runat="server">
    <title></title>
    <link href="/files/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.min.js"></script>
    <script type="text/javascript" src="//player.wowza.com/player/latest/wowzaplayer.min.js"></script>
    <link href="common.css" rel="stylesheet" />
    <script>
        var user_id = '<%= Session["user_id"] %>';

        function getParameterByName(name, url) {
            if (!url) {
                url = window.location.href;
            }
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        function onclick_hao() {
            var id = getParameterByName("id");
            var id = getParameterByName("id");
            if ($.cookie("movie#" + user_id + "#" + id) == undefined)
                $.cookie("movie#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=movie&id=" + id + "&hao=1&len=350");

                var diff = jQuery("#FormView1_lblHao").width() - AjaxValue;
                jQuery("#FormView1_lblHao").width(AjaxValue);

                var wd = jQuery("#FormView1_lblBad").width();
                jQuery("#FormView1_lblBad").width(wd + diff);

                var nhao = jQuery("#FormView1_lblHaoNum").text();
                jQuery("#FormView1_lblHaoNum").text(eval(nhao) + 1);
            }
        }
        function onclick_bad() {
            var id = getParameterByName("id");
            var id = getParameterByName("id");
            if ($.cookie("movie#" + user_id + "#" + id) == undefined)
                $.cookie("movie#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=movie&id=" + id + "&bad=1&len=350");

                var diff = jQuery("#FormView1_lblBad").width() - AjaxValue;
                jQuery("#FormView1_lblBad").width(AjaxValue);
                var wd = jQuery("#FormView1_lblHao").width();
                jQuery("#FormView1_lblHao").width(wd + diff);

                var nbad = jQuery("#FormView1_lblBadNum").text();
                jQuery("#FormView1_lblBadNum").text(eval(nbad) + 1);
            }
        }
    </script>
</head>
<body style="margin:0;">
    <table style="position: absolute; width: 100%; height: 100%" class="table_form">
        <tr>
            <td style="height: 59px">
                <div style="background-color: #232323; height: 59px; width: 100%; display: table;">
                    <span style="padding-left: 10px; display: table-cell; vertical-align: middle;">
                    </span>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 98px">
                <div class="dropdown" style="white-space: nowrap; background-color: #323232; height: 98px; text-align: left; display: table;">
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
            <td style="height: 100%; vertical-align:top;">
                <form id="form1" runat="server">
                    <table style="width: 100%;">
                        <tr style="height:30px">
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-left:30px">
                                <asp:Label ID="lblSubject" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <table style="padding: 0 auto;width:100%" align="center">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div id="playerElement" style="width:100%; height:0; padding:0 0 56.25% 0""></div>
                                            <%PlacePlayer(); %>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr style="height:10px">
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width:90%; padding: 0 auto; height:100px;" align="center">
                                    <tr>
                                        <td style="text-align: left;">
                                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" Width="100%" Height="100px">
                                                <ItemTemplate>
                                                    <table style="height: 100%; width: 70%; border-width: 1px; border-color: #AAAAAA; border-style: solid;border-radius: 3px;border: 1px solid #CCCCCC;padding: 0px;border-collapse:separate;">
                                                        <tr style="line-height: 0px">
                                                            <td colspan="2" style="word-wrap: hyphenate; text-align: center;">
                                                                <asp:Label ID="lblHao" runat="server" BackColor="#78B300" Height="5px" Width='<%# GetHaoWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label><asp:Label ID="lblBad" runat="server" BackColor="#CC0001" Height="5px" Width='<%# GetBadWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr style="line-height: 0px">
                                                            <td style="padding-left:30px">
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/files/image/mark_hao.png" Height="30px" />
                                                                <asp:Label ID="lblHaoNum" runat="server" Text='<%# Eval("hao") %>'></asp:Label>
                                                            </td>
                                                            <td style="text-align: right;padding-right:30px;">
                                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/files/image/mark_bad.png" Height="30px" />
                                                                <asp:Label ID="lblBadNum" runat="server" Text='<%# Eval("bad") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:FormView>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, hao, bad FROM movie WHERE (id = ?)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td style="width:15%;text-align:right;">
                                            <asp:ImageButton ID="imgHao" Height="100%" runat="server" ImageUrl="~/files/image/hao.png" ImageAlign="AbsMiddle" OnClientClick='onclick_hao();return false;' CausesValidation="False" />
                                        </td>
                                        <td style="width:15%;text-align:right;">
                                           &nbsp;<asp:ImageButton ID="imgBad" Height="100%" runat="server" ImageUrl="~/files/image/bad.png" ImageAlign="AbsMiddle" OnClientClick='onclick_bad();return false;' CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>                                
                            </td>
                        </tr>
                        <tr style="height:20px">
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width:90%; padding: 0 auto;height:100px" align="center">
                                    <tr>
                                        <td style="text-align: left;">
                                            <asp:Label ID="lblBefore" runat="server" Text="2"></asp:Label>
                                            天 之前,
                                            <asp:Label ID="lblAmount" runat="server" Text="123123"></asp:Label>
                                            人观看</td>
                                        <td style="text-align: right;">
                                            <asp:Button ID="btnDownload" runat="server" Style="display:none;background-image: url('/files/image/download.png'); background-size:50%; background-repeat: no-repeat; background-position: center;-webkit-border-radius: 7px; padding: 5px;" Height="100px" width="200px" OnClick="btnDownload_Click" />
                                        </td>
                                     </tr>
                                 </table>
                                
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</body>
</html>
