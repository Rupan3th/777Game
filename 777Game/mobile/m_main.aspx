﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="m_main.aspx.cs" Inherits="_777Game_mobile_m_main" %>

<%@ Register Src="../chat_room.ascx" TagName="chat_room" TagPrefix="uc2" %>
<%@ Register Src="~/777Game/chat_room.ascx" TagPrefix="uc1" TagName="chat_room" %>
<%@ Register Src="~/777Game/chat_mobile.ascx" TagPrefix="uc1" TagName="chat_mobile" %>
<%@ Register Src="~/777Game/giftsend_mobile.ascx" TagPrefix="uc1" TagName="giftsend_mobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>水果老虎机</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="user-scalable=no, width=720px" />
        
    <script src="/files/js/jquery-1.8.3.min.js"></script>      

    <style type="text/css">
        * {
            font-size: 16px;
            font-family: 宋体;
            margin: 0;
            padding: 0;
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

    <script type="text/javascript">
           
        var bg_sound_state = 1;
        var eff_sound_state = 1;
        var zhubo_sound_state = 1;        

        var user_id = '<%= Session["user_id"] %>';      

        (function ($) {
            $.fn.nodoubletapzoom = function () {
                $(this).bind('touchstart', function preventZoom(e) {
                    var t2 = e.timeStamp
                      , t1 = $(this).data('lastTouch') || t2
                      , dt = t2 - t1
                      , fingers = e.originalEvent.touches.length;
                    $(this).data('lastTouch', t2);
                    if (!dt || dt > 500 || fingers > 1) return; // not double-tap

                    e.preventDefault(); // double tap - prevent the zoom
                    // also synthesize click events we just swallowed up
                    $(this).trigger('click').trigger('click');
                });
            };
        })(jQuery);

     
        PostAjax("/Ajax/loginstate.ashx", "category=2&user_id=" + user_id + "&loginfir=" + 1);
        setInterval(function () {
            PostAjax("/Ajax/loginstate.ashx", "category=2&user_id=" + user_id);
        }, 5 * 60 * 1000);

        var room = 1;
        PostAjax("/Ajax/tvroom_manager.ashx", "user_id=" + user_id + "&room=" + room + "&state=0");
        $(window).on("beforeunload", function () {
            PostAjax("/Ajax/tvroom_manager.ashx", "user_id=" + user_id + "&room=" + room + "&state=1");
            return "Buy now!!!";
        });

    </script>

</head>
<body>
    <div>
        <form id="form1" runat="server">

            <div id='livestreaming' style='width: 720px; height: 400px; left: 0px; top: 0px;'>
                <iframe width="720" height="400" src="wowza_live_m.aspx" style="overflow-y:hidden; overflow-x:hidden"></iframe>
            </div>                      
             
            <div id="play" style="width: 720px; height: 790px">
                <iframe id="777game" width="720" height="790" src="spin_mobile.aspx" style="overflow-y:hidden; overflow-x:hidden;"></iframe>					
            </div>            

            <div id="chat_area" style="pointer-events:none; display:block;width: 720px; height: 400px; position: absolute; left: 0px; top: 0px; background-image:url('/files/image/transparency.png')">
                <div id="live_chat_area" style="width: 720px; height: 400px">
                    <!--chat area-->
                    <uc1:chat_mobile runat="server" ID="chat_mobile" />                    
                </div>
            </div>
            <div id="gift_area" style="width: 720px; height: 500px; position: absolute; left: 0px; top:620px;  background-color: antiquewhite; display: none">
                <div id="live_gift_area" style="width: 720px; height: 500px">
                    <!--chat area-->
                    <uc1:giftsend_mobile runat="server" ID="giftsend_mobile" />
                </div>
            </div>

            <div id='arrow' style="width:100px; height:100px; position: absolute; left: 0px; top: 0px; z-index:103; " > 
            <img src="/files/image/images_m/arrow.png" style="width: 30px; height: 40px; position: absolute; left: 30px; top: 20px;z-index:103" /></div>
            <script>
                document.getElementById("arrow").onclick = function () {
                    document.getElementById("popup_menu").style.display = 'block';
                }
            </script>
            
            <div id='menu_chat' style="width:100px; height:70px; position: absolute; left: 40px; top: 1120px; z-index:102; " > 
                <img width='40' height='40' src="img/menu_chat.png" style="position: relative; left: 18px; top: 18px;" /> </div>              
            <div id='menu_gift' style="width:100px; height:70px; position: absolute; left: 600px; top: 1120px; z-index:102;" > 
                <img width='40' height='40' src="img/menu_gift.png" style="position: relative; left: 13px; top: 14px" /></div>      

            <script>    
                var showstate = 0;

                document.getElementById("menu_chat").onclick = function () {
                    if (showstate != 2) {
                        visibleInput(true);
                        $("#chat_area").css("pointer-events", "auto");                       
                        document.getElementById("gift_area").style.display = 'none';
                        showstate = 2;
                    }
                    else {
                        visibleInput(false);
                        $("#chat_area").css("pointer-events", "none");
                        showstate = 0;
                    }
                }

                document.getElementById("menu_gift").onclick = function () {
                    if (showstate != 3) {                        
                        visibleInput(false);
                        $("#chat_area").css("pointer-events", "none");
                        document.getElementById("gift_area").style.display = 'block';
                        showstate = 3;
                    }
                    else {
                        document.getElementById("gift_area").style.display = 'none';
                        showstate = 0;
                    }
                }
            </script>
            <div id="popup_menu" style="width: 600px; height: 418px; position: absolute; left: 60px; top: 500px; background-image: url(/files/image/images_m/popup_menu.png); z-index:102; display: none;">
                <img id="close_pop_btn" src="../../files/image/images_m/close_btn.png" style="position: absolute; left: 530px; top: 3px;" />
                <img id="mute_bg_btn" src="../../files/image/images_m/mute_bg_btn.png" style="position: absolute; left: 78px; top: 87px;" />
                <img id="mute_eff_btn" src="../../files/image/images_m/mute_eff_btn.png" style="position: absolute; left: 239px; top: 87px;" />
                <img id="mute_zhubo_btn" src="../../files/image/images_m/mute_zhubo_btn.png" style="position: absolute; left: 400px; top: 87px;" />
                <img id="gohome_btn" src="../../files/image/images_m/gohome_btn.png" style="position: absolute; left: 78px; top: 230px;" />
                <%--<img id="goroom_btn" src="../../files/image/images_m/goroom_btn.png" />--%>
                <img id="showlog_btn" src="../../files/image/images_m/showlog_btn.png" style="position: absolute; left: 402px; top: 230px;" />
            </div>
            <script>
                document.getElementById("close_pop_btn").onclick = function () {
                    document.getElementById("popup_menu").style.display = 'none';
                }
                document.getElementById("showlog_btn").onclick = function () {
                    window.open('betting_log.aspx', '客服代表', 'toolbar=no, menubar=no, scrollbars=no, resizable=no');
                }
                document.getElementById("gohome_btn").onclick = function () {
                    location.href = "/main/sky_driver.aspx";
                }
                document.getElementById("mute_bg_btn").onclick = function () {
                    if (bg_sound_state == 1) {
                        document.getElementById("mute_bg_btn").style.opacity = 0.1;
                        bg_sound_state = 0;
                        $('#777game').get(0).contentWindow.bg_sound_state = 0;
                    }
                    else {
                        document.getElementById("mute_bg_btn").style.opacity = 1;
                        bg_sound_state = 1;
                        bg_sound = 1;
                        $('#777game').get(0).contentWindow.bg_sound_state = 1;
                        $('#777game').get(0).contentWindow.bg_sound = 1;
                    }
                }
                document.getElementById("mute_eff_btn").onclick = function () {
                    if (eff_sound_state == 1) {
                        document.getElementById("mute_eff_btn").style.opacity = 0.1;
                        eff_sound_state = 0;
                        $('#777game').get(0).contentWindow.eff_sound_state = 0;
                    }
                    else {
                        document.getElementById("mute_eff_btn").style.opacity = 1;
                        eff_sound_state = 1;
                        $('#777game').get(0).contentWindow.eff_sound_state = 1;
                    }
                }
                document.getElementById("mute_zhubo_btn").onclick = function () {
                    
                    if (zhubo_sound_state == 1) {
                        document.getElementById("mute_zhubo_btn").style.opacity = 0.1;
                        zhubo_sound_state = 0;
                        //strem_player.mute(true);
                    }
                    else {
                        document.getElementById("mute_zhubo_btn").style.opacity = 1;
                        zhubo_sound_state = 1;
                        //strem_player.mute(false);
                    }
                }
            </script>

        </form>
    </div>
</body>
</html>

<script type="text/javascript">
    var body = document.getElementsByTagName("body")[0];
    body.style.visibility = "hidden";   
    window.onload = function () { body.style.visibility = "visible"; };
</script>
