<%@ WebHandler Language="C#" Class="book" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.UI;
using System.Web.UI.WebControls;

public class book : IHttpHandler {
    mysql msql = new mysql();

    public async void ProcessRequest (HttpContext context) {
        if (context.Request["id"] == null) return;

        string sContent="";
        string strSubject = "";
        string id = context.Request["id"].ToString();
        msql.GetValue("select nvname from novel where id=" + id, out strSubject);
        string strVUrl = "";
        msql.GetValue("select url from novel where id=" + id, out strVUrl);
        String strDownload = global.mDownloadUrl + "/?bookinfo=" + Uri.EscapeDataString(strSubject + "/" + strVUrl);

        HttpResponseMessage response = await global.mclient.GetAsync(strDownload);
        if (response.IsSuccessStatusCode)
        {
            sContent = await response.Content.ReadAsStringAsync();
        }
        context.Response.Write(sContent);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
}