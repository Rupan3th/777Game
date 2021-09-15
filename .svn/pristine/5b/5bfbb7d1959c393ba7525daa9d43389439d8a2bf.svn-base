<%@ Control Language="C#" AutoEventWireup="true" CodeFile="giftsend_mobile.ascx.cs" Inherits="_777Game_giftsend_mobile" %>
<style>
    .act-btn a.btn_gift {
        display: inline-block;
        width: 100%;
        height: 50px;
        line-height: 50px;
        color: rgb(255, 255, 255);
        background: rgb(106, 211, 119) none repeat scroll 0% 0%;
        font-size: 14px;
        text-align: center;
        text-decoration: none;
        border-radius: 0px 2px 2px 0px;
    }

    .act-btn a.btn_gift:hover {
        background: rgba(106, 211, 119, 0.7) none repeat scroll 0% 0%;
    }
</style>
<div style="width: 100%; height: 100%; display: inline-table;">
    <div class="gift_panel" id="div_gift" style="display: table-row; height: auto; width: 100%;">
        <table class="tab1 table_gift" style="width: 100%; height: 100%; vertical-align: middle; text-align: center;">
            <tbody>
                <tr>
                    <td><span title="">
                        <img name="0" src="/files/image/live/swfGIFT/gift_1.png" alt="1"></span></td>
                    <td><span title="">
                        <img name="1" src="/files/image/live/swfGIFT/gift_2.png" alt="2"></span></td>
                    <td><span title="">
                        <img name="2" src="/files/image/live/swfGIFT/gift_3.png" alt="3"></span></td>
                    <td><span title="">
                        <img name="3" src="/files/image/live/swfGIFT/gift_4.png" alt="4"></span></td>
                    <td><span title="">
                        <img name="4" src="/files/image/live/swfGIFT/gift_5.png" alt="5"></span></td>
                </tr>
                <tr>
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
                <tr>
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
    <div style="display: table-row; height: 50px; width: 100%;">
        <div style="width: 100%; display: inline-flex;">
            <div style="display: table-cell; width: 30%;vertical-align:middle; text-align:center;background-color:rgb(255, 250, 210);">
                <span class="to-gift" title="礼物" style="width: 100%;">
                    <img alt="" src="/files/image/coin2.png" style="padding-top:5px"/>
                </span>
            </div>
            <div style="display: table-cell; width: 50%;">
                <span class="to-count" style="width: 100%;">
                    <input style="height: 48px; width:100%; text-align: center; padding:0; font-size:50px" value="" type="number" min="1" max="10000" step="1">
                    <input id="gift-clss" hidden="hidden">
                </span>
            </div>
            <div style="display: table-cell; width: 20%;">
                    <span class="act-btn" onclick="sendGift()"><a class="btn_gift">发送</a></span>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var selTd = null;
        jQuery(".table_gift img").each(function () {
            jQuery(this).css("width", "50%");
            jQuery(this).css("height", "50%");
            jQuery(this).click(function () {
                jQuery("#gift-clss").val("/GIFT/gift_" + $(this).attr("alt") + "/");
                jQuery(".to-count input").focus();
            });
        });

        jQuery(".table_gift td").each(function () {
            jQuery(this).click(function () {
                if (selTd != null) $(selTd).css('background-color', '#FFFFFF');
                $(this).css('background-color', '#FF00FF');
                selTd = this;
            });
        });

        function sendGift()
        {
            var gift = jQuery("#gift-clss").val();
            var cnt = jQuery(".to-count input").val();
            if (gift.length <= 0) {
                alert('请选择送礼物的图标。');
                return;
            }

            if (cnt.length <= 0 || !$.isNumeric(cnt)) {
                alert('请输入送礼物的金额。');
                jQuery(".to-count input").focus();
                return;
            }

            if (gift.length > 0 && cnt.length > 0) {
                cnt = parseInt(cnt, 10);
                if (cnt > 0) {
                    var sresult = PostAjax("/Ajax/chat_action.ashx", "cmd=send&txt=" + gift + cnt + "/&chl=" + ChannelInfo);
                    if (isError(sresult)) return;

                    jQuery("#gift-clss").val("");
                    jQuery(".to-count input").val("");
                    $(selTd).css('background-color', '#FFFFFF');
                    selTd = null;
                }
            }
        }
    </script>
</div>
