<%@ Page Language="C#" AutoEventWireup="true" CodeFile="movie.aspx.cs" Inherits="media_movie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="common.js"></script>

    <style type="text/css">
        .auto-style5 {
            width: 78px;
        }

        .auto-style6 {
            width: 103px;
        }
    </style>
    <script>
        var movie_id = 0;
        function clickimg(id) {
            var param = "type=movie&id=" + id;
            PostAjax("/Ajax/rcnt_update.ashx", param);
            window.open("/media/mplay.aspx?id=" + id, "media_page", "", true);
        }

        var mvid = getParameterByName('mvid');
        if (mvid != null) {
            clickimg(mvid);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pnlSearch" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style5">视频</td>
                        <td class="auto-style6">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, kname FROM kinds2 WHERE ((detail_id = 25) AND (isdel = 0))"></asp:SqlDataSource>
                            <asp:DropDownList ID="ddlKInd" runat="server" DataSourceID="SqlDataSource1" DataTextField="kname" DataValueField="id" Height="22px" OnDataBound="ddlKInd_DataBound" Width="103px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlSort" runat="server" Height="22px" Width="110px">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="1">조회수별</asp:ListItem>
                                <asp:ListItem Value="2">인기도별</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                        <td colspan="2">
                            <asp:TextBox ID="tbSearch" runat="server" Width="378px"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="查询" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <table style="width: 100%;">
                <tr>
                    <td style="text-align: center;">
                        <div>

                            <asp:DataList ID="dlMovie" runat="server" RepeatColumns="4" Width="100%">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <table style="width: 260px; height: 220px; background-color: white">
                                        <tr>
                                            <td colspan="2" style="height: 145px">
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "javascript:cash_confirm(" + Eval("id").ToString() + ", "+Eval("coin").ToString()+")" %>'>
                                                    <asp:Image ID="Image2" runat="server" Width="260px" Height="145px" ImageUrl='<%# utility.GetImgSrc("movie", Eval("mvname").ToString(), Eval("pathname").ToString(), Eval("i_url").ToString()) %>' />
                                                </asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: left">
                                                <asp:Label ID="Label1" runat="server" Text='<%# utility.SimplifedStr(Eval("mvname").ToString(), 25) %>' Font-Size="14px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: left; font-size: 14px">
                                                <asp:Label ID="Label2" runat="server" Text='<%# utility.GetDateFormNow(Eval("regdate").ToString()) %>'></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text="天 之前"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; font-size: 14px">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("rcnt") %>'></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text="人观看"></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-size: 14px">
                                                <asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/files/image/hart.png" />
                                                <asp:Label ID="Label5" runat="server" Text='<%# utility.GetInteresting(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                            </asp:DataList>

                        </div>
                        <table style="margin: 0 auto" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <%--//{This Code For paging process about datalist control--%>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">|&lt;</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">下页</asp:LinkButton>
                                            </td>
                                            <td style="text-align: center">
                                                <asp:DataList ID="rptPaging" runat="server"
                                                    OnItemCommand="rptPaging_ItemCommand"
                                                    OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbPaging" runat="server"
                                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="newPage"
                                                            Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">上页</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbLast" runat="server" OnClick="lbLast_Click">&gt;|</asp:LinkButton>
                                            </td>
                                            <td>[<asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                                                ]</td>
                                        </tr>
                                    </table>
                                    <%--//}This Code For paging process about datalist control--%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
        <!--{Alert Confirm Dialog-->
        <style type="text/css">
            .ConfirmAlert {
                width: 270px;
                height: 150px;
                position: absolute;
                left: 50%;
                top: 50%;
                margin: -75px 0 0 -135px;
            }

            .round-button {
                -webkit-border-radius: 7px;
            }
        </style>
        <div class="ConfirmAlert round-button" style="display: none; border-width: 1px; background-color: #FFFFFF; padding: 5px;">
            <table class="round-button" style="border: 1px solid #9FCDA9; width: 100%; position: relative; height: 100%; background-color: #FFFCEB; padding: 0px;">
                <tr>
                    <td colspan="3" style="background-color: #EB5A3D; text-align: center; font-weight: bold; color: #FFFFFF; -webkit-border-radius: 7px;">观看收费内容</td>
                </tr>
                <tr>
                    <td rowspan="2" style="text-align: center;">
                        <img alt="" src="/files/image/cash_confirm.png" /></td>
                    <td colspan="2" style="text-align: center;"><strong>继续观看收费内容<br />
                        需支付对应元宝</strong></td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <input id="btnYes" class="round-button" type="button" value="YES" style="width: 68px; height: 33px; background-color: #356372; color: #FFFFFF;" /></td>
                    <td style="text-align: center;">
                        <input id="btnNo" class="round-button" type="button" value="NO" style="width: 68px; height: 33px; background-color: #316271; color: #FFFFFF;" /></td>
                </tr>
            </table>
        </div>
        <script>
            //REFME
            //jQuery("#Button1").click(function () {
            //    var IsOn = jQuery(".ConfirmAlert").css("display");
            //    if (IsOn == "none") jQuery(".ConfirmAlert").css("display", "block");
            //    else jQuery(".ConfirmAlert").css("display", "none");
            //});
            function cash_confirm(id, coin) {
                movie_id = id;
                if (eval(coin) > 0) {
                    jQuery(".ConfirmAlert").css("display", "block");
                }
                else clickimg(movie_id);
            }

            jQuery("#btnYes").click(function () {
                //insert Code;
                clickimg(movie_id);
            });
            jQuery("#btnNo").click(function () {
                jQuery(".ConfirmAlert").css("display", "none");
            });
        </script>
        <!--}Alert Confirm Dialog-->
    </form>
</body>
</html>
