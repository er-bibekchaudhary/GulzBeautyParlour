using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_UserMgnt : System.Web.UI.Page
{

    static int UserID;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PnlAddUser.Visible = true;
            PnlEditUsers.Visible = false;
            PnlChngAdminPW.Visible = false;
            UserID = 0;
        }

    }
    

    //Load Users Full Name to Repeater
    protected void loadUsers()
    {
        rptrUsers.DataSource = BLLUsers.getallUser();
        rptrUsers.DataBind();
    }

    //Show panel to add new user 
    protected void LnkAddUsers_Click(object sender, EventArgs e)
    {
        PnlAddUser.Visible = true;
        PnlEditUsers.Visible = false;
        PnlChngAdminPW.Visible = false;
        lblMessage.Text = "";
    }

    //Show panel to Edit users
    protected void LnkEditUsers_Click(object sender, EventArgs e)
    {
        PnlAddUser.Visible = false;
        PnlEditUsers.Visible = true;
        PnlChngAdminPW.Visible = false;
        lblEMessage.Text = "";
        loadUsers();
    }

    //Show panel to change Admin Password
    protected void LnkChngPassword_Click(object sender, EventArgs e)
    {
        PnlAddUser.Visible = false;
        PnlEditUsers.Visible = false;
        PnlChngAdminPW.Visible = true;
        lblCpassword.Text = "";
    }

    //Add new user to system
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int flag = 0;
        if (flag == 0)
        {
            if (txtUserName.Text == "")
            {
                lblMessage.Text = "Enter Your UserName";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (txtFirstName.Text == "")
            {
                lblMessage.Text = "Enter Your First Name";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (txtLastName.Text == "")
            {
                lblMessage.Text = "Enter Your Last Name";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (txtPassword.Text == "")
            {
                lblMessage.Text = "Enter Password";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (txtConPassword.Text == "")
            {
                lblMessage.Text = "Conform Password Field is Empty";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (BLLUsers.CheckUserName(txtUserName.Text))
            {
                lblMessage.Text = "UserName already Exists";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            if (txtPassword.Text != txtConPassword.Text)
            {
                flag = 1;
                lblMessage.Text="Password Doesnt Match";
            }
        }

        if (flag == 0)
        {
            UserInfo _user = new UserInfo();
            _user.UserName = txtUserName.Text;
            _user.FirstName = txtFirstName.Text;
            _user.LastName = txtLastName.Text;
            _user.Password = txtPassword.Text;

            try
            {
                BLLUsers.CreateUser(_user);
                lblMessage.Text = "User Successfully Created";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
            }
        }
    }

    //Load users in Edit panel
    protected void btnLoad_Click(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument.ToString());
        UserID = id;

        UserInfo _user = BLLUsers.getUserByID(id);
        txtFnameEdit.Text = _user.FirstName;
        txtLnameEdit.Text = _user.LastName;
        txtUnameEdit.Text = _user.UserName;
    }

    //Reset Fields in Add Panel
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtFirstName.Text="";
        txtLastName.Text="";
        lblEMessage.Text = "";
    }

    //Reset User Passwords
    protected void btnResetPassword_Click(object sender, EventArgs e)
    {
        BLLUsers.ChangeUserPassword("password123", UserID);
        lblEMessage.Text = "New Password is \"password123\"";
    }

    //Delete users
    protected void btnDelUser_Click(object sender, EventArgs e)
    {
        BLLUsers.DeleteUser(UserID);
        lblEMessage.Text = "User Succesfully Deleted";
        txtFnameEdit.Text = "";
        txtLnameEdit.Text = "";
        txtUnameEdit.Text = "";
        loadUsers();
    }

    //Edit user table
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        UserInfo _user = new UserInfo();
        _user.UserID = UserID;
        _user.UserName = txtUnameEdit.Text;
        _user.FirstName = txtFnameEdit.Text;
        _user.LastName = txtLnameEdit.Text;

        try
        {
            BLLUsers.EditUser(_user);
            lblEMessage.Text = "User Succesfully Changed";

            loadUsers();
        }
        catch (Exception ex)
        {
            lblEMessage.Text = ex.Message;
        }
    }

    //Change Admin Password
    protected void BtnChangeAdmin_Click(object sender, EventArgs e)
    {
        if (txtNpass.Text == txtRNpass.Text)
        {
            if (BLLUsers.checckAdminPassword(txtOpass.Text))
            {
                BLLUsers.ChangeAdminPassword(txtOpass.Text);
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
    }

    public void shownotification()
    {
        ////GlobalFunctions.RegisterJSCode()
        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //sb.Append(@"<script language='javascript'>");
        //sb.Append(@"alert("+text+")");
        //sb.Append(@"</");
        //sb.Append(@"script>");
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowNotification(1)", true);
    }
}
   