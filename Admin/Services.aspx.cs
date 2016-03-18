using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Services : System.Web.UI.Page
{
    static int ServiceID;
    static int CatID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindDDL();
        }
        BindCat();
        BindService();
        
    }

    public void bindDDL()
    {
        ddlCategory.DataSource = BLLCategory.getallCategory();
        ddlCategory.DataTextField = "categoryName";
        ddlCategory.DataValueField = "categoryID";
        ddlCategory.DataBind();

        ddlCategoryEdit.DataSource = BLLCategory.getallCategory();
        ddlCategoryEdit.DataTextField = "categoryName";
        ddlCategoryEdit.DataValueField = "categoryID";
        ddlCategoryEdit.DataBind();
    }

    protected void BindCat()
    {
        rptrCategory.DataSource = BLLCategory.getallCategory();
        rptrCategory.DataBind();
    }

    protected void BindService()
    {
        rptrService.DataSource = BllService.GetAllService();
        rptrService.DataBind();
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        int flag = 0;

        if (txtCategory.Text == "")
        {
            lblMessage.Text = "Empty Category Field";
            shownotification();
            flag = 1;
        }

        if (flag == 0)
        {
            if (BLLCategory.CheckCategoryName(txtCategory.Text))
            {
                try
                {
                     BLLCategory.CreateCategory(txtCategory.Text);
                     lblMessage.Text = "Category Succesfully Added";
                     shownotification();
                     BindCat();
                     ClearForm();
                    
                }

                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    shownotification();
                }
            }
            else
            {
                lblMessage.Text = "Already category Name Exists";
                shownotification();
            }
        } 

    }
    //edit Categories
    protected void btnEditCat_Click(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument.ToString());

        CatID = id;
        txtCategory.Text = BLLCategory.GetCategoryByID(id);
        btnAddCategory.Visible = false;
        btnSaveCategory.Visible = true;
        btnDelCategory.Visible = true;
    }
    

     //Load Service in Edit panel
     protected void btnLoad_Click(object sender, EventArgs e)
     {
         int id = int.Parse((sender as LinkButton).CommandArgument.ToString());

         ServiceID = id;

         ServiceInfo _service = BllService.GetServicebyID(id);
         txtServiceEdit.Text = _service.ServiceName;
         txtPriceEdit.Text = _service.rate.ToString();
         ddlCategoryEdit.SelectedValue = _service.CategoryID.ToString();
     }

     protected void btnSaveCategory_Click(object sender, EventArgs e)
     {
             try
             {
                 BLLCategory.EditCategory(txtCategory.Text, CatID);
                 lblMessage.Text = "Category Succesfully Updated";
                 shownotification();
                 BindCat();
                 ClearForm();
                 btnAddCategory.Visible = true;
                 btnSaveCategory.Visible = false;
                 btnDelCategory.Visible = false;
             }

             catch (Exception ex)
             {
                 lblMessage.Text = ex.Message;
                 shownotification();
             }
     }
     protected void btnDelCategory_Click(object sender, EventArgs e)
     {
         
         BLLCategory.DeleteCategory(CatID);
         lblMessage.Text = "Category Succesfully Deleted";
         shownotification();
         ClearForm();
         BindCat();
         bindDDL();
         btnAddCategory.Visible = true;
         btnSaveCategory.Visible = false;
         btnDelCategory.Visible = false;
     }
     protected void btnAddService_Click(object sender, EventArgs e)
     {
         ServiceInfo _service = new ServiceInfo();
         int flag = 0;
         if (txtService.Text == "")
         {
             lblMessage.Text = "No Service Name.";
             shownotification();
             flag = 1;
         }
         if (txtPrice.Text == "")
         {
             lblMessage.Text = "No Price for Service.";
             shownotification();
             flag = 1;
         }

         if (flag == 0)
         {

             _service.ServiceName = txtService.Text;
             _service.rate = int.Parse(txtPrice.Text);
             _service.CategoryID = int.Parse(ddlCategory.SelectedValue);
             //txtCategory.Text = ddlCategory.SelectedValue;
             try
             {
                 BllService.CreateService(_service);
                 lblMessage.Text = "Service Saved succesfully Added";
                 shownotification();
                 ClearForm();
             }
             catch (Exception ex)
             {
                 lblMessage.Text = ex.Message;
                 shownotification();
             }
         }

     }
     protected void Unnamed1_Click(object sender, EventArgs e)
     {
         //cancel Add
         ClearForm();
     }
     protected void btnsaveEditService_Click(object sender, EventArgs e)
     {
         ServiceInfo _service = new ServiceInfo();
         int flag = 0;
         if (txtServiceEdit.Text == "")
         {
             lblMessage.Text = "No Service Name.";
             shownotification();
             flag = 1;
         }
         if (txtPriceEdit.Text == "")
         {
             lblMessage.Text = "No Price for Service.";
             shownotification();
             flag = 1;
         }

         if (flag == 0)
         {

             _service.ServiceName = txtServiceEdit.Text;
             _service.rate = int.Parse(txtPriceEdit.Text);
             _service.CategoryID = int.Parse(ddlCategoryEdit.SelectedValue);
             _service.ServiceID = ServiceID;

             //txtCategory.Text = ddlCategory.SelectedValue;
             try
             {
                 BllService.UpdateService(_service);
                 lblMessage.Text = "Service Upadated succesfully Added";
                 shownotification();
                 ClearForm();
             }
             catch (Exception ex)
             {
                 lblMessage.Text = ex.Message;
                 shownotification();
             }
         }

     }
     protected void btncancelEdit_Click(object sender, EventArgs e)
     {
         BllService.DeleteService(ServiceID);
     }

     protected void ClearForm()
    {
        txtCategory.Text = "";
        txtPrice.Text = "";
        txtService.Text = "";
        txtPriceEdit.Text = "";
        txtServiceEdit.Text = "";
    }
     protected void lnkAddService_Click(object sender, EventArgs e)
     {
     //    pnlAdd.Visible = true;
     //    pnlEditService.Visible = false;
     }
     protected void lnkEditService_Click(object sender, EventArgs e)
     {
         //pnlAdd.Visible = false;
         //pnlEditService.Visible = true;
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