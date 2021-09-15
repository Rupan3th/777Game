using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MySql.Data.MySqlClient;

public partial class login : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        //{{ For make session key to authentication from jsp.
        String struser = "", strix = "";
        if(Request["username"] != null && Request["ix"] != null)
        {
            struser = Request["username"].ToString();
            strix = Request["ix"].ToString();
        }

        if (Request.Cookies["username"] != null && Request.Cookies["ix"] != null)
        {
            struser = Request.Cookies["username"].ToString();
            strix = Request.Cookies["ix"].ToString();
        }

        ///houtai/vod/advert.aspx?username=superman&ix=A58F1F21A5E79999CEFBE2257F7EFB7212345
        //struser = "superman";
        //strix = "A58F1F21A5E79999CEFBE2257F7EFB7212345";
        if (struser.Length > 0 && strix.Length > 0)
        {
            if (utility.IsValidateBy(struser, strix))
            {
                String sql = "select id, rating, coin  from admin where isdell=0 and name = '"+struser+"'";
                msql.open();
                MySqlDataReader reader = msql.GetReader(sql);
                if (reader.Read())
                {
                    Session["User"] = struser;
                    Session["Roles"] = "admin";

                    Session["user_id"] = reader["id"].ToString();
                    Session["admin_id"] = reader["id"].ToString();
                    Session["name"] = struser;
                    Session["rating"] = reader["rating"].ToString();
                    Session["coin"] = reader["coin"].ToString();
                    Session["temp_coin"] = "";

                    FormsAuthentication.SetAuthCookie(struser, false);
                }
                msql.close();

                if (Request["ReturnUrl"] != null) Page.Response.Redirect(Request["ReturnUrl"].ToString());
                else Response.Redirect("Default.aspx");
            }
        }

        string strUrl = Request.Url.ToString();
        if ((Session["Roles"] == null 
            || Session["Roles"].ToString().Length <= 0)
            && strUrl.Contains("houtai"))
        {//When call houtai pages with bad account, call follow javascript.
            Page.RegisterClientScriptBlock("logout", "<script language='javascript'>location.href = '"+global.sJspServer+"'</script>");
        }
        //}} For make session key to authentication from jsp.
    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
 
    }
}