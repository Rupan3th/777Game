<%@ Page Language="C#" AutoEventWireup="true" CodeFile="image.aspx.cs" Inherits="media_image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="common.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 39px;
        }

        .auto-style3 {
            width: 120px;
        }

        .auto-style4 {
            width: 89px;
        }
    </style>

    <script>
        function clickimg(id)
        {
            var param = "type=image&id=" + id;
            PostAjax("/Ajax/rcnt_update.ashx", param);
            window.open("/media/imgview.aspx?id="+id, "media_page", "", true);
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

            <table style="width: 100%;">
                <tr>
                    <td style="vertical-align: middle;" class="auto-style1">图片</td>
                    <td style="vertical-align: middle;" class="auto-style4">
                        <asp:DropDownList ID="ddlKInd" runat="server" DataSourceID="SqlDataSource1" DataTextField="kname" DataValueField="id" Height="22px" Width="103px" OnDataBound="ddlKInd_DataBound">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, kname FROM kinds2 WHERE ((detail_id = 26) AND (isdel = 0))"></asp:SqlDataSource>
                    </td>
                    <td style="vertical-align: middle;" class="auto-style3">
                        <asp:DropDownList ID="ddlSort" runat="server" Height="22px" Width="110px">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem Value="1">조회수별</asp:ListItem>
                            <asp:ListItem Value="2">인기도별</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="vertical-align: middle;">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center;">&nbsp;</td>
                    <td colspan="3">
                        <asp:TextBox ID="tbSearch" runat="server" Width="378px"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="查询" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div>

                            <asp:DataList ID="dlMovie" runat="server" RepeatColumns="4" Width="100%" RepeatDirection="Horizontal">
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemTemplate>
                                    <table style="width: 260px; height: 220px; background-color: white">
                                        <tr>
                                            <td colspan="2" style="height: 145px">
                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "javascript:clickimg(" + Eval("id").ToString() + ")" %> '>
                                                    <asp:Image ID="Image2" runat="server" Width="260px" Height="145px" ImageUrl='<%# utility.GetImgSrc("image", Eval("ptname").ToString(), Eval("pathname").ToString(), Eval("p_url").ToString()) %>' />
                                                </asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: left; font-size:14px">
                                                <asp:Label ID="Label1" runat="server" Text='<%# utility.SimplifedStr(Eval("ptname").ToString(), 25) %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: left; font-size:14px">
                                                <asp:Label ID="Label2" runat="server" Text='<%# utility.GetDateFormNow(Eval("regdate").ToString()) %>'></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text="天 之前"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; font-size:14px">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("rcnt") %>'></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text="人观看"></asp:Label>
                                            </td>
                                            <td style="text-align: right; font-size:14px">
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
                                            <td>
                                                [<asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
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
    </form>
</body>
</html>
