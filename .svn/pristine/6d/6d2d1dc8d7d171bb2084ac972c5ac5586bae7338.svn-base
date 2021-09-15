using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajax_sendbet : System.Web.UI.Page
{
    mysql mconn = new mysql();    

    protected void Page_Load(object sender, EventArgs e)
    {
        utility.DestorySessionForTrial(Session, this);

        if (Request["user_id"] != null && Request["round"] != null && Request["bet_coin"] != null)
        {
            int user_id = Convert.ToInt32(this.Request["user_id"]);
            int round = Convert.ToInt32(this.Request["round"]) + 1;
            int bet_coin = Convert.ToInt32(this.Request["bet_coin"]);
            int bar = Convert.ToInt32(this.Request["bar"]);
            int seven = Convert.ToInt32(this.Request["seven"]);
            int star = Convert.ToInt32(this.Request["star"]);
            int watermelon = Convert.ToInt32(this.Request["watermelon"]);
            int bell = Convert.ToInt32(this.Request["bell"]);
            int lemon = Convert.ToInt32(this.Request["lemon"]);
            int orange = Convert.ToInt32(this.Request["orange"]);
            int apple = Convert.ToInt32(this.Request["apple"]);
            int doub = Convert.ToInt32(this.Request["doub"]);
            int singl = Convert.ToInt32(this.Request["singl"]);
            int big = Convert.ToInt32(this.Request["big"]);
            int small = Convert.ToInt32(this.Request["small"]);
            int zhibo_id = Convert.ToInt32(this.Request["zhibo_id"]);

            string sql = "insert into betting2(user_id,round,bet_coin,bar,seven,star,watermelon,bell,lemon,orange,apple,doub,singl,big,small,zhibo_id) values (" + user_id + ", " + round + ", " + bet_coin + ", " + bar + ", " + seven + ", " + star + ", " + watermelon + ", " + bell + ", " + lemon + ", " + orange + ", " + apple + ", " + doub + ", " + singl + ", " + singl + ", " + small + ", "+ zhibo_id + ");";

            if (bar != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 1 + ", " + round + ", " + bar + ");"; }
            if (seven != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 2 + ", " + round + ", " + seven + ");"; }
            if (star != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 3 + ", " + round + ", " + star + ");"; }
            if (watermelon != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 4 + ", " + round + ", " + watermelon + ");"; }
            if (bell != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 5 + ", " + round + ", " + bell + ");"; }
            if (lemon != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 6 + ", " + round + ", " + lemon + ");"; }
            if (orange != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 7 + ", " + round + ", " + orange + ");"; }
            if (apple != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 8 + ", " + round + ", " + apple + ");"; }
            if (singl != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 9 + ", " + round + ", " + singl + ");"; }
            if (doub != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 10 + ", " + round + ", " + doub + ");"; }
            if (big != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 11 + ", " + round + ", " + big + ");"; }
            if (small != 0)
            { sql += "insert into betting21(user_id,kinds_id,round,bet_coin) values (" + user_id + ", " + 12 + ", " + round + ", " + small + ")"; }

            mconn.Execute(sql);   
        }        

        if (Request["coin"] != null && Request["round"] != null)
        {
            int coin = Convert.ToInt32(this.Request["coin"]);
            int round = Convert.ToInt32(this.Request["round"]);

            string sql = "update betting2 set coin = "+ coin + " where round=" + round + " ";
            mconn.Execute(sql);
        }

        //if (Request["round"] != null && Request["fruit"] != null && Request["taisai"] != null && Request["evodd"] != null)
        //{
        //    int round = Convert.ToInt32(this.Request["round"]);
        //    int fruit = Convert.ToInt32(this.Request["fruit"]);
        //    int taisai = Convert.ToInt32(this.Request["taisai"]);
        //    int evodd = Convert.ToInt32(this.Request["evodd"]);

        //    string sql = "insert into bettinglist2(round,fruit,taisai,evodd) values (" + round + ", " + fruit + ", " + taisai + ", " + evodd + ")";
        //    mconn.Execute(sql);            
        //}

    }
}