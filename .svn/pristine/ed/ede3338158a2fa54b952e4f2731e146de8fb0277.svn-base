<%@ Control Language="C#" AutoEventWireup="true" CodeFile="recent_novel.ascx.cs" Inherits="media_recent_novel" %>
<style>
    .myDataGridClass > tbody > tr > td /* Apply border to all cells */ {
        border-top: 1px dashed rgba(153, 153, 153, 0.2);
        border-bottom: 1px dashed rgba(153, 153, 153, 0.2);
    }

    .myDataGridClass > tbody > tr:last-child > td /* Remove bottom border */ {
        border-bottom-width: 0;
    }

    .myDataGridClass > tbody > tr:first-child > td /* Remove bottom border */ {
        border-top-width: 0;
    }


    /*Sample Css for gridview{{{{{{{{{{{{{{{{{{{*/
    .ReMeDataGridClass > tbody > tr > td /* Apply border to all cells */ {
        border: 1px dashed rgba(153, 153, 153, 1);
    }

    .ReMeDataGridClass > tbody > tr > th /* Apply border to headers */ {
        border: 0px dashed black;
    }

    .ReMeDataGridClass > tbody > tr > td:last-child /* Remove right-side border */ {
        border-bottom-width: 0;
    }

    .ReMeDataGridClass > tbody > tr > td:first-child /* Remove left-side border */ {
        border-left-width: 0;
    }

    .ReMeDataGridClass > tbody > tr > th:last-child /* Remove right-side header border */ {
        border-right-width: 0;
    }

    .ReMeDataGridClass > tbody > tr > th:first-child /* Remove left-side header border */ {
        border-left-width: 0;
    }

    .ReMeDataGridClass > tbody > tr:last-child > td /* Remove bottom border */ {
        border-bottom-width: 1;
    }

    .ReMeDataGridClass > tbody > tr > th /* Remove top border */ {
        border-top-width: 1;
    }
    /*Sample Css for gridview}}}}}}}}}}}}}}}}}}}}}}}}}*/
</style>
<table style="width: 100%; text-align: left; vertical-align: top;">
    <tr>
        <td style="text-align: left; vertical-align: top; width: 70%">
            <asp:GridView ID="gvByRecent" runat="server" DataSourceID="SqlDataSource2"
                Style="margin: 0 auto" align="center" AutoGenerateColumns="False"
                PageSize="20" Width="100%" OnDataBinding="GridView1_DataBinding" ShowHeader="False" GridLines="None" CssClass="myDataGridClass" BackColor="#F6F6F9">
                <Columns>
                    <asp:TemplateField HeaderText="등록날자">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("regdate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# GetDateStr(Eval("regdate").ToString()) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="제목">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# utility.SimplifedStr(Eval("nvname").ToString(), 100) %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="hl" runat="server" NavigateUrl='<%# "~/media/Default.aspx?type=2&mvid="+ Eval("id").ToString()%>'>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nvname") %>'></asp:Label>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="조회수">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("rcnt") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            阅读 :
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("rcnt") %>'></asp:Label>
                            &nbsp;次
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Height="47px" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                SelectCommand=""></asp:SqlDataSource>
        </td>
        <td style="text-align: left; vertical-align: top;">
            <table style="width: 100%; background-color: #F6F6F9;">
                <tr>
                    <td>
                        <img alt="" src="/files/image/novelorder_read.png" style="height:46px" /></td>
                </tr>
                <tr style="height: 1px; background-color: rgba(153, 153, 153, 1);">
                    <td></td>
                </tr>
            </table>
            <asp:GridView ID="gvByRead" runat="server" DataSourceID="SqlDataSource3"
                Style="margin: 0 auto" align="center" AutoGenerateColumns="False" PageSize="20" Width="100%"
                OnDataBinding="GridView3_DataBinding" ShowHeader="False" GridLines="None" CssClass="myDataGridClass" BackColor="#F6F6F9">
                <Columns>
                    <asp:TemplateField HeaderText="제목">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("nvname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            &nbsp;<img alt="" src="<%# GetMarkImg() %>"" />&nbsp;<asp:HyperLink ID="hl0" runat="server" NavigateUrl='<%# "~/media/Default.aspx?type=2&mvid="+ Eval("id").ToString()%>'>
                                <asp:Label ID="Label4" runat="server" Text='<%# utility.SimplifedStr(Eval("nvname").ToString(), 40) %>'></asp:Label>
                            </asp:HyperLink>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Height="47px" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                SelectCommand=""></asp:SqlDataSource>
        </td>
    </tr>
</table>
