<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SMView.aspx.cs" Inherits="media_SMView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>...</title>
    <link href="/files/css/bootstrap.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 100%; text-align:center;">
                    <tr>
                        <td style="width:150px">Date</td>
                        <td style="width:100px">Sender</td>
                        <td>Content</td>
                    </tr>
                </table>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
            <ItemTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td style="width:150px; text-align:center;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("regdate") %>'></asp:Label>
                        </td>
                        <td style="width:100px; text-align:center;">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("sender") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
            SelectCommand="SELECT id, sender, receiver, type, subject, content, regdate FROM msglun WHERE ((is_read = ?) AND (receiver = ?))">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="is_read" Type="Int32" />
                <asp:SessionParameter DefaultValue="-1" Name="receiver" SessionField="user_id" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
