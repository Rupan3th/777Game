<%@ WebHandler Language="C#" Class="spinlog" %>

using System;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;

public class spinlog : IHttpHandler {
    mysql mconn = new mysql();
    public void ProcessRequest (HttpContext context) {
        string strRet = "";
        int lognum = 7;
        if (context.Request["lognum"] != null)
        {
            lognum = 11;
        }
        
        mconn.open();

        String sql = "select fruit, taisai, evodd from bettinglist2 order by id desc limit " + lognum + "";
        MySqlDataReader reader = mconn.GetReader(sql);
        while (reader.Read())
        {
            strRet += reader["fruit"].ToString();strRet += ",";
            strRet += reader["taisai"].ToString();strRet += ",";
            strRet += reader["evodd"].ToString();strRet += "/";
        }
        reader.Close();
        mconn.close();

        context.Response.Write(strRet);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}