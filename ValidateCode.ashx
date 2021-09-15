﻿<%@ WebHandler Language="C#" Class="ValidateCode" %>

using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Web.SessionState;

public class ValidateCode : IHttpHandler, IRequiresSessionState
{
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    public void ProcessRequest(HttpContext context)
    {
        context.Response.Buffer = true;
        context.Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1.0);
        context.Response.Expires = 0;
        context.Response.CacheControl = "no-cache";
        context.Response.AppendHeader("Pragma", "No-Cache");
        int num1 = 4;
        string[] strArray = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,m,n,p,q,r,s,t,u,w,x,y,z".Split(',');
        string str1 = "";
        int num2 = -1;
        Random random = new Random();
        for (int index1 = 0; index1 < num1; ++index1)
        {
            if (num2 != -1)
                random = new Random(num2 * index1 * (int)DateTime.Now.Ticks);
            int index2 = random.Next(33);
            while (num2 == index2)
                index2 = random.Next(33);
            num2 = index2;
            str1 = str1 + strArray[index2];
        }
        string str2 = str1;
        context.Session["webcheckcode"] = (object)str2;
        Bitmap bitmap = new Bitmap(str2.Length * 14, 20);
        Graphics graphics = Graphics.FromImage((Image)bitmap);
        Font font = new Font("Arial ", 10f);
        Brush brush1 = (Brush)new SolidBrush(Color.Black);
        Brush brush2 = (Brush)new SolidBrush(Color.FromArgb(166, 8, 8));
        graphics.Clear(ColorTranslator.FromHtml("#99C1CB"));
        char[] chArray = str2.ToCharArray();
        for (int index = 0; index < chArray.Length; ++index)
        {
            if ((int)chArray[index] >= 48 && (int)chArray[index] <= 57)
                graphics.DrawString(chArray[index].ToString(), font, brush2, (float)(3 + index * 12), 3f);
            else
                graphics.DrawString(chArray[index].ToString(), font, brush1, (float)(3 + index * 12), 3f);
        }
        MemoryStream memoryStream = new MemoryStream();
        bitmap.Save((Stream)memoryStream, ImageFormat.Jpeg);
        context.Response.Cache.SetNoStore();
        context.Response.ClearContent();
        context.Response.ContentType = "image/Jpeg";
        context.Response.BinaryWrite(memoryStream.ToArray());
        graphics.Dispose();
        bitmap.Dispose();
    }

}