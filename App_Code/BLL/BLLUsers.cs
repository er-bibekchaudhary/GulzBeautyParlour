using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for BLLUsers
/// </summary>
public class BLLUsers
{
	// Create new User
	 public static void CreateUser(UserInfo User)
    {
        SqlConnection Con = ConnectionHelper.GetConnection();
        string Sp = "Usp_Create_User";
        SqlCommand cmd = new SqlCommand(Sp, Con);
        cmd.Parameters.Add(new SqlParameter("@UserName", User.UserName));
        cmd.Parameters.Add(new SqlParameter("@FirstName", User.FirstName));
        cmd.Parameters.Add(new SqlParameter("@LastName", User.LastName));
        cmd.Parameters.Add(new SqlParameter("@Password", User.Password));
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

    //Checking for user Avibality
     public static bool CheckUserName(string UserName)
     {
         SqlConnection con = ConnectionHelper.GetConnection();
         string queery = "Select * from TblUsers where UserNameLower='" + UserName.ToLower() + "'";

         SqlCommand cmd = new SqlCommand(queery, con);

         DataTable dt = new DataTable();
         SqlDataAdapter da = new SqlDataAdapter(cmd);
         da.Fill(dt);
         if (dt.Rows.Count == 0)
             return false;
         else
             return true;
     }


    //Get all users
    public static DataTable getallUser()
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_GetAll_User";
        SqlCommand cmd = new SqlCommand(sp,con);
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    //Get User by ID
    public static UserInfo getUserByID(int id)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_GetUser_ByID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@ID",id));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            UserInfo _User = new UserInfo();
            _User.UserName = (_Reader["UserName"].ToString());
            _User.FirstName = (_Reader["FirstName"].ToString());
            _User.LastName = (_Reader["LastName"].ToString());
            return _User;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Edit User 
    public static void EditUser(UserInfo User)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "USP_Update_User";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@UserID", User.UserID));
        cmd.Parameters.Add(new SqlParameter("@UserName", User.UserName));
        cmd.Parameters.Add(new SqlParameter("@FirstName", User.FirstName));
        cmd.Parameters.Add(new SqlParameter("@LastName", User.LastName));
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

    //Delete User
    public static void DeleteUser(int id)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string querry = "delete from tblUsers where UserID=" + id;
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

    //change Admin Password
    public static void ChangeAdminPassword(string NewPassword)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string queery = "update Admin set AdminPassword='" + NewPassword + "' Where AdminName = 'Admin' ";

        SqlCommand cmd = new SqlCommand(queery, con);
        cmd.ExecuteNonQuery();  
    }

    //Check Admin password
    public static bool checckAdminPassword(string Password)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string queery = "select AdminPassword from Admin where AdminName='Admin'";
        SqlCommand cmd = new SqlCommand(queery, con);
       
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            if (Password == _Reader["AdminPassword"].ToString())
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //Check user password
    public static bool checckUserPassword(int userid, string Password)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string queery = "select Password from TblUsers where UserID="+userid;
        SqlCommand cmd = new SqlCommand(queery, con);

        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            if (Password == _Reader["Password"].ToString())
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    //change user password
    public static void ChangeUserPassword(string NewPassword, int userid)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string queery = "update TblUsers set Password='" + NewPassword + "' Where UserID = "+userid;

        SqlCommand cmd = new SqlCommand(queery, con);
        cmd.ExecuteNonQuery();
    }

    //login user
    public static UserInfo UserLogin(string Username, string Password)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_UserLogin";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@username", Username));
        cmd.Parameters.Add(new SqlParameter("@password", Password));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            UserInfo _User = new UserInfo();
            _User.UserID = int.Parse(_Reader["UserID"].ToString());
            _User.FullName = (_Reader["Name"].ToString());
            _User.UserGroupID = int.Parse(_Reader["usersroleID"].ToString());
            return _User;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}