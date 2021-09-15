﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class media_mobile_mplay : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            lblSubject.Text = GetSubject(Request["id"].ToString());
            lblBefore.Text = GetBefore(Request["id"].ToString());
            lblAmount.Text = GetAmount(Request["id"].ToString());

            if (!Page.IsPostBack)
            {//process coin for cash logic.
                String sid = "-1", sCoin = "", sClss = "";
                if (Session["user_id"] != null) sid = Session["user_id"].ToString();
                sCoin = GetCoin(Request["id"].ToString());
                sClss = GetClssId(Request["id"].ToString());

                if (sCoin.Length > 0 && int.Parse(sCoin) > 0)
                    msql.Execute("insert into betting3(user_id, type, title_id, coin) values(" + sid + ", " + sClss + ", " + Request["id"].ToString() + ", " + sCoin + ")");
            }
        }
    }
    string GetSubject(string id)
    {
        string strtitle = "";
        msql.GetValue("select mvname from movie where id=" + id, out strtitle);
        return strtitle;
    }

    string GetCoin(string id)
    {
        string strVal = "";
        msql.GetValue("select coin from movie where id=" + id, out strVal);
        return strVal;
    }

    string GetPath(string id)
    {
        string strpath = "";
        msql.GetValue("select pathname from movie where id=" + id, out strpath);
        return strpath;
    }

    string GetVUrl(string id)
    {
        string strvurl = "";
        msql.GetValue("select v_url from movie where id=" + id, out strvurl);
        return strvurl;
    }
    string GetClssId(string id)
    {
        string strVal = "";
        msql.GetValue("select clss_id from movie where id=" + id, out strVal);
        return strVal;
    }
    string GetAmount(string id)
    {
        string strCalls = "";
        msql.GetValue("select rcnt from movie where id=" + id, out strCalls);
        return strCalls;
    }

    string GetBefore(string id)
    {
        String strDate = "";
        msql.GetValue("select regdate from movie where id=" + id, out strDate);
        strDate = utility.GetDateFormNow(strDate);
        return strDate;
    }

    float fWidth = 350f;
    public Unit GetHaoWidth(string strHao, String strBad)
    {
        int nHao = int.Parse(strHao);
        int nBad = int.Parse(strBad);
        if (nHao == 0 && nBad == 0) return 0;
        float fIntval = fWidth / (float)(nHao + nBad);

        return (int)(fIntval * nHao);
    }

    public Unit GetBadWidth(string strHao, String strBad)
    {
        int nHao = int.Parse(strHao);
        int nBad = int.Parse(strBad);
        if (nHao == 0 && nBad == 0) return 0;
        float fIntval = fWidth / (float)(nHao + nBad);

        return (int)(fIntval * nBad);
    }

    public void PlacePlayer()
    {
        if (Request["id"] == null)
        {
            Response.Write("");
            return;
        }
        String strPath = GetPath(Request["id"].ToString());
        String strVUrl = GetVUrl(Request["id"].ToString());

        string strPlayerTag = @"<script type='text/javascript'>
                                        WowzaPlayer.create('playerElement',
                                            {
                                                'license': '"+ ConfigurationManager.AppSettings["WowzaLicense"].ToString() + @"',
                                                'title': 'Demo',
                                                'description': 'Demo',
                                                'sourceURL': '" + global.mWowzaVodUrl + strPath + "/mp4:" + strVUrl + @"/playlist.m3u8',
                                                'autoPlay': false,
                                                'volume': '75',
                                                'mute': false,
                                                'loop': false,
                                                'audioOnly': false,
                                                'uiShowQuickRewind': true,
                                                'uiQuickRewindSeconds': '30'
                                            }
                                        );
                                    </script>";

        Response.Write(strPlayerTag);
    }
    protected void btnDownload_Click(object sender, EventArgs e)
    {
        if (Request["id"] == null) return;

        String strSubject = GetSubject(Request["id"].ToString());
        String strVUrl = GetVUrl(Request["id"].ToString());
        String strDownload = global.mDownloadUrl + "/?filename=" + Uri.EscapeDataString(strSubject + "/" + strVUrl);

        Response.Redirect(strDownload);
    }
}