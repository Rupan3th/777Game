﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="recent_image.ascx.cs" Inherits="media_recent_image" %>
<script>
    function clickimg(id) {
        var param = "type=movie&id=" + id;
        PostAjax("/Ajax/rcnt_update.ashx", param);
        window.open("/media/Default.aspx?type=1&mvid=" + id, "_self", "", true);
    }
</script>
<asp:DataList ID="dlMovie" runat="server" RepeatColumns="5" Width="100%" RepeatDirection="Horizontal" DataKeyField="id" DataSourceID="SqlDataSource1" OnDataBinding="dlMovie_DataBinding">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    <ItemTemplate>
        <table style="width: 240px; height: 220px; background-color: white">
            <tr>
                <td colspan="2" style="height: 145px">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "javascript:clickimg(" + Eval("id").ToString() + ")" %> '>
                        <asp:Image ID="Image2" runat="server" Width="240px" Height="145px" ImageUrl='<%# utility.GetImgSrc("image", Eval("ptname").ToString(), Eval("pathname").ToString(), Eval("p_url").ToString()) %>' />
                    </asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left; font-size: 14px">
                    <asp:Label ID="Label1" runat="server" Text='<%# utility.SimplifedStr(Eval("ptname").ToString(), 25) %>'></asp:Label>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
    SelectCommand="">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
