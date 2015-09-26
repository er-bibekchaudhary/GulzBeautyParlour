using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BllService
/// </summary>
public class BllService
{
	public BllService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void CreateService(ServiceInfo Service)
    {
        SqlConnection Con = ConnectionHelper.GetConnection();
        string Sp = "Usp_Create_Service";
        SqlCommand cmd = new SqlCommand(Sp, Con);
        cmd.Parameters.Add(new SqlParameter("@ServiceName", Service.ServiceName));
        cmd.Parameters.Add(new SqlParameter("@CatID", Service.CategoryID));
        cmd.Parameters.Add(new SqlParameter("@ServicePrice", Service.rate));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static void UpdateService(ServiceInfo Service)
    {
        SqlConnection Con = ConnectionHelper.GetConnection();
        string Sp = "Usp_Update_Service";
        SqlCommand cmd = new SqlCommand(Sp, Con);
        cmd.Parameters.Add(new SqlParameter("@serviceID", Service.ServiceID));
        cmd.Parameters.Add(new SqlParameter("@ServiceName", Service.ServiceName));
        cmd.Parameters.Add(new SqlParameter("@CatID", Service.CategoryID));
        cmd.Parameters.Add(new SqlParameter("@ServicePrice", Service.rate));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public static ServiceInfo GetServicebyID(int id)
    {
        ServiceInfo _service = new ServiceInfo();
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_ById_Service";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@ServID", id));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            _service.ServiceName= (_Reader["ServiceName"].ToString());
            _service.ServiceID = int.Parse(_Reader["ServiceID"].ToString());
            _service.CategoryID = int.Parse(_Reader["CategoryID"].ToString());
            _service.rate = int.Parse(_Reader["ServicePrice"].ToString());
            return _service;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    public static DataTable GetServiceByCategory(int catID)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Get_Service_ByCatID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@CatID", catID));
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }
    public static DataTable GetAllService()
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Get_AllService";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public static void DeleteService(int ServiceID)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_delete_Service";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@serviceID", ServiceID));
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
    }

    
  
}