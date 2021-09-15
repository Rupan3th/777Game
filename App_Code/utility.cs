﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.SessionState;
using System.Web.Security;
using System.Configuration;

/// <summary>
/// Summary description for utility
/// </summary>
public class utility
{
    public enum UPLOAD_TYPE { MOVIE, IMAGE, NOVEL, ALL_TYPE };
    public static string[][] mMediaKind = new string[][]{ new string[]{"Life", "Sport", "Adverse", "Film"}//MOVIE kind
                                                        , new string[]{"Nature", "Animals", "Plants", "Fall", "Flowers" }//IMAGE kind
                                                        , new string[]{"Love Story", "War"}//NOVEL KIND
                                                        , new string[]{"Reversed"} };//Reserved
    public utility()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string CreateMD5(string input)
    {
        // Use input string to calculate MD5 hash
        using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
        {
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            // Convert the byte array to hexadecimal string
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }
    }

    public static void DestorySessionForTrial(HttpSessionState sess, System.Web.UI.Page pg)
    {
        if(sess != null 
            && sess["timeout"] != null
            && sess["logindt"] != null)
        {
            DateTime dt = DateTime.Parse(sess["logindt"].ToString());
            dt = dt.AddMilliseconds(double.Parse(sess["timeout"].ToString()));
            if(dt.CompareTo(DateTime.Now) <= 0)
            {
                sess.Clear();
                sess.RemoveAll();
                sess.Abandon();

                FormsAuthentication.SignOut();
                pg.Response.Redirect("~/login.aspx");
            }
        }
    }

    static public int GenerateRandom(int min, int max)
    {
        var seed = Convert.ToInt32(Regex.Match(Guid.NewGuid().ToString(), @"\d+").Value);
        return new Random(seed).Next(min, max);
    }

    static public int GetColumnIndexByName(GridView gv, string columnName)
    {
        for (int i = 0; i < gv.Columns.Count;  i++)
        {
            if(gv.Columns[i].HeaderText.CompareTo(columnName) == 0) return i;
        }
        return -1;
    }

    static public string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

    static public string GetCurrentTime()
    {
        String strTime = "";
        DateTime dt = DateTime.Now;
        strTime = String.Format("{0:0000}-{1:00}-{2:00} {3:00}:{4:00}:{5:00}", dt.Year, dt.Month, dt.Day, dt.Hour, dt.Minute, dt.Second);
        return strTime;
    }

    static public String FormatBigNum(String strNum)
    {
        String strVal = "";
        int nRest = strNum.Length%3;
        int nRepeat = strNum.Length / 3;
        strVal = strNum.Substring(0, nRest);
        for (int i = 0; i < nRepeat; i++)
        {
            strVal += " ";
            strVal += strNum.Substring(nRest+3*i, 3);
        }

        return strVal;
    }

    static public String ClearTaom(String str)
    {
        String strTemp = str.Replace("\'", "");
        return strTemp.Replace("\"", "");
    }

    static public void log(String strMsg)
    {
        //File.AppendAllText("d:\\log.txt", strMsg+"\r\n");
    }

    static public void initDdl(int n, DropDownList ddlClss)
    {
        string[] strList = mMediaKind[n];

        ddlClss.Items.Clear();
        for(int i=0; i<strList.Length; i++)
        {
            ddlClss.Items.Add(strList[i]);
        }
    }

    static public string SimplifedStr(String str, int nCnt)
    {
        if (str.Length > nCnt) return str.Substring(0, nCnt) + "...";
        else return str;
    }
    static public String GetDateFormNow(string strRegDate)
    {
        DateTime dt = DateTime.Parse(strRegDate);
        TimeSpan ts = DateTime.Now.Subtract(dt);
        int nDay = (int)ts.TotalHours / 24;
        return nDay.ToString();
    }

    static public string GetImgSrc(String strType, String sname, string path, String fname)
    {
        string sPath = path;
        if (path == null || path.Length <= 0) sPath = sname;
        String strUrl = global.mMultiUploadUrl + "/?type=" + strType + "&name=" + Uri.EscapeUriString(sname) + "&url=" + Uri.EscapeUriString(fname);
        return strUrl;
    }

    static public string GetInteresting(string strHao, string strBad)
    {
        int nTotal = int.Parse(strHao) + int.Parse(strBad);
        if (nTotal == 0) return "0%";
        float fHao = float.Parse(strHao);
        float f = (fHao / (float)nTotal) * 100.0f;
        String strRet = String.Format("{0:n1}%", f);
        return strRet;
    }

    static public bool IsValidateBy(string username, string ix)
    {
        string strMd5 = ix.Substring(0, ix.Length - 5);
        string orgStr = username + ix.Substring(ix.Length - 5);
        orgStr = CreateMD5(orgStr);
        if (orgStr.ToLower().CompareTo(strMd5.ToLower()) == 0) return true;

        return false;
    }

    static public void LivePlayer(HttpResponse Response)
    {
        string strPlayerTag = @"<script>
             $(document).ready(function () {
                player.setup({
                    playlist: [{
                        'sources': [
                            {
                                'file': '" + ConfigurationManager.AppSettings["WowzaLiveUrl"].ToString() + @"',
                                //'file': 'rtsp://222.169.19.149:1935/mylive/stream',                                
                            }
                            
                        ]
                    }],
                    width: 202,
                    height: 210,
                    autostart: 'true',
                    stretching: 'exactfit',    
                    allowfullscreen: 'false'
                    //controls: 'false',
                    //hlshtml: 'true',
                    //mute: 'true'
                });
              });   
           
           </script>";

        Response.Write(strPlayerTag);

    }

    static public void LivePlayer_mobile(HttpResponse Response)
    {
        string strPlayerTag = @"<script id='player_embed' src='" + ConfigurationManager.AppSettings["WowzaLivecloud"].ToString() + @"' type='text/javascript'></script>";

        Response.Write(strPlayerTag);

    }
}
