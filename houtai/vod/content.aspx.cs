using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class houtai_vod_content : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            hdType.Value = Request["id"].ToString();
            switch(hdType.Value)
            {
                case "0": hddetialid.Value = "25"; MultiView1.ActiveViewIndex = 0; break;
                case "1": hddetialid.Value = "26"; MultiView1.ActiveViewIndex = 1; break;
                case "2": hddetialid.Value = "27"; MultiView1.ActiveViewIndex = 2; break;
            }
        }
    }

    protected void ddlClssId_DataBinding(object sender, EventArgs e)
    {
        ddlClssId.Items.Clear();
    }

    int nNo = 0;
    public string GetNo()
    {
        nNo++;
        return nNo.ToString();
    }

    protected void GridView1_DataBinding(object sender, EventArgs e)
    {

        int n = GridView1.PageIndex;
        n *= GridView1.PageSize;
        nNo = n;

        SetMovieSelection();
    }

    String SetMovieSelection()
    {
        string sqlSel = "SELECT movie.id, movie.mvname, movie.clss_id, movie.coin, movie.hao, movie.i_url, kinds2.kname FROM movie INNER JOIN kinds2 ON movie.clss_id = kinds2.id";
        string sqlSelCnt = "SELECT count(movie.id) FROM movie INNER JOIN kinds2 ON movie.clss_id = kinds2.id";

        string sqlWhere = " WHERE movie.isdel=0";
        string sqlOrder = " ORDER BY movie.id desc";
        if (ddlClssId.SelectedValue.Length > 0) sqlWhere += " and movie.clss_id=" + ddlClssId.SelectedValue;
        if (tbBegin.Text.Length > 0) sqlWhere += " and regdate >= '" + tbBegin.Text + "'";
        if (tbEnd.Text.Length > 0) sqlWhere += " and regdate <= '" + tbEnd.Text + "'";
        SqlDataSource1.SelectCommand = sqlSel + sqlWhere + sqlOrder;

        return sqlSelCnt + sqlWhere;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        switch(hdType.Value)
        {
            case "0":
                GridView1.DataBind();
                break;
            case "1":
                GridView2.DataBind();
                break;
            case "2":
                GridView3.DataBind();
                break;
        }
    }

    protected void OnDeleteByManual(object sender, CommandEventArgs e)
    {
        string sql = "UPDATE movie SET isdel = 1 WHERE id = "+e.CommandArgument;
        msql.Execute(sql);
        GridView1.DataBind();
    }

    protected void OnDeletePhoto(object sender, CommandEventArgs e)
    {
        string sql = "UPDATE photo SET isdel = 1 WHERE id = " + e.CommandArgument;
        msql.Execute(sql);
        GridView2.DataBind();
    }

    
    protected void GridView2_DataBinding(object sender, EventArgs e)
    {
        int n = GridView2.PageIndex;
        n *= GridView2.PageSize;
        nPhotoNo = n;

        SetPhotoSelection();
    }

    String SetPhotoSelection()
    {
        string sqlSel = "SELECT photo.id, photo.ptname, photo.p_url, photo.clss_id, photo.hao, photo.isdel, kinds2.kname FROM photo INNER JOIN kinds2 ON photo.clss_id = kinds2.id";
        string sqlSelCnt = "SELECT count(photo.id) FROM photo INNER JOIN kinds2 ON photo.clss_id = kinds2.id";
        string sqlWhere = " WHERE photo.isdel=0";
        string sqlOrder = " ORDER BY photo.id desc";
        if (ddlClssId.SelectedValue.Length > 0) sqlWhere += " and photo.clss_id=" + ddlClssId.SelectedValue;
        if (tbBegin.Text.Length > 0) sqlWhere += " and regdate >= '" + tbBegin.Text + "'";
        if (tbEnd.Text.Length > 0) sqlWhere += " and regdate <= '" + tbEnd.Text + "'";
        SqlDataSource3.SelectCommand = sqlSel + sqlWhere + sqlOrder;

        return sqlSelCnt + sqlWhere;
    }

    int nPhotoNo = 0;
    public string GetPhotoNo()
    {
        nPhotoNo++;
        return nPhotoNo.ToString();
    }

    protected void View2_Activate(object sender, EventArgs e)
    {
        GridView2.DataBind();
    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {
        switch(MultiView1.ActiveViewIndex)
        {
            case 0:GridView1.DataBind(); break;
            case 1: GridView2.DataBind(); break;
            case 2: GridView3.DataBind();break;
        }
    }

    protected void imsellall_Click(object sender, ImageClickEventArgs e)
    {
        GridView gv = null;
        switch (MultiView1.ActiveViewIndex)
        {
            case 0: gv = GridView1; break;
            case 1: gv = GridView2; break;
            case 2: gv = GridView3; break;
        }

        CheckBox cbSel;
        for (int i = 0; i < gv.Rows.Count; i++)
        {
            cbSel = (CheckBox)gv.Rows[i].FindControl("cbSel");
            cbSel.Checked = true;
        }
    }

    protected void imselldel_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox cbSel;
        Label lblid;
        GridView gv = null;
        string sql = "";
        switch (MultiView1.ActiveViewIndex)
        {
            case 0: gv = GridView1; sql = "UPDATE movie SET isdel = 1 WHERE id = "; break;
            case 1: gv = GridView2; sql = "UPDATE photo SET isdel = 1 WHERE id = "; break;
            case 2: gv = GridView3; sql = "UPDATE novel SET isdel = 1 WHERE id = "; break;
        }

        for (int i = 0; i < gv.Rows.Count; i++)
        {
            cbSel = (CheckBox)gv.Rows[i].FindControl("cbSel");
            lblid = (Label)gv.Rows[i].FindControl("lblid");
            if (cbSel.Checked) msql.Execute( sql + lblid.Text);
        }
        gv.DataBind();
    }

    protected void OnDeleteNovel(object sender, CommandEventArgs e)
    {
        string sql = "UPDATE novel SET isdel = 1 WHERE id = " + e.CommandArgument;
        msql.Execute(sql);
        GridView3.DataBind();
    }

    protected void GridView3_DataBinding(object sender, EventArgs e)
    {
        int n = GridView3.PageIndex;
        n *= GridView3.PageSize;
        nNovelNo = n;

        SetNovelSelection();
    }

    String SetNovelSelection()
    {
        string sqlSel = "SELECT novel.id, novel.nvname, novel.clss_id, novel.hao, novel.isdel, novel.url, kinds2.kname FROM novel INNER JOIN kinds2 ON novel.clss_id = kinds2.id";
        string sqlSelCnt = "SELECT count(novel.id) FROM novel INNER JOIN kinds2 ON novel.clss_id = kinds2.id";
        string sqlWhere = " WHERE novel.isdel=0";
        string sqlOrder = " ORDER BY novel.id desc";
        if (ddlClssId.SelectedValue.Length > 0) sqlWhere += " and novel.clss_id=" + ddlClssId.SelectedValue;
        if (tbBegin.Text.Length > 0) sqlWhere += " and regdate >= '" + tbBegin.Text + "'";
        if (tbEnd.Text.Length > 0) sqlWhere += " and regdate <= '" + tbEnd.Text + "'";
        SqlDataSource4.SelectCommand = sqlSel + sqlWhere + sqlOrder;

        return sqlSelCnt + sqlWhere;
    }

    int nNovelNo = 0;
    public string GetNovelNo()
    {
        nNovelNo++;
        return nNovelNo.ToString();
    }

    protected void View3_Activate(object sender, EventArgs e)
    {
        GridView3.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        SetMovieSelection();
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        SetPhotoSelection();
    }

    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        SetNovelSelection();
    }
}