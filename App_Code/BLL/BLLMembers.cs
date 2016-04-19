using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for BLLMembers
/// </summary>
public class BLLMembers
{
   	// Create new Member
	 public static void CreateMember(MemberInfo Member)
    {
        SqlConnection Con = ConnectionHelper.GetConnection();
        string Sp = "Usp_Create_Member";
        SqlCommand cmd = new SqlCommand(Sp, Con);
        cmd.Parameters.Add(new SqlParameter("@FirstName", Member.FirstName));
        cmd.Parameters.Add(new SqlParameter("@LastName", Member.LastName));
        cmd.Parameters.Add(new SqlParameter("@Address", Member.Address));
        cmd.Parameters.Add(new SqlParameter("@PhoneNumber", Member.PhoneNumber));
        cmd.Parameters.Add(new SqlParameter("@CreatedDate", Member.CreatedDate));
        cmd.Parameters.Add(new SqlParameter("@ValidUpto", Member.ValidUpto));
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


    //Get all users
    public static DataTable getallMember()
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_GetAll_Member";
        SqlCommand cmd = new SqlCommand(sp,con);
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
        //List<MemberInfo> lstMembers = new List<MemberInfo>();

        //SqlDataReader _Reader = cmd.ExecuteReader();
        //try
        //{
        //    while (_Reader.Read())
        //    {
        //        MemberInfo _Member = new MemberInfo();
        //        _Member.MemberId = int.Parse(_Reader["MemberId"].ToString());
        //        _Member.FirstName = (_Reader["FirstName"].ToString());
        //        _Member.LastName = (_Reader["LastName"].ToString());
        //        _Member.Address = (_Reader["Address"].ToString());
        //        _Member.PhoneNumber = (_Reader["PhoneNumber"].ToString());
        //        _Member.CreatedDate = Convert.ToDateTime(_Reader["CreatedDate"].ToString());
        //        _Member.ValidUpto = Convert.ToDateTime(_Reader["ValidUpto"].ToString());
        //        lstMembers.Add(_Member);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}
        
        //return lstMembers;
    }


    //Get Member by ID
    public static MemberInfo getMemberByID(int id)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_GetMember_ByID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@ID",id));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            MemberInfo _Member = new MemberInfo();
            _Member.FirstName = (_Reader["FirstName"].ToString());
            _Member.LastName = (_Reader["LastName"].ToString());
            _Member.Address = (_Reader["Address"].ToString());
           _Member.PhoneNumber = (_Reader["PhoneNumber"].ToString());
           _Member.CreatedDate = Convert.ToDateTime(_Reader["CreatedDate"].ToString());
           _Member.ValidUpto = Convert.ToDateTime(_Reader["ValidUpto"].ToString());
            return _Member;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Edit Member 
    public static void EditMember(MemberInfo Member)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "USP_Update_Member";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@MemberID", Member.MemberId));
        cmd.Parameters.Add(new SqlParameter("@FirstName", Member.FirstName));
        cmd.Parameters.Add(new SqlParameter("@LastName", Member.LastName));
        cmd.Parameters.Add(new SqlParameter("@Address", Member.Address));
        cmd.Parameters.Add(new SqlParameter("@PhoneNumber", Member.PhoneNumber));
        cmd.Parameters.Add(new SqlParameter("@CreatedDate", Member.CreatedDate));
        cmd.Parameters.Add(new SqlParameter("@ValidUpto", Member.ValidUpto));
        cmd.CommandType=CommandType.StoredProcedure;

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            throw ex;
        }
    }

    //Delete Member
    public static void DeleteMember(int id)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string querry = "delete from tblMembers where MemberID=" + id;
        SqlCommand cmd = new SqlCommand(querry, con);

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