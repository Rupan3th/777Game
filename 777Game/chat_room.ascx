<%--This chat interface is of ttqtv.com--%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="chat_room.ascx.cs" Inherits="_777Game_chat_room" %>
<link href="../files/css/common.css" rel="stylesheet" />
<link href="../files/css/style.css" rel="stylesheet" />
<script src="../files/js/room_public.js"></script>
<script src="../files/js/alert.js"></script>
<script type="text/javascript">
    var LoginUser = { "id": "1ef28c63-1285-4cf8-aaca-81717b0e6584", "uid": "d7bed63d-f821-4039-842d-5f13e30cc20c", "rid": "0", "name": "游客wqPIGj", "lv": "0", "tx": "0", "img": "", "ism": "False", "cname": "", "car": "", "carp": "0", "carswf": "", "vip": "0", "lh": "0", "lk": "0", "tdvip": "0", "agency": "0", "sort": "0", "jz": "", "sh": "0" };
</script>
<div class="maincon">
    <div class="mainright">
        <div class="rcontent">
            <div class="rlcon fl">
                <div id="liaotdiv">
                    <div id="tagContent">
                        <div class="tagContent selectTag" id="tagContent0">
                            <div class="ltcon" id="div_message">
                                <ul id="list_message">
                                    <li><span style="color: Green;">连接服务器成功...</span></li>
                                    <li>21:53 欢迎"kcs123456"进入房间</li>
                                </ul>
                            </div>
                            <div class="gaogcon" onmousemove="RepliceTitle()">
                                <ul id="list_notice">
                                    <li><span class="name">房间公告 ：</span></li>
                                    <li><span class="name">菜菜_小妞
                                                对你说 ：</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ggcon">
                    <ul>
                        <li>
                            <select id="list_to_user" class="xlexe">
                                <option value="All">所有人</option>
                            </select>
                        </li>
                        <li style="padding-top: 3px;">
                            <input type="checkbox" id="check_private_message">悄悄话</li>
                        <li class="bq"><a href="javascript:void(0)" onclick="ShowFace()" title="普通表情"></a>
                        </li>
                        <li class="bqvip"><a href="javascript:void(0)" onclick="ShowFaceVip()" title="VIP专属表情"></a></li>
                        <li class="qp"><a href="javascript:void(0)" title="清屏" onclick="$('#list_message').html('');">
                            <em class="ico"></em>&nbsp;清屏</a></li>
                    </ul>
                </div>
                <div class="bqtc face_panel" id="div_face" style="display: none;">
                    <table class="tab1 table_face">
                        <tbody>
                            <tr>
                                <td><span title="狂笑">
                                    <img name="0" src="/files/image/ttqtv_face/0.gif" alt="狂笑"></span></td>
                                <td><span title="大笑">
                                    <img name="1" src="/files/image/ttqtv_face/1.gif" alt="大笑"></span></td>
                                <td><span title="惊讶">
                                    <img name="2" src="/files/image/ttqtv_face/2.gif" alt="惊讶"></span></td>
                                <td><span title="害羞">
                                    <img name="3" src="/files/image/ttqtv_face/3.gif" alt="害羞"></span></td>
                                <td><span title="窃笑">
                                    <img name="4" src="/files/image/ttqtv_face/4.gif" alt="窃笑"></span></td>
                                <td><span title="发怒">
                                    <img name="5" src="/files/image/ttqtv_face/5.gif" alt="发怒"></span></td>
                                <td><span title="大哭">
                                    <img name="6" src="/files/image/ttqtv_face/6.gif" alt="大哭"></span></td>
                                <td><span title="色色">
                                    <img name="7" src="/files/image/ttqtv_face/7.gif" alt="色色"></span></td>
                                <td><span title="坏笑">
                                    <img name="8" src="/files/image/ttqtv_face/8.gif" alt="坏笑"></span></td>
                            </tr>
                            <tr>
                                <td><span title="火大">
                                    <img name="9" src="/files/image/ttqtv_face/9.gif" alt="火大"></span></td>
                                <td><span title="汗">
                                    <img name="10" src="/files/image/ttqtv_face/10.gif" alt="汗"></span></td>
                                <td><span title="奸笑">
                                    <img name="11" src="/files/image/ttqtv_face/11.gif" alt="奸笑"></span></td>
                                <td><span title="欢迎">
                                    <img name="12" src="/files/image/ttqtv_face/12.gif" alt="欢迎"></span></td>
                                <td><span title="再见">
                                    <img name="13" src="/files/image/ttqtv_face/13.gif" alt="再见"></span></td>
                                <td><span title="白眼">
                                    <img name="14" src="/files/image/ttqtv_face/14.gif" alt="白眼"></span></td>
                                <td><span title="挖鼻">
                                    <img name="15" src="/files/image/ttqtv_face/15.gif" alt="挖鼻"></span></td>
                                <td><span title="顶">
                                    <img name="16" src="/files/image/ttqtv_face/16.gif" alt="顶"></span></td>
                                <td><span title="胜利">
                                    <img name="17" src="/files/image/ttqtv_face/17.gif" alt="胜利"></span></td>
                            </tr>
                            <tr>
                                <td><span title="欧耶">
                                    <img name="18" src="/files/image/ttqtv_face/18.gif" alt="欧耶"></span></td>
                                <td><span title="抱拳">
                                    <img name="19" src="/files/image/ttqtv_face/19.gif" alt="抱拳"></span></td>
                                <td><span title="囧">
                                    <img name="20" src="/files/image/ttqtv_face/20.gif" alt="囧"></span></td>
                                <td><span title="淡定">
                                    <img name="21" src="/files/image/ttqtv_face/21.gif" alt="淡定"></span></td>
                                <td><span title="美女">
                                    <img name="22" src="/files/image/ttqtv_face/22.gif" alt="美女"></span></td>
                                <td><span title="靓仔">
                                    <img name="23" src="/files/image/ttqtv_face/23.gif" alt="靓仔"></span></td>
                                <td><span title="神马">
                                    <img name="24" src="/files/image/ttqtv_face/24.gif" alt="神马"></span></td>
                                <td><span title="开心">
                                    <img name="25" src="/files/image/ttqtv_face/25.gif" alt="开心"></span></td>
                                <td><span title="给力">
                                    <img name="26" src="/files/image/ttqtv_face/26.gif" alt="给力"></span></td>
                            </tr>
                            <tr>
                                <td><span title="飞吻">
                                    <img name="27" src="/files/image/ttqtv_face/27.gif" alt="飞吻"></span></td>
                                <td><span title="眨眼">
                                    <img name="28" src="/files/image/ttqtv_face/28.gif" alt="眨眼"></span></td>
                                <td><span title="威武">
                                    <img name="29" src="/files/image/ttqtv_face/29.gif" alt="威武"></span></td>
                                <td><span title="来吧">
                                    <img name="30" src="/files/image/ttqtv_face/30.gif" alt="来吧"></span></td>
                                <td><span title="围观">
                                    <img name="31" src="/files/image/ttqtv_face/31.gif" alt="围观"></span></td>
                                <td><span title="飘过">
                                    <img name="32" src="/files/image/ttqtv_face/32.gif" alt="飘过"></span></td>
                                <td><span title="地雷">
                                    <img name="33" src="/files/image/ttqtv_face/33.gif" alt="地雷"></span></td>
                                <td><span title="菜刀">
                                    <img name="34" src="/files/image/ttqtv_face/34.gif" alt="菜刀"></span></td>
                                <td><span title="帅">
                                    <img name="35" src="/files/image/ttqtv_face/35.gif" alt="帅"></span></td>
                            </tr>
                            <tr>
                                <td><span title="审视">
                                    <img name="36" src="/files/image/ttqtv_face/36.gif" alt="审视"></span></td>
                                <td><span title="无语">
                                    <img name="37" src="/files/image/ttqtv_face/37.gif" alt="无语"></span></td>
                                <td><span title="无奈">
                                    <img name="38" src="/files/image/ttqtv_face/38.gif" alt="无奈"></span></td>
                                <td><span title="亲亲">
                                    <img name="39" src="/files/image/ttqtv_face/39.gif" alt="亲亲"></span></td>
                                <td><span title="勾引">
                                    <img name="40" src="/files/image/ttqtv_face/40.gif" alt="勾引"></span></td>
                                <td><span title="后后">
                                    <img name="41" src="/files/image/ttqtv_face/41.gif" alt="后后"></span></td>
                                <td><span title="吐血">
                                    <img name="42" src="/files/image/ttqtv_face/42.gif" alt="吐血"></span></td>
                                <td><span title="媚眼">
                                    <img name="44" src="/files/image/ttqtv_face/44.gif" alt="媚眼"></span></td>
                                <td><span title="愁人">
                                    <img name="45" src="/files/image/ttqtv_face/45.gif" alt="愁人"></span></td>
                            </tr>
                            <tr>
                                <td><span title="肿么">
                                    <img name="46" src="/files/image/ttqtv_face/46.gif" alt="肿么"></span></td>
                                <td><span title="调戏">
                                    <img name="47" src="/files/image/ttqtv_face/47.gif" alt="调戏"></span></td>
                                <td><span title="抽">
                                    <img name="48" src="/files/image/ttqtv_face/48.gif" alt="抽"></span></td>
                                <td><span title="哼哼">
                                    <img name="49" src="/files/image/ttqtv_face/49.gif" alt="哼哼"></span></td>
                                <td><span title="鄙视">
                                    <img name="50" src="/files/image/ttqtv_face/50.gif" alt="鄙视"></span></td>
                                <td><span title="鸡冻">
                                    <img name="52" src="/files/image/ttqtv_face/52.gif" alt="鸡冻"></span></td>
                                <td><span title="眼馋">
                                    <img name="53" src="/files/image/ttqtv_face/53.gif" alt="眼馋"></span></td>
                                <td><span title="热汗">
                                    <img name="54" src="/files/image/ttqtv_face/54.gif" alt="热汗"></span></td>
                                <td><span title="输">
                                    <img name="55" src="/files/image/ttqtv_face/55.gif" alt="输"></span></td>
                            </tr>
                            <tr>
                                <td><span title="石化">
                                    <img name="56" src="/files/image/ttqtv_face/56.gif" alt="石化"></span></td>
                                <td><span title="蔑视">
                                    <img name="57" src="/files/image/ttqtv_face/57.gif" alt="蔑视"></span></td>
                                <td><span title="哭">
                                    <img name="58" src="/files/image/ttqtv_face/58.gif" alt="哭"></span></td>
                                <td><span title="骂">
                                    <img name="59" src="/files/image/ttqtv_face/59.gif" alt="骂"></span></td>
                                <td><span title="狂哭">
                                    <img name="60" src="/files/image/ttqtv_face/60.gif" alt="狂哭"></span></td>
                                <td><span title="狂汗">
                                    <img name="61" src="/files/image/ttqtv_face/61.gif" alt="狂汗"></span></td>
                            </tr>
                        </tbody>
                        <script type="text/javascript">
                            $(".table_face img").each(function () {
                                $(this).click(function () {
                                    $("#text_message").val($("#text_message").val() + "/" + $(this).attr("alt"));
                                    $('#div_face').hide();
                                    $("#text_message").focus();
                                });
                            });
                            function ShowFace() {
                                if ($('#div_face').is(':hidden')) {
                                    $('#div_face_vip').hide();
                                    setTimeout("$('#div_face').show()", 100);
                                } else {
                                    $('#div_face').hide();
                                }
                            }
                            function ShowFaceVip() {
                                if (LoginUser.vip > 0 || LoginUser.lk > 0 || LoginUser.tdvip > 0) {
                                    if ($('#div_face_vip').is(':hidden')) {
                                        $('#div_face').hide();
                                        setTimeout("$('#div_face_vip').show()", 100);
                                    } else {
                                        $('#div_face_vip').hide();
                                    }
                                }
                                else {
                                    _Alert("您没有权限使用VIP专属表情。<a href='/Mall/Vip.aspx' target='_blank'>点此购买VIP</a>");
                                }
                            }
                        </script>
                    </table>
                </div>
                <div class="bqtc1 face_panel" id="div_face_vip" style="display: none;">
                </div>
                <div class="ltinput">
                    <div class="topinp">
                        <input class="textyt" type="text" id="text_message" maxlength="50" onkeydown="if(event.keyCode==13){SendMsg();}">
                        <div class="ritext" onclick="ShowEasyReply()">
                            <div class="kjhfcon hide">
                                <ul>
                                    <li onclick="EasyReply(this)">是直播，是直播，确实是直播！不信你就多呆一会儿！</li>
                                    <li onclick="EasyReply(this)">新来的朋友们，喜欢主播的话，就点击“关注”或者收藏网页，下次再来哦！</li>
                                    <li onclick="EasyReply(this)">想点歌的朋友，请走"点歌"系统，就在直播窗口右侧的公屏上方哦！</li>
                                    <li onclick="EasyReply(this)">和谐的聊天环境需要我们共同努力。请各位朋友文明聊天 不说脏话！</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="botbont">
                        <p class="lineban">
                            <a href="/Activity/pay/" target="_blank">首充送豪礼，马上去充值</a>
                        </p>
                        <input type="button" class="bont" value="发送" onclick="SendMsg()" id="button_sendmsg">
                        <input type="button" class="bont2" value="飞屏" onclick="SendHorn()">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Alert panel-->
<div id="_AlertPanel" style="display: none;">
    <div class="popupbig">
        <div class="ptit">
            <p class="close fr">
                <a href="javascript:_CheckTrue()" id="_AlertClose"></a>
            </p>
        </div>
        <div class="pcont clearfloat">
            <i class="pngico fl" id="_AlertType"></i>
            <div class="popinfo fl" style="max-width: 200px; height: auto;">
                <h3 id="_AlertTitle"></h3>
                <p id="_AlertConteng"></p>
            </div>
        </div>
        <div class="buttondiv" id="_AlertButton">
            <a class="bont1" href="javascript:void(0)" onclick="_CheckTrue()">确定</a> <a class="bont2" href="javascript:void(0)" onclick="_PanelHide()">取消</a>
        </div>
    </div>
    <div id="blacktop">
    </div>
</div>
