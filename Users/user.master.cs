using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_user : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserGroup"] != null)
        {
            int UserGroup = int.Parse(Session["UserGroup"].ToString());

            if (UserGroup != 2)
            {
                Response.Redirect("../Default.aspx");
            }
        }
        else
        {
            Response.Redirect("../Default.aspx");
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["FullName"] = null;
        Session["UserGroup"] = null;
        Session["UserID"] = null;
        Response.Redirect("../Default.aspx");
    }
    protected void BtnChangePassword_Click(object sender, EventArgs e)
    {
        int userid1=int.Parse(Session["UserID"].ToString()); 
        if (txtNpass.Text == txtRNpass.Text)
        {
            if (BLLUsers.checckUserPassword(userid1, txtOpass.Text))
            {
                BLLUsers.ChangeUserPassword(txtNpass.Text, userid1);
                lblCpassword.Text = "Pasword successfully changed";
            }
            else
            {
                lblCpassword.Text = "Old is Password Incorrect";
            }
        }
        else
        {
            lblCpassword.Text = "Password Does not Match";
        }
        shownotification();
    }
    protected void lnkChangePassword_Click(object sender, EventArgs e)
    {
        shownotification();
    }
    public void shownotification()
    {
        ////GlobalFunctions.RegisterJSCode()
        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //sb.Append(@"<script language='javascript'>");
        //sb.Append(@"alert("+text+")");
        //sb.Append(@"</");
        //sb.Append(@"script>");
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowChangePassword(1)", true);
    }
}
