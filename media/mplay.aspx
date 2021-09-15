﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mplay.aspx.cs" Inherits="media_mplay" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />    
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="//player.wowza.com/player/latest/wowzaplayer.min.js"></script>
    <style>
        .round_table {
            border-radius: 3px;
            border: 1px solid #CCCCCC;
            padding: 0px;
            width: 120px;
        }

        .round-button {
            -webkit-border-radius: 7px;
            padding: 5px;
        }

        table td {
            font-size: 14px;
        }

        .table_form {
            width: 100%;
            padding: 0 0 0 0;
            border: 0;
            border-collapse: collapse;
            border-spacing: 0 0;
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
            if ($.cookie("movie#" + user_id + "#" + id) == undefined)
                $.cookie("movie#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=movie&id=" + id + "&hao=1");

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
            if ($.cookie("movie#" + user_id + "#" + id) == undefined)
                $.cookie("movie#" + user_id + "#" + id, 1);
            else return false;

            if (id != null && id != "") {
                var AjaxValue = PostAjax("/Ajax/HaoBad.ashx", "type=movie&id=" + id + "&bad=1");
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
            <table style="margin:0 auto; align:center;">
                <tr>
                    <td>
                        <table style="margin: 0 auto" align="center">
                            <tr>
                                <td style="height: 30px">
                                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div id="playerElement" style="width: 640px; height: 360px; padding: 0"></div>
                                    <%PlacePlayer(); %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%" class="table_form">
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2">
                                                                <ItemTemplate>
                                                                    <table style="height: 39px; width: 150px; border-width: 1px; border-color: #AAAAAA; border-style: solid;" class="round_table">
                                                                        <tr style="height: 5px; line-height: 0px">
                                                                            <td colspan="2" style="word-wrap: hyphenate; text-align: center; height: 5px">
                                                                                <asp:Label ID="lblHao" runat="server" BackColor="#78B300" Height="5px" Width='<%# GetHaoWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label><asp:Label ID="lblBad" runat="server" BackColor="#CC0001" Height="5px" Width='<%# GetBadWidth(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 20px; line-height: 0px">
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
                                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="SELECT id, hao, bad FROM movie WHERE (id = ?)">
                                                                <SelectParameters>
                                                                    <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="id" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="imgHao" runat="server" ImageUrl="~/files/image/hao.png" ImageAlign="AbsMiddle" OnClientClick='onclick_hao();return false;' CausesValidation="False" />
                                                        </td>
                                                        <td>
                                                            <asp:ImageButton ID="imgBad" runat="server" ImageUrl="~/files/image/bad.png" ImageAlign="AbsMiddle" OnClientClick='onclick_bad();return false;' CausesValidation="False" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Button ID="btnDownload" runat="server" CssClass="round-button" Style="background-image: url('/files/image/download.png'); background-repeat: no-repeat; background-position: center" Height="39px" Width="60px" OnClick="btnDownload_Click" />

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="lblBefore" runat="server" Text="2"></asp:Label>
                                    天 之前, 
                                    <asp:Label ID="lblAmount" runat="server" Text="123123"></asp:Label>
                                    人观看
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">
                                    <iframe id="adv1" Height="150px" Width="640px" scrolling=no style="border:hidden;" src="">

                                    </iframe>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 10px">&nbsp;</td>
                    <td style="vertical-align: top; text-align: center;">
                        <table style="width: 100%;">
                            <tr>
                                <td style="height: 30px">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">
                                    <iframe id="adv0" Height="300px" Width="400px" scrolling=no style="border:hidden;" src="">

                                    </iframe>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">
                                    <iframe id="adv2" Height="260px" Width="400px" scrolling=no style="border:hidden;" src="">

                                    </iframe>
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
<script>
    var advUrl = PostAjax("/Ajax/advertising.ashx", "mode=0");
    jQuery("#adv0").attr("src", advUrl);

    advUrl = PostAjax("/Ajax/advertising.ashx", "mode=1");
    jQuery("#adv1").attr("src", advUrl);

    advUrl = PostAjax("/Ajax/advertising.ashx", "mode=2");
    jQuery("#adv2").attr("src", advUrl);
</script>
