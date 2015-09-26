using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLSales
/// </summary>
public class BLLSales
{
	public BLLSales()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DataTable GetMonthlyReport(int Month, int Year)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_get_MonthsDetails";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@month", Month));
        cmd.Parameters.Add(new SqlParameter("@year", Year));
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public static DataTable GetReportBydate(string date)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Get_SalesByDate";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@date", date));
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public static int saveBill(string customername, int userid,int discount, double totaAmount,double NetAmount)
    {
        
        using (var cmd = new SqlCommand("Usp_SaveBill", ConnectionHelper.GetConnection()))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@CustomerName",customername));
            cmd.Parameters.Add(new SqlParameter("@TotalAmount",totaAmount));
            cmd.Parameters.Add(new SqlParameter("@Discountpercent",discount));
            cmd.Parameters.Add(new SqlParameter("@NetAmount",NetAmount));
            cmd.Parameters.Add(new SqlParameter("@soldby",userid));

            try
            {
                SqlDataReader _Reader = cmd.ExecuteReader();
                _Reader.Read();
                int billid =int.Parse(_Reader["BillID"].ToString());
                return billid;
            }
            catch (Exception ex)
            {
                throw ex;
            }  
        }
    }

    public static void savesales(List<SellsInfo> sells, int billid)
    {
        foreach(SellsInfo _sells in sells)
        {
            using (var cmd = new SqlCommand("Usp_SaveSales", ConnectionHelper.GetConnection()))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@billid", billid));
                cmd.Parameters.Add(new SqlParameter("@Servicename", _sells.ServiceName));
                cmd.Parameters.Add(new SqlParameter("@Price", _sells.Rate));
                cmd.Parameters.Add(new SqlParameter("@qyt", _sells.Quantity));

                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
        
    }

    public static BillInfo getbillbyid(int id)
    {
        BillInfo _bill = new BillInfo();
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_getBillByBillID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@BillID", id));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            int userid = int.Parse(_Reader["SoldBy"].ToString());
            UserInfo _user = new UserInfo();
            try {
                _user = BLLUsers.getUserByID(userid);
            }
            catch (Exception ex)
            {
                _user.FirstName= "Hillary";
                _user.LastName="Duff";
            }


           _bill.BillID = int.Parse(_Reader["BillID"].ToString());
           _bill.CustomerName = _Reader["CustomerName"].ToString();
            _bill.DiscountAmount=int.Parse(_Reader["Discount"].ToString());
            _bill.NetAmount = int.Parse(_Reader["NetAmount"].ToString());
            _bill.TotalAmount = int.Parse(_Reader["TotalAmount"].ToString());
            _bill.SoldBy = _user.FirstName + " " + _user.LastName;
            _bill.salesDate = Convert.ToDateTime(_Reader["DateOfSales"].ToString());
           
            return _bill;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    } 

    public static DataTable getsells(int billid)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Get_SalesByBillID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@BillID", billid));
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

}