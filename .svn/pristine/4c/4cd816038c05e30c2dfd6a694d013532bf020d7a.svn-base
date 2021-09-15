using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_recent_novel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            gvByRecent.DataBind();
            gvByRead.DataBind();
        }
    }

    String ConfigSqlByRecent()
    {
        String sql = "SELECT id, nvname, admin_id, url, clss_id, hao, bad, rcnt, regdate, isdel FROM novel";
        String sqlWhere = " WHERE (isdel = 0)";
        String sqlOrder = " ORDER BY regdate DESC";
        String sqlLimit = " limit 11";
        int nClssId = -1;

        if (Request["ddlNovelClss"] != null && int.TryParse(Request["ddlNovelClss"].ToString(), out nClssId))
        {
            sqlWhere += " and clss_id=" + nClssId;
        }

            return sql + sqlWhere + sqlOrder + sqlLimit;
    }

    String ConfigSqlByRead()
    {
        String sql = "SELECT id, nvname, admin_id, url, clss_id, hao, bad, rcnt, regdate, isdel FROM novel";
        String sqlWhere = " WHERE (isdel = 0)";
        String sqlOrder = " ORDER BY rcnt DESC";
        String sqlLimit = " limit 10";
        int nClssId = -1;

        if (Request["ddlNovelClss"] != null && int.TryParse(Request["ddlNovelClss"].ToString(), out nClssId))
        {
            sqlWhere += " and clss_id=" + nClssId;
        }

        return sql + sqlWhere + sqlOrder + sqlLimit;
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand = ConfigSqlByRecent();
    }

    protected void GridView3_DataBinding(object sender, EventArgs e)
    {
        nMarkCnt = 0;
        SqlDataSource3.SelectCommand = ConfigSqlByRead();
    }

    public String GetDateStr(String strReg)
    {
        DateTime dtReg = DateTime.Parse(strReg);
        return dtReg.ToString("[ yyyy-MM-dd ]");
    }

    int nMarkCnt = 0;
    public String GetMarkImg()
    {
        nMarkCnt++;
        string strUrl = String.Format("/files/image/mark{0:00}.png", nMarkCnt);
        return strUrl;
    }
}