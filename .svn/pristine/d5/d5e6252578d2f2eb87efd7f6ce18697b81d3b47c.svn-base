using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main_sky_driver : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["act"] != null && Request["act"].CompareTo("5") == 0)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Default.aspx");
            return;
        }

        utility.DestorySessionForTrial(Session, this);
    }
}