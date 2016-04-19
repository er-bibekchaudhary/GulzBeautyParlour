using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Members : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlAddMembers.Visible = false;
            pnlListMembers.Visible = true;
        }
    }
    protected void btnshowAdd_Click(object sender, EventArgs e)
    {
        pnlAddMembers.Visible = true;
        pnlListMembers.Visible = false;
    }
    protected void btnhideAdd_Click(object sender, EventArgs e)
    {
        pnlAddMembers.Visible = false;
        pnlListMembers.Visible = true;
    }

    public void bindMembers()
    {
        DataTable dt = BLLMembers.getallMember();

        rptrMember.DataSource = dt;
        rptrMember.DataBind();
    }

    //Add new user to system
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int flag = 0;
        if (flag == 0)
        {
            if (txtFirstName.Text == "")
            {
                lblMessage.Text = "Enter Member's First Name";
                flag = 1;
                showMessage();
            }
        }

        if (flag == 0)
        {
            if (txtLastName.Text == "")
            {
                lblMessage.Text = "Enter Member's Last Name";
                flag = 1;
                showMessage();
            }
        }

        if (flag == 0)
        {
            if (txtAddress.Text == "")
            {
                lblMessage.Text = "Enter Member's Address";
                flag = 1;
                showMessage();
            }
        }

        if (flag == 0)
        {
            if (txtPhoneNumber.Text == "")
            {
                lblMessage.Text = "Enter Member's Number";
                flag = 1;
            }
        }

        if (flag == 0)
        {
            MemberInfo _Member = new MemberInfo();
            _Member.FirstName = txtFirstName.Text;
            _Member.LastName = txtLastName.Text;
            _Member.Address = txtAddress.Text;
            _Member.PhoneNumber = txtPhoneNumber.Text;
            _Member.CreatedDate = DateTime.Now;
            _Member.ValidUpto = DateTime.Now.AddYears(1);

            try
            {
                BLLMembers.CreateMember(_Member);
                bindMembers();
                lblMessage.Text = "Member Successfully Added";
                showMessage();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message.ToString();
                showMessage();
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtAddress.Text = "";
        txtPhoneNumber.Text = "";
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        MemberInfo _Member = BLLMembers.getMemberByID(int.Parse(lblMembersID.Text));
        _Member.FirstName = txtFirstNameEdit.Text;
        _Member.LastName = txtLastNameEdit.Text;
        _Member.Address = txtAddressEdit.Text;
        _Member.PhoneNumber = txtPhoneEdit.Text;
        if (chkUpdateMembership.Checked)
        {
            _Member.ValidUpto = _Member.ValidUpto.AddYears(1);
        }

        try
        {
            BLLMembers.EditMember(_Member);
            lblMessage.Text = "Member Succesfully Updated";
            bindMembers();
            showMessage();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
            showMessage();
        }
    }

    protected void btnEditCancel_Click(object sender, EventArgs e)
    {
        txtFirstNameEdit.Text = "";
        txtLastNameEdit.Text = "";
        txtAddressEdit.Text = "";
        txtPhoneEdit.Text = "";
        hideEdit();
    }

    public void showEdit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowEdit(1)", true);
    }
    public void hideEdit()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowEdit(0)", true);
    }
    public void showMessage()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowMessage(1)", true);
    }
}