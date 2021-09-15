﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="houtai_vod_Default" %>

<%@ Register Src="left.ascx" TagName="left" TagPrefix="uc1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <style>
        .menu_item {
            text-align: center;
        }

        .div_middle {
            display: table;
            vertical-align: middle;
        }

        .Labal_Default {
            display: table-cell;
        }

        .auto-style1 {
            width: 136px;
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
        function onclick_menu(id) {
            switch (id) {
                case 0:
                    {
                        jQuery("#left1_pnlHome").css({ display: "block" });
                        jQuery("#left1_pnlSystem").css({ display: "none" });
                        jQuery("#left1_pnlContent").css({ display: "none" });
                        jQuery("#lblPageInfo").text("管理信息");

                        jQuery("#Menu1n0 .Menu1_4").addClass("Menu1_6");
                        jQuery("#Menu1n1 .Menu1_4").removeClass("Menu1_6");
                        jQuery("#Menu1n2 .Menu1_4").removeClass("Menu1_6");

                        break;
                    }
                case 1:
                    {
                        jQuery("#left1_pnlHome").css({ display: "none" });
                        jQuery("#left1_pnlSystem").css({ display: "block" });
                        jQuery("#left1_pnlContent").css({ display: "none" });
                        jQuery("#lblPageInfo").text("系统配置");

                        jQuery("#Menu1n0 .Menu1_4").removeClass("Menu1_6");
                        jQuery("#Menu1n1 .Menu1_4").addClass("Menu1_6");
                        jQuery("#Menu1n2 .Menu1_4").removeClass("Menu1_6");
                        break;
                    }
                case 2:
                    {
                        jQuery("#left1_pnlHome").css({ display: "none" });
                        jQuery("#left1_pnlSystem").css({ display: "none" });
                        jQuery("#left1_pnlContent").css({ display: "block" });
                        jQuery("#lblPageInfo").text("内容管理");

                        jQuery("#Menu1n0 .Menu1_4").removeClass("Menu1_6");
                        jQuery("#Menu1n1 .Menu1_4").removeClass("Menu1_6");
                        jQuery("#Menu1n2 .Menu1_4").addClass("Menu1_6");
                        break;
                    }
            }
        }

        function iframeLoaded() {
            var iFrameID = document.getElementById('content');
            if (iFrameID) {
                // here you can make the height, I delete it first, then I make it again
                iFrameID.height = ""; 
                iFrameID.height = iFrameID.contentWindow.document.body.scrollHeight + "px";
            }
        }
    </script>
</head>
<body style="margin: 0 0 0 0;">
    <form id="form1" runat="server">
        <table  class="table_form" style="position:absolute; width:100%; height:100%">
            <tr>
                <td colspan="2" style="height: 50px; background-color: rgba(0, 102, 255, 1);">
                    <!--Top bar-->
                    <div style="height: 50px; width: 100%">
                        <table style="width: 100%; height: 100%; background-color: transparent" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="text-align: center" class="auto-style1">
                                    <asp:Label ID="Label1" runat="server" Text="论坛后台管理" ForeColor="White"></asp:Label>
                                </td>
                                <td>
                                    <asp:Menu ID="Menu1" runat="server" Height="100%" Orientation="Horizontal" BackColor="Transparent" RenderingMode="Table" ForeColor="White" CssClass="menu_item">
                                        <Items>
                                            <asp:MenuItem Text="首页" Value="0" NavigateUrl="javascript:onclick_menu(0);"></asp:MenuItem>
                                            <asp:MenuItem Text="系统" Value="1" NavigateUrl="javascript:onclick_menu(1);"></asp:MenuItem>
                                            <asp:MenuItem Text="内容" Value="2" NavigateUrl="javascript:onclick_menu(2);"></asp:MenuItem>
                                        </Items>
                                        <StaticMenuItemStyle Width="100px" />
                                        <StaticSelectedStyle BackColor="#3FB5F3" Height="100%" />
                                    </asp:Menu>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="width: 200px; background-color: rgba(221, 238, 238, 1);">
                    <!--left menu bar-->
                    <div style="width: 200px;height: 100%;">
                        <table class="table_form">
                            <tr>
                                <td style="background-color: #CBEBFC; vertical-align: middle; text-align: center; height: 40px">
                                    <asp:Label ID="lblPageInfo" runat="server" Text="管理信息"></asp:Label>
                                </td>
                            </tr>
                        </table>

                        <uc1:left ID="left1" runat="server" />

                    </div>
                </td>
                <td  style="padding:0 0 0 0">
                   <!--Main Area-->
                    <div style="height: 100%; width: 100%">
                        <table class="table_form">
                            <tr>
                                <td style="background-color: #DDEEEE; vertical-align: middle; text-align: left; height: 40px; padding-left: 10px">
                                    <asp:Label ID="lblSitemap" runat="server" Text="位置： 首页 › 广告管理"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding:20px 10px">
                                    <iframe id="content" name="content" style="width:100%; display:table" onload="iframeLoaded()" frameborder="0"></iframe>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
