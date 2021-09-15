<%@ WebHandler Language="C#" Class="media_notice" %>

using System;
using System.Web;

public class media_notice : IHttpHandler {
    mysql msql = new mysql();
    public void ProcessRequest (HttpContext context) {
            String strNote = "";
            msql.GetValue( "select content from announcement order by id limit 1", out strNote);
        context.Response.Write(strNote);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}