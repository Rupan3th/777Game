﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for mysql
/// </summary>
public class mysql
{
    MySqlConnection mconn = null;

    public mysql()
    {
        //
        // TODO: Add constructor logic here
        //
        String strConnect = ConfigurationManager.ConnectionStrings["mysql_connectstring"].ToString();
        mconn = new MySqlConnection( strConnect );
    }

    public mysql( bool bWithOpen )
    {
        //
        // TODO: Add constructor logic here
        //
        String strConnect = ConfigurationManager.ConnectionStrings["mysql_connectstring"].ToString();
        mconn = new MySqlConnection(strConnect);
        try
        {
            mconn.Open();
        }
        catch (Exception ex) { }        
    }

    ~mysql()
    {
    }


    public MySqlConnection ConnPtr()
    {
        return mconn;
    }

    public string GetValue(String sql, out String strRet)
    {
        string strVal = "";
        MySqlCommand cmd = new MySqlCommand(sql, mconn);
        mconn.Open();
        MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (rdr.Read())
        {
            if (rdr[0] != null && rdr[0].ToString().Length > 0) strVal = rdr[0].ToString();
        }
        rdr.Close();
        mconn.Close();
        strRet = strVal;
        return strVal;
    }

    public void open()
    {
        mconn.Open();
    }

    public void close()
    {
        mconn.Close();
    }
    public MySqlDataReader GetReader(String sql)
    {
        MySqlCommand cmd = new MySqlCommand(sql, mconn);
        MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return rdr;
    }

    public int GetValue(String sql, out int nRet)
    {
        int nVal = -1;
        MySqlCommand cmd = new MySqlCommand(sql, mconn);
        mconn.Open();
        MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        if (rdr.Read())
        {
            if (rdr[0] == null
                || rdr[0].ToString().Length <= 0
                || !int.TryParse(rdr[0].ToString(), out nVal))
            {
                nVal = -1;
            }
        }
        rdr.Close();
        mconn.Close();
        nRet = nVal;
        return nVal;
    }

    public int GetValue(String sql, out int nRet, MySqlConnection conn)
    {
        int nVal = -1;
        MySqlCommand cmd = new MySqlCommand(sql, conn);
        MySqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.Default);
        if (rdr.Read())
        {
            if (rdr[0] == null
                || rdr[0].ToString().Length <= 0
                || !int.TryParse(rdr[0].ToString(), out nVal))
            {
                nVal = -1;
            }
        }
        rdr.Close();
        nRet = nVal;
        return nVal;
    }

    public int Execute(String sql)
    {
        int nRows = 0;
        MySqlCommand cmd = new MySqlCommand(sql, mconn);
        mconn.Open();        
        nRows = cmd.ExecuteNonQuery();
        
        mconn.Close();
        return nRows;
    }

    public DataTable FillDataTable( DataTable dt, String sql )
    {
        dt.Clear();
        mconn.Open();
        var da = new MySqlDataAdapter(sql, mconn);
        da.Fill(dt);
        mconn.Close();
        return dt;
    }
}