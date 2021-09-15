using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_mobile_Default : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        utility.DestorySessionForTrial(Session, this);

        if ( Request["hf_media"] != null )
        {
            string strmedia = Request["hf_media"].ToString();
            switch( strmedia )
            {
                case "0":
                    MultiView1.ActiveViewIndex = 0;
                    gvMovie.DataBind();
                    break;//Movie
                case "1":
                    MultiView1.ActiveViewIndex = 1;
                    gvPhoto.DataBind();
                    break;//Photo
                case "2":
                    MultiView1.ActiveViewIndex = 2;
                    gvNovel.DataBind();
                    break;//Novel
            }                
        }
        else
        {
            MultiView1.ActiveViewIndex = 3;
        }
    }

    protected void gvMovie_DataBinding(object sender, EventArgs e)
    {
        ConfigMovieSql();
    }

    protected void gvMovie_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ConfigMovieSql();
    }

    public void ConfigMovieSql()
    {
        string sqlsel = "SELECT id, mvname, pathname, i_url, v_url, coin, clss_id, hao, bad, rcnt, regdate FROM movie";
        string sqlwhere = " WHERE (isdel = 0)";
        string sqlorder = " ORDER BY regdate DESC";

        string strClss = "";
        if( Request["ddlclss"] != null )
        {
            strClss = Request["ddlclss"].ToString();
            if( strClss.Length > 0 && int.Parse( strClss ) > 0 )
            {
                sqlwhere += " and clss_id="+ strClss;
            }
        }

        SqlDataSource3.SelectCommand = sqlsel + sqlwhere + sqlorder;
        utility.log("Movie " + SqlDataSource3.SelectCommand );
    }


    protected void gvPhoto_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ConfigPhotoSql();
    }

    protected void gvPhoto_DataBinding(object sender, EventArgs e)
    {
        ConfigPhotoSql();
    }

    public void ConfigPhotoSql()
    {
        string sqlsel = "SELECT id, ptname, pathname, p_url, clss_id, hao, bad, rcnt FROM photo";
        string sqlwhere = " WHERE (isdel = 0)";
        string sqlorder = " ORDER BY regdate DESC";

        string strClss = "";
        if (Request["hfClssImage"] != null)
        {
            strClss = Request["hfClssImage"].ToString();
            if (strClss.Length > 0 && int.Parse(strClss) > 0)
            {
                sqlwhere += " and clss_id=" + strClss;
            }
        }

        SqlDataSource4.SelectCommand = sqlsel + sqlwhere + sqlorder;

        utility.log("Photo " + SqlDataSource4.SelectCommand);
    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        switch(MultiView1.ActiveViewIndex)
        {
            case 0:
                gvMovie.DataBind();
                break;
            case 1:
                gvPhoto.DataBind();
                break;
            case 2:
                gvNovel.DataBind();
                break;
        }
    }

    protected void ddlClss_DataBound(object sender, EventArgs e)
    {
        //ddlClss.Items.Insert(0, "");
    }

    protected void ddlPClss_DataBound(object sender, EventArgs e)
    {
        //ddlPClss.Items.Insert(0, "");
    }

    protected void ddlNClss_DataBound(object sender, EventArgs e)
    {
        //ddlNClss.Items.Insert(0, "");
    }

    protected void gvNovel_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ConfigNovelSql();
    }

    protected void gvNovel_DataBinding(object sender, EventArgs e)
    {
        ConfigNovelSql();
    }

    public void ConfigNovelSql()
    {
        string sqlsel = "SELECT id, nvname, pathname, url, rcnt FROM novel";
        string sqlwhere = " WHERE (isdel = 0)";
        string sqlorder = " ORDER BY regdate DESC";

        string strClss = "";
        if ( Request["ddlNClss"] != null )
        {
            strClss = Request["ddlNClss"].ToString();
            if (strClss.Length > 0 && int.Parse(strClss) > 0)
            {
                sqlwhere += " and clss_id=" + strClss;
            }
        }

        SqlDataSource8.SelectCommand = sqlsel + sqlwhere + sqlorder;

        utility.log("Novel " + SqlDataSource8.SelectCommand);
    }

    public void GetImageClss(String strToken, String strShow, String strValue)//ex: strToken = 26
    {
        String strClss = @"<a href='javascript: jQuery(""#" + strValue + "\").val(0);jQuery(\"#" + strShow + "\").val(\"\");jQuery(\"#form1\").submit();' style='background-color:#FFFFFF;color:#000000;border-bottom:solid 1px;text-align:center;'>全部</a>"; //全部

         String sql = "SELECT id, kname FROM kinds2 WHERE ((isdel = 0) AND (detail_id = "+ strToken + "))";
        msql.open();
        MySqlDataReader rdr = msql.GetReader(sql);
        while(rdr.Read())
        {
            strClss += @"<a href='javascript: jQuery(""#" + strValue + "\").val(" + rdr["id"].ToString() + ");jQuery(\"#" + strShow + "\").val(\"" + rdr["kname"].ToString() + "\");jQuery(\"#form1\").submit();' style='background-color:#FFFFFF;color:#000000;border-bottom:solid 1px;text-align:center;'>" + rdr["kname"].ToString() + "</a>";
        }
        rdr.Close();
        msql.close();
        Response.Write(strClss);
    }
}