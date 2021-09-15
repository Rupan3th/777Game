﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="spin_play.aspx.cs" Inherits="_777Game_spin_play" %>

<%@ Register Src="chat_room.ascx" TagName="chat_room" TagPrefix="uc2" %>
<%@ Register Src="~/777Game/chat_room.ascx" TagPrefix="uc1" TagName="chat_room" %>
<%@ Register src="chat6cn_room.ascx" tagname="chat6cn_room" tagprefix="uc3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <link href="../files/css/common.css" rel="stylesheet" />    

    <script src="../files/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="../files/js/fruit_slots_.js"></script>
    <script type="text/javascript" src="../files/js/segment-display.js"></script>
    <script type="text/javascript" src="../files/js/jquery.jqGauges.min.js"></script>       
   
    <style type="text/css">
        *
        {
            font-size:12px;
            font-family:宋体;
            margin:0;
            padding:0;
        }
        
        body {
         margin-left: 0px;
         margin-top: 0px;
         margin-right: 0px;
         margin-bottom: 0px;
         overflow-y: hidden;
         overflow-x: hidden;
        }
    </style>
    <script>
         var user_id = '<%= Session["user_id"] %>';
        var username = '<%= Session["User"] %>';
        var usercoin = '<%= Session["coin"] %>';
        usercoin = usercoin + 1 - 1;
        var zhibo_id = '<%= Session["zhibo_id"] %>';
        zhibo_id = parseInt(zhibo_id);
        zhibo_id = 15;
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="spinplay_wrap" style="width:1920px; height:1080px">
         <div id="play" style="background:url(/files/image/images/bkg1.png)"></div>

        <div id="slot_machine_log" style="width:75px; height:560px; position: absolute; left:240px; top:201px; ">
            <!--left log area-->
            <ul id='slot_log' class='slot_log' style="width:75px; height:560px; overflow-y:hidden"></ul>                
        </div>

        <div id="dice_log1" style="width:75px; height:560px; position: absolute; left:1107px; top:205px; ">
            <!--dice log area-->
            <ul id='diceTai_log' class='diceTai_log' style="width:75px; height:560px; overflow-y:hidden"></ul>
        </div>
        <div id="dice_log2" style="width:75px; height:560px; position: absolute; left:1182px; top:205px; ">
            <!--dice log area-->
            <ul id='diceodd_log' class='diceodd_log' style="width:75px; height:560px; overflow-y:hidden"></ul>
        </div>
         <div id="chat_area" style="width:419px; height:752px; position: absolute; left:1275px; top:75px">
            <div id="total_log_area" style="width:419px; height:208px">
                <!--top total log area-->
                <%--<ul id='total_log' class='total_log' style="color:blue; width:400px; height:188px; margin:11px; margin-left:20px; overflow-y:hidden"></ul>--%>
            </div>
            <div id="live_chat_area" style="width:395px; height:520px;margin-left:10px; margin-top:15px">
                <!--chat area-->
                <div style="width:395px; height:475px;margin-top:57px">
                    <uc3:chat6cn_room ID="chat6cn_room1" runat="server" />
                </div>
            </div>
        </div>
    
        <iframe id="livestreaming"  src="wowza_live_222.aspx" style="border:0px; width:222px; height:232px; position:absolute;left:595px;top:202px; z-index:103; overflow-y:hidden; overflow-x:hidden" ></iframe>
       
    </div>
    </form>
    <script>
        var g = new wLaoHuJi("play");
        g.init();

        var msg = PostAjax("/Ajax/spinlog.ashx", "");
        var myArray = new Array(7);
        myArray = msg.split('/');
        var semi = new Array(3);
        for (var i = 0; i < 7; i++) {
            semi = myArray[i].split(',');
            var cssfruit = slotlogcss[semi[0] - 1];
            var text = "<div style='width:75px;height:80px' class='" + cssfruit + "'></div>"
            if (text.length) {
                $('<li />', { html: text }).appendTo('ul.slot_log')
            }            

            var csstaisai = taisailogcss[semi[1]];
            var text = "<div style='width:75px;height:80px' class='" + csstaisai + "'></div>"
            if (text.length) {
                $('<li />', { html: text }).appendTo('ul.diceTai_log')
            }            

            var cssevodd = evoddlogcss[semi[2]];
            var text = "<div style='width:75px;height:80px' class='" + cssevodd + "'></div>"
            if (text.length) {
                $('<li />', { html: text }).appendTo('ul.diceodd_log')
            }            
        }

    </script>
</body>
</html>


