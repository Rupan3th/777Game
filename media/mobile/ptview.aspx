<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ptview.aspx.cs" Inherits="media_mobile_ptview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/files/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.min.js"></script>
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
            if ($.cookie("image#" + user_id + "#" + id) == undefined)
                $.cookie("image#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=image&id=" + id + "&hao=1&len=350");

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
            if ($.cookie("image#" + user_id + "#" + id) == undefined)
                $.cookie("image#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=image&id=" + id + "&bad=1&len=350");

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
                <form id="form1" runat="server" style="height: 100%;">
                    <div style="height: 30px;">
                        <!--Only For space-->
                    </div>
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                    <asp:HiddenField ID="hfpathname" runat="server" />
                    <asp:HiddenField ID="hfwidth" runat="server" />

                    <asp:DataList ID="DataList1" runat="server" Style="margin: 0 auto" align="center" DataSourceID="SqlDataSource1" RepeatColumns="1" Width="100%" RepeatDirection="Horizontal">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# GetImgSrcEx("image", Eval("p_url").ToString()) %>' Width="100%" Style="padding: 5px" />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, photo_id, p_url, regdate, isdel FROM photolst WHERE ((isdel = ?) AND (photo_id = ?))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                            <asp:QueryStringParameter DefaultValue="0" Name="photo_id" QueryStringField="id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div style="height: 10px;">
                        <!--Only For space-->
                    </div>
                    <table style="margin: 0 auto; width: 90%; height: 100px" align="center">
                        <tr>
                            <td>
                                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" Width="100%" Height="100px">
                                    <ItemTemplate>
                                        <table style="height: 100%; width: 70%; border-width: 1px; border-color: #AAAAAA; border-style: solid; border-collapse: separate; border-radius: 7px;">
                                            <tr style="line-height: 0px">
                                                <td colspan="2" style="word-wrap: hyphenate; text-align: center;">
                                                    <asp:Label ID="lblHao" runat="server" BackColor="#78B300" Height="5px" Width='<%# GetHaoWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label><asp:Label ID="lblBad" runat="server" BackColor="#CC0001" Height="5px" Width='<%# GetBadWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="line-height: 0px">
                                                <td style="padding: 30px">
                                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/files/image/mark_hao.png" Height="30px" />
                                                    <asp:Label ID="lblHaoNum" runat="server" Text='<%# Eval("hao") %>'></asp:Label>
                                                </td>
                                                <td style="text-align: right; padding: 30px;">
                                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/files/image/mark_bad.png" Height="30px" />
                                                    <asp:Label ID="lblBadNum" runat="server" Text='<%# Eval("bad") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, hao, bad FROM photo WHERE (id = ?)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td style="width: 15%; text-align: right;">
                                <asp:ImageButton ID="imgHao" runat="server" Height="100%" ImageUrl="~/files/image/hao.png" ImageAlign="AbsMiddle" OnClientClick="onclick_hao();return false;" />

                            </td>
                            <td style="width: 15%; text-align: right;">
                                <asp:ImageButton ID="imgBad" runat="server" Height="100%" ImageUrl="~/files/image/bad.png" ImageAlign="AbsMiddle" OnClientClick="onclick_bad();return false;" />

                            </td>
                        </tr>
                    </table>
                    <div style="height: 30px;">
                        <!--Only For space-->
                    </div>
                    <div style="width: 90%; margin: 0 auto; text-align: left;" align="center">
                        <asp:Label ID="lblBefore" runat="server" Text="2"></asp:Label>天 之前,
                        <asp:Label ID="lblAmount" runat="server" Text="123123"></asp:Label>人观看
                    </div>
                    <div style="height: 30px;">
                        <!--Only For space-->
                    </div>
            </td>
            </form>
            </td>
        </tr>
    </table>
</body>
</html>
