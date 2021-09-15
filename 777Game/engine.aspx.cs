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

public partial class _777Game_engine : System.Web.UI.Page
{
    mysql mconn = new mysql();
    mysql mconn1 = new mysql();
    //mysql mconn2 = new mysql();
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
    string[] fruit_name = { "apple", "apple", "lemon", "watermelon", "watermelon", "luck", "apple", "orange", "orange", "bell", "seven", "seven", "apple", "lemon", "lemon", "star", "star", "luck", "apple", "bell", "orange", "bell", "bar", "bar" };
    int[] fruit_rate = { 5, 2, 15, 20, 2, 0, 5, 2, 10, 20, 2, 40, 5, 2, 15, 30, 2, 0, 5, 2, 10, 20, 50, 120 };
    int[] kinds_id = { 8, 8, 6, 4, 4, 0, 8, 7, 7, 5, 2, 2, 8, 6, 6, 3, 3, 0, 8, 5, 7, 5, 1, 1 };
    int bet_coin = 0;
    int coin = 0;
    int coin1 = 0;
    int coin2 = 0;
    int coin3 = 0;
    int coin4 = 0;
    int remaintime = 120;
    int pasttime = 0;
    int rdbuf = 0;
    int profit_rate = 0;    
    int Profit_state ;
    int fcoin = 0;
    int f_coin = 0;
    int fangsui = 0;
    DateTime stime, etime;

    protected void Page_Load(object sender, EventArgs e)
    {       

        fruit = det_slot();
        if (fruit == 6 || fruit == 18) generate_luck();
        generate_dice();

        // 수익률 읽어내기
        string sql = "select minprofit from settingsite ORDER BY id DESC limit 1 ";        
        mconn.GetValue(sql, out profit_rate);

        // 황수이게산   
        mconn.open();
        sql = "SELECT *FROM settingdian where isfang=1 and stime < NOW() and etime > NOW() order by stime limit 1";
        MySqlDataReader reader = mconn.GetReader(sql);
       
        if (!reader.HasRows)
        {
            fcoin = 0;
            fangsui = 0;
        }
        else
        {
            while (reader.Read())
            {
                f_coin = Convert.ToInt32(reader["fcoin"].ToString());
                stime = Convert.ToDateTime(reader["stime"].ToString());
                etime = Convert.ToDateTime(reader["etime"].ToString());
                TimeSpan timeDiff = etime - stime;
                int diffMinute = timeDiff.Minutes + timeDiff.Hours*60 + timeDiff.Days*60*24;
                fcoin = f_coin / (diffMinute / 2);
                fangsui = 1;
            }            
            reader.Close();            
        }
        mconn.close();
        TextBox19.Text = fcoin.ToString() + " / " + f_coin.ToString();
        
        if (fangsui == 1 && stime.Year > 1)
        {
            int sround = ((stime.Year - 2000) * 10000 + stime.Month * 100 + stime.Day) * 1000 + (stime.Hour * 60 + stime.Minute) / 2;
            int eround = ((etime.Year - 2000) * 10000 + etime.Month * 100 + etime.Day) * 1000 + (etime.Hour * 60 + etime.Minute) / 2;
            sql = "select sum(coin) from betting2 where round>"+sround+" and round<"+eround+"";
            int realcoin = 0;
            mconn.GetValue(sql, out realcoin);            
            sql = "update settingdian set realcoin = "+ -realcoin + ", isfang=0 where isfang=1 and etime < NOW()";
            mconn.Execute(sql);
        }
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        // 지정된 시간마다 현재 이벤트 핸들러 실행
        this.Label1.Text = DateTime.Now.ToString();  // 실시간 현재시간 현시
        pasttime = DateTime.Now.Hour * 3600 + DateTime.Now.Minute * 60 + DateTime.Now.Second;
        remaintime = 120 - (pasttime % 120);

        int dday = (DateTime.Now.Year-2000)*10000 + DateTime.Now.Month*100 + DateTime.Now.Day;
        round = pasttime / 120 + 1;
        round = dday*1000 + round;

        TextBox7.Text = remaintime.ToString();  //역계수기 현시
        TextBox5.Text = round.ToString();       //현재회차 현시
        TextBox17.Text = profit_rate.ToString()+" %";  //수익률 현시

        if (remaintime == 10)
        {
            Profit_calc();      //수익률 계산
            rdbuf = Convert.ToInt32(TextBox8.Text);            
            if (rdbuf != round)
            {
                DefineResult();
                rdbuf = round;                
            }
        }
    }
    

    protected void DefineResult()
    {
        if (Profit_state == 0)
        {
            fruit = 6;
            aa = 0;
            bb = 0;
            cc = 0;
            dd = 0;
        }
        // 게임결과 DB에 써넣기      
        string sql = "insert into bettinglist2(round,fruit,taisai,evodd,dice1,dice2,dice3,aa,bb,cc,dd,ee) values (" + round + ", " + fruit + ", " + taisai + ", " + evodd + ", " + dice1 + ", " + dice2 + ", " + dice3 + ", " + aa + ", " + bb + ", " + cc + ", " + dd + ", " + ee + ")";
        mconn.Execute(sql);
        // 게임결과 내보내기
        TextBox8.Text = round.ToString();
        TextBox9.Text = fruit.ToString();
        TextBox10.Text = dice1.ToString();
        TextBox11.Text = dice2.ToString();
        TextBox12.Text = dice3.ToString();

        // 유저들의 해당회차 배팅값 불러오기
        mconn.open();
        sql = "select user_id,round,bet_coin,bar,seven,star,watermelon,bell,lemon,orange,apple,doub,singl,big,small from betting2 where round = " + round + " ";
        MySqlDataReader reader = mconn.GetReader(sql);
        sql = "";
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
                lucky = 1; 
                if (aa != 0) {
                    coin1 = Convert.ToInt32(reader[fruit_name[aa - 1]].ToString()) * fruit_rate[aa - 1];
                    sql = "update betting21 set coin = coin+" + coin1 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[aa - 1] + ";";
                }
                if (bb != 0) {
                    coin2 = Convert.ToInt32(reader[fruit_name[bb - 1]].ToString()) * fruit_rate[bb - 1];
                    sql += "update betting21 set coin = coin+" + coin2 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[bb - 1] + ";";
                }
                if (cc != 0) {
                    coin3 = Convert.ToInt32(reader[fruit_name[cc - 1]].ToString()) * fruit_rate[cc - 1];
                    sql += "update betting21 set coin = coin+" + coin3 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[cc - 1] + ";";
                }
                if (dd != 0) {
                    coin4 = Convert.ToInt32(reader[fruit_name[dd - 1]].ToString()) * fruit_rate[dd - 1];
                    sql += "update betting21 set coin = coin+" + coin4 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[dd - 1] + ";";
                }                
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
            
            coin += Convert.ToInt32(buf1+buf2) - bet_coin;

            sql += "update betting2 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " ;";
            mconn1.Execute(sql);

        }
        //sql = "INSERT INTO betting22(user_id,kinds_id,round,bet_coin,coin,lucky) SELECT user_id,kinds_id,round,bet_coin,coin-bet_coin,lucky FROM betting21 WHERE round=" + round + "";
        sql = "INSERT INTO roundend(type,round) values(1, " + round + ")";
        mconn1.Execute(sql);

        reader.Close();
        mconn.close();
        
        TextBox13.Text = aa.ToString();
        TextBox14.Text = bb.ToString();
        TextBox15.Text = cc.ToString();
        TextBox16.Text = dd.ToString();
    }

    ///
    protected void Button1_Click(object sender, EventArgs e)
    {
        int bet_coin = 0;

        fruit = Convert.ToInt32(TextBox1.Text);
        dice1 = Convert.ToInt32(TextBox2.Text);
        dice2 = Convert.ToInt32(TextBox3.Text);
        dice3 = Convert.ToInt32(TextBox4.Text);

        Random random = new Random();
        ss = random.Next(24) + 1;
        rr = Convert.ToInt32(TextBox18.Text);        

        if (rr <= 4)
        {
            fruit = 6;
            TextBox1.Text = fruit.ToString() ;
            if (rr == 1) { aa = 10; bb = 15; cc = 21; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지)        
            if (rr == 2) { aa = 22; bb = 3; cc = 9; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지) 
            if (rr == 3) { aa = 20; bb = 14; cc = 8; dd = 0; ee = 5; } // small three (종, 망고, 오렌지)
            if (rr == 4) // contine three
            {
                aa = ss;
                if (aa > 24) aa = 1;
                bb = aa + 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
                if (cc > 24) cc = 1;
                dd = 0; ee = 2;
            }
        }
        if (rr > 4)
        {
            fruit = 18;
            TextBox1.Text = fruit.ToString();
            if (rr == 5) { aa = 12; bb = 16; cc = 4; dd = 0; ee = 1; }  // big three(77, 별, 수박)
            if (rr == 6) { aa = 11; bb = 17; cc = 5; dd = 0; ee = 5; }  // small three (77, 별, 수박)
            if (rr == 7) { aa = 1; bb = 7; cc = 13; dd = 19; ee = 4; }  // big four(사과)                       
            if (rr == 8) // contine four
            {
                aa = ss;
                if (aa > 24) aa = 1;
                bb = aa + 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
                if (cc > 24) cc = 1;
                dd = cc + 1;
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
                bet_coin = Convert.ToInt32(reader["bet_coin"].ToString());

                if (fruit != 6 && fruit != 18)
                {
                    coin = Convert.ToInt32(reader[fruit_name[fruit - 1]].ToString()) * fruit_rate[fruit - 1];
                    sql = "update betting21 set coin = " + coin + " where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[fruit - 1] + ";";
                }

                if (fruit == 6 || fruit == 18)
                {
                    lucky = 1;
                    if (aa != 0)
                    {
                        coin1 = Convert.ToInt32(reader[fruit_name[aa - 1]].ToString()) * fruit_rate[aa - 1];
                        sql = "update betting21 set coin = coin+" + coin1 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[aa - 1] + ";";
                    }
                    if (bb != 0)
                    {
                        coin2 = Convert.ToInt32(reader[fruit_name[bb - 1]].ToString()) * fruit_rate[bb - 1];
                        sql += "update betting21 set coin = coin+" + coin2 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[bb - 1] + ";";
                    }
                    if (cc != 0)
                    {
                        coin3 = Convert.ToInt32(reader[fruit_name[cc - 1]].ToString()) * fruit_rate[cc - 1];
                        sql += "update betting21 set coin = coin+" + coin3 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[cc - 1] + ";";
                    }
                    if (dd != 0)
                    {
                        coin4 = Convert.ToInt32(reader[fruit_name[dd - 1]].ToString()) * fruit_rate[dd - 1];
                        sql += "update betting21 set coin = coin+" + coin4 + ", lucky = 1 where round=" + round + " and user_id =" + userid + " and kinds_id =" + kinds_id[dd - 1] + ";";
                    }
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

                TextBox6.Text = "Luck번호" + aa.ToString() + "," + bb.ToString() + "," + cc.ToString() + "," + dd.ToString();

            }
            //sql = "INSERT INTO betting22(user_id,kinds_id,round,bet_coin,coin,lucky) SELECT user_id,kinds_id,round,bet_coin,coin-bet_coin,lucky FROM betting21 WHERE round=" + round + "";
            sql = "INSERT INTO roundend(type,round) values(1, " + round + ")";
            mconn1.Execute(sql);

            reader.Close();
            mconn.close();
        }
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

    protected void generate_luck()
    {
        Random random = new Random();
        ss = random.Next(24) + 1;
        rr = random.Next(5000) + 1;
        rb = random.Next(7500) + 1;
        
        if (fruit == 6)
        {
            if (rr > 4900) { aa = 10; bb = 15; cc = 21; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지)        
            else if (rr > 4800 && rr <= 4900) { aa = 22; bb = 3; cc = 9; dd = 0; ee = 1; }  // big three(종, 망고, 오렌지) 
            else if (rr > 3811 && rr <= 4800) { aa = 20; bb = 14; cc = 8; dd = 0; ee = 5; } // small three (종, 망고, 오렌지)
            else if (rr == 3811) // contine three
            {
                aa = ss;
                if (aa > 24) aa = 1;
                bb = aa + 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
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
                if (aa > 24) aa = 1;
                bb = aa + 1;
                if (bb > 24) bb = 1;
                cc = bb + 1;
                if (cc > 24) cc = 1;
                dd = cc + 1;
                if (dd > 24) dd = 1;
                ee = 3;
            }
        }        
    }
    protected void generate_dice()
    {
        Random random = new Random();
        dice1 = random.Next(6) + 1;
        dice2 = random.Next(6) + 1;
        dice3 = random.Next(6) + 1;

        if ((dice1 + dice2 + dice3) > 10) { taisai = 1; }
        else taisai = 0;

        if ((dice1 + dice2 + dice3) % 2 != 0) { evodd = 1; }
        else evodd = 0;
    }

    protected void Profit_calc()
    {
        mconn1.open();
        string sql = "select user_id,round,bet_coin,bar,seven,star,watermelon,bell,lemon,orange,apple,doub,singl,big,small from betting2 where round = " + round + " ";
        MySqlDataReader reader = mconn1.GetReader(sql);

        if (!reader.HasRows)
        {
            Profit_state = 1;
            
        }
        else
        {
            int i = 0;
            while (i < 10)
            {
                int tcoin = 0;
                bet_coin = 0;

                while (reader.Read())
                {
                    int userid = Convert.ToInt32(reader["user_id"].ToString());
                    if (fruit != 6 && fruit != 18)
                    {
                        coin = Convert.ToInt32(reader[fruit_name[fruit - 1]].ToString()) * fruit_rate[fruit - 1];
                    }

                    if (fruit == 6 || fruit == 18)
                    {
                        if (aa != 0) coin = Convert.ToInt32(reader[fruit_name[aa - 1]].ToString()) * fruit_rate[aa - 1];
                        if (bb != 0) coin += Convert.ToInt32(reader[fruit_name[bb - 1]].ToString()) * fruit_rate[bb - 1];
                        if (cc != 0) coin += Convert.ToInt32(reader[fruit_name[cc - 1]].ToString()) * fruit_rate[cc - 1];
                        if (dd != 0) coin += Convert.ToInt32(reader[fruit_name[dd - 1]].ToString()) * fruit_rate[dd - 1];
                    }

                    double buf = 0;
                    if (taisai == 0) { buf += Convert.ToInt32(reader["small"].ToString()) * dice_rate; }
                    else { buf += Convert.ToInt32(reader["big"].ToString()) * dice_rate; }

                    if (evodd == 0) { buf += Convert.ToInt32(reader["doub"].ToString()) * dice_rate; }
                    else { buf += Convert.ToInt32(reader["singl"].ToString()) * dice_rate; }

                    coin += Convert.ToInt32(buf);
                    bet_coin += Convert.ToInt32(reader["bet_coin"].ToString());
                    tcoin += coin;

                }

                if (tcoin < (bet_coin - (bet_coin / profit_rate) + fcoin))
                {
                    Profit_state = 1;
                    break;
                }
                else
                {
                    fruit = det_slot();
                    if (fruit == 6 || fruit == 18) generate_luck();
                    generate_dice();
                    Profit_state = 0;
                }
                i += 1;
            }
        }         
             
        reader.Close();
        mconn1.close();
        
    }

}