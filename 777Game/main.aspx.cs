﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


public partial class _777Game_main : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        utility.DestorySessionForTrial(Session, this);

        string user_id = (string)(Session["user_id"]);

        if (Session["user_id"] == null)
        {
            Response.Redirect(String.Format("/login.aspx?"));
        }
        if (Session["rating"] == null)
        {
            string rating = Session["rating"].ToString();

            if (rating.CompareTo("777") == 0)
            {

            }
        }

    }
}