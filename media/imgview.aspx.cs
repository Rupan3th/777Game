﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_imgview : System.Web.UI.Page
{
    //{{This Code For paging process about datalist control
    readonly PagedDataSource _pgsource = new PagedDataSource();
    public int _firstIndex, _lastIndex;
    public int _pageSize = 1;
    private DataTable mDt = new DataTable();
    mysql msql = new mysql();
    //REFME Modify sqlForPage with your purpose.
    static string sqlForPage = "";
    //}}This Code For paging process about datalist control
    static bool bByNext = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request["id"] != null)
        {
            sqlForPage = "SELECT id, photo_id, p_url, regdate, isdel FROM photolst WHERE((isdel = 0) AND(photo_id = "+Request["id"].ToString()+"))";
            lblSubject.Text = GetSubject(Request["id"].ToString());
            hfpathname.Value = GetPath(Request["id"].ToString());
            hfId.Value = Request["id"].ToString();

            if (Request["mode"] == null)
            {
                MultiView1.ActiveViewIndex = 0;
                pnlBottom.Visible = false;
                bByNext = false;
            }
            else
            {
                if(!bByNext) CurrentPage = int.Parse( Request["mode"].ToString() );
                MultiView1.ActiveViewIndex = 1;
                pnlBottom.Visible = true;
                if (!Page.IsPostBack) BindData();
            }
        }
    }

    string GetSubject(string id)
    {
        string strtitle = "";
        msql.GetValue("select ptname from photo where id=" + id, out strtitle);
        return strtitle;
    }

    string GetPath(string id)
    {
        string strpath = "";
        msql.GetValue("select pathname from photo where id=" + id, out strpath);
        return strpath;
    }

    public string GetImgSrcEx( string strType, string fname)
    {
        String strUrl = global.mMultiUploadUrl + "/?type=" + strType + "&name=" + Uri.EscapeUriString(hfpathname.Value) + "&url=" + Uri.EscapeUriString(fname);
        return strUrl;
    }

    float fWidth = 140f;
    public Unit GetHaoWidth(string strHao, String strBad)
    {
        int nHao = int.Parse(strHao);
        int nBad = int.Parse(strBad);
        if (nHao == 0 && nBad == 0) return 0;
        float fIntval = fWidth / (float)(nHao + nBad);

        return (int)(fIntval * nHao);
    }

    public Unit GetBadWidth(string strHao, String strBad)
    {
        int nHao = int.Parse(strHao);
        int nBad = int.Parse(strBad);
        if (nHao == 0 && nBad == 0) return 0;
        float fIntval = fWidth / (float)(nHao + nBad);

        return (int)(fIntval * nBad);
    }

    protected void imgHao_Click(object sender, ImageClickEventArgs e)
    {
        if (Request["id"] == null) return;
        msql.Execute("Update photo set hao=hao+1 where id="+ Request["id"].ToString());
        FormView1.DataBind();
    }

    protected void imgBad_Click(object sender, ImageClickEventArgs e)
    {
        if (Request["id"] == null) return;
        msql.Execute("Update photo set bad=bad+1 where id=" + Request["id"].ToString());
        FormView1.DataBind();
    }

    //{{This Code For paging process about datalist control
    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            return ((int)ViewState["CurrentPage"]);
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }

    // Bind PagedDataSource into Repeater
    public void BindData()
    {
        var dt = msql.FillDataTable(mDt, sqlForPage);
        _pgsource.DataSource = dt.DefaultView;
        _pgsource.AllowPaging = true;
        // Number of items to be displayed in the Repeater
        _pgsource.PageSize = _pageSize;
        _pgsource.CurrentPageIndex = CurrentPage;
        // Keep the Total pages in View State
        ViewState["TotalPages"] = _pgsource.PageCount;

        // Bind data into DataList
        dlDetail.DataSource = _pgsource;//REFME Modify dlMovie to control you use.
        dlDetail.DataBind();
    }

    protected void lbNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;        
        BindData();
        bByNext = true;
    }

    int nIdx = 0;
    public string GetDetailUrl()
    {
        string strUrl = "?id=" + Request["id"].ToString() + "&mode=" + nIdx;
        nIdx++;
        return strUrl;
    }

    //}}This Code For paging process about datalist control

    protected void dlDetail_DataBinding(object sender, EventArgs e)
    {
        nIdx = 0;
    }
}