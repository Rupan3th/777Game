<%@ WebHandler Language="C#" Class="game_result" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public class game_result : IHttpHandler {
    mysql mconn = new mysql();
    public void ProcessRequest (HttpContext context) {
        string strRet = "";
        int round = 0;
        mconn.open();

        String sql = "select round, fruit, dice1, dice2, dice3, aa, bb, cc, dd, ee from bettinglist2 order by id desc limit 1";
        MySqlDataReader reader = mconn.GetReader(sql);

        if(context.Request["round"] == null)
        {
            while (reader.Read())
            {
                strRet += reader["aa"].ToString(); strRet += ",";
                strRet += reader["bb"].ToString(); strRet += ",";
                strRet += reader["cc"].ToString(); strRet += ",";
                strRet += reader["dd"].ToString(); strRet += ",";
                strRet += reader["ee"].ToString(); strRet += "/";
            }
            context.Response.Write(strRet);
        }

        int current_round = Convert.ToInt32(context.Request["round"]);
        while (reader.Read())
        {
            round = Convert.ToInt32(reader["round"].ToString());
            strRet += reader["fruit"].ToString(); strRet += ",";
            strRet += reader["dice1"].ToString(); strRet += ",";
            strRet += reader["dice2"].ToString(); strRet += ",";
            strRet += reader["dice3"].ToString(); strRet += "/";
        }

        reader.Close();
        mconn.close();
        //if (round == (current_round + 1))
        context.Response.Write(strRet);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}