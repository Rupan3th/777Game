﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FluorineFx.Net;
using FluorineFx;
using FluorineFx.Messaging;
using System.Web.UI;
using System.Collections;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for wowza_chat
/// </summary>
public class wowza_chat
{
    String strGUID="";
    String strConnectInfo = global.sChatServer;
    NetConnection nc = null;
    RemoteSharedObject textchat_so = null;
    int lastChatId = 0;
    public string strUser = "anyone";
    public string strMsg = "Hi";
    private readonly object _syncRoot = new Object();
    private string strReceved = "";

    public object LogUtility { get; private set; }

    public wowza_chat(String sGuid)
    {
        //
        // TODO: Add constructor logic here
        //
        strGUID = sGuid;
    }

    public bool SendMsg( String strText )
    {
        ChatMessage chM = new ChatMessage();
        chM.message = strText;
        chM.time = DateTime.Now;
        chM.user = strUser;

        try
        {
            nc.Call("addMessage", null, new object[] { (object)"textchat", (object)chM });
        }
        catch (Exception ex) {
            return false;
        }
        return true;
    }

    public bool Connect()
    {
        bool bRet = false;
        utility.log("wow_chat.Connect enter");
        try
        {
            nc = new NetConnection();
            nc.NetStatus += new NetStatusHandler(ncOnStatus);
            nc.Connect(strConnectInfo);

            bRet = true;
        }
        catch(Exception ex)
        {
            utility.log(ex.Message);
        }

        utility.log("wow_chat.Connect end");
        return bRet;
    }

    private void ncOnStatus(object sender, NetStatusEventArgs e)
    {
        String str = e.Info["code"].ToString();
        if (str.CompareTo("NetConnection.Connect.Success") == 0)
        {
            initSharedObject("textchat");
            str = "OK";
        }
        else
            str = "Faild";
    }

    void initSharedObject(string str)
    {
        // initialize the shared object server side
        nc.Call("initSharedObject", new FluorineFx.Net.Responder<string>(connectSharedObjectRes), new object[] { (object)str });
    }

    void connectSharedObjectRes(string str)
    {
        connectSharedObject(str);
    }

    void connectSharedObject(string str)
    {
        utility.log("wow_chat.connectSharedObject enter");
        try
        {
            textchat_so = FluorineFx.Net.RemoteSharedObject.GetRemote(str, nc.Uri.ToString(), false);
            textchat_so.Sync += new SyncHandler(syncEventHandler);
            textchat_so.Connect(nc);            
        }
        catch(Exception ex)
        {
            utility.log(ex.Message);
        }
        utility.log("wow_chat.connectSharedObject leave");
    }

    void syncEventHandler(object sender, FluorineFx.Net.SyncEventArgs e)
    {
        ASObject[] asObj = e.ChangeList;

        utility.log("syncEventHandler run.");
        utility.log( strGUID );

        // if first time only show last 4 messages in the list
        if (lastChatId == 0)
        {
            lastChatId = int.Parse(textchat_so.GetAttribute("lastChatId").ToString()) - 4;
            if (lastChatId < 0)
                lastChatId = 0;
        }

        // show new messasges
        var currChatId = int.Parse(textchat_so.GetAttribute("lastChatId").ToString());

        // if there are new messages to display
        if (currChatId > 0)
        {
            for (int i = (lastChatId + 1); i <= currChatId; i++)
            {                
                if (textchat_so.GetAttribute("chatData" + i) != null)
                {
                    ASObject chatMsg = (ASObject)textchat_so.GetAttribute("chatData" + i);
                    string msg = formatMessage(chatMsg);
                    RecivedMsg ( msg );//received message, put in buffer.
                }
            }            
            lastChatId = currChatId;
        }
    }

    public void RecivedMsg(string msg)
    {
        utility.log("RecivedMsg ++>" + msg);
        lock (_syncRoot)
        {
            strReceved += msg;
        }
    }

    static public void dropChat(mysql msql, String uname, int nval)
    {
        int nCnt = 0;
        msql.GetValue("select count(id) from unchating where username='" + uname + "'", out nCnt);
        if (nCnt > 0)
            msql.Execute("update unchating set stime='"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', disable=1 where username='"+uname+"'");
        else
            msql.Execute("insert into unchating(username, stime, disable) values('"+uname+"', '"+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"', 1)");

        global.wowHotChatUsers[uname] = 1;
    }

    static public void stopChat(mysql msql, String uname, int nval)
    {
        int nCnt = 0;
        int ntype = 0;
        switch(nval)
        {
            case 15: ntype = 2; break;
            case 30: ntype = 3; break;
            case 60: ntype = 4; break;
        }

        global.wowHotChatUsers[uname] = ntype;
        msql.GetValue("select count(id) from unchating where username='" + uname + "'", out nCnt);
        if (nCnt > 0)
            msql.Execute("update unchating set stime='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', disable="+ ntype + " where username='" + uname + "'");
        else
            msql.Execute("insert into unchating(username, stime, disable) values('" + uname + "', '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "', "+ ntype + ")");
    }

    public enum CHAT_STATE { DROP, STOP, NORMAL };
    static public CHAT_STATE userChatState(MySqlCommand cmd, String uname, out int _ntype)
    {
        int nType=0;
        String strdt = "";
        DateTime enddt;
        CHAT_STATE retState = CHAT_STATE.NORMAL;
        _ntype = 0;

        String sql = "select id, disable, stime from unchating where username = '" + uname + "'";
        cmd.CommandText = sql;
        MySqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        if(reader.Read())
        {
            if (reader["disable"] != null) int.TryParse(reader["disable"].ToString(), out nType);
            if (reader["stime"] != null) strdt = reader["stime"].ToString();

            _ntype = nType;
            switch (nType)
            {
                case 1:
                    enddt = DateTime.Parse(strdt).AddMinutes(60 * 2);
                    if (DateTime.Now.CompareTo(enddt) < 0) retState = CHAT_STATE.DROP;
                    break;
                case 2:
                    enddt = DateTime.Parse(strdt).AddMinutes(15);
                    if (DateTime.Now.CompareTo(enddt) < 0) retState = CHAT_STATE.STOP;
                    break;
                case 3:
                    enddt = DateTime.Parse(strdt).AddMinutes(30);
                    if (DateTime.Now.CompareTo(enddt) < 0) retState = CHAT_STATE.STOP;
                    break;
                case 4:
                    enddt = DateTime.Parse(strdt).AddMinutes(60);
                    if (DateTime.Now.CompareTo(enddt) < 0) retState = CHAT_STATE.STOP;
                    break;
            }
        }
        reader.Close();        
        return retState;
    }

    static public CHAT_STATE userChatState(mysql msql, String uname, out int _ntype)
    {
        int nCnt = 0, nType=0;
        String strdt = "";
        DateTime enddt;
        msql.GetValue("select count(id) from unchating where username='" + uname + "'", out nCnt);
        if( nCnt > 0 )
        {
            msql.GetValue("select disable from unchating where username='" + uname + "'", out nType);
            msql.GetValue("select stime from unchating where username='" + uname + "'", out strdt);

            _ntype = nType;
            switch (nType)
            {
                case 1:
                    enddt = DateTime.Parse(strdt).AddMinutes(60*2);
                    if (DateTime.Now.CompareTo(enddt) < 0) return CHAT_STATE.DROP;
                    break;
                case 2:
                    enddt = DateTime.Parse(strdt).AddMinutes(15);
                    if (DateTime.Now.CompareTo(enddt) < 0) return CHAT_STATE.STOP;
                    break;
                case 3:
                    enddt = DateTime.Parse(strdt).AddMinutes(30);
                    if (DateTime.Now.CompareTo(enddt) < 0) return CHAT_STATE.STOP;
                    break;
                case 4:
                    enddt = DateTime.Parse(strdt).AddMinutes(60);
                    if (DateTime.Now.CompareTo(enddt) < 0) return CHAT_STATE.STOP;
                    break;
            }
        }

        _ntype = 0;
        return CHAT_STATE.NORMAL;
    }

    static public int userChatState(String uname)
    {
        if (global.wowHotChatUsers[uname] != null)
            return (int)global.wowHotChatUsers[uname];

        return (int)CHAT_STATE.NORMAL;
    }

    public string GetMsg()
    {
        String str = "";
        lock (_syncRoot)
        {
            str = strReceved;
            strReceved = "";
        }
        return str;
    }

    string formatMessage(ASObject msgObj)
    {
        string msg = "";

        int hour24 = DateTime.Now.Hour;        
        int hourNum = hour24;
        if (hourNum == 0)
            hourNum = 12;

        String hourStr = hourNum + "";
        String minuteStr = DateTime.Now.Minute + "";
        if (minuteStr.Length < 2)
            minuteStr = "0" + minuteStr;
        String secondStr = DateTime.Now.Second + "";
        if (secondStr.Length < 2)
            secondStr = "0" + secondStr;

        String preString = PreMessage(msgObj["message"].ToString());
        msg = "<li><u>" + hourStr + ":" + minuteStr + ":" + secondStr + "</u> - <b><a id='chat_user'>" + msgObj["user"].ToString() + "</a></b>: " + preString  + "</li>";
        return msg;
    }

    string PreMessage(string strRaw)
    {
        String strKey="";
        String strReplace = "";
        //"\"< img align = 'absmiddle' src = '/files/image/6cn_face/"++".gif'>\"";
        foreach(string skey in imoticon.Keys )
        {
            strReplace = "<img align = 'absmiddle' src = '/files/image/6cn_face/"+ imoticon[skey].ToString() + ".gif'>";
            strRaw = strRaw.Replace(skey, strReplace);            
        }

        return strRaw;
    }

    //reqular expression: (\"[^:, "]+\"): (\"[^:, "]+\") => $2: $1
    //(vip\d+): (\"[^:, "]+\")
    //(s\d+): (\"[^:", "]+\")
    Hashtable imoticon = new Hashtable()
        {
            { "/狂笑", "0"}
            , {"/大笑", "1"}
            , {"/惊讶", "2"}
            , {"/害羞", "3"}
            , {"/窃笑", "4"}
            , {"/发怒", "5"}
            , {"/大哭", "6"}
            , {"/色色", "7"}
            , {"/坏笑", "8"}
            , {"/火大", "9"}
            , {"/汗", "10"}
            , {"/奸笑", "11"}
            , {"/欢迎", "12"}
            , {"/再见", "13"}
            , {"/白眼", "14"}
            , {"/挖鼻", "15"}
            , {"/顶", "16"}
            , {"/胜利", "17"}
            , {"/欧耶", "18"}
            , {"/抱拳", "19"}
            , {"/囧", "20"}
            , {"/淡定", "21"}
            , {"/美女", "22"}
            , {"/靓仔", "23"}
            , {"/神马", "24"}
            , {"/开心", "25"}
            , {"/给力", "26"}
            , {"/飞吻", "27"}
            , {"/眨眼", "28"}
            , {"/V5", "29"}
            , {"/来吧", "30"}
            , {"/围观", "31"}
            , {"/飘过", "32"}
            , {"/地雷", "33"}
            , {"/菜刀", "34"}
            , {"/帅", "35"}
            , {"/审视", "36"}
            , {"/无语", "37"}
            , {"/无奈", "38"}
            , {"/亲亲", "39"}
            , {"/勾引", "40"}
            , {"/后后", "41"}
            , {"/吐血", "42"}
            , {"/媚眼", "44"}
            , {"/愁人", "45"}
            , {"/肿么了", "46"}
            , {"/调戏", "47"}
            , {"/抽", "48"}
            , {"/哼哼", "49"}
            , {"/bs", "50"}
            , {"/鸡冻", "52"}
            , {"/眼馋", "53"}
            , {"/热汗", "54"}
            , {"/输", "55"}
            , {"/石化", "56"}
            , {"/蔑视", "57"}
            , {"/哭", "58"}
            , {"/骂", "59"}
            , {"/狂哭", "60"}
            , {"/狂汗", "61"}
            , {"/笑哭", "62"}
            , {"/狗狗", "63"}
            , { "/喵喵", "64"}

            , { "/真好听", "vip1"}
            , { "/嗨起来", "vip2"}
            , { "/霸气", "vip3"}
            , { "/红包刷起来", "vip4"}
            , { "/太漂亮了", "vip5"}
            , { "/马上投票", "vip6"}
            , { "/玫瑰在哪里", "vip7"}
            , { "/土豪来啦", "vip8"}
            , { "/爱死你了", "vip9"}
            , { "/啵一个", "vip10"}
            , { "/新货求关注", "vip11"}
            , { "/要抱抱", "vip12"}
            , { "/冒个泡", "vip13"}
            , { "/有黑幕", "vip14"}
            , { "/爱你1314", "vip15"}
            , { "/好甜呀", "vip16"}
            , { "/坑爹", "vip17"}
            , { "/女汉子", "vip18"}
            , { "/鼓掌", "vip19"}
            , { "/加油", "vip20"}
            , { "/天然呆", "vip21"}
            , { "/赞", "vip22"}

            , { "/被扁", "s11"}
            , {"/变脸", "s12"}
            , {"/吃饭", "s13"}
            , {"/吹裙子", "s14"}
            , {"/打劫", "s15"}
            , {"/憨笑", "s16"}
            , {"/泪流满面", "s17"}
            , {"/傻笑", "s18"}
            , {"/惊吓", "s19"}
            , {"/惊恐", "s20"}
            , {"/好囧", "s21"}
            , {"/蹲墙角", "s22"}
            , {"/可爱", "s23"}
            , {"/委屈落泪", "s24"}
            , {"/抠鼻", "s25"}
            , {"/亲一个", "s26"}
            , {"/色迷迷", "s27"}
            , {"/闪闪发光", "s28"}
            , {"/虐", "s29"}
            , {"/幸福", "s31"}
            , {"/装帅", "s32"}
            , {"/拍砖", "s33"}
            , {"/左吐", "s30"}
            , {"/右吐", "s34"}
            , {"/左闪", "s35"}
            , {"/右躲", "s36"}
            , {"/白富美", "s1"}
            , {"/心动的感觉", "s2"}
            , {"/兄弟们上", "s3"}
            , {"/求交往", "s4"}
            , {"/嫁给我吧", "s5"}
            , {"/在一起", "s6"}
            , {"/看好老婆", "s7"}
            , {"/好基友", "s8"}
            , {"/屌爆了", "s9"}
            , {"/走你", "s10"}
        };
}