﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class houtai_game_Default : System.Web.UI.Page
{
    mysql mconn = new mysql();
    mysql mconn1 = new mysql();
    int round = 0;
    int fruit = 0;
    int taisai = 0;
    int evodd = 0;
    int dice1 = 0;
    int dice2 = 0;
    int dice3 = 0;
    int aa = 0;
    int bb = 0;
    int cc = 0;
    int dd = 0;
    int ee = 0;
    int rr = 0;
    int ss = 0;
    int rb = 0;
    
    double dice_rate = 1.96;
    string[] fruit_name = { "apple","apple","lemon","watermelon","watermelon","luck","apple","orange","orange","bell","seven","seven","apple","lemon","lemon","star","star","luck","apple","bell","orange","bell","bar","bar"};
    int[] fruit_rate = { 5, 2, 15, 20, 2, 0, 5, 2, 10, 20, 2, 40, 5, 2, 15, 30, 2, 0, 5, 2, 10, 20, 50, 120 };
    int[] kinds_id = { 8, 8, 6, 4, 4, 0, 8, 7, 7, 5, 2, 2, 8, 6, 6, 3, 3, 0, 8, 5, 7, 5, 1, 1 };
    int coin = 0;
    int remaintime = 120;
    int rdbuf = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Random random = new Random();
        ss = random.Next(24) + 1;
        rr = random.Next(5000) + 1;
        rb = random.Next(7500) + 1;

        fruit = det_slot();
        //fruit = 6; rb = 2; rr = 3;
        if (fruit == 6)
        {
            if (rr > 4900) { aa = 10; bb = 15; cc = 21; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지)        
            else if (rr > 4800 && rr <= 4900) { aa = 22; bb = 3; cc = 9; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지) 
            else if (rr > 3811 && rr <= 4800) {  aa = 20; bb = 14; cc = 8; dd = 0; ee = 5; } // small three (종, 망고, 오렌지)
            else if (rr == 3811) // contine three
            {
                aa = ss;
              //if (aa == 6 || aa == 18) aa += 1;
                if (aa > 24) aa = 1;
                bb = aa + 1;
             // if (bb == 6 || bb == 18) bb += 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
             // if (cc == 6 || cc == 18) cc += 1;
                if (cc > 24) cc = 1;
                dd = 0; ee = 2;
            }
        }
        if (fruit == 18)
        {
            if (rb > 7495) { aa = 12; bb = 16; cc = 4; dd = 0; ee = 1; }  // big three(77, 별, 수박)
            if (rb > 6011 && rb <= 7495) { aa = 11; bb = 17; cc = 5; dd = 0; ee = 5; }  // small three (77, 별, 수박)
            if (rb > 6001 && rb <= 6011) { aa = 1; bb = 7; cc = 13; dd = 19; ee = 4; }  // big four(사과)                       
            if (rb == 6001) // contine four
            {
                aa = ss;
              //if (aa == 6 || aa == 18) aa += 1;
                if (aa > 24) aa = 1;
                bb = aa + 1;
              //if (bb == 6 || bb == 18) bb += 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
              //if (cc == 6 || cc == 18) cc += 1;
                if (cc > 24) cc = 1;
                dd = cc + 1;
              //if (dd == 6 || dd == 18) dd += 1;
                if (dd > 24) dd = 1;
                ee = 3;
            }                
        }

        dice1 = random.Next(6) + 1;
        dice2 = random.Next(6) + 1;
        dice3 = random.Next(6) + 1;

        if ((dice1 + dice2 + dice3) > 10) { taisai = 1; }
        else taisai = 0;
        if ((dice1 + dice2 + dice3) % 2 != 0) { evodd = 1; }
        else evodd = 0;    
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        // 지정된 시간마다 현재 이벤트 핸들러 실행
        this.Label1.Text = DateTime.Now.ToLongTimeString();
        remaintime = 120 - (DateTime.Now.Hour * 3600 + DateTime.Now.Minute * 60 + DateTime.Now.Second) % 120;
        int dday = (DateTime.Now.Year-2000)*10000 + DateTime.Now.Month*100 + DateTime.Now.Day;
        round =  (DateTime.Now.Hour * 3600 + DateTime.Now.Minute * 60 + DateTime.Now.Second) / 120 + 1;
        round = dday*1000 + round;

        TextBox7.Text = remaintime.ToString();
        TextBox5.Text = round.ToString();
        if (remaintime == 5)
        {
            rdbuf = Convert.ToInt32(TextBox8.Text);            
            if (rdbuf != round)
            {
                DefineResult();
                rdbuf = round;                
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        fruit = Convert.ToInt32(TextBox1.Text);
        dice1 = Convert.ToInt32(TextBox2.Text);
        dice2 = Convert.ToInt32(TextBox3.Text);
        dice3 = Convert.ToInt32(TextBox4.Text);
        
        if (fruit == 6)
        {
            if (rr == 1) { aa = 11; bb = 17; cc = 5; dd = 0; ee = 0; } // small three
            if (rr == 2) { aa = 20; bb = 14; cc = 8; dd = 0; ee = 0; } // small three
            if (rr == 3) // contine three
            {
                aa = ss;
             // if (aa == 6 || aa == 18) aa += 1;
                if (aa > 24) aa = 1;
                bb = aa + 1;
             // if (bb == 6 || bb == 18) bb += 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
             // if (cc == 6 || cc == 18) cc += 1;
                if (cc > 24) cc = 1;
                dd = 0; ee = 2;
            }
        }
        if (fruit == 18)
        {
            if (rr == 1) { aa = 1; bb = 7; cc = 13; dd = 19; ee = 1; } // big three
            if (rr == 2) { aa = 12; bb = 16; cc = 4; dd = 0; ee = 1; } // big three
            if (rr == 3) { aa = 10; bb = 15; cc = 21; dd = 0; ee = 1; } // big three
            if (rr == 4) { aa = 22; bb = 3; cc = 9; dd = 0; ee = 1; } // big three
            if (rr == 5) // contine four
            {
                aa = ss;
             // if (aa == 6 || aa == 18) aa += 1;
                if (aa > 24) aa = 1;
                bb = aa + 1;
             // if (bb == 6 || bb == 18) bb += 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
             // if (cc == 6 || cc == 18) cc += 1;
                if (cc > 24) cc = 1;
                dd = cc + 1;
             // if (dd == 6 || dd == 18) dd += 1;
                if (dd > 24) dd = 1;
                ee = 3;
            }
        }

        if ((dice1 + dice2 + dice3) > 10) { taisai = 1; }
        else taisai = 0;
        if ((dice1 + dice2 + dice3) % 2 != 0) { evodd = 1; }
        else evodd = 0;

        round = Convert.ToInt32(this.TextBox5.Text);
        rdbuf = Convert.ToInt32(TextBox8.Text);
        if (rdbuf != round)
        {            
            rdbuf = round;
            TextBox8.Text = rdbuf.ToString();
            string sql = "insert into bettinglist2(round,fruit,taisai,evodd,dice1,dice2,dice3,aa,bb,cc,dd,ee) values (" + round + ", " + fruit + ", " + taisai + ", " + evodd + ", " + dice1 + ", " + dice2 + ", " + dice3 + ", " + aa + ", " + bb + ", " + cc + ", " + dd + ", " + ee + ")";
            mconn.Execute(sql);

            mconn.open();
            sql = "select user_id,round,bet_coin,bar,seven,star,watermelon,bell,lemon,orange,apple,doub,singl,big,small from betting2 where round = " + round + " ";
            MySqlDataReader reader = mconn.GetReader(sql);
            TextBox6.Text = "";
            while (reader.Read())
            {
                int lucky = 0;
                int userid = Convert.ToInt32(reader["user_id"].ToString());
                if (fruit != 6 && fruit != 18)
                {
                    coin = Convert.ToInt32(reader[fruit_name[fruit - 1]].ToString()) * fruit_rate[fruit - 1];
                    sql = "update betting21 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[fruit - 1] + ";";
                }
                if (fruit == 6 || fruit == 18)
                {
                    lucky = 1; int coin4 = 0;
                    int coin1 = Convert.ToInt32(reader[fruit_name[aa - 1]].ToString()) * fruit_rate[aa - 1];
                    sql = "update betting21 set coin = coin+" + coin1 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[aa - 1] + ";";
                    int coin2 = Convert.ToInt32(reader[fruit_name[bb - 1]].ToString()) * fruit_rate[bb - 1];
                    sql += "update betting21 set coin = coin+" + coin2 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[bb - 1] + ";";
                    int coin3 = Convert.ToInt32(reader[fruit_name[cc - 1]].ToString()) * fruit_rate[cc - 1];
                    sql += "update betting21 set coin = coin+" + coin3 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[cc - 1] + ";";
                    if (dd != 0)
                    {
                        coin4 = Convert.ToInt32(reader[fruit_name[dd - 1]].ToString()) * fruit_rate[dd - 1];
                        sql += "update betting21 set coin = coin+" + coin4 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[dd - 1] + ";";
                    }
                    if (ee != 0) coin += Convert.ToInt32(reader[fruit_name[ee - 1]].ToString()) * fruit_rate[ee - 1];
                    coin = coin1 + coin2 + coin3 + coin4;
                }
                double buf1 = 0; double buf2 = 0;
                if (taisai == 0)
                {
                    buf1 = Convert.ToInt32(reader["small"].ToString()) * dice_rate;
                    sql += "update betting21 set coin = " + Convert.ToInt32(buf1) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 12 + ";";
                }
                else
                {
                    buf1 = Convert.ToInt32(reader["big"].ToString()) * dice_rate;
                    sql += "update betting21 set coin = " + Convert.ToInt32(buf1) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 11 + ";";
                }

                if (evodd == 0)
                {
                    buf2 = Convert.ToInt32(reader["doub"].ToString()) * dice_rate;
                    sql += "update betting21 set coin = " + Convert.ToInt32(buf2) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 10 + ";";
                }
                else
                {
                    buf2 = Convert.ToInt32(reader["singl"].ToString()) * dice_rate;
                    sql += "update betting21 set coin = " + Convert.ToInt32(buf2) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 9 + ";";
                }

                coin += Convert.ToInt32(buf1 + buf2) - Convert.ToInt32(reader["bet_coin"].ToString());

                sql += "update betting2 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " ;";
                mconn1.Execute(sql);

                TextBox6.Text += coin.ToString() + ",";

            }
            sql = "INSERT INTO betting22(user_id,kinds_id,round,bet_coin,coin,lucky) SELECT user_id,kinds_id,round,bet_coin,coin-bet_coin,lucky FROM betting21 WHERE round=" + round + "";
            mconn1.Execute(sql);

            reader.Close();
            mconn.close();
        }
    }

    protected void DefineResult()
    {
        int bet_coin = 0;
        string sql = "insert into bettinglist2(round,fruit,taisai,evodd,dice1,dice2,dice3,aa,bb,cc,dd,ee) values (" + round + ", " + fruit + ", " + taisai + ", " + evodd + ", " + dice1 + ", " + dice2 + ", " + dice3 + ", " + aa + ", " + bb + ", " + cc + ", " + dd + ", " + ee + ")";
        mconn.Execute(sql);

        mconn.open();
        sql = "select user_id,round,bet_coin,bar,seven,star,watermelon,bell,lemon,orange,apple,doub,singl,big,small from betting2 where round = " + round + " ";
        MySqlDataReader reader = mconn.GetReader(sql);
        TextBox6.Text = "";
        while (reader.Read())
        {            
            int lucky = 0;
            int userid = Convert.ToInt32(reader["user_id"].ToString());
            bet_coin = Convert.ToInt32(reader["bet_coin"].ToString());

            if (fruit != 6 && fruit!=18)
            {
                coin = Convert.ToInt32(reader[fruit_name[fruit - 1]].ToString()) * fruit_rate[fruit - 1];
                sql = "update betting21 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[fruit - 1] + ";";
            }
            if (fruit == 6 || fruit == 18)
            {
                lucky = 1; int coin4 = 0;
                int coin1 = Convert.ToInt32(reader[fruit_name[aa - 1]].ToString()) * fruit_rate[aa - 1];
                sql = "update betting21 set coin = coin+" + coin1 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[aa - 1] + ";";
                int coin2 = Convert.ToInt32(reader[fruit_name[bb - 1]].ToString()) * fruit_rate[bb - 1];
                sql += "update betting21 set coin = coin+" + coin2 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[bb - 1] + ";";
                int coin3 = Convert.ToInt32(reader[fruit_name[cc - 1]].ToString()) * fruit_rate[cc - 1];
                sql += "update betting21 set coin = coin+" + coin3 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[cc - 1] + ";";
                if (dd != 0) {
                    coin4 = Convert.ToInt32(reader[fruit_name[dd - 1]].ToString()) * fruit_rate[dd - 1];
                    sql += "update betting21 set coin = coin+" + coin4 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[dd - 1] + ";";
                }
                if (ee != 0) coin += Convert.ToInt32(reader[fruit_name[ee - 1]].ToString()) * fruit_rate[ee - 1];
                coin = coin1 + coin2 + coin3 + coin4;
            }
            double buf1 = 0; double buf2 = 0;
            if (taisai == 0) {
                buf1 = Convert.ToInt32(reader["small"].ToString()) * dice_rate;
                sql += "update betting21 set coin = " + Convert.ToInt32(buf1) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 12 + ";";
            }
            else {
                buf1 = Convert.ToInt32(reader["big"].ToString()) * dice_rate;
                sql += "update betting21 set coin = " + Convert.ToInt32(buf1) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 11 + ";";
            }

            if (evodd == 0) {
                buf2 = Convert.ToInt32(reader["doub"].ToString()) * dice_rate;
                sql += "update betting21 set coin = " + Convert.ToInt32(buf2) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 10 + ";";
            }
            else {
                buf2 = Convert.ToInt32(reader["singl"].ToString()) * dice_rate;
                sql += "update betting21 set coin = " + Convert.ToInt32(buf2) + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + 9 + ";";
            }

            coin += Convert.ToInt32(buf1+buf2) - Convert.ToInt32(reader["bet_coin"].ToString());

            sql += "update betting2 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " ;";
            mconn1.Execute(sql);

            TextBox6.Text += coin.ToString() + ",";
           
        }
        //sql = "INSERT INTO betting22(user_id,kinds_id,round,bet_coin,coin,lucky) SELECT user_id,kinds_id,round,bet_coin,coin-bet_coin,lucky FROM betting21 WHERE round=" + round + "";
        //sql = "INSERT INTO roundend(type,round) values(1, " + round + ")";
        //mconn1.Execute(sql);

        reader.Close();
        mconn.close();
        TextBox8.Text = round.ToString();
        TextBox9.Text = fruit.ToString();
        TextBox10.Text = dice1.ToString();
        TextBox11.Text = dice2.ToString();
        TextBox12.Text = dice3.ToString();
    }


    protected int det_slot()
    {
        Random random = new Random();
        int r = random.Next(29184) + 1;
        int b = 1;
        if (r > 29129)
        {
            //大Bar  55/n 
            b = 24;
        }
        else if (r > 28997 && r <= 29129)
        {
            //小Bar  132/n
            b = 23;
        }
        else if (r > 28832 && r <= 28997)
        {
            //大77  165/n
            b = 12;
        }
        else if (r > 28612 && r <= 28832)
        {
            //大星星  220/n
            b = 16;
        }
        else if (r > 28282 && r <= 28612)
        {
            //大西瓜  330/n 수박
            b = 4;
        }
        else if (r > 27952 && r <= 28282)
        {
            //大铃铛  165/n  큰종
            int ar = random.Next(2) + 1;
            switch (ar)
            {
                case 1:
                    b = 22;
                    break;
                case 2:
                    b = 10;
                    break;
            }
        }
        else if (r > 27512 && r <= 27952)
        {
            //大椰子1  220/n 대망고
            int ar = random.Next(2) + 1;
            switch (ar)
            {
                case 1:
                    b = 3;
                    break;
                case 2:
                    b = 15;
                    break;
            }
        }
        else if (r > 26852 && r <= 27512)
        {
            //大桔子1  330/n  오렌지
            int ar = random.Next(2) + 1;
            switch (ar)
            {
                case 1:
                    b = 21;
                    break;
                case 2:
                    b = 9;
                    break;
            }
        }
        else if (r > 25532 && r <= 26852)
        {
            //苹果   220/n   사과
            int ar = random.Next(4) + 1;
            switch (ar)
            {
                case 1:
                    b = 1;
                    break;
                case 2:
                    b = 7;
                    break;
                case 3:
                    b = 13;
                    break;
                case 4:
                    b = 19;
                    break;
            }
        }
        else if (r > 24721 && r <= 25532)
        {
            //luck  1/36
            b = 18;
        }
        else if (r > 23100 && r <= 24721)
        {
            //luck  1/18
            b = 6;
        }

        else
        {
            //小东西   small
            int ar = random.Next(7) + 1;
            switch (ar)
            {
                case 1:
                    b = 2;
                    break;
                case 2:
                    b = 5;
                    break;
                case 3:
                    b = 8;
                    break;
                case 4:
                    b = 11;
                    break;
                case 5:
                    b = 14;
                    break;
                case 6:
                    b = 17;
                    break;
                case 7:
                    b = 20;
                    break;
            }
        }
        return b;
    }           
    
}