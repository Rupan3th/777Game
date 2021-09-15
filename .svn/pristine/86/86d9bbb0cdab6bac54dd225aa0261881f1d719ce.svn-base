using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Ajax_Login : System.Web.UI.Page
{
    mysql mconn = new mysql(true);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["name"] == null 
            || Request["pwd"] == null 
            || Request["vcode"] == null
            || Session["webcheckcode"] == null ) return;

        string username = this.Request["name"].ToString();
        bool bOpend = false;
        username = utility.ClearTaom(username);
        string pwd =  utility.CreateMD5(this.Request["pwd"].ToString());
        pwd = utility.ClearTaom(pwd );
        string strVode = this.Request["vcode"];

        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(pwd))//check if empty or null
            this.Write("-1");

        else if (strVode != this.Session["webcheckcode"].ToString())//check verify code.
        {
            this.Write("-2");
        }
        else
        {//login proceess
            String strRole = "user";
            String strResult = "Unknown login error 5";

            string id, admin_id, rating, coin, regdate, temp_coin, startvip, endvip, isdel;
            String sql = "select id, admin_id, rating, coin, regdate, temp_coin, startvip, endvip, isdel from user where name='" + username + "' and ucase(pass)=ucase('"+pwd+"') and isdel=0";
            try
            {
                //omitted mconn.open();
                bOpend = true;

                MySqlCommand cmd = new MySqlCommand(sql, mconn.ConnPtr());
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    id = reader["id"].ToString();
                    admin_id = reader["admin_id"].ToString();
                    rating = reader["rating"].ToString();
                    coin = reader["coin"].ToString();
                    regdate = reader["regdate"].ToString();
                    temp_coin = reader["temp_coin"].ToString();
                    startvip = reader["startvip"].ToString();
                    endvip = reader["endvip"].ToString();
                    isdel = reader["isdel"].ToString();
                    if ((rating.CompareTo("999") == 0 || rating.CompareTo("555") == 0 || rating.CompareTo("777") == 0) && isdel.CompareTo("0") == 0)
                    {
                        Session["User"] = username;
                        Session["Roles"] = strRole;
                        Session.Timeout = 15;
                        FormsAuthentication.SetAuthCookie(username, false);//Let us now set the authentication cookie so that we can use that later.

                        //{{
                        Session["user_id"] = id;
                        Session["admin_id"] = admin_id;
                        Session["name"] = username;
                        Session["rating"] = rating;
                        Session["coin"] = coin;
                        Session["temp_coin"] = temp_coin;
                        //}}

                        reader.Close();

                        //{{리용자 차팅상태반영로직
                        if (Session["User"] != null && Session["User"].ToString().Length > 0)
                        {
                            int nType = 0;
                            wowza_chat.userChatState(cmd, username, out nType);
                            if (nType > 0) global.wowHotChatUsers[username] = nType;
                            else global.wowHotChatUsers.Remove(username);

                            //utility.log("[login] chat users:[" + global.wowHotChatUsers.Count
                            //    + "] cur name[" + Session["name"].ToString()
                            //    + "] state [" + wowza_chat.userChatState(Session["name"].ToString())
                            //    + "]");
                        }
                        //}}리용자 차팅상태반영로직

                        if (rating.CompareTo("777") == 0)
                        {
                            DateTime dtNow = DateTime.Now;
                            DateTime dtStart = DateTime.Parse(startvip);
                            DateTime dtEnd = DateTime.Parse(endvip);
                            if (dtNow.CompareTo(dtStart) >= 0 && dtNow.CompareTo(dtEnd) <= 0)
                            {  //Set For 777 acount.
                                TimeSpan tsDiff = dtEnd.Subtract(dtNow);
                                UInt32 uMilli = (UInt32)tsDiff.TotalMilliseconds;

                                //{{
                                Session["timeout"] = (int)uMilli;// 
                                Session["logindt"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                                Session.Timeout = 30;//30 Minitues this value is setted by web.config.
                                //}}
                                strResult = "/tm/" + (int)uMilli;//this.Write( "/tm/" + (int)uMilli );
                            }
                        }
                        else strResult = "OK";//this.Write("OK");
                    }
                    else strResult = "不能登录，请确认用户信息，重新输入。";//this.Write("不能登录，请确认用户信息，重新输入。");
                }
                else strResult = "不能登录，请确认用户信息，重新输入。";//this.Write("不能登录，请确认用户信息，重新输入。");
                reader.Close();
                mconn.close();
            }
            catch(Exception ex)
            {
                strResult = "Unknown login error 5";// if( !bOpend ) this.Write("");
            }

            this.Write( strResult );
        }

        //this.Write("Unknown login error 4");
    }

    public void Write(string str)
    {
        this.Response.Clear();
        this.Response.Write(str);
        this.Response.End();
    }
}