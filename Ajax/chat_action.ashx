﻿<%@ WebHandler Language="C#" Class="chat_action" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Web.SessionState;

public class chat_action : IHttpHandler , IReadOnlySessionState
{
    static mysql msql = new mysql();

    public void ProcessRequest (HttpContext context) {
        String strCmd = "";
        String strMsg = "";
        if( context.Request["cmd"] != null )
        {
            strCmd = context.Request["cmd"].ToString();
            if (strCmd.CompareTo("init") == 0)
            {
                String strGUID = System.Guid.NewGuid().ToString("N");
                wowza_chat wowchat = new wowza_chat( strGUID );
                if (wowchat.Connect())
                {
                    if ( context.Request["u"] != null && context.Request["u"].ToString().Length > 0 )
                        wowchat.strUser = context.Request["u"].ToString();
                    global.wowChatObjs.Add(strGUID, wowchat);
                }
                else strGUID = "";//If faild, return empty string.
                context.Response.Write( strGUID );
            }
            else if (strCmd.CompareTo("send") == 0
                        && context.Request["chl"] != null
                        && context.Request["chl"].ToString().Length > 0 )
            {
                utility.log( "[send] chat users:["+global.wowHotChatUsers.Count
                    +"] cur name["+context.Session["name"].ToString()
                    +"] msg:"+context.Request["txt"] );

                if( context.Session["name"] != null
                        && (global.wowHotChatUsers[context.Session["name"].ToString()] != null
                        && (int)global.wowHotChatUsers[context.Session["name"].ToString()] > 0) )
                {
                    utility.log( "cur name["+context.Session["name"].ToString()
                     +"] state:" + (int)global.wowHotChatUsers[context.Session["name"].ToString()] );

                    int nType = 0;
                    wowza_chat.CHAT_STATE cstate = wowza_chat.userChatState(msql, context.Session["name"].ToString(), out nType);
                    if ( cstate != wowza_chat.CHAT_STATE.NORMAL)
                    {
                        context.Response.Write( "\\"+ nType );
                        return;
                    }
                    else
                    {
                        global.wowHotChatUsers.Remove(context.Session["name"].ToString());
                    }
                }

                wowza_chat wowchat = (wowza_chat)global.wowChatObjs[context.Request["chl"].ToString()];
                if ( wowchat != null
                         && context.Request["txt"] != null)
                {
                    strMsg = utility.ClearTaom(context.Request["txt"].ToString());
                    //{{Process gift(/GIFT/Name/Num/)
                    if(strMsg.Contains("GIFT"))
                    {
                        int nJubaoId = -1;//FIXME
                        int nGiftCount = 0;
                        string[] sgftInfo = strMsg.Split('/');//선물보내기때 present표 추가, user표에서 coin, temp_coin감소
                        if(int.TryParse(sgftInfo[3], out nGiftCount)
                                && nGiftCount > 0
                                && context.Session != null
                                && context.Session["user_id"] != null )
                        {
                            try
                            {
                                msql.Execute("insert into present(uid, zid, coin) values(" + context.Session["user_id"].ToString() + "," + nJubaoId + "," + nGiftCount + ")");
                                msql.Execute("update user set coin=coin-" + nGiftCount + ", temp_coin=temp_coin-" + nGiftCount + " where id=" + context.Session["user_id"].ToString());
                            }
                            catch(Exception ex) { };

                        }
                    }
                    //}}Process gift(/GIFT/Name/Num/)
                    if( !wowchat.SendMsg(strMsg) ) context.Response.Write( "\\-1" );

                    context.Response.Write( "" );
                }
            }
            else if (strCmd.CompareTo("recv") == 0
                        && context.Request["chl"] != null
                        && context.Request["chl"].ToString().Length > 0 )
            {
                if( context.Session["name"] != null
                        && (global.wowHotChatUsers[context.Session["name"].ToString()] != null
                        && (int)global.wowHotChatUsers[context.Session["name"].ToString()] > 0) )
                {
                    //utility.log( "[recv] chat users:["+global.wowHotChatUsers.Count
                    //+"] cur name["+context.Session["name"].ToString()
                    //+"] state ["+wowza_chat.userChatState( context.Session["name"].ToString())
                    //+"]");

                    //int nType = 0;
                    //wowza_chat.CHAT_STATE cstate= wowza_chat.userChatState(msql, context.Session["name"].ToString(), out nType );
                    //if (cstate == wowza_chat.CHAT_STATE.DROP)
                    //{
                    //    context.Response.Write( "\\" + nType );
                    //    return;
                    //}
                    //else
                    //{
                    //    if (cstate == wowza_chat.CHAT_STATE.NORMAL)
                    //        global.wowHotChatUsers.Remove(context.Session["name"].ToString());
                    //}
                }

                wowza_chat wowchat = (wowza_chat)global.wowChatObjs[context.Request["chl"].ToString()];
                if ( wowchat != null)
                {
                    strMsg = wowchat.GetMsg();
                    if( strMsg.Length > 0 )
                    {
                        //    utility.log( "[recv] chat users:["+global.wowHotChatUsers.Count
                        //+"] cur name["+context.Session["name"].ToString()
                        //+"] state ["+wowza_chat.userChatState( context.Session["name"].ToString())
                        //+"] msg:"+strMsg );

                        context.Response.Write( strMsg );
                    }
                }
            }
            else if (strCmd.CompareTo("close") == 0
                        && context.Request["chl"] != null
                        && context.Request["chl"].ToString().Length > 0 )
            {
                global.wowChatObjs.Remove(context.Request["chl"].ToString());
            }
            else if (strCmd.CompareTo("drop") == 0
                    && context.Session["rating"].ToString().CompareTo("4") == 0 )
            {
                wowza_chat.dropChat(msql, context.Request["u"].ToString(), 60*2);

                utility.log( "[drop] chat users:["+global.wowHotChatUsers.Count
                    +"] hot name["+context.Request["u"].ToString()
                    +"] state ["+(int)wowza_chat.userChatState( context.Request["u"].ToString())
                    +"]");
            }
            else if (strCmd.Contains("stop")
                    && context.Session["rating"].ToString().CompareTo("4") == 0 )
            {
                int nval = 0;
                int.TryParse(strCmd.Replace("stop", ""), out nval);
                wowza_chat.stopChat(msql, context.Request["u"].ToString(), nval);

                utility.log( "[stop] chat users:["+global.wowHotChatUsers.Count
                    +"] hot name["+context.Request["u"].ToString()
                    +"] state ["+(int)wowza_chat.userChatState( context.Request["u"].ToString() )
                    +"]");
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}