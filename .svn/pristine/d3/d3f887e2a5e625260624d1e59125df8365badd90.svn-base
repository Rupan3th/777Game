<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chathost_mobile.aspx.cs" Inherits="_777Game_chathost_mobile" %>

<%@ Register src="chat_mobile.ascx" tagname="chat_mobile" tagprefix="uc1" %>

<%@ Register src="giftsend_mobile.ascx" tagname="giftsend_mobile" tagprefix="uc2" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
        <script src="../files/js/jquery_2.js"></script>
    <script src="../files/js/jquery-1.8.3.min.js"></script>
    <link href="/files/css/common.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 364px;
        }
        .auto-style4 {
            width: 308px;
        }
        .auto-style6 {
            width: 308px;
            height: 407px;
        }
        .auto-style7 {
            width: 364px;
            height: 407px;
        }
        .auto-style8 {
            height: 407px;
        }
        .auto-style9 {
            width: 720px;
            height: 409px;
            position: absolute;
            left: 0px;
            top: 0px;
        }
        .auto-style10 {
            width: 308px;
            height: 136px;
        }
        .auto-style11 {
            width: 364px;
            height: 136px;
        }
        .auto-style12 {
            height: 136px;
        }
    </style>
</head>
<body style="background-color:rgba(0, 100, 33, 0.5);">

    <form id="form1" runat="server">
            <table style="width: 100%;">
        <tr>
            <td class="auto-style6"></td>
            <td class="auto-style7"></td>
            <td class="auto-style8"></td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">
        <div id="chat_area" style="background-image: url('/files/image/transparency.png')" class="auto-style9">
            <div id="live_chat_area" style="width: 720px; height: 400px">
               
                <uc1:chat_mobile ID="chat_mobile1" runat="server" />
               
            </div>
        </div>

            </td>
            <td class="auto-style12">
                </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style2">    <p>
        <input id="Button1" type="button" value="button1" onclick="visibleInput(true);" /><input id="Button2" type="button" value="button2" onclick="visibleInput(false);" /></p></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4" style="height:300px;">&nbsp;</td>
            <td class="auto-style2">  
                <uc2:giftsend_mobile ID="giftsend_mobile1" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>


    </form>

</body>
</html>
