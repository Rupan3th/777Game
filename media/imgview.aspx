﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="imgview.aspx.cs" Inherits="media_imgview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script>
        function goList() {
            window.open("/media/imgview.aspx?id=" + jQuery("#hfId").attr("value"), "media_page", "", true);
        }
    </script>
    <style type="text/css">
        .round_table {
            border-radius: 3px;
            border: 1px solid #CCCCCC;
            padding: 0px;
            width: 120px;
        }
    </style>
    <script>
        var user_id = '<%= Session["user_id"] %>';

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

        function onclick_hao() {
            var id = getParameterByName("id");
            if ($.cookie("image#" + user_id + "#" + id) == undefined)
                $.cookie("image#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=image&id=" + id + "&hao=1");

                var diff = jQuery("#FormView1_lblHao").width() - AjaxValue;
                jQuery("#FormView1_lblHao").width(AjaxValue);

                var wd = jQuery("#FormView1_lblBad").width();
                jQuery("#FormView1_lblBad").width(wd + diff);

                var nhao = jQuery("#FormView1_lblHaoNum").text();
                jQuery("#FormView1_lblHaoNum").text(eval(nhao) + 1);
            }
        }
        function onclick_bad() {
            var id = getParameterByName("id");
            if ($.cookie("image#" + user_id + "#" + id) == undefined)
                $.cookie("image#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=image&id=" + id + "&bad=1");
                var diff = jQuery("#FormView1_lblBad").width() - AjaxValue;
                jQuery("#FormView1_lblBad").width(AjaxValue);
                var wd = jQuery("#FormView1_lblHao").width();
                jQuery("#FormView1_lblHao").width(wd + diff);

                var nbad = jQuery("#FormView1_lblBadNum").text();
                jQuery("#FormView1_lblBadNum").text(eval(nbad) + 1);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:Label ID="lblSubject" runat="server"></asp:Label>
                        <asp:HiddenField ID="hfpathname" runat="server" />
                        <asp:HiddenField ID="hfwidth" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:MultiView ID="MultiView1" runat="server">
                            <asp:View ID="View1" runat="server">
                                <asp:DataList ID="DataList1" runat="server" Style="margin: 0 auto" align="center" DataSourceID="SqlDataSource1" RepeatColumns="1" Width="100%" RepeatDirection="Horizontal">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# GetDetailUrl() %>'>
                                            <asp:Image ID="Image2" runat="server" ImageUrl='<%# GetImgSrcEx("image", Eval("p_url").ToString()) %>' Width="100%" />
                                        </asp:HyperLink>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, photo_id, p_url, regdate, isdel FROM photolst WHERE ((isdel = ?) AND (photo_id = ?))">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                        <asp:QueryStringParameter DefaultValue="0" Name="photo_id" QueryStringField="id" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </asp:View>
                            <asp:View ID="View2" runat="server">
                                <asp:DataList ID="dlDetail" runat="server" Style="margin: 0 auto" align="center" RepeatColumns="1" Width="100%" OnDataBinding="dlDetail_DataBinding">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# GetImgSrcEx("image", Eval("p_url").ToString()) %>' />
                                    </ItemTemplate>
                                </asp:DataList>                                
                            </asp:View>
                        </asp:MultiView>

                    </td>
                </tr>
                <tr>
                    <td>

                        <table>
                            <tr>
                                <td>
                                    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                                        <ItemTemplate>
                                            <table style="height: 39px; width: 150px; border-width: 1px; border-color: #AAAAAA; border-style: solid;" class="round_table">
                                                <tr style="line-height:0px">
                                                    <td colspan="2" style="word-wrap: hyphenate; text-align: center;">
                                                        <asp:Label ID="lblHao" runat="server" BackColor="#78B300" Height="5px" Width='<%# GetHaoWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label><asp:Label ID="lblBad" runat="server" BackColor="#CC0001" Height="5px" Width='<%# GetBadWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="line-height:0px">
                                                    <td>
                                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/files/image/mark_hao.png" />
                                                        <asp:Label ID="lblHaoNum" runat="server" Text='<%# Eval("hao") %>'></asp:Label>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        <asp:Image ID="Image4" runat="server" ImageUrl="~/files/image/mark_bad.png" />
                                                        <asp:Label ID="lblBadNum" runat="server" Text='<%# Eval("bad") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, hao, bad FROM photo WHERE (id = ?)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:ImageButton ID="imgHao" runat="server" ImageUrl="~/files/image/hao.png" ImageAlign="AbsMiddle" OnClientClick="onclick_hao();return false;" />

                                </td>
                                <td>
                                    <asp:ImageButton ID="imgBad" runat="server" ImageUrl="~/files/image/bad.png" ImageAlign="AbsMiddle" OnClientClick="onclick_bad();return false;" />

                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>
            <asp:Panel ID="pnlBottom" runat="server" Visible ="false">
                <table style="width:100%;">
                <tr>
                    <td>
                        <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="javascript:goList();"> 돌아가기</asp:HyperLink>
                        <asp:HiddenField ID="hfId" runat="server" />
                    </td>
                    <td style="text-align:right;">
                        <%--//{This Code For paging process about datalist control--%>
                        <table style"margin:0 auto" align="right">
                            <tr>
                                <td>
                                    <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">上页</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <%--//}This Code For paging process about datalist control--%>
                    </td>
                </tr>
            </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
