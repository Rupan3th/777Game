﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class houtai_vod_advert : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public string MarkVisible(string strVisible)
    {
        String str = "/files/image/adv_hidden.png";
        if(strVisible.CompareTo("1") == 0) str = "/files/image/adv_visible.png";
        return str;
    }

    public bool IsVisible( string strVisible )
    {
        bool bRet = false;
        if (strVisible.CompareTo("1") == 0) bRet = true;
        return bRet;
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        CheckBox cbvisible = (CheckBox)GridView1.Rows[ e.RowIndex ].FindControl("chvisible");
        TextBox tbvisible = (TextBox)GridView1.Rows[e.RowIndex].FindControl("tbvisible");
        e.NewValues["visible"] = cbvisible.Checked ? "1" : "0";
    }

    protected void FormView1_PreRender(object sender, EventArgs e)
    {
        TextBox tbadminid = (TextBox)FormView1.FindControl("tbadminid");
        tbadminid.Text = (Session["admin_id"] != null ? Session["admin_id"].ToString() : "2");
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        GridView1.DataBind();        
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
    }

    protected void ibSelAll_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox cbSel;
        for(int i=0; i<GridView1.Rows.Count; i++)
        {
            cbSel = (CheckBox)GridView1.Rows[i].FindControl("cbSel");
            cbSel.Checked = true;
        }
    }

    protected void ibSelDel_Click(object sender, ImageClickEventArgs e)
    {
        CheckBox cbSel;
        Label lblid;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            cbSel = (CheckBox)GridView1.Rows[i].FindControl("cbSel");
            lblid = (Label)GridView1.Rows[i].FindControl("lblid");
            if (cbSel.Checked) msql.Execute("UPDATE advertisement SET isdel = 1 WHERE id = "+lblid.Text);
        }
        GridView1.DataBind();
    }
}