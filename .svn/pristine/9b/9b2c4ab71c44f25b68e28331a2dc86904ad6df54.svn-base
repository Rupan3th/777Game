<%@ WebHandler Language="C#" Class="GetSMail" %>

using System;
using System.Web;
using System.Web.SessionState;

public class GetSMail : IHttpHandler , IReadOnlySessionState
{
    mysql msql = new mysql();
    public void ProcessRequest (HttpContext context) {
        string strCnt = "0";
        if(context.Session["user_id"] == null)
        {
            context.Response.Write("");
            return;
        }

        msql.GetValue("select count(id) from msglun where is_read=0 and receiver="+context.Session["user_id"].ToString(), out strCnt);
        if(int.Parse(strCnt) > 0)  context.Response.Write("1");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}