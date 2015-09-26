using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectionHelper
/// </summary>
public class ConnectionHelper
{
    public static string GetConnectionString()
    {
        string ConStr = ConfigurationManager.ConnectionStrings["GBPConnectionString"].ConnectionString;
        return ConStr;

    }

    public static SqlConnection GetConnection()
    {
        SqlConnection SqlC = new SqlConnection();
        SqlC.ConnectionString =ConnectionHelper.GetConnectionString();
        SqlC.Open();
        return SqlC;
    }
}