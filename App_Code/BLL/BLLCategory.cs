using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for BLLCategory
/// </summary>
public class BLLCategory
{
    // Create new Category
    public static void CreateCategory(string cat)
    {
        SqlConnection Con = ConnectionHelper.GetConnection();
        string Sp = "Usp_Create_Category";
        SqlCommand cmd = new SqlCommand(Sp, Con);
        cmd.Parameters.Add(new SqlParameter("@Category", cat));
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

    //Checking for Category Avibality
    public static bool CheckCategoryName(string CatName)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string queery = "Select * from TblCategory  where lower(categoryName)='" + CatName.ToLower() + "'";

        SqlCommand cmd = new SqlCommand(queery, con);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        if (dt.Rows.Count == 0)
            return true;
        else
            return false;
    }


    //Get all Category
    public static DataTable getallCategory()
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Get_Category";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }


    //Edit Category 
    public static void EditCategory(string Name, int ID)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_Update_Category";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@catID", ID));
        cmd.Parameters.Add(new SqlParameter("@catName", Name));
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

    //Delete Category
    public static void DeleteCategory(int id)
    {
        SqlConnection con = ConnectionHelper.GetConnection();
        string querry = "delete from TblCategory where categoryid="+id;
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

    public static string GetCategoryByID(int id)
    {
        string CategoryName;
        SqlConnection con = ConnectionHelper.GetConnection();
        string sp = "Usp_get_CategoryByID";
        SqlCommand cmd = new SqlCommand(sp, con);
        cmd.Parameters.Add(new SqlParameter("@catid", id));
        cmd.CommandType = CommandType.StoredProcedure;
        try
        {
            SqlDataReader _Reader = cmd.ExecuteReader();
            _Reader.Read();

            CategoryName = (_Reader["categoryName"].ToString());
            return CategoryName;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}