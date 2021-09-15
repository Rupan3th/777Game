<%@ Page Language="C#" AutoEventWireup="true" CodeFile="novel.aspx.cs" Inherits="media_novel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
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
        function clicknovel(id) {
            var param = "type=novel&id=" + id;
            PostAjax("/Ajax/rcnt_update.ashx", param);
            location.href = '?mvid=' + id;
        }
    </script>
</head>
<body style="margin: 0 0 0 0;position:absolute; width:100%; height:100%">
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <table style="width: 100%;">
                        <tr>
                            <td style="vertical-align: middle;" class="auto-style1">小说</td>
                            <td style="vertical-align: middle;" class="auto-style4">
                                <asp:DropDownList ID="ddlKInd" runat="server" DataSourceID="SqlDataSource1" DataTextField="kname" DataValueField="id" Height="22px" Width="103px" OnDataBound="ddlKInd_DataBound">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                    SelectCommand="SELECT id, kname FROM kinds2 WHERE ((detail_id = 27) AND (isdel = 0))"></asp:SqlDataSource>
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
                                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" Style="margin: 0 auto" align="center" AllowPaging="True" AutoGenerateColumns="False" BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" GridLines="None" PageSize="20" Width="100%" OnPageIndexChanging="GridView1_PageIndexChanging" OnDataBinding="GridView1_DataBinding">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNo" runat="server" Text="<%# GetNo() %>"></asp:Label>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>' Style="display: none"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="题目">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("nvname") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hl" runat="server" NavigateUrl='<%# "javascript:clicknovel("+Eval("id").ToString()+");" %>'>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("nvname") %>'></asp:Label>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="hao" HeaderText="推荐数" Visible="False">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="rcnt" HeaderText="阅读次数">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="regdate" HeaderText="登录日期">
                                            <ItemStyle HorizontalAlign="Center" Width="250px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" />
                                    <RowStyle BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                    SelectCommand=""></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table  style="margin: 0 0 0 0;position:absolute; width:100%; height:100%">
                        <tr>
                            <td style="text-align: center; height:100%">
                                <iframe style="margin: 0 0 0 0;height:100%;width:100%;" src="<% var url= GetBookUrl(); Response.Write(url);%>">

                                </iframe>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" style="border-radius:7px" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
