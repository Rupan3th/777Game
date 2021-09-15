﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="publish_spinplay.aspx.cs" Inherits="_777Game_publish_spinplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1" />
    <script src="/files/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/files/js/fruit_slots_light.js"></script>
    <script type="text/javascript" src="/files/js/segment-display.js"></script>
    <script type="text/javascript" src="/files/js/jquery.jqGauges.min.js"></script>   
    
    <link href="../files/css/common.css" rel="stylesheet" /> 
    
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

</head>
<body >
    <form id="form1" runat="server">
    <div class="spinplay_wrap" style="width:1050px; height:755px">
         <div id="play" style="background:url(/files/image/images/bkg_l.png);"></div>

        <div id="slot_machine_log" style="width:75px; height:560px; position: absolute; left:16px; top:130px; ">
            <!--left log area-->
            <ul id='slot_log' class='slot_log' style="width:75px; height:560px; overflow-y:hidden"></ul>                
        </div>

        <div id="dice_log1" style="width:75px; height:560px; position: absolute; left:883px; top:135px; ">
            <!--dice log area-->
            <ul id='diceTai_log' class='diceTai_log' style="width:75px; height:560px; overflow-y:hidden"></ul>
        </div>
        <div id="dice_log2" style="width:75px; height:560px; position: absolute; left:958px; top:135px; ">
            <!--dice log area-->
            <ul id='diceodd_log' class='diceodd_log' style="width:75px; height:560px; overflow-y:hidden"></ul>
        </div>
    
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
            //$("#slot_log").scrollTop($("#slot_log")[0].scrollHeight);

            var csstaisai = taisailogcss[semi[1]];
            var text = "<div style='width:75px;height:80px' class='" + csstaisai + "'></div>"
            if (text.length) {
                $('<li />', { html: text }).appendTo('ul.diceTai_log')
            }
            // $("#diceTai_log").scrollTop($("#diceTai_log")[0].scrollHeight);

            var cssevodd = evoddlogcss[semi[2]];
            var text = "<div style='width:75px;height:80px' class='" + cssevodd + "'></div>"
            if (text.length) {
                $('<li />', { html: text }).appendTo('ul.diceodd_log')
            }
            //$("#diceodd_log").scrollTop($("#diceodd_log")[0].scrollHeight);
        }
    </script>
</body>
</html>
