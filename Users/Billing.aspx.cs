using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Billing : System.Web.UI.Page
{
    static List<SellsInfo> Addeditems = new List<SellsInfo>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Addeditems.Clear();
            bindDDL();

            rptrList.DataSource = BllService.GetServiceByCategory(int.Parse(ddlService.SelectedValue));
            rptrList.DataBind();
        }
    }


    #region Adding Sales to cart
    //Adding to edit panel
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int ID = int.Parse((sender as LinkButton).CommandArgument);
        ServiceInfo _service = BllService.GetServicebyID(ID);
        lblServiceName.Text = _service.ServiceName;
        txtServicePrice.Text = _service.rate.ToString();
        txtServiceQyt.Text = "1";
        showItems();
    }
    #endregion
    //bind choice of Services
    protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
    {
        rptrList.DataSource = BllService.GetServiceByCategory(int.Parse(ddlService.SelectedValue));
        rptrList.DataBind();
    }
    // binding drop down list
    public void bindDDL()
    {
        ddlService.DataSource = BLLCategory.getallCategory();
        ddlService.DataTextField = "categoryName";
        ddlService.DataValueField = "categoryID";
        ddlService.DataBind();
    }

    //put data to bill
    public void bindBill()
    {
        rptrBill.DataSource = Addeditems;
        rptrBill.DataBind();
        rptrBillPrint.DataSource = Addeditems;
        rptrBillPrint.DataBind();
    }

    //get total of all
    public void getTotal()
    {
        double total = 0;
        int Sno = 1;
        foreach (SellsInfo sells in Addeditems)
        {
            total = total + sells.Amount;
            sells.SalesID = Sno;
            Sno = Sno + 1;
        }

        if (txtDiscountPercent.Text == "")
        {
            lblNetAmount.Text = total.ToString();
            lblNetAmountPrint.Text = total.ToString();
            lblDiscountAmount.Text = "0";
            lblDiscountAmountPrint.Text = "0";
        }
        else
        {
            lblDiscountPercentage.Text = txtDiscountPercent.Text;
            lblDiscountPercentPrint.Text = txtDiscountPercent.Text;

            double discount = (total / 100) * int.Parse(txtDiscountPercent.Text);

            lblDiscountAmount.Text = discount.ToString();
            lblDiscountAmountPrint.Text = discount.ToString();

            lblNetAmount.Text = (total-discount).ToString();
            lblNetAmountPrint.Text = (total - discount).ToString();
        }

        lblTotal.Text = total.ToString();
        lblTotalPrint.Text = total.ToString();

    }

    // show bill print view
    protected void btnAddTobill_Click(object sender, EventArgs e)
    {
        if (Addeditems.Count != 0)
        {
            lblCustomerName.Text = txtCustomername.Text;
            lblBillNO.Text = savebill().ToString();
            lblDate.Text = DateTime.Now.ToLongDateString();
            lblSoldBY.Text = Session["FullName"].ToString();
            pnlBilllist.Visible = false;
            pnlBillPrint.Visible = true;
        }
    }
   
    //savebill
    public int savebill()
    {
        int userID = int.Parse(Session["UserID"].ToString());
        int billid = BLLSales.saveBill(txtCustomername.Text,userID, int.Parse(lblDiscountAmount.Text), Convert.ToDouble(lblTotal.Text), Convert.ToDouble(lblNetAmount.Text));
        BLLSales.savesales(Addeditems, billid);
        return billid;
    }

    public void clearform()
    {
        txtCustomername.Text = "";
        txtMemberShipID.Text = "";
        txtServicePrice.Text = "";
        lblDiscountPercentage.Text = "";
        lblDiscountPercentPrint.Text = "";
        lnkshowMembers.Text = "Click Here";
        txtServiceQyt.Text = "";
        txtDiscountPercent.Text = "";
        lblTotal.Text = "";
        lblServiceName.Text = "";
    }
    //Adding items to list
    protected void btnAddToList_Click(object sender, EventArgs e)
    {
        SellsInfo _sales = new SellsInfo();
        _sales.ServiceName = lblServiceName.Text;
        _sales.Rate = Convert.ToDouble(txtServicePrice.Text);
        _sales.Quantity = int.Parse(txtServiceQyt.Text);
        _sales.Amount = _sales.Rate * _sales.Quantity;
        Addeditems.Add(_sales);
        bindBill();
        hideItems();
        getTotal();
    }

    protected void btnAddToList1_Click(object sender, EventArgs e)
    {
        hideItems();
        hideMembers();
    }


    protected void btnDoneMembers_Click(object sender, EventArgs e)
    {
        lnkshowMembers.Text = txtCustomername.Text;
        hideMembers();
        getTotal();
    }

    protected void BtnGetMembers_Click(object sender, EventArgs e)
    {
        if(txtMemberShipID.Text=="")
        {
            lblMessage.Text="Please Enter Membership Number";
            showMessage();
        }
        else{
            try
            {
                MemberInfo _member = BLLMembers.getMemberByID(int.Parse(txtMemberShipID.Text));
                txtCustomername.Text = _member.FirstName + " " + _member.LastName;
                showMembers();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Member Not Found";
                showMessage();
            }
        }
        
    }
    protected void lnkshowMembers_Click(object sender, EventArgs e)
    {
        showMembers();
    }

    //After print
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        pnlBillPrint.Visible = false;
        pnlBilllist.Visible = true;
        Addeditems.Clear();
        bindBill();
        clearform();
        getTotal();
    }

    public void showItems()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowItems(1)", true);
    }
    public void hideItems()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowItems(0)", true);
    }
    public void showMembers()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowMembers(1)", true);
    }
    public void hideMembers()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowMembers(0)", true);
    }
    public void showMessage()
    {
        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "Alert", "ShowMessage(1)", true);
    }
}