using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        utility.DestorySessionForTrial(Session, this);

        if (Session["coin"] != null) lblCoin.Text = Session["coin"].ToString();
        if(Session["rating"] != null)
        {
            if (Session["rating"].ToString().CompareTo("999") == 0) lblVip.Text = "普通";
            else if (Session["rating"].ToString().CompareTo("555") == 0) lblVip.Text = "VIP";
        }
    }

    protected void ddlMovieClss_DataBound(object sender, EventArgs e)
    {
        ddlMovieClss.Items.Insert(0, "视频");
    }

    protected void ddlPhotoClss_DataBound(object sender, EventArgs e)
    {
        ddlPhotoClss.Items.Insert(0, "图片");
    }

    protected void ddlNovelClss_DataBound(object sender, EventArgs e)
    {
        ddlNovelClss.Items.Insert(0, "小说");
    }

    protected void ddlMovieClss_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strClss = ddlMovieClss.SelectedValue;
        Page.Response.Redirect("~/media/Default.aspx?type=0&clss="+strClss);
    }

    protected void ddlPhotoClss_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strClss = ddlPhotoClss.SelectedValue;
        Page.Response.Redirect("~/media/Default.aspx?type=1&clss=" + strClss);
    }

    protected void ddlNovelClss_SelectedIndexChanged(object sender, EventArgs e)
    {
        String strClss = ddlNovelClss.SelectedValue;
        Page.Response.Redirect("~/media/Default.aspx?type=2&clss=" + strClss);
    }
}