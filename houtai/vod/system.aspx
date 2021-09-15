<%@ Page Language="C#" AutoEventWireup="true" CodeFile="system.aspx.cs" Inherits="houtai_vod_system" validateRequest="false" %>

<%@ Register Src="../../cheditor/cheditor.ascx" TagName="cheditor" TagPrefix="uc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/cheditor/ckeditor.js"></script>
    <style type="text/css">
        .round-button {
            background-color: #169BD5;
            -webkit-border-radius: 7px;
            padding: 5px;
        }

    </style>
    <script>
        function sel_changed(id, _this) {
            switch (id) {
                case 0:
                    jQuery("#tr_id").show();
                    jQuery("#tr_range").hide();
                    break;
                case 1:
                    jQuery("#tr_id").hide();
                    jQuery("#tr_range").show();
                    break;
            }
        }
        function htmlContent()
        {
            //alert(jQuery(".cke_wysiwyg_frame").html())
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="100%" OnPreRender="FormView1_PreRender">
                        <InsertItemTemplate>
                            <table style="width: 100%;">
                                <tr>
                                    <td style="vertical-align: top; text-align: center" class="auto-style2"><span>网站公告</span></td>
                                    <td style="vertical-align: top;">
                                        <asp:TextBox ID="tbcontent" runat="server" Height="192px" Width="518px" TextMode="MultiLine" MaxLength="512" Text='<%# Bind("content") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbcontent" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnModify" CssClass="round-button" runat="server" BackColor="#169BD5" Text="确定修改" Height="45px" Width="115px" CommandName="Insert" />
                                        <asp:TextBox ID="tbadmin_id" runat="server" Text='<%# Bind("admin_id") %>' Style="display: none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                        DeleteCommand="DELETE FROM announcement WHERE id = ?"
                        InsertCommand="INSERT INTO announcement (id, admin_id, content) VALUES (?, ?, ?)"
                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                        SelectCommand="SELECT id, admin_id, content, regdate, isdel FROM announcement WHERE (isdel = ?)"
                        UpdateCommand="UPDATE announcement SET admin_id = ?, content = ?, regdate = ?, isdel = ? WHERE id = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                            <asp:Parameter Name="admin_id" Type="Int32" />
                            <asp:Parameter Name="content" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="admin_id" Type="Int32" />
                            <asp:Parameter Name="content" Type="String" />
                            <asp:Parameter Name="regdate" Type="DateTime" />
                            <asp:Parameter Name="isdel" Type="Int32" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2" DefaultMode="Insert" Width="100%" OnPreRender="FormView2_PreRender">
                        <InsertItemTemplate>
                            <table style="width: 70%;">
                                <tr>
                                    <td style="text-align: center;width:170px;">
                                        <span>发送站内信</span>
                                    </td>
                                    <td>
                                        <input id="rbinvidual" checked="checked" name="type" onchange="sel_changed(0, this)" type="radio">单发站内信</input>&nbsp;&nbsp;
                                        <input id="rbrange" name="type" onchange="sel_changed(1, this)" type="radio">指定会员组</input>
                                    </td>
                                </tr>
                                <tr id="tr_id">
                                    <td style="text-align: center;width:170px;">
                                        <span>接收ID</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbrecvid" runat="server" Width="226px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbrecvid" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                        <asp:CustomValidator ID="cvExistID" runat="server" ControlToValidate="tbrecvid" ErrorMessage="*" ForeColor="#FF3300" OnServerValidate="cvExistID_ServerValidate"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr id="tr_range" style="display: none;">
                                    <td style="text-align: center;width:170px;">
                                        <span>会员组</span>
                                    </td>
                                    <td>
                                        <select id="selrange"  style="width:200px" name="D1">
                                            <option></option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;width:170px;">
                                        <span>信件标题</span>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbtitle" runat="server" MaxLength="256" Text='<%# Bind("subject") %>' Width="558px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbtitle" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;width:170px;">
                                        <span>信件内容</span>
                                    </td>
                                    <td>
                                        <asp:TextBox id="editor1" name="editor1" style="width: 612px;height: 286px;" runat="server" Text='<%# Bind("content") %>' TextMode="MultiLine"></asp:TextBox>
                                        <script>
                                            CKEDITOR.replace('FormView2$editor1', {
                                                // Load the German interface.
                                                language: 'zh-cn'
                                            });
                                        </script>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center;width:170px;">&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnSend" runat="server" BackColor="#169BD5" CssClass="round-button" Height="45px" Text="确定发送" Width="115px" CommandName="Insert" OnClientClick="htmlContent()" />
                                        <asp:TextBox ID="tbsender" runat="server" Text='<%# Bind("sender") %>' style="display:none;"></asp:TextBox>
                                        <asp:TextBox ID="tbreceiver" runat="server" Text='<%# Bind("receiver") %>' style="display:none;"></asp:TextBox>
                                        <asp:TextBox ID="tbtype" runat="server" Text='<%# Bind("type") %>' style="display:none;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                        DeleteCommand="DELETE FROM msglun WHERE id = ?"
                        InsertCommand="INSERT INTO msglun (id, sender, receiver, type, subject, content) VALUES (?, ?, ?, ?, ?, ?)"
                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                        SelectCommand="SELECT id, sender, receiver, type, subject, content FROM msglun"
                        UpdateCommand="UPDATE msglun SET sender = ?, receiver = ?, type = ?, subject = ?, content = ? WHERE id = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                            <asp:Parameter Name="sender" Type="Int64" />
                            <asp:Parameter Name="receiver" Type="Int64" />
                            <asp:Parameter Name="type" Type="Int32" />
                            <asp:Parameter Name="subject" Type="String" />
                            <asp:Parameter Name="content" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="sender" Type="Int64" />
                            <asp:Parameter Name="receiver" Type="Int64" />
                            <asp:Parameter Name="type" Type="Int32" />
                            <asp:Parameter Name="subject" Type="String" />
                            <asp:Parameter Name="content" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
