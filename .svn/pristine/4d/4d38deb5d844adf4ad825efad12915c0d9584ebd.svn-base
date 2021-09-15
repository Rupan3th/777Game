<%@ WebHandler Language="C#" Class="advertising" %>

using System;
using System.Web;

public class advertising : IHttpHandler {
    mysql msql = new mysql();
    public void ProcessRequest(HttpContext context) {
        if (context.Request == null || context.Request["mode"] == null)
        {
            context.Response.Write("");
            return;
        }

        String strAdv0 = "", strAdv1 = "", strAdv2 = "";
        switch(context.Request["mode"].ToString())
        {
            case "0":
                msql.GetValue("select content from advertisement where isdel = 0 and visible = 1 and layout=0 order by regdate desc", out strAdv0);
                context.Response.Write(strAdv0);
                break;
            case "1":
                msql.GetValue("select content from advertisement where isdel = 0 and visible = 1 and layout=1 order by regdate desc", out strAdv1);
                context.Response.Write(strAdv1);
                break;
            case "2":
                msql.GetValue("select content from advertisement where isdel = 0 and visible = 1 and layout=2 order by regdate desc", out strAdv2);
                context.Response.Write(strAdv2);
                break;
        }
        context.Response.Write("");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}