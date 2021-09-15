<%@ Control Language="C#" AutoEventWireup="true" CodeFile="chat_mobile.ascx.cs" Inherits="_777Game_chat_mobile" %>
<link media="all" href="/files/css/chatpannel-mobile.css" type="text/css" rel="stylesheet">
<link href="/files/css/user-manager.css" rel="stylesheet" />
<style>
    .face-pop {
        z-index: 100;
        position: absolute;
        left: -999px;
        top: -999px;
        width: 330px;
        height: 278px;
        overflow: hidden;
        background: #fff;
        border: 1px solid #e5e5e5;
        border-color: rgba(0, 0, 0, 0.0);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.14);
        border-radius: 4px;
        visibility: hidden;
        opacity: 0;
        transition: opacity .3s, visibility .3s;
    }

        .face-pop .tab {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 30px;
            background: #f7f7f7;
        }

            .face-pop .tab a {
                display: inline-block;
                padding: 5px 8px;
                width: 24px;
                height: 20px;
                font-size: 0;
            }

                .face-pop .tab a.on {
                    background: #fff;
                }

            .face-pop .tab i {
                width: 24px;
                height: 20px;
                background: url('/files/image/face-pop-v3.png');
            }

            .face-pop .tab .default i {
                background-position: 4px 2px;
            }

            .face-pop .tab .default:hover i, .face-pop .tab .default.on i {
                background-position: 4px -33px;
            }

            .face-pop .tab .vip i {
                background-position: -39px 1px;
            }

            .face-pop .tab .vip:hover i, .face-pop .tab .vip.on i {
                background-position: -39px -34px;
            }

            .face-pop .tab .safe i {
                background-position: -80px 0;
            }

            .face-pop .tab .safe:hover i, .face-pop .tab .safe.on i {
                background-position: -80px -35px;
            }

        .face-pop .face-default, .face-pop .face-vip, .face-pop .face-safe {
            padding: 8px 8px 0;
            height: 240px;
            display: none;
            overflow: auto;
        }

    .gift_panel {
        padding: 8px 8px 8px;
        display: none;
        overflow: auto;
        background: #fff;
        border: 1px solid #ccc;
    }

        .gift_panel td {
            border: 1px solid #eee;
            text-align: center;
        }

    .face-pop .face-default {
        display: block;
    }

    .face-pop table {
        width: 100%;
    }

    .face-pop td {
        border: 1px solid #eee;
        text-align: center;
    }

        .face-pop td:hover, .face-pop td.on {
            background: #f3f3f3;
        }

    .face-pop .face-default td {
        width: 11%;
        height: 32px;
    }

    .face-pop .face-vip td {
        width: 33%;
        height: 46px;
    }

    .face-pop .face-safe td {
        width: 25%;
        height: 78px;
    }

    .trans_div {
        background:unset;
        background-image: url('/files/image/transparency.png');
        background-repeat:repeat-x repeat-y;
    }

    div.stream .chatList li{
        color: black; 
        text-shadow: -1px -1px 0 #FFF,1px -1px 0 #FFF,-1px 1px 0 #FFF,1px 1px 0 #FFF; 
        font-size: large; 
        font-family: SimSun; 
        opacity: 0.5;
    }

    div.room_notice{
        color: black; 
        text-shadow: -1px -1px 0 #FFF,1px -1px 0 #FFF,-1px 1px 0 #FFF,1px 1px 0 #FFF; 
        font-size: 40px;
        font-family: SimSun; 
        opacity: 0.5;
    }
</style>

<div class="column3 fix trans_div" style="margin-right: 0px;">
    <!--right span of chat pannel is margin-right-->
    <div class="room-chat-panel trans_div" style="">
        <div class="room-chat-body trans_div" id="chat_body" style="">
            <div class="watch-chat trans_div" id="watchChat" style="">
                <!--Height of chat pannel is follow value-->
                <div class="watch-chat-box room-chat-bg trans_div" id="all_chat" data-tracing="all_chat" style="height: 360px;">
                    <!--/#priHand-->
                    <div class="room_notice trans_div" data-tracing="iqg9ruc4" style="">
                        <span class="title trans_div">【房间公告】：</span>
                        <span class="pay-px trans_div" style="color:#f7240f"></span>
                    </div>
                    <!--/.room_notice-->
                    <!--Height of public chat pannel is follow value-->
                    <div id="watchChat_pub" class="chat-public scroll-bar" style="height: 320px;">
                        <div class="stream">
                            <ul class="chatList" onclick="popupUserMenu()">
                            </ul>
                        </div>
                    </div>
                    <!--/.chat_public-->
                    <!--Height of private chat pannel is follow value-->
                </div>
                <!--/.watch-chat-box-->
                <div class="watch-chat-act" id="chatForm" data-tracing="iqg9ruce" style="">
                    <div class="chat-set" style="display:none;">
                        <span class="to-name">
                            <input value="所有人" readonly="readOnly" type="text">
                            <a class="toPub to_select"></a>
                        </span>
                        <span class="to-priv">
                            <input class="check" disabled="" type="checkbox">悄悄</span>
                        <span class="to-face" title="表情"><i></i></span>
                    </div>
                    <!--/.chat-set-->
                    <div class="chat-txt" style="">
                        <span class="to-text">
                            <input placeholder="和主播聊聊吧..." class="" value="" type="text">
                        </span>
                        <span class="act-btn"><a class="btn_text">发言</a></span>
                        <span class="act-btn act-btn-aly"><a class="flyBtn"><i>飞屏</i></a></span>
                    </div>
                    <!--/.chat-txt-->
                </div>
                <!--/.room_chat-act-->
            </div>
            <!--/.watch-chat-->
        </div>
        <!--/.room-chat-body-->
    </div>
    <!--/.room-chat-panel-->
</div>
<!--/.column3-->
<script src="/files/js/woza_chat_mobile.js"></script>
<script>
    var HotUser = "";
    if (!isPostBack()) {
        var username = '<%= Session["User"] %>';
        ChannelInfo = PostAjax("/Ajax/chat_action.ashx", "cmd=init&u=" + username);//while init chat engine, asign channel information
        if (ChannelInfo.length > 0)
            $("span.pay-px").text("聊天初始化成功");
        else 
            $("span.pay-px").text("聊天初始化失败");
    }

    function getAbsolutePosition(element) {
        var r = { x: element.offsetLeft, y: element.offsetTop };
        if (element.offsetParent) {
            var tmp = getAbsolutePosition(element.offsetParent);
            r.x += tmp.x;
            r.y += tmp.y;
        }
        return r;
    }

    var chat_height = 0, inputbox_height = 0, msglist_height = 0, chatpub_height = 0;
    function visibleInput(bVisible)
    {
        if (chat_height == 0)
        {
            inputbox_height = $(".watch-chat-act").css("height");
            chat_height = $(".watch-chat").css("height");

            inputbox_height = inputbox_height.substr(0, inputbox_height.length - 2);
            chat_height = chat_height.substr(0, chat_height.length - 2);
        }
        msglist_height = $(".watch-chat-box").css("height");
        msglist_height = msglist_height.substr(0, msglist_height.length - 2);

        chatpub_height = $("#watchChat_pub").css("height");
        chatpub_height = chatpub_height.substr(0, chatpub_height.length - 2);        

        var visisble = $(".watch-chat-act").css("visibility");
        var height = 0;
        if (visisble == "visible" && !bVisible)
        {
            $(".watch-chat-act").css("visibility", "hidden");
            
            height = eval(msglist_height) + eval(inputbox_height);
            $(".watch-chat-box").css("height", height + "px");

            height = eval(chatpub_height) + eval(inputbox_height);
            $("#watchChat_pub").css("height", height);
        }
        else if (visisble != "visible" && bVisible) {
            $(".watch-chat-act").css("visibility", "visible");
            height = eval(msglist_height) - eval(inputbox_height);
            $(".watch-chat-box").css("height", height + "px");

            height = eval(chatpub_height) - eval(inputbox_height);
            $("#watchChat_pub").css("height", height);
        }
    }

    visibleInput(false);
</script>