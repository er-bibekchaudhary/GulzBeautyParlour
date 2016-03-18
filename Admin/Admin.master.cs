using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserGroup"] != null)
        {
            int UserGroup = int.Parse(Session["UserGroup"].ToString());

            if (UserGroup != 1)
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
}
