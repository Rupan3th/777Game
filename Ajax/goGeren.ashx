﻿<%@ WebHandler Language="C#" Class="goGeren" %>
using System;
using System.Web;
using System.Web.SessionState;
using System.Configuration;
public class goGeren : IHttpHandler  , IReadOnlySessionState{
    
    public void ProcessRequest (HttpContext context) {
        if(context.Session == null || context.Session["user_id"] == null || context.Session["name"] == null)
        {
            context.Response.Write("");
            return;
        }
        
        String str = ConfigurationManager.AppSettings["GerenCenterUrl"].ToString() + "?username=";
        str += context.Session["name"];
        str += "&ix=";
        str += SecurityCode( context.Session["name"].ToString() );
        context.Response.Write(str);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private string SecurityCode(string strInit)
    {
        String strRet = "";

        Random r = new Random();
        var x = r.Next(0, 99999);
        string sCode = x.ToString("00000");

        strInit += sCode;
        strInit = utility.CreateMD5(strInit);
        strRet = strInit + sCode;

        return strRet;
    }

}