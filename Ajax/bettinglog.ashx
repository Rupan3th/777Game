<%@ WebHandler Language="C#" Class="bettinglog" %>

using System;
using System.Web;
using MySql.Data;
using MySql.Data.MySqlClient;

public class bettinglog : IHttpHandler {
    mysql mconn = new mysql();
    public void ProcessRequest (HttpContext context) {
        string strRet = "";
        String sql = "";

        if (context.Request["user_id"] == null) return;

        if (context.Request["user_id"] != null)
        {
            String strUserId = context.Request["user_id"].ToString();
            int user_id = Convert.ToInt32(strUserId);
            sql = "SELECT betting2.regdate as regdate, betting2.round as round, betting21.id as id, `user`.name AS uname, betting21.bet_coin as bet_coin, betting21.coin as coin, betting21.kinds_id as kinds_id, bettinglist2.fruit as fruit, bettinglist2.taisai as taisai, bettinglist2.evodd as evodd FROM betting2 INNER JOIN `user` ON betting2.user_id = `user`.id INNER JOIN betting21 ON betting2.user_id = betting21.user_id AND betting2.round = betting21.round INNER JOIN bettinglist2 ON betting2.round = bettinglist2.round WHERE (betting2.user_id = "+user_id+") ORDER BY betting21.id DESC limit 100";
            mconn.open();
            MySqlDataReader reader = mconn.GetReader(sql);

            while (reader.Read())
            {
                strRet += reader["regdate"].ToString();strRet += ",";
                strRet += reader["round"].ToString();strRet += ",";
                strRet += reader["id"].ToString();strRet += ",";
                strRet += reader["uname"].ToString();strRet += ",";
                strRet += reader["bet_coin"].ToString();strRet += ",";
                strRet += reader["coin"].ToString();strRet += ",";
                strRet += reader["kinds_id"].ToString();strRet += ",";
                strRet += reader["fruit"].ToString();strRet += ",";
                strRet += reader["taisai"].ToString();strRet += ",";                
                strRet += reader["evodd"].ToString();strRet += "-";
            }
            reader.Close();
            mconn.close();
        }
       
        

        context.Response.Write(strRet);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}