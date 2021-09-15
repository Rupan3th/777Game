using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class houtai_vod_system : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null) return;

        if (Request["id"] != null)
        {
            switch(Request["id"].ToString())
            {
                case "0":
                    MultiView1.ActiveViewIndex = 0;
                    break;
                case "1":
                    MultiView1.ActiveViewIndex = 1;
                    break;
            }
        }
    }

    protected void FormView1_PreRender(object sender, EventArgs e)
    {
        if( FormView1.DefaultMode == FormViewMode.Insert )
        {
            TextBox tbadmin_id = (TextBox)FormView1.FindControl("tbadmin_id");
            if( Session["admin_id"] != null )
                tbadmin_id.Text = Session["admin_id"].ToString();
        }
    }

    protected void FormView2_PreRender(object sender, EventArgs e)
    {
        if (FormView2.DefaultMode == FormViewMode.Insert)
        {
            TextBox tbsender = (TextBox)FormView2.FindControl("tbsender");
            if (Session["admin_id"] != null)
                tbsender.Text = Session["admin_id"].ToString();
            else tbsender.Text = "-1";
        }
    }

    protected void cvExistID_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string recev_id = "";
        msql.GetValue("select id from user where name='"+args.Value+"' limit 1", out recev_id);
        if(recev_id == null || recev_id.Length <= 0)
        {
            args.IsValid = false;
            return;
        }

        TextBox tbreceiver = (TextBox)FormView2.FindControl("tbreceiver");
        tbreceiver.Text = recev_id;
        args.IsValid = true;        
    }
}