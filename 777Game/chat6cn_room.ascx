﻿<%--This chat interface is of 6.cn--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="chat6cn_room.ascx.cs" Inherits="_777Game_chat6cn_room" %>
<%--NEEDME <script src="/files/js/jquery_2.js"></script>--%>
<link media="all" href="/files/css/chatpannel.css" type="text/css" rel="stylesheet">
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
</style>

<div class="column3 fix" style="margin-right: 0px;">
    <!--right span of chat pannel is margin-right-->
    <div class="room-chat-panel">
        <div class="room-chat-body" id="chat_body">
            <div class="watch-chat" id="watchChat">
                <!--Height of chat pannel is follow value-->
                <div class="watch-chat-box room-chat-bg" id="all_chat" data-tracing="all_chat" style="height: 350px;">
                    <!--/#priHand-->
                    <div class="room_notice" data-tracing="iqg9ruc4">
                        <span class="title">【房间公告】：</span>
                        <span class="pay-px" style="color:#f7240f"></span>
                    </div>
                    <!--/.room_notice-->
                    <!--Height of public chat pannel is follow value-->
                    <div id="watchChat_pub" class="chat-public scroll-bar" style="height: 270px;">
                        <div class="stream">
                            <ul class="chatList" onclick="popupUserMenu()">
                            </ul>
                        </div>
                    </div>
                    <!--/.chat_public-->
                    <!--Height of private chat pannel is follow value-->
                    <div id="watchChat_pri" class="chat-private scroll-bar" style="height: 80px; display: none">
                        <div class="stream">
                            <ul class="chatList">
                                <li class="">
                                    <div class="txt-item"><a class="u">小妖♡出山</a> <span class="c9">对</span> <a class="u">你</a> <span class="c9">说：</span><span class="con">喜欢加军团啦http://v.6.cn/a/920311150</span></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--/.chat_private-->
                    <div id="watchChat_slideBar" class="chat-bar" style="bottom: 113.558px; display: none"><span></span><i></i></div>
                    <div class="radio-room" data-tracing="iqg9rucd" style="display: none">
                        <div class="radio-bd">
                            <i class="ico" title="广播"></i>
                            <ul class="list">
                                <li><a target="_top" title="东莞少妇——极品——东莞少妇——极品——东莞少妇——极品——东莞少妇—" href="780791.html" indepth="true"><span>超级大乃牛：</span><em>东莞少妇——极品——东莞少妇——极品——东莞少妇——极品——东莞少妇—</em></a></li>
                            </ul>
                            <a class="send">发布广播</a>
                        </div>
                        <div class="radio-send">
                            <a class="close-small close" title="关闭"></a>
                            <div class="text">
                                <textarea placeholder="输入文字不超过50个。每次广播花费500六币"></textarea>
                            </div>
                            <div class="btn"><a>提交</a></div>
                        </div>
                    </div>
                    <!--/.radio-room-->
                </div>
                <!--/.watch-chat-box-->
                <div class="watch-talk-box room-chat-bg" id="only_chat" style="display: none; height: 642px;" data-tracing="only_chat">
                    <div class="pubHandBox" style="visibility: visible; opacity: 1;">
                        <span class="clearListBtn">清屏</span>
                        <span class="rollPauseBtn">滚屏</span>
                    </div>
                    <!--/#pubHand-->
                    <div class="pubHandBox" style="bottom: 20px; top: auto; display: none; visibility: visible; opacity: 1;">
                        <span class="clearListBtn">清屏</span>
                        <span class="priBtn deny">私聊</span>
                    </div>
                    <!--/#priHand-->
                    <div id="watchTalk_me" class="talk-tome">
                        <div class="talk-tome-box scroll-bar" style="display: none; height: 0px;">
                            <div class="stream">
                                <p class="talk-none">亲，还没有人对你说过哦～</p>
                                <ul class="chatList"></ul>
                            </div>
                        </div>
                        <div class="talk-tome-spread" data-tracing="iqg9ruc5"><a><i></i>对我说</a></div>
                    </div>
                    <div class="talk-public scroll-bar" style="height: 547.319px; overflow: hidden;">
                        <div class="stream">
                            <ul class="chatList">
                            </ul>
                        </div>
                    </div>
                    <!--/.talk_public-->
                    <div class="talk-private scroll-bar" style="height: 82.6811px; overflow: hidden;">
                        <div class="stream">
                            <ul class="chatList"></ul>
                        </div>
                    </div>
                    <!--/.talk_private-->
                    <div id="watchTalk_slideBar" class="talk-bar" style="bottom: 79.6811px;"><span></span><i></i></div>
                </div>
                <!--/.watch-talk-box-->
                <div class="watch-chat-act" id="chatForm" data-tracing="iqg9ruce">
                    <div class="chat-set">
                        <span class="to-name" style="display:none;">
                            <input value="所有人" readonly="readOnly" type="text">
                            <a class="toPub to_select"></a>
                        </span>
                        <span class="to-priv" style="display:none;">
                            <input class="check" disabled="" type="checkbox">悄悄</span>
                        <span class="to-priv" >
                            <input class="check gift_hide" type="checkbox">屏蔽礼物</span>
                        <span class="to-face" title="表情"><i></i></span>
                    </div>
                    <!--/.chat-set-->
                    <div class="chat-txt">
                        <span class="to-text">
                            <input placeholder="和主播聊聊吧..." class="" value="" type="text">
                        </span>
                        <span class="act-btn"><a class="btn_text">发言</a></span>
                        <span class="act-btn act-btn-aly"><a class="flyBtn"><i>飞屏</i></a></span>
                    </div>
                    <!--/.chat-txt-->
                    <div style="height:1px;background-color:#000000;margin-top:3px;margin-bottom:3px;">
                    </div>
                    <div class="gift-set" style="width:100%;">
                        <div class="gift_panel" id="div_gift" style="display: none;">
                            <table class="tab1 table_gift">
                                <tbody>
                                    <tr>
                                        <td ><span title="0.1金币">
                                            <img name="0" src="/files/image/live/swfGIFT/gift_1.png" alt="1"></span></td>
                                        <td><span title="1金币">
                                            <img name="1" src="/files/image/live/swfGIFT/gift_2.png" alt="2"></span></td>
                                        <td><span title="6金币">
                                            <img name="2" src="/files/image/live/swfGIFT/gift_3.png" alt="3"></span></td>
                                        <td><span title="66金币">
                                            <img name="3" src="/files/image/live/swfGIFT/gift_4.png" alt="4"></span></td>
                                        <td><span title="100金币">
                                            <img name="4" src="/files/image/live/swfGIFT/gift_5.png" alt="5"></span></td>
                                    </tr>
                                    <tr style="display:none;">
                                        <td><span title="">
                                            <img name="5" src="/files/image/live/swfGIFT/gift_6.png" alt="6"></span></td>
                                        <td><span title="">
                                            <img name="6" src="/files/image/live/swfGIFT/gift_7.png" alt="7"></span></td>
                                        <td><span title="">
                                            <img name="7" src="/files/image/live/swfGIFT/gift_8.png" alt="8"></span></td>
                                        <td><span title="">
                                            <img name="8" src="/files/image/live/swfGIFT/gift_9.png" alt="9"></span></td>
                                        <td><span title="">
                                            <img name="9" src="/files/image/live/swfGIFT/gift_10.png" alt="10"></span></td>
                                    </tr>
                                    <tr style="display:none;">
                                        <td><span title="">
                                            <img name="10" src="/files/image/live/swfGIFT/gift_11.png" alt="11"></span></td>
                                        <td><span title="">
                                            <img name="11" src="/files/image/live/swfGIFT/gift_12.png" alt="12"></span></td>
                                        <td><span title="">
                                            <img name="12" src="/files/image/live/swfGIFT/gift_13.png" alt="13"></span></td>
                                        <td><span title="">
                                            <img name="13" src="/files/image/live/swfGIFT/gift_14.png" alt="14"></span></td>
                                        <td><span title="">
                                            <img name="14" src="/files/image/live/swfGIFT/gift_15.png" alt="15"></span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div style="float:right;">
                            <span class="to-gift" title="礼物"><i class="gift_btn"></i></span>
                            <span class="to-count">
                                <input class="" style="width: 50px; text-align: center;" value="" type="number" min="1" max="10000" step="1">
                                <input id="gift-clss" hidden="hidden">
                            </span>
                            <span class="act-btn2">
                                <a class="giftflyBtn">
                                    <i>飞屏</i>
                                </a>
                            </span>
                        </div>
                        <script type="text/javascript">
                            jQuery(".table_gift img").each(function () {
                                jQuery(this).click(function () {
                                    jQuery("#gift-clss").val("/GIFT/gift_" + $(this).attr("alt") + "/");
                                    jQuery('#div_gift').hide();
                                    jQuery(".gift-set .to-count input").focus();
                                });
                            });

                            function ShowGiftPannel() {
                                var d = jQuery(".to-gift").offset();
                                jQuery(".gift_panel").css({
                                    left: 100,
                                    top: -60,
                                    position: "absolute"
                                });
                                $('#div_gift').show();
                            }

                            jQuery(".to-gift").bind("click", function () {
                                ShowGiftPannel();
                            });
                        </script>
                    </div>
                </div>
                <!--/.room_chat-act-->
            </div>
            <!--/.watch-chat-->
        </div>
        <!--/.room-chat-body-->
    </div>
    <!--/.room-chat-panel-->
    <a class="side-spread" title="收起观众列表" disabled><i></i></a>
</div>
<!--/.column3-->

<div class="user-manager" style="display:none; top: 0px; left: 0px;">
<% 
    if (Session["rating"] != null && Session["rating"].ToString().CompareTo("4") == 0)
    {
        Response.Write(@"<div class='userWrap'>
        <h6>UserName：</h6>
        <b class='underline'></b>
        <p class='icon'></p>
        <p class='main_1'>
            <a class='kick' onclick='comeoutUser();'>踢出2小时</a>
            <a class='say_off' onclick='shutupUser(15);'>禁言15分钟</a>
            <a class='say_off' onclick='shutupUser(30);'>禁言30分钟</a>
            <a class='say_off' onclick='shutupUser(60);'>禁言60分钟</a>
            <a href='' class='say_on' style='display:none;'>恢复发言</a>
            <a href='' class='ip_off' style='display:none;'>封IP2小时</a>
            <b class='underline'></b>
        </p>
    </div>");
    }
%>  
</div>
<script src="/files/js/woza_chat.js"></script>
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

    function popupUserMenu( e )
    {
    <% 
    if ( Session["rating"] != null && Session["rating"].ToString().CompareTo("4") == 0 )
    {
        Response.Write(@"
        e = e || window.event;
        e = e.target || e.srcElement;
        if (e.nodeName == 'A' && e.id == 'chat_user') {
            pos = getAbsolutePosition(e);
            HotUser = e.innerText;
            $('.user-manager .userWrap h6').text(e.innerText);
            $('.user-manager').css('top', pos.y + 20 - $('div#watchChat_pub').scrollTop());
            $('.user-manager').css('left', pos.x);
            jQuery('.user-manager').show();
        }");
    }
    %>  
    }

    function comeoutUser()
    {
        PostAjax("/Ajax/chat_action.ashx", "cmd=drop&u=" + HotUser);
    }

    function shutupUser(span) {
        PostAjax("/Ajax/chat_action.ashx", "cmd=stop" + span + "&u=" + HotUser);
    }
</script>

