using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class media_mobile_ptview : System.Web.UI.Page
{
    mysql msql = new mysql();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["id"] != null)
        {
            lblSubject.Text = GetSubject(Request["id"].ToString());
            hfpathname.Value = GetPath(Request["id"].ToString());
            lblBefore.Text = GetBefore(Request["id"].ToString());
            lblAmount.Text = GetAmount(Request["id"].ToString());
        }
    }
    string GetAmount(string id)
    {
        string strCalls = "";
        msql.GetValue("select rcnt from photo where id=" + id, out strCalls);
        return strCalls;
    }

    string GetBefore(string id)
    {
        String strDate = "";
        msql.GetValue("select regdate from photo where id=" + id, out strDate);
        strDate = utility.GetDateFormNow(strDate);
        return strDate;
    }
    public string GetImgSrcEx(string strType, string fname)
    {
        String strUrl = global.mMultiUploadUrl + "/?type=" + strType + "&name=" + Uri.EscapeUriString(hfpathname.Value) + "&url=" + Uri.EscapeUriString(fname);
        return strUrl;
    }

    string GetSubject(string id)
    {
        string strtitle = "";
        msql.GetValue("select ptname from photo where id=" + id, out strtitle);
        return strtitle;
    }

    string GetPath(string id)
    {
        string strpath = "";
        msql.GetValue("select pathname from photo where id=" + id, out strpath);
        return strpath;
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
}