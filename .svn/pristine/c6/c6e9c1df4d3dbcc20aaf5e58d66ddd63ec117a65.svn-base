using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_image : System.Web.UI.Page
{
    //{{This Code For paging process about datalist control
    readonly PagedDataSource _pgsource = new PagedDataSource();
    public int _firstIndex, _lastIndex;
    public int _pageSize = 12;
    private DataTable mDt = new DataTable();
    mysql msql = new mysql();
    //REFME Modify sqlForPage with your purpose.
    static string sqlForPage = "SELECT id, ptname, pathname, admin_id, p_url, clss_id, hao, bad, rcnt, regdate, isdel FROM photo WHERE (isdel = 0) ORDER BY regdate DESC";
    //}}This Code For paging process about datalist control

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //{{When come this page from media home page
            if (Page.Request["clss"] != null)
                sqlForPage = "SELECT id, ptname, pathname, admin_id, p_url, clss_id, hao, bad, rcnt, regdate, isdel FROM photo WHERE (isdel = 0) and clss_id="+ Page.Request["clss"].ToString() + " ORDER BY regdate DESC";
            //}}When come this page from media home page

            BindData();
        }
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
        // Example: "Page 1 of 10"
        lblpage.Text = (CurrentPage + 1) + "/" + _pgsource.PageCount;
        // Enable First, Last, Previous, Next buttons
        lbPrevious.Enabled = !_pgsource.IsFirstPage;
        lbNext.Enabled = !_pgsource.IsLastPage;
        lbFirst.Enabled = !_pgsource.IsFirstPage;
        lbLast.Enabled = !_pgsource.IsLastPage;

        // Bind data into DataList
        dlMovie.DataSource = _pgsource;//REFME Modify dlMovie to control you use.
        dlMovie.DataBind();

        // Call the function to do paging
        HandlePaging();
    }

    private void HandlePaging()
    {
        var dt = new DataTable();
        dt.Columns.Add("PageIndex"); //Start from 0
        dt.Columns.Add("PageText"); //Start from 1

        _firstIndex = CurrentPage - 5;
        if (CurrentPage > 5)
            _lastIndex = CurrentPage + 5;
        else
            _lastIndex = 10;

        // Check last page is greater than total page then reduced it to total no. of page is last index
        if (_lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
        {
            _lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
            _firstIndex = _lastIndex - 10;
        }

        if (_firstIndex < 0)
            _firstIndex = 0;

        // Now creating page number based on above first and last page index
        for (var i = _firstIndex; i < _lastIndex; i++)
        {
            var dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }

        rptPaging.DataSource = dt;
        rptPaging.DataBind();
    }

    protected void lbFirst_Click(object sender, EventArgs e)
    {
        CurrentPage = 0;
        BindData();
    }
    protected void lbLast_Click(object sender, EventArgs e)
    {
        CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
        BindData();
    }
    protected void lbPrevious_Click(object sender, EventArgs e)
    {
        CurrentPage -= 1;
        BindData();
    }
    protected void lbNext_Click(object sender, EventArgs e)
    {
        CurrentPage += 1;
        BindData();
    }

    protected void rptPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (!e.CommandName.Equals("newPage")) return;
        CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
        BindData();
    }

    protected void rptPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        var lnkPage = (LinkButton)e.Item.FindControl("lbPaging");
        if (lnkPage.CommandArgument != CurrentPage.ToString()) return;
        lnkPage.Enabled = false;
        lnkPage.BackColor = Color.FromName("#00FF00");
    }
    //}}This Code For paging process about datalist control

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
        sqlForPage = "SELECT id, ptname, pathname, admin_id, p_url, clss_id, hao, bad, rcnt, regdate, isdel FROM photo WHERE (isdel = 0)";
        if (ddlKInd.Text.Length > 0) sqlForPage += " and clss_id = " + ddlKInd.SelectedValue;
        if (tbSearch.Text.Length > 0) sqlForPage += " and ptname like '%" + tbSearch.Text + "%'";
        if (ddlSort.Text.Length <= 0) sqlForPage += " ORDER BY regdate DESC";
        else if (ddlSort.SelectedValue.CompareTo("1") == 0) sqlForPage += " ORDER BY rcnt DESC";
        else if (ddlSort.SelectedValue.CompareTo("2") == 0) sqlForPage += " ORDER BY hao DESC";

        BindData();
    }
}