
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        string username = txtUserName.Text;
        string password = txtPassword.Text;
        try
        {
            UserInfo _user = BLLUsers.UserLogin(username, password);

            //admin login
            if (_user.UserGroupID == 1)
            {
                Session["FullName"] = _user.FullName;
                Session["UserGroup"] = _user.UserGroupID;
                Session["UserID"] = _user.UserID;
                Response.Redirect("Admin/Services.aspx");
            }
            //user login
            else if (_user.UserGroupID == 2)
            {
                Session["FullName"] = _user.FullName;
                Session["UserGroup"] = _user.UserGroupID;
                Session["UserID"] = _user.UserID;
                Response.Redirect("Users/Billing.aspx");
            }
            //incorrect username or password
            else if (_user.UserGroupID == 0)
            {
                lblMessage.Text = _user.FullName;
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        
    }
    
}