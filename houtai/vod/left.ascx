<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="houtai_vod_left" %>
<style>
        .menu_left {
            text-align: left;
        }
</style>
<script>
    function onclick_homemenu() {
        jQuery("#left1_Menu1n0 table").addClass("left1_Menu2_4");
        jQuery("#lblSitemap").text("位置： 首页 › 广告管理");
        window.open("/houtai/vod/advert.aspx", "content", "", true);//jQuery("#content").load("/houtai/vod/advert.aspx");
    }

    function onclick_systemmenu(id) {
        switch (id) {
            case 0:
                {
                    jQuery("#lblSitemap").text("位置： 系统› 网站公告");

                    jQuery("#left1_Menu2n0 table").addClass("left1_Menu2_4");
                    jQuery("#left1_Menu2n1 table").removeClass("left1_Menu2_4");

                    break;
                }
            case 1:
                {
                    jQuery("#lblSitemap").text("位置： 系统› 发送站内信");

                    jQuery("#left1_Menu2n0 table").removeClass("left1_Menu2_4");
                    jQuery("#left1_Menu2n1 table").addClass("left1_Menu2_4");
                    break;
                }
        }

        window.open("/houtai/vod/system.aspx?id=" + id, "content", "", true); //jQuery("#content").load("/houtai/vod/system.aspx?id=" + id);
    }

    function onclick_contentmenu() {
        jQuery("#left1_Menu3n0 table").addClass("left1_Menu2_4");
        jQuery("#lblSitemap").text("位置： 内容› 列表查看");
        window.open("/houtai/vod/content.aspx", "content", "", true); //jQuery("#content").load("/houtai/vod/conten.aspx");
    }
</script>
<!--Menu 首页-->
<asp:Panel ID="pnlHome" runat="server">
    <asp:Menu ID="Menu1" runat="server" ForeColor="Black" RenderingMode="Table" Width="100%" CssClass="menu_left">
        <Items>
            <asp:MenuItem Text="&nbsp;&nbsp;▶ 广告管理" Value="0" NavigateUrl="javascript:onclick_homemenu();"></asp:MenuItem>
        </Items>
        <StaticSelectedStyle BackColor="#4FC6FF" />
    </asp:Menu>
</asp:Panel>
<!--Menu 系统-->
<asp:Panel ID="pnlSystem" runat="server" style="display:none;">
    <asp:Menu ID="Menu2" runat="server" ForeColor="Black" RenderingMode="Table" Width="100%" CssClass="menu_left">
        <Items>
            <asp:MenuItem Text="&nbsp;&nbsp;▶ 网站公告" Value="0" NavigateUrl="javascript:onclick_systemmenu(0);"></asp:MenuItem>
            <asp:MenuItem Text="&nbsp;&nbsp;▶ 发送站内信" Value="1" NavigateUrl="javascript:onclick_systemmenu(1);"></asp:MenuItem>
        </Items>
        <StaticSelectedStyle BackColor="#4FC6FF" />
    </asp:Menu>
</asp:Panel>
<!--Menu 内容-->
<asp:Panel ID="pnlContent" runat="server" style="display:none;">
    <asp:Menu ID="Menu3" runat="server" ForeColor="Black" RenderingMode="Table" Width="100%" CssClass="menu_left">
        <Items>
            <asp:MenuItem Text="&nbsp;&nbsp;▶列表查看" Value="0" NavigateUrl="javascript:onclick_contentmenu();"></asp:MenuItem>
        </Items>
        <StaticSelectedStyle BackColor="#4FC6FF" />
    </asp:Menu>
</asp:Panel>
