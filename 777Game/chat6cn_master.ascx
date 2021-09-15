﻿<%--This chat interface is of 6.cn--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="chat6cn_master.ascx.cs" Inherits="_777Game_chat6cn_master" %>
<%--NEEDME <script src="/files/js/jquery_2.js"></script>--%>
<link media="all" href="/files/css/chatpannel.css" type="text/css" rel="stylesheet">
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
                <div class="watch-chat-box room-chat-bg" id="all_chat" data-tracing="all_chat" style="height: 483px;">
                    <div style="height:30px;background-color:#d7d7d7;text-align:center;vertical-align:middle;display:table;width:100%;">
                        <span style="padding-left: 10px; display: table-cell; vertical-align: middle;">礼物</span>
                    </div>
                    <div id="watchGift_pub" class="gift-public scroll-bar" style="top:0px;height: 193px;">
                        <div class="stream">
                            <ul class="chatList">
                            </ul>
                        </div>
                    </div>                    
                    <div style="height:30px;background-color:#d7d7d7;text-align:center;vertical-align:middle;display:table;width:100%;">
                            <span style="padding-left: 10px; display: table-cell; vertical-align: middle;">聊天</span>
                    </div>
                    <!--Height of public chat pannel is follow value-->
                    <div id="watchChat_pub" class="chat-public scroll-bar" style="top:253px;height: 230px;">
                        <div class="stream">
                            <ul class="chatList">
                            </ul>
                        </div>
                    </div>
                    <!--/.chat_public-->
                    <!--Height of private chat pannel is follow value-->
                    <div id="watchChat_pri" class="chat-private scroll-bar" style="height: 84.5578px; display: none">
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
                <div class="watch-chat-act" id="chatForm" data-tracing="iqg9ruce" style="height:75px">
                    <div class="chat-set">
                        <span class="to-name" style="display:none;">
                            <input value="所有人" readonly="readOnly" type="text">
                            <a class="toPub to_select"></a>
                        </span>
                        <span class="to-priv">
                            <input class="check" disabled="" type="checkbox">悄悄</span>
                        <span class="to-face" title="表情"><i></i></span>
                        <span class="to-gift" title="礼物" style="display:none;"><i class="gift_btn"></i></span>

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
                                <script type="text/javascript">
                                    jQuery(".table_gift img").each(function () {
                                        jQuery(this).click(function () {
                                            jQuery(".to-text input").val($(".to-text input").val() + "/GIFT/gift_" + $(this).attr("alt") + "/1/");
                                            jQuery('#div_gift').hide();
                                            jQuery(".to-text input").focus();
                                        });
                                    });

                                    function ShowGiftPannel() {
                                        if ($('#div_gift').is(':hidden')) {
                                            var d = jQuery(".to-gift").offset();
                                            jQuery(".gift_panel").css({
                                                left: 100,
                                                top: -60,
                                                position: "absolute"
                                            });
                                            $('#div_gift').show();
                                        } else {
                                            $('#div_gift').hide();
                                        }
                                    }

                                    jQuery(".to-gift").bind("click", function () {
                                        ShowGiftPannel();
                                    });
                                </script>
                            </table>
                        </div>
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
<script src="/files/js/woza_chatmaster.js"></script>
<script>
    function isPostBack() {
        return document.referrer.indexOf(document.location.href) > -1;
    }

    if (!isPostBack()) {
        var username = '<%= Session["User"] %>';
        ChannelInfo = PostAjax("/Ajax/chat_action.ashx", "cmd=init&u=" + username);//while init chat engine, asign channel information
        if (ChannelInfo.length > 0)
            $("span.pay-px").text("聊天初始化成功");
        else
            $("span.pay-px").text("聊天初始化失败");
    }
</script>