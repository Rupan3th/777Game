﻿<%@ WebHandler Language="C#" Class="HaoBad" %>

using System;
using System.Web;

public class HaoBad : IHttpHandler {
    mysql msql = new mysql();

    //id=2&hao=1, id=3&bad=2
    public void ProcessRequest (HttpContext context) {
        string strHao = "", strBad = "";
        int nWidth = 0;
        if (context.Request["type"] == null && context.Request["id"] == null && (context.Request["hao"] == null || context.Request["bad"] == null)) context.Response.Write("");
        else if (context.Request["type"] != null && context.Request["id"] != null )
        {
            string stype = context.Request["type"].ToString();
            if(context.Request["len"] != null)
                    fWidth = float.Parse( context.Request["len"].ToString() );

            if(context.Request["hao"] != null)
            {
                if(stype.CompareTo("movie") == 0 )
                {
                    msql.Execute("Update movie set hao=hao+1 where id=" + context.Request["id"].ToString());
                    msql.GetValue("select hao from movie where id="+context.Request["id"].ToString(), out strHao);
                    msql.GetValue("select bad from movie where id="+context.Request["id"].ToString(), out strBad);
                }
                else if(stype.CompareTo("image") == 0)
                {
                    msql.Execute("Update photo set hao=hao+1 where id=" + context.Request["id"].ToString());
                    msql.GetValue("select hao from photo where id="+context.Request["id"].ToString(), out strHao);
                    msql.GetValue("select bad from photo where id="+context.Request["id"].ToString(), out strBad);
                }

                nWidth = GetHaoWidth(strHao, strBad, true);
                context.Response.Write(nWidth.ToString());
            }
            else if(context.Request["bad"] != null)
            {
                if (stype.CompareTo("movie") == 0)
                {
                    msql.Execute("Update movie set bad=bad+1 where id=" + context.Request["id"].ToString());
                    msql.GetValue("select hao from movie where id=" + context.Request["id"].ToString(), out strHao);
                    msql.GetValue("select bad from movie where id=" + context.Request["id"].ToString(), out strBad);
                }
                else if (stype.CompareTo("image") == 0)
                {
                    msql.Execute("Update photo set bad=bad+1 where id=" + context.Request["id"].ToString());
                    msql.GetValue("select hao from photo where id=" + context.Request["id"].ToString(), out strHao);
                    msql.GetValue("select bad from photo where id=" + context.Request["id"].ToString(), out strBad);
                }

                nWidth = GetHaoWidth(strHao, strBad, false);
                context.Response.Write(nWidth.ToString());
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    float fWidth = 140f;
    public int GetHaoWidth(string strHao, String strBad, bool bHao)
    {
        int nHao = int.Parse(strHao);
        int nBad = int.Parse(strBad);
        if (nHao == 0 && nBad == 0) return 0;
        float fIntval = fWidth / (float)(nHao + nBad);


        if (bHao == true) return (int)(fIntval * nHao);
        return (int)(fIntval * nBad);
    }

}