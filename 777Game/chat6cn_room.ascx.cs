using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _777Game_chat6cn_room : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if( !Page.IsPostBack )
        {
        }
    }
}


//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:23 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="69058854,217364826,^_^敏$锐^_^,,7">^_^敏$锐^_^</a><span class="urid">[<em>217364826</em>]</span> <span class="c9">说：</span><span class="con"><img src = "s15.gif" align="absmiddle">头条<img src="s15.gif" align="absmiddle"> 头条</span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:39 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="60613266,920615,小妖♡出山,,9">小妖♡出山</a><span class="urid">[<em>920615</em>]</span> <span class="c9">说：</span><span class="con">好</span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:42 </span><i class="uIco badge_7122" title="爱心管理"></i><i class="phone"></i><a href = "#" class="u" user="60542007,210650242,正月❤️阳光海岸🌹,7122,7">正月❤️阳光海岸🌹 </a><span class="c9">：</span><span class="con"><img src = "41.gif" align="absmiddle"><img src = "41.gif" align="absmiddle"></span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:46 </span><i class="uIco badge_7569" title="白银守护"></i><i class="uIco badge_7829" title="抢星达人高级徽章"></i><i class="phone"></i><a href = "#" class="u" user="69058854,217364826,^_^敏$锐^_^,7569|7829,7">^_^敏$锐^_^ </a><span class="c9">：</span><span class="con">人呢<img src="s15.gif" align="absmiddle"></span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:46 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="69058854,217364826,^_^敏$锐^_^,,7">^_^敏$锐^_^</a><span class="urid">[<em>217364826</em>]</span> <span class="c9">说：</span><span class="con"><img src = "s15.gif" align="absmiddle"></span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:47 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="60465438,214428143,落叶❤逍遥,,10">落叶❤逍遥</a><span class="urid">[<em>214428143</em>]</span> <span class="c9">说：</span><span class="con">逍遥出来</span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:48 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="60613266,920615,小妖♡出山,,9">小妖♡出山</a><span class="urid">[<em>920615</em>]</span> <span class="c9">说：</span><span class="con"><img src = "s11.gif" align="absmiddle">跑骚</span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:50 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="64782559,96818,pan-北漂,,10">pan-北漂</a><span class="urid">[<em>96818</em>]</span> <span class="c9">说：</span><span class="con"><img src = "s15.gif" align="absmiddle">头条</span></div>
//</li>
//<li class="style-chat ">
//    <div class="txt-item"><span class="t">20:51 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "#" class="u" user="38298613,48685815,万星で大白,7569,7">万星で大白</a><span class="c9">对</span> <a href = "#" class="u" user="67495706,214862816,追风❤听雨,,7">追风❤听雨</a><span class="urid">[<em>214862816</em>]</span> <span class="c9">说：</span><span class="con"><img src = "s15.gif" align="absmiddle">头条</span></div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:53 </span><i class="uIco badge_7569" title="白银守护"></i><i class="uIco badge_7829" title="抢星达人高级徽章"></i><i class="phone"></i><a href = "index.html" class="u" user="69058854,217364826,^_^敏$锐^_^,7569|7829,7" indepth="true">^_^敏$锐^_^ </a><span class="c9">对</span> <a href = "index.html" class="u" user="60613266,920615,小妖♡出山,,9" indepth="true">小妖♡出山</a><span class="urid">[<em>920615</em>]</span> <span class="c9">说：</span><span class="con">你才5百多啊</span></div>
//</li>
//<li class="notice">
//    <div class="txt-item">
//        <span class="newsflash">
//            <img class="horn" title="" src="pixel.gif">
//            六间房快报！<a href = "http://v.6.cn/832639" target="_top">正安﹏听歌（<em>8068</em>） 在 蜜恭喜正安哥荣升藩王 房间发送了“超级烟花”，5分钟后引爆，见者有份，速去领豆！</a></span>
//    </div>
//</li>
//<li class="">
//    <div class="txt-item">欢迎<i class="rich11"></i><a href = "index.html" class="u" user="42536423,8091993,❥Sweet蛋蛋,,7" indepth="true">“❥Sweet蛋蛋”</a> 驾到</div>
//</li>
//<li class="">
//    <div class="txt-item">欢迎<i class="rich11"></i><a href = "index.html" class="u" user="42536423,8091993,❥Sweet蛋蛋,,7" indepth="true">“❥Sweet蛋蛋”</a> 驾到</div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:55 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">：</span><span class="con">反正你第八</span></div>
//</li>
//<li class="">
//    <div class="txt-item">欢迎<a href="index.html" class="u" user="42916273,55941260,稀有的猪,,2" indepth="true">“稀有的猪”</a>进入房间</div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:56 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">：</span><span class="con"><img src = "s21.gif" align="absmiddle"></span></div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:56 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">：</span><span class="con">上头条的时候，咋就没人了呢</span></div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:57 </span><i class="uIco badge_7569" title="白银守护"></i><i class="uIco badge_7829" title="抢星达人高级徽章"></i><i class="phone"></i><a href = "index.html" class="u" user="69058854,217364826,^_^敏$锐^_^,7569|7829,7" indepth="true">^_^敏$锐^_^ </a><span class="c9">：</span><span class="con">五百元能上多少头条</span></div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:57 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">：</span><span class="con">就冷风和明锐了</span></div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:57 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">对</span> <a href = "index.html" class="u" user="69058854,217364826,^_^敏$锐^_^,,7" indepth="true">^_^敏$锐^_^</a> <span class="c9">说：</span><span class="con">5000</span></div>
//</li>
//<li class="">
//    <div class="txt-item">
//        欢迎<i class="rich16"></i><a href = "index.html" class="u" user="25252378,629584,Baby❤囡猪宝,,2" indepth="true">“Baby❤囡猪宝”</a> 大驾光临<div class="tSeatCar"><em class="carIco seatBig_7582"></em><span class="carInfo"><em class="seat_7582"></em>奔驰E<em class="carUid">629584</em></span></div>
//    </div>
//</li>
//<li class="">
//    <div class="txt-item"><span class="t">20:57 </span><i class="uIco badge_7569" title="白银守护"></i><a href = "index.html" class="u" user="38298613,48685815,万星で大白,7569,7" indepth="true">万星で大白</a><span class="c9">对</span> <a href = "index.html" class="u" user="69058854,217364826,^_^敏$锐^_^,,7" indepth="true">^_^敏$锐^_^</a> <span class="c9">说：</span><span class="con">有返点应该可以上5200</span></div>
//</li>