<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="media_mobile_Default" %>

<!DOCTYPE html>

<html>
<head>
    <title></title>
    <link href="/files/css/bootstrap.min.css" rel="stylesheet" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script src="/files/js/jquery.cookie.js"></script>
    <script src="/files/js/common.js"></script>
    <link href="common.css" rel="stylesheet" />
    <style type="text/css">
        .GridPager a, .GridPager span {
            margin: 5px 5px 5px 5px;
            display: block;
            height: 60px;
            width: 70px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }
    </style>
</head>
<body>
    <table style="position: absolute; width: 100%; height: 100%" class="table_form">
        <tr>
            <td style="height: 59px">
                <div style="background-color: #232323; height: 59px; width: 100%; display: table;">
                    <span style="padding-left: 10px; display: table-cell; vertical-align: middle;"></span>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 98px">
                <div class="dropdown" style="white-space: nowrap; background-color: #323232; height: 98px; text-align: left; display: table;">
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <div style="float: left; width: 80%; height: 100%; display: table;">
                        <span style="display: table-cell; vertical-align: middle;">
                            <marquee id="notice" behavior="scroll" direction="left" style="width: 100%; height: 60%; color: crimson; background-color: white; font-size: 40px; vertical-align: middle;"></marquee>
                        </span>
                    </div>
                    <div style="float: left; width: 5%; height: 100%;">
                        &nbsp;
                    </div>
                    <img src="/files/image/mobile_menu.png" onclick="myFunction()" class="dropbtn" style="vertical-align: middle;" />
                    <div id="myDropdown" class="dropdown-content" style="z-index:100;">
                        <a href="javascript:jQuery('#hf_media').val(0);jQuery('#form1').submit();">视频</a>
                        <a href="javascript:jQuery('#hf_media').val(1);jQuery('#form1').submit();">图片</a>
                        <a href="javascript:jQuery('#hf_media').val(2);jQuery('#form1').submit();">小说</a>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="height: 100%;">
                <form id="form1" runat="server" style="height: 100%;">
                    <asp:HiddenField ID="hf_media" runat="server" Value="0" />
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="3" OnActiveViewChanged="MultiView1_ActiveViewChanged">
                        <asp:View ID="View1" runat="server">
                            <table style="width: 100%; height: 100%" class="table_form">
                                <tr>
                                    <td style="height: 59px">
                                        <div style="background-color: #232323; height: 59px; width: 100%; display: table;">
                                            <span style="padding-left: 10px; display: table-cell; vertical-align: middle; color: white;">
                                                <div style="display:table-cell;">
                                                    视频 &nbsp; 
                                                </div>
                                                <div style="display: table-cell; white-space: nowrap; background-color: #323232; width: 200px;">
                                                    <input runat="server" placeholder="=选择类型=" id="inClssMovie" type="text" readonly="readonly" onclick="toggleMovClss()" style="width: 100%; height: 50px; color: #000000; text-align: center;" />
                                                    <asp:HiddenField ID="ddlClss" runat="server" Value="0" />
                                                    <div id="clssMove" class="dropdown-content" style="width: 200px;">
                                                        <% GetImageClss("25", "inClssMovie", "ddlClss"); %>
                                                    </div>
                                                    <script>
                                                        function toggleMovClss() {
                                                            $("#clssMove").toggle();
                                                        }
                                                    </script>
                                                </div>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:top;">
                                        <asp:GridView ID="gvMovie" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" ShowHeader="False" Width="100%" OnDataBinding="gvMovie_DataBinding" OnPageIndexChanging="gvMovie_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick="<%# "javascript:cash_confirm(" + Eval("id").ToString() + ", "+Eval("coin").ToString()+")" %>">
                                                                <td style="width:65%; text-align: left; vertical-align: top; padding-left: 10px;">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# utility.SimplifedStr(Eval("mvname").ToString(), 50) %>' Height="100%" Width="100%"></asp:Label>
                                                                </td>
                                                                <td style="width: 7%; text-align: right; vertical-align:middle; font-size: 30px; font-weight: normal;">
                                                                    <div style="">
                                                                        <asp:Image ID="Image7" runat="server" ImageAlign="AbsMiddle" Width="30px" ImageUrl="~/files/image/coin.png" />
                                                                    </div>
                                                                    <div>
                                                                        <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" Width="30px" ImageUrl="~/files/image/hart.png" />
                                                                    </div>
                                                                </td>
                                                                <td style="width: 10%; text-align: left; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <div>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("coin").ToString() %>'></asp:Label>
                                                                    </div>
                                                                    <div>
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# utility.GetInteresting(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td style="padding-right:10px">
                                                                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# utility.GetImgSrc("movie", Eval("mvname").ToString(), Eval("pathname").ToString(), Eval("i_url").ToString()) %>' Width="255px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>"
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>"
                                            SelectCommand="">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <table style="width: 100%; height: 100%" class="table_form">
                                <tr>
                                    <td style="height: 59px">
                                        <div style="background-color: #232323; height: 59px; width: 100%; display: table;">
                                            <span style="padding-left: 10px; display: table-cell; vertical-align: middle; color: white;white-space: nowrap;">
                                                <div style="display:table-cell;">
                                                    图片 &nbsp;
                                                </div>
                                                <div style="display:table-cell;white-space: nowrap; background-color: #323232;width:200px;">
                                                    <input runat="server" placeholder="=选择类型=" id="inclssImage" type="text" readonly="readonly" onclick="toggleImgClss()" style="width: 100%;height:50px;color:#000000;text-align:center;" />
                                                    <asp:HiddenField ID="hfClssImage" runat="server" Value="0"/>
                                                    <div id="clssImage" class="dropdown-content" style="width:200px;">
                                                        <% GetImageClss("26", "inclssImage", "hfClssImage"); %>
                                                    </div>
                                                <script>
                                                    function toggleImgClss() {
                                                        $("#clssImage").toggle();
                                                    }
                                                </script>
                                                </div>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <asp:GridView ID="gvPhoto" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" ShowHeader="False" Width="100%" OnDataBinding="gvPhoto_DataBinding" OnPageIndexChanging="gvPhoto_PageIndexChanging">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick="<%# "javascript:clickimgview(" + Eval("id").ToString() +")" %>">
                                                                <td style="width: 65%; text-align: left; vertical-align: top; padding-left: 10px">
                                                                    <asp:Label ID="Label6" runat="server" Height="100%" Text='<%# utility.SimplifedStr(Eval("ptname").ToString(), 50) %>' Width="100%"></asp:Label>
                                                                </td>
                                                                <td style="width: 7%; text-align: right; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <asp:Image ID="Image3" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/files/image/hart.png" Width="30px" />
                                                                </td>
                                                                <td style="width: 10%; text-align: left; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# utility.GetInteresting(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                                </td>
                                                                <td  style="padding-right:10px">
                                                                    <asp:Image ID="Image4" runat="server" Height="200px" ImageUrl='<%# utility.GetImgSrc("image", Eval("ptname").ToString(), Eval("pathname").ToString(), Eval("p_url").ToString()) %>' Width="255px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle HorizontalAlign="Center" Width="100%" CssClass="GridPager" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" SelectCommand="">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <table style="width: 100%; height: 100%" class="table_form">
                                <tr>
                                    <td style="height: 59px">
                                        <div style="background-color: #232323; height: 59px; width: 100%; display: table;">
                                            <span style="padding-left: 10px; display: table-cell; vertical-align: middle; color: white;">
                                                <div style="display:table-cell;">
                                                    小说 &nbsp; 
                                                </div>
                                                <div style="display: table-cell; white-space: nowrap; background-color: #323232; width: 200px;">
                                                    <input runat="server" placeholder="=选择类型=" id="inClssNovel" type="text" readonly="readonly" onclick="toggleNovClss()" style="width: 100%; height: 50px; color: #000000; text-align: center;" />
                                                    <asp:HiddenField ID="ddlNClss" runat="server" Value="0" />
                                                    <div id="clssNovel" class="dropdown-content" style="width: 200px;">
                                                        <% GetImageClss("27", "inClssNovel", "ddlNClss"); %>
                                                    </div>
                                                    <script>
                                                        function toggleNovClss() {
                                                            $("#clssNovel").toggle();
                                                        }
                                                    </script>
                                                </div>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;">
                                        <asp:GridView ID="gvNovel" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource8" OnDataBinding="gvNovel_DataBinding" OnPageIndexChanging="gvNovel_PageIndexChanging" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick='<%# "javascript:clicknvlview(" + Eval("id").ToString() +")" %>'>
                                                                <td style="width: 100%; text-align: left; vertical-align: top; padding-left: 10px">
                                                                    <asp:Label ID="Label14" runat="server" Height="100%" Text='<%# utility.SimplifedStr(Eval("nvname").ToString(), 50) %>' Width="100%"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Center" Width="100%" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
                                            SelectCommand="">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <table style="width: 100%; height: 100%; background-color: #ececec; text-align: center;">
                                <tr>
                                    <td style="vertical-align:bottom;text-align:left;height:70px;">
                                        &nbsp;最新上传视频
                                    </td>
                                    <td style="vertical-align:bottom;text-align:center;width:10%;">
                                        <asp:Image ID="Image9" runat="server" ImageAlign="Bottom" ImageUrl="~/files/image/plus.png"  Width="50px" onclick="javascript:jQuery('#hf_media').val(0);jQuery('#form1').submit();" />&nbsp;
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;" colspan="2">
                                        <asp:GridView ID="gvMovie0" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" OnDataBinding="gvMovie_DataBinding" OnPageIndexChanging="gvMovie_PageIndexChanging" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("mvname") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick='<%# "javascript:cash_confirm(" + Eval("id").ToString() + ", "+Eval("coin").ToString()+")" %>'>
                                                                <td style="width: 65%; text-align: left; vertical-align: top; padding-left: 10px">
                                                                    <asp:Label ID="Label11" runat="server" Height="100%" Text='<%# utility.SimplifedStr(Eval("mvname").ToString(), 50) %>' Width="100%"></asp:Label>
                                                                </td>
                                                                <td style="width: 7%; text-align: right; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <div style="height:50%">
                                                                        <asp:Image ID="Image8" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/files/image/coin.png" Width="30px" />
                                                                    </div>
                                                                    <div style="height:50%">
                                                                        <asp:Image ID="Image9" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/files/image/hart.png" Width="30px" />
                                                                    </div>
                                                                </td>
                                                                <td style="width: 10%; text-align: left; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <div style="height:50%">
                                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("coin") %>'></asp:Label>
                                                                    </div>
                                                                    <div style="height:50%">
                                                                        <asp:Label ID="Label13" runat="server" Text='<%# utility.GetInteresting(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                                    </div>
                                                                </td>
                                                                <td  style="padding-right:10px">
                                                                    <asp:Image ID="Image10" runat="server" Height="200px" ImageUrl='<%# utility.GetImgSrc("movie", Eval("mvname").ToString(), Eval("pathname").ToString(), Eval("i_url").ToString()) %>' Width="255px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Center" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
                                            SelectCommand="SELECT id, mvname, pathname, i_url, v_url, coin, clss_id, hao, bad, rcnt FROM movie WHERE (isdel = 0) ORDER BY regdate DESC limit 5">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:bottom;text-align:left;height:70px;">
                                        &nbsp;最新上传图片
                                    </td>
                                    <td>
                                        <asp:Image ID="Image11" runat="server" ImageAlign="Bottom" ImageUrl="~/files/image/plus.png"  Width="50px"  onclick="javascript:jQuery('#hf_media').val(1);jQuery('#form1').submit();" />&nbsp;
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;" colspan="2">

                                        <asp:GridView ID="gvPhoto0" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5" OnDataBinding="gvPhoto_DataBinding" OnPageIndexChanging="gvPhoto_PageIndexChanging" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ptname") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick='<%# "javascript:clickimgview(" + Eval("id").ToString() +")" %>'>
                                                                <td style="width: 65%; text-align: left; vertical-align: top; padding-left: 10px">
                                                                    <asp:Label ID="Label8" runat="server" Height="100%" Text='<%# utility.SimplifedStr(Eval("ptname").ToString(), 50) %>' Width="100%"></asp:Label>
                                                                </td>
                                                                <td style="width: 7%; text-align: right; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <asp:Image ID="Image5" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/files/image/hart.png" Width="30px" />
                                                                </td>
                                                                <td style="width: 10%; text-align: left; vertical-align: middle; font-size: 30px; font-weight: normal;">
                                                                    <asp:Label ID="Label9" runat="server" Text='<%# utility.GetInteresting(Eval("hao").ToString(), Eval("bad").ToString()) %>'></asp:Label>
                                                                </td>
                                                                <td  style="padding-right:10px">
                                                                    <asp:Image ID="Image6" runat="server" Height="200px" ImageUrl='<%# utility.GetImgSrc("image", Eval("ptname").ToString(), Eval("pathname").ToString(), Eval("p_url").ToString()) %>' Width="255px" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Center" Width="100%" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
                                            SelectCommand="SELECT id, ptname, pathname, p_url, clss_id, hao, bad, rcnt FROM photo WHERE (isdel = 0) ORDER BY regdate DESC limit 5">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align:bottom;text-align:left;height:70px;">
                                        &nbsp;最新上传小说
                                    </td>
                                    <td>
                                        <asp:Image ID="Image12" runat="server" ImageAlign="Bottom" ImageUrl="~/files/image/plus.png"  Width="50px"  onclick="javascript:jQuery('#hf_media').val(2);jQuery('#form1').submit();" />&nbsp;
                                    </td>
                                </tr>
                                <tr style="height: 10px; background-color: #b1ccd5;">
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;" colspan="2">
                                        <asp:GridView ID="gvRecentNovel" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" ShowHeader="False" Width="100%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table style="width: 100%;">
                                                            <tr onclick='<%# "javascript:clicknvlview(" + Eval("id").ToString() +")" %>'>
                                                                <td style="width: 100%; text-align: left; vertical-align: top; padding-left: 10px">
                                                                    <asp:Label ID="Label10" runat="server" Height="100%" Text='<%# utility.SimplifedStr(Eval("nvname").ToString(), 50) %>' Width="100%"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerStyle CssClass="GridPager" HorizontalAlign="Center" Width="100%" />
                                            <RowStyle Height="240px" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:mysql_connectstring %>" 
                                            ProviderName="<%$ ConnectionStrings:mysql_connectstring.ProviderName %>" 
                                            SelectCommand="SELECT id, nvname, pathname, url, rcnt FROM novel WHERE (isdel = 0) ORDER BY regdate DESC limit 5">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="0" Name="isdel" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                </form>
            </td>
        </tr>
    </table>
    <!--{Alert Confirm Dialog-->
    <style type="text/css">
        .ConfirmAlert {
            width: 500px;
            height: 300px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -150px 0 0 -250px;
        }

        .round-button {
            -webkit-border-radius: 7px;
        }
    </style>
    <div class="ConfirmAlert round-button" style="display: none; border-width: 1px; background-color: #FFFFFF; padding: 5px;">
        <table class="round-button" style="border: 1px solid #9FCDA9; width: 100%; position: relative; height: 100%; background-color: #FFFCEB; padding: 0px;">
            <tr>
                <td colspan="3" style="background-color: #EB5A3D; text-align: center; font-weight: bold; color: #FFFFFF; -webkit-border-radius: 7px;">观看收费内容</td>
            </tr>
            <tr>
                <td rowspan="2" style="text-align: center;">
                    <img alt="" src="/files/image/cash_confirm.png" /></td>
                <td colspan="2" style="text-align: center;"><strong>继续观看收费内容<br />
                    需支付对应元宝</strong></td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <input id="btnYes" class="round-button" type="button" value="YES" style="width: 90px; height: 60px; background-color: #356372; color: #FFFFFF;" /></td>
                <td style="text-align: center;">
                    <input id="btnNo" class="round-button" type="button" value="NO" style="width: 68px; height: 60px; background-color: #316271; color: #FFFFFF;" /></td>
            </tr>
        </table>
    </div>
    <script>
        //REFME
        //jQuery("#Button1").click(function () {
        //    var IsOn = jQuery(".ConfirmAlert").css("display");
        //    if (IsOn == "none") jQuery(".ConfirmAlert").css("display", "block");
        //    else jQuery(".ConfirmAlert").css("display", "none");
        //});
        function cash_confirm(id, coin) {
            movie_id = id;
            if (eval(coin) > 0) {
                jQuery(".ConfirmAlert").css("display", "block");
            }
            else clickimg(movie_id);
        }

        jQuery("#btnYes").click(function () {
            //insert Code;
            clickimg(movie_id);
        });
        jQuery("#btnNo").click(function () {
            jQuery(".ConfirmAlert").css("display", "none");
        });
    </script>
    <!--}Alert Confirm Dialog-->

    <!--{Search Dialog------------------------------------------------------------------------>
    <div id="SearchDialog" class="modal" style="display: none;">
        <!-- Modal content -->
        <div class="modal-content">
            <table class="round-button" style="width: 100%; height: 100%; background-color: #434343">
                <tr>
                    <td>
                        <img alt="" src="/files/image/search_mark1.png" style="padding-left: 30px; width: 100px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width: 90%; margin: 0 auto" align="center">
                            <tr>
                                <td style="width: 70%">
                                    <input id="txtSearch" type="text" style="width: 100%; height: 70px" />
                                </td>
                                <td style="width: 30%; font-size: 30px">
                                    <select id="selType" style="width: 100%; height: 70px">
                                        <option value="0">视频</option>
                                        <option value="1">图片</option>
                                    </select>
                                </td>
                                <td style="width: 10%">
                                    <img id="btnSearch" class="close" alt="" src="/files/image/search_btn.png" style="height: 100%;" />
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>

        </div>
    </div>
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            padding: 20px;
            border: 1px solid #888;
            width: 70%;
            height: 200px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -100px 0 0 -35%;
            border-width: 1px;
            background-color: #FFFFFF;
            padding: 5px;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
    </style>
    <script>

        var dlg = document.getElementById('SearchDialog');// Get the modal
        var doSearch = document.getElementsByClassName("close")[0];// Get the <span> element that closes the modal

        function SearchDialog() {// When the user clicks the button, open the modal
            jQuery("#SearchDialog").css("display", "block");
            jQuery("#txtSearch").focus();
        }

        doSearch.onclick = function () {// When the user clicks on <span> (x), close the modal
            dlg.style.display = "none";

            jQuery('#hf_media').val(jQuery('#selType').val());
            jQuery("#hf_search").val(jQuery('#txtSearch').val());
            jQuery('#hf_filter').val(4);
            jQuery('#form1').submit();
        }

        jQuery(window).click(function (event) {// When the user clicks anywhere outside of the modal, close it
            if (event.target == dlg) {
                dlg.style.display = "none";
            }
        });
    </script>
    <!--}Search Dialog------------------------------------------------------------------------>
</body>
</html>
<script>
    function clickimg(id) {
        var param = "type=movie&id=" + id;
        PostAjax("/Ajax/rcnt_update.ashx", param);

        location.href = '/media/mobile/mplay.aspx?id=' + id;
    }

    function clickimgview(id) {
        var param = "type=image&id=" + id;
        PostAjax("/Ajax/rcnt_update.ashx", param);

        location.href = "/media/mobile/ptview.aspx?id=" + id;
    }

    function clicknvlview(id) {
        var param = "type=novel&id=" + id;
        PostAjax("/Ajax/rcnt_update.ashx", param);

        location.href = "/media/mobile/novel_view.aspx?id=" + id;
    }
</script>
<script>
    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

    var noticetext = PostAjax("/Ajax/media_notice.ashx", "");
    jQuery("#notice").text(noticetext);
</script>
