﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_novel : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["mvid"] != null)
        {
            MultiView1.ActiveViewIndex = 1;
        }
    }

    protected void ddlKInd_DataBound(object sender, EventArgs e)
    {
        ddlKInd.Items.Insert(0, "");

        //{{When come this page from media home page
        if (!Page.IsPostBack && Page.Request["clss"] != null)
        {
            ddlKInd.SelectedValue = Page.Request["clss"].ToString();
        }
        //}}When come this page from media home page
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
    }

    int mNo;
    public string GetNo()
    {
        string sNo = mNo.ToString();
        mNo--;
        return sNo;
    }

    string GetSubject(string id)
    {
        string strtitle = "";
        msql.GetValue("select nvname from novel where id=" + id, out strtitle);
        return strtitle;
    }

    string GetVUrl(string id)
    {
        string strvurl = "";
        msql.GetValue("select url from novel where id=" + id, out strvurl);
        return strvurl;
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        String sql = SetSelectionCommand();

        int nAllCount = 0;
        msql.GetValue(sql, out nAllCount);
        nAllCount -= GridView1.PageSize * GridView1.PageIndex;
        mNo = nAllCount;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            PropertyInfo isreadonly =
              typeof(System.Collections.Specialized.NameValueCollection).GetProperty(
              "IsReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);
            // make collection editable
                isreadonly.SetValue(this.Request.QueryString, false, null);
            // remove
            this.Request.QueryString.Remove("mvid");
        }
        MultiView1.ActiveViewIndex = 0;
    }

    public String GetBookUrl()
    {
        if (Request["mvid"] == null) return "";

        String strUrl = global.mDownloadUrl + "/?bookinfo=" + Request["mvid"].ToString();
        return strUrl;
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        SetSelectionCommand();
    }

    String SetSelectionCommand()
    {
        String sql = "SELECT id, nvname, admin_id, url, clss_id, hao, bad, rcnt, regdate, isdel FROM novel WHERE (isdel = 0)";
        String sqlCnt = "SELECT count(id) FROM novel WHERE (isdel = 0)";
        if (ddlKInd.Text.Length > 0)
        {
            sql += " and clss_id = " + ddlKInd.SelectedValue;
            sqlCnt += " and clss_id = " + ddlKInd.SelectedValue;
        }
        if (tbSearch.Text.Length > 0)
        {
            sql += " and nvname like '%" + tbSearch.Text + "%'";
            sqlCnt += " and nvname like '%" + tbSearch.Text + "%'";
        }

        if (ddlSort.Text.Length <= 0) sql += " ORDER BY regdate DESC";
        else if (ddlSort.SelectedValue.CompareTo("1") == 0) sql += " ORDER BY rcnt DESC";
        else if (ddlSort.SelectedValue.CompareTo("2") == 0) sql += " ORDER BY hao DESC";

        utility.log(sql);
        SqlDataSource2.SelectCommand = sql;

        return sqlCnt;
    }
}