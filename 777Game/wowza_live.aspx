﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wowza_live.aspx.cs" Inherits="_777Game_wowza_live" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />        
    <script src="/files/js/jquery-1.8.3.min.js"></script>   
                    
    <script src="/files/js/jwplayer.js"></script>
    <script>jwplayer.key = "gESqN5xJRRkppyDGnZbzKugu91grnuoIhVplCg==";</script>

    <style type="text/css">
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }
    </style>    

</head>
<body>
    <form id="form1" runat="server">
        <%--<div id='wowza_player' style='border:solid; width: 222px; height: 232px; left: 0px; top: 0px;' ondblclick="doubleSize(event, this)"></div>
        <%--<script id='player_embed' src='//player.cloud.wowza.com/hosted/7bb0rth1/wowza.js' type='text/javascript'></script>--%>
        <%--<% utility.LivePlayer(Response); %>--%>
       
        <div id="wowza_player" style="border:solid; width:100%; height: 100%; left: 0px; top: 0px;" ></div>
        <script>
            var player = jwplayer(wowza_player);
        </script>
        <% utility.LivePlayer(Response); %>

       <%-- <div id="resizebtn"  onclick="resize();" >resize</div>--%>
        <script>
            var width = 202;
            var height = 210;

            function resize() {
                width = width * 2;
                height = height * 2;
                if (width > 888) {
                    width = 202;
                    height = 210;
                }
                player.resize(width, height);
            }
        </script>
        <%--<script>      
            $(document).ready(function () {
                jwplayer("wowza_player").setup({
                    playlist: [{
                        'sources': [
                            {
                                'file': 'rtmp://36.49.152.168:1935/mylive/stream',
                                //'file': 'rtmp://tianhe01.top:1935/mylive/stream',                                
                            }
                            
                        ]
                    }],
                    width: 222,
                    height: 232,
                    autostart: 'true',
                    stretching: 'exactfit',
                    displayclick: 'none',
                    //hlshtml: 'true',
                    //mute: 'true'
                });
            });
            $(".jwfullscreen").css("z-index", "-1");
        </script>--%>
        
    </form>
</body>
</html>

