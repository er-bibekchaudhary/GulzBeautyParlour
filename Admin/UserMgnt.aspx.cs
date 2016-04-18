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
            AddUsers.Visible = true;
            EditUsers.Visible = false;
            ChngPassword.Visible = false;
            UserID = 0;
            lblCpassword.Text = "";
            lblEMessage.Text = "";
            lblMessage.Text = "";
        }
        loadUsers();
    }
    

    //Load Users Full Name to Repeater
    protected void loadUsers()
    {
        rptrUsers.DataSource = BLLUsers.getallUser();
        rptrUsers.DataBind();
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
                shownotification();
            }
        }

        if (flag == 0)
        {
            if (txtFirstName.Text == "")
            {
                lblMessage.Text = "Enter Your First Name";
                flag = 1;
                shownotification();
            }
        }

        if (flag == 0)
        {
            if (txtLastName.Text == "")
            {
                lblMessage.Text = "Enter Your Last Name";
                flag = 1;
                shownotification();
            }
        }

        if (flag == 0)
        {
            if (txtPassword.Text == "")
            {
                lblMessage.Text = "Enter Password";
                flag = 1;
                shownotification();
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
                shownotification();
            }
        }

        if (flag == 0)
        {
            if (txtPassword.Text != txtConPassword.Text)
            {
                flag = 1;
                lblMessage.Text="Password Doesnt Match";
                shownotification();
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
                shownotification();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
                shownotification();
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
        lblMessage.Text = "New Password is \"password123\"";
        shownotification();
    }

    //Delete users
    protected void btnDelUser_Click(object sender, EventArgs e)
    {
        BLLUsers.DeleteUser(UserID);
        lblMessage.Text = "User Succesfully Deleted";
        txtFnameEdit.Text = "";
        txtLnameEdit.Text = "";
        txtUnameEdit.Text = "";
        loadUsers();
        shownotification();
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
            lblMessage.Text = "User Succesfully Changed";

            loadUsers();
            shownotification();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            shownotification();
        }
    }

    //Change Admin Password
    protected void BtnChangeAdmin_Click(object sender, EventArgs e)
    {
        if (txtNpass.Text == txtRNpass.Text)
        {
            if (BLLUsers.checckAdminPassword(txtOpass.Text))
            {
                BLLUsers.ChangeAdminPassword(txtNpass.Text);
                lblMessage.Text = "Pasword successfully changed";
                shownotification();
            }
            else
            {
                lblMessage.Text = "Old is Password Incorrect";
                shownotification();
            }
        }
        else
        {
            lblMessage.Text = "Password Does not Match";
            shownotification();
        }
    }
    protected void LnkAddUsers_Click(object sender, EventArgs e)
    {
        AddUsers.Visible = true;
        EditUsers.Visible = false;
        ChngPassword.Visible = false;
    }

    protected void LnkEditUsers_Click(object sender, EventArgs e)
    {
        AddUsers.Visible = false;
        EditUsers.Visible = true;
        ChngPassword.Visible = false;
    }

    protected void LnkChngPassword_Click(object sender, EventArgs e)
    {
        AddUsers.Visible = false;
        EditUsers.Visible = false;
        ChngPassword.Visible = true;
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
   