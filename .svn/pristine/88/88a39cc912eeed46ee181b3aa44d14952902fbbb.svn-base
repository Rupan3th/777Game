<%@ WebHandler Language="C#" Class="rcnt_update" %>

using System;
using System.Web;

public class rcnt_update : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        mysql msql = new mysql();
        string strId = "";
        if (context.Request["type"] != null && context.Request["id"] != null)
        {
                strId = utility.ClearTaom(context.Request["id"].ToString());
            switch(context.Request["type"].ToString())
            {
                case "image":
                    msql.Execute("update photo set rcnt= rcnt+1 where id="+strId);
                    break;
                case "movie":
                    msql.Execute("update movie set rcnt= rcnt+1 where id="+strId);
                    break;
                case "novel":
                    msql.Execute("update novel set rcnt= rcnt+1 where id="+strId);
                    break;
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}