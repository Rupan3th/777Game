using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for mssql
/// </summary>
public class mssql
{
    SqlConnection mconn = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());

	public mssql()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection ConnPtr()
    {
        return mconn;
    }

    public string GetValue(String sql, out String strRet)
    {
        string strVal = "";
        SqlCommand cmd = new SqlCommand( sql, mconn );
        mconn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
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
    public SqlDataReader GetReader( String sql )
    {
        SqlCommand cmd = new SqlCommand(sql, mconn);
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        return rdr;
    }

    public int GetValue(String sql, out int nRet)
    {
        int nVal = -1;
        SqlCommand cmd = new SqlCommand(sql, mconn) ;
        mconn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
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

    public int GetValue(String sql, out int nRet, SqlConnection conn)
    {
        int nVal = -1;
        SqlCommand cmd = new SqlCommand(sql, conn);
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.Default);
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
        SqlCommand cmd = new SqlCommand(sql, mconn);
        mconn.Open();
        nRows = cmd.ExecuteNonQuery();
        mconn.Close();
        return nRows;
    }
}
