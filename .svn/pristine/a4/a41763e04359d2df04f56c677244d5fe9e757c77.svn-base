using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for global
/// </summary>
public class global
{
    static public string mWowzaVodUrl = ConfigurationManager.AppSettings["WowzaVodUrl"].ToString();//coresponding at "Z:\Workstation\777_project\MSvr\upload\files\movie"
    static public string mMultiUploadUrl = ConfigurationManager.AppSettings["MultiUploadUrl"].ToString();
    static public string mDownloadUrl = ConfigurationManager.AppSettings["DownloadUrl"].ToString();
    static public String sChatServer = ConfigurationManager.AppSettings["ChatServer"].ToString();//URI to chat server.
    static public String sJspServer = ConfigurationManager.AppSettings["JspServer"].ToString();

    static public Hashtable wowChatObjs = new Hashtable();
    static public Hashtable wowHotChatUsers = new Hashtable();
    public static HttpClient mclient = new HttpClient();
}