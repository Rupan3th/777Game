using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_recent_image : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) dlMovie.DataBind();
    }

    protected void dlMovie_DataBinding(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = ConfigSql();
        SqlDataSource1.DataBind();
    }
    public string ConfigSql()
    {
        string strSql = "SELECT id, ptname, pathname, admin_id, p_url, clss_id, hao, bad, rcnt, regdate, isdel FROM photo";
        string strWhere = " WHERE (isdel = ?)";
        string strOrder = " ORDER BY regdate DESC";
        string strLimit = " limit 10";
        int nClssId = -1;

        if (Request["ddlPhotoClss"] != null && int.TryParse(Request["ddlPhotoClss"].ToString(), out nClssId))
        {
            strWhere += " and clss_id=" + nClssId;
        }

        return strSql + strWhere + strOrder + strLimit;
    }
}