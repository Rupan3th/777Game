<%@ Control Language="C#" AutoEventWireup="true" CodeFile="page_control.ascx.cs" Inherits="page_control" %>
<table>
    <tr>
        <td>
            <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">|&lt;</asp:LinkButton>
        </td>
        <td>
            <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">下页</asp:LinkButton>
        </td>
        <td style="text-align:center">
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
            <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>
