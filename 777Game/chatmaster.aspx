﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chatmaster.aspx.cs" Inherits="_777Game_chatmaster" %>

<%@ Register src="chat6cn_master.ascx" tagname="chat6cn_master" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../files/js/jquery_2.js"></script>
    <script src="../files/js/jquery-1.8.3.min.js"></script>
    
    <link href="/files/css/common.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 168px;
        }
        .auto-style2 {
            width: 168px;
            height: 41px;
        }
        .auto-style3 {
            height: 41px;
        }
    </style>
     
</head>
<body>
   <uc1:chat6cn_master ID="chat6cn_master1" runat="server" />
</body>
</html>
