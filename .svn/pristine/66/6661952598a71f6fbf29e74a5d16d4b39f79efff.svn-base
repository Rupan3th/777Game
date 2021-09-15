<%@ Page Language="C#" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="houtai_vod_content" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/url.js"></script>
    <link href="/files/css/houtai.css" rel="stylesheet" />
    <style>
        .menu_item {
            text-align: center;
        }

        .sel_tab, #menuTabn0, #menuTabn1, #menuTabn2 {
            border-top-style: solid;
            border-right-style: solid;
            border-left-style: solid;
            border-top-color: #000000;
            border-right-color: #000000;
            border-left-color: #000000;
            border-top-width: 1px;
            border-right-width: 1px;
            border-left-width: 1px;
        }

        .unsel_tab {
            border-bottom-style: solid;
            border-bottom-color: #000000;
            border-bottom-width: 1px;
        }

        .round-button {
            background-color: #169BD5;
            -webkit-border-radius: 7px;
            padding: 5px;
        }

        .auto-style1 {
            width: 500px;
            text-align: center;
        }
    </style>
    <script>
        function confirmDel() {
            return confirm('确实要删除这些项目？');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Menu ID="menuTab" runat="server" Height="50px" Orientation="Horizontal" RenderingMode="Table" Width="449px" CssClass="menu_item" ForeColor="Black">
                            <Items>
                                <asp:MenuItem Text="视频列表" Value="0" NavigateUrl="?id=0"></asp:MenuItem>
                                <asp:MenuItem Text="图片列表" Value="1" NavigateUrl="?id=1"></asp:MenuItem>
                                <asp:MenuItem Text="小说列表" Value="2" NavigateUrl="?id=2"></asp:MenuItem>
                            </Items>
                        </asp:Menu>

                        <asp:HiddenField ID="hdType" runat="server" Value="0" />
                        <asp:HiddenField ID="hdClssId" runat="server" Value="0" />
                        <asp:HiddenField ID="hddetialid" runat="server" Value="25" />

                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style3">
                                    <asp:DropDownList ID="ddlClssId" runat="server" Height="25px" Width="142px" DataSourceID="SqlDataSource2" DataTextField="kname" DataValueField="id" OnDataBinding="ddlClssId_DataBinding">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                        ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                        SelectCommand="SELECT id, kname FROM kinds2 WHERE ((detail_id = ?) AND (isdel = ?))">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hddetialid" DefaultValue="25" Name="detail_id" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </td>
                                <td>
                                    <asp:TextBox ID="tbBegin" runat="server" type="date"></asp:TextBox></td>
                                <td>~</td>
                                <td>
                                    <asp:TextBox ID="tbEnd" runat="server" type="date"></asp:TextBox></td>
                                <td class="auto-style2">
                                    <asp:Button ID="btnSearch" runat="server" Text="查询" Width="64px" class="round-button" OnClick="btnSearch_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" OnActiveViewChanged="MultiView1_ActiveViewChanged">
                            <asp:View ID="View1" runat="server">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Vertical" PageSize="12" DataKeyNames="id" OnDataBinding="GridView1_DataBinding" OnPageIndexChanging="GridView1_PageIndexChanging" BorderStyle="Dotted" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="选">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSel" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编号">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNo" runat="server" Text="<%# GetNo() %>"></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>' Style="display: none"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                        <asp:BoundField>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="mvname">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kname" HeaderText="分类">
                                            <HeaderStyle HorizontalAlign="Center" Width="70px" />
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="coin" HeaderText="观看金币">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hao" HeaderText="人气">
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Text="删除" CommandArgument='<%# Eval("id").ToString() %>' OnCommand="OnDeleteByManual"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#E9F1FF" Font-Bold="True" ForeColor="#666666" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#E9F1FF" ForeColor="#666666" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="#CCCCCC" BorderStyle="Dotted" BorderWidth="1px" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                    SelectCommand="">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="id" Type="Int32" />
                                        <asp:Parameter Name="mvname" Type="String" />
                                        <asp:Parameter Name="clss_id" Type="Int32" />
                                        <asp:Parameter Name="coin" Type="Single" />
                                        <asp:Parameter Name="hao" Type="Int32" />
                                        <asp:Parameter Name="i_url" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="mvname" Type="String" />
                                        <asp:Parameter Name="clss_id" Type="Int32" />
                                        <asp:Parameter Name="coin" Type="Single" />
                                        <asp:Parameter Name="hao" Type="Int32" />
                                        <asp:Parameter Name="i_url" Type="String" />
                                        <asp:Parameter Name="id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View2" runat="server" OnActivate="View2_Activate">
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="Vertical" AllowPaging="True" OnDataBinding="GridView2_DataBinding" PageSize="12" OnPageIndexChanging="GridView2_PageIndexChanging" BackColor="#666666" BorderStyle="Dotted" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="选">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSel" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编号">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GetPhotoNo() %>"></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>' Style="display: none"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ptname">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="分类" DataField="kname">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hao" HeaderText="人气">
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" Text="删除" CommandArgument='<%# Eval("id").ToString() %>' OnCommand="OnDeletePhoto"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#E9F1FF" Font-Bold="True" ForeColor="#666666" />
                                    <PagerStyle BackColor="#E9F1FF" ForeColor="#666666" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="1px" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                    SelectCommand=""></asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View3" runat="server" OnActivate="View3_Activate">
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="Vertical" OnDataBinding="GridView3_DataBinding" AllowPaging="True" PageSize="12" OnPageIndexChanging="GridView3_PageIndexChanging" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="选">
                                            <EditItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSel" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编号">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GetNovelNo() %>"></asp:Label>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' style="display:none"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nvname">
                                        <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kname" HeaderText="分类">
                                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hao" HeaderText="人气">
                                        <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" OnCommand="OnDeleteNovel" Text="删除" CommandArgument='<%# Eval("id") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="70px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#E9F1FF" Font-Bold="True" ForeColor="#666666" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="1px" />
                                    <PagerStyle BackColor="#E9F1FF" ForeColor="#666666" HorizontalAlign="Center" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="1px" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="#666666" BorderStyle="Dotted" BorderWidth="1px" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                    ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
                                    SelectCommand="" >
                                </asp:SqlDataSource>
                            </asp:View>
                        </asp:MultiView>
                    </td>
                </tr>
                <tr>
                    <td>

                        <asp:ImageButton ID="imsellall" runat="server" ImageUrl="~/files/image/selall.png" OnClick="imsellall_Click" />
                        <asp:ImageButton ID="imselldel" runat="server" ImageUrl="~/files/image/seldel.png" OnClick="imselldel_Click" OnClientClick="javascript:return confirmDel();" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
    <script>
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

        function setSelTab(nTab) {

            switch (nTab) {
                case "0":
                    jQuery("#menuTabn0").removeClass("unsel_tab");
                    jQuery("#menuTabn1").addClass("unsel_tab");
                    jQuery("#menuTabn2").addClass("unsel_tab");
                    break;
                case "1":
                    jQuery("#menuTabn0").addClass("unsel_tab");
                    jQuery("#menuTabn1").removeClass("unsel_tab");
                    jQuery("#menuTabn2").addClass("unsel_tab");
                    break;
                case "2":
                    jQuery("#menuTabn0").addClass("unsel_tab");
                    jQuery("#menuTabn1").addClass("unsel_tab");
                    jQuery("#menuTabn2").removeClass("unsel_tab");
                    break;
            }

        }

        var b = getParameterByName('id');
        if (b == null) b = "0";
        setSelTab(b);
    </script>
</body>
</html>
