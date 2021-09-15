using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_mobile_novel_view : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public String GetBookUrl()
    {
        if (Request["id"] == null) return "";

        String strUrl = global.mDownloadUrl + "/?bookinfo=" + Request["id"].ToString();
        return strUrl;
    }
}