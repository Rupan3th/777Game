<%@ WebHandler Language="C#" Class="loginstate" %>

using System;
using System.Web;


public class loginstate : IHttpHandler {
    mysql mconn = new mysql();
    mysql mconn1 = new mysql();
    public void ProcessRequest (HttpContext context) {

        if (context.Request["category"] == null || context.Request["user_id"] == null) return;

        // INSERT INTO students (NAME, email) VALUES ('saltfactory', 'saltfactory@gmail.com')
        // ON DUPLICATE KEY UPDATE name='saltfactory', email='saltfactory@me.com'
        string strTblName = "login2";
        if(context.Request["category"] != null
                && context.Request["category"].ToString().CompareTo("3") == 0 )
            strTblName = "login3";

        String sql = "";
        String strUserId = context.Request["user_id"].ToString();
        if (context.Request["user_id"] != null && strUserId.Length > 0)
        {
            int user_id = Convert.ToInt32(strUserId);
            sql = "INSERT INTO "+strTblName+" (uid) VALUES (" + user_id + ") ON DUPLICATE KEY UPDATE cnt=cnt+" + 1 + " ";
            mconn.Execute(sql);

            if (context.Request["loginfir"] != null)
            {
                sql = "select logintime from "+strTblName+" where uid="+ user_id +"";
                string logtimevalue = "";
                mconn1.GetValue(sql, out logtimevalue);
                DateTime dt = DateTime.Parse(logtimevalue);
                logtimevalue = dt.ToString("yyyy-MM-dd HH:mm:ss");

                sql = "INSERT INTO loginhistory (uid) VALUES (" + user_id + ") ;";
                sql += "update user set logtime = '"+logtimevalue+"'  where id=" + user_id + " ";
                mconn.Execute(sql);
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}