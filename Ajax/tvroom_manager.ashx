<%@ WebHandler Language="C#" Class="tvroom_manager" %>

using System;
using System.Web;

public class tvroom_manager : IHttpHandler {
    mysql mconn = new mysql();
    mysql mconn1 = new mysql();

    public void ProcessRequest (HttpContext context) {
        if (context.Request["room"] == null || context.Request["user_id"] == null) return;

        string strTblName = "tvroom";

        String sql = "";
        String strUserId = context.Request["user_id"].ToString();
        String strRoom = context.Request["room"].ToString();
        String strState = context.Request["state"].ToString();
        if (context.Request["user_id"] != null && strUserId.Length > 0)
        {
            int user_id = Convert.ToInt32(strUserId);
            int room = Convert.ToInt32(strRoom);
            int state = Convert.ToInt32(strState);

            sql = "select count(*) from tvroom where uid = " + user_id + " and room = " + room + " ";
            int cnt = 0;
            mconn.GetValue(sql, out cnt);

            if(cnt > 0)
                sql = "update tvroom set state = " + state + " where uid=" + user_id + " and room =" + room + "";
            else
                sql = "INSERT INTO "+strTblName+" (uid, room, state) VALUES (" + user_id + ", " + room + ", " + state + ") ";
            mconn1.Execute(sql);    
        }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}