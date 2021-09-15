<%@ Page Language="C#" AutoEventWireup="true" CodeFile="advert.aspx.cs" Inherits="houtai_vod_advert" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/files/css/houtai.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td>

                        <asp:Image ID="imgAdvLayout" runat="server" ImageAlign="Baseline" ImageUrl="~/files/image/adv_layout.png" />
                        <br />

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True"
                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Vertical" DataKeyNames="id" OnRowUpdating="GridView1_RowUpdating" OnDataBinding="GridView1_DataBinding" BorderStyle="Dotted">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="选">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="cbSel" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSel" runat="server" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="编号">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNo" runat="server" Text="<%# GetNo() %>"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="广告标题">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbtitle" runat="server" Text='<%# Bind("title") %>' Width="90%" MaxLength="200"></asp:TextBox>
                                        <asp:TextBox ID="tbid" runat="server" Text='<%# Bind("id") %>' Style="display: none;"></asp:TextBox>
                                        <asp:TextBox ID="tbvisible" runat="server" Text='<%# Bind("visible") %>' Style="display: none;"></asp:TextBox>
                                        <asp:TextBox ID="tbisdel" runat="server" Text='<%# Bind("isdel") %>' Style="display: none;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbtitle" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>' Style="display: none;"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="250px" HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="广告地址">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("content") %>' Width="100%" MaxLength="256"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("content") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="配置">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="tbLayout" runat="server" Text='<%# Bind("layout") %>' Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbLayout" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbLayout" ErrorMessage="*" ForeColor="#FF3300" MaximumValue="2" MinimumValue="0"></asp:RangeValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("layout") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="主页显示">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="chvisible" runat="server" Checked='<%# IsVisible(Eval("visible").ToString()) %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# MarkVisible(Eval("visible").ToString()) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="修改"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="修改"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="删除"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="100px" Font-Size="12px" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#E9F1FF" Font-Bold="True" ForeColor="Black" />
                            <PagerStyle BackColor="#EBF3FF" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px"  />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                            DeleteCommand="UPDATE advertisement SET isdel = 1 WHERE id = ?"
                            InsertCommand="INSERT INTO advertisement (id, admin_id, title, content, visible, regdate, isdel) VALUES (?, ?, ?, ?, ?, ?, ?)"
                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                            SelectCommand="SELECT id, admin_id, title, content, layout, visible, regdate, isdel FROM advertisement WHERE isdel=0 ORDER BY id DESC"
                            UpdateCommand="UPDATE advertisement SET title = ?, content = ?, layout = ?, visible = ?, isdel = ? WHERE id = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="id" Type="Int32" />
                                <asp:Parameter Name="admin_id" Type="Int32" />
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="content" Type="String" />
                                <asp:Parameter Name="visible" Type="Int32" />
                                <asp:Parameter Name="regdate" Type="DateTime" />
                                <asp:Parameter Name="isdel" Type="Int32" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="title" Type="String" />
                                <asp:Parameter Name="content" Type="String" />
                                <asp:Parameter Name="layout" Type="Int32" />
                                <asp:Parameter Name="visible" Type="Int32" />
                                <asp:Parameter Name="isdel" Type="Int32" />
                                <asp:Parameter Name="id" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 200px">
                                    <asp:ImageButton ID="ibSelAll" runat="server" ImageUrl="~/files/image/selall.png" OnClick="ibSelAll_Click" />
                                    <asp:ImageButton ID="ibSelDel" runat="server" ImageUrl="~/files/image/seldel.png" OnClick="ibSelDel_Click" />
                                </td>
                                <td>
                                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" DefaultMode="Insert" OnPreRender="FormView1_PreRender" OnItemInserted="FormView1_ItemInserted" Width="100%">
                                        <InsertItemTemplate>
                                            <table style="width: 100%; height:28px">
                                                <tr>
                                                    <td width="250px">
                                                        <asp:TextBox ID="tbtitle" Width="90%" runat="server" Text='<%# Bind("title") %>' Height="25px" MaxLength="200"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbtitle" ErrorMessage="*" ForeColor="#FF3300" ValidationGroup="advadd"></asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbcontent" Width="90%" runat="server" Text='<%# Bind("content") %>' Height="25px" MaxLength="256"></asp:TextBox>
                                                        <asp:TextBox ID="tbadminid" runat="server" Text='<%# Bind("admin_id") %>' Style="display: none"></asp:TextBox>
                                                    </td>
                                                    <td width="100px">
                                                        <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Insert" ImageUrl="~/files/image/add_adv.png" ValidationGroup="advadd" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                        DeleteCommand="DELETE FROM advertisement WHERE id = ?"
                                        InsertCommand="INSERT INTO advertisement (admin_id, title, content) VALUES (?, ?, ?)"
                                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                        SelectCommand="SELECT admin_id, title, content, visible, id FROM advertisement"
                                        UpdateCommand="UPDATE advertisement SET admin_id = ?, title = ?, content = ?, visible = ? WHERE id = ?">
                                        <DeleteParameters>
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="admin_id" Type="Int32" />
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="content" Type="String" />
                                            <asp:Parameter Name="visible" Type="Int32" />
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="admin_id" Type="Int32" />
                                            <asp:Parameter Name="title" Type="String" />
                                            <asp:Parameter Name="content" Type="String" />
                                            <asp:Parameter Name="visible" Type="Int32" />
                                            <asp:Parameter Name="id" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
