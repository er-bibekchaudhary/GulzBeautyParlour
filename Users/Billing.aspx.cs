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
            lblDate.Text = DateTime.Now.ToShortTimeString();
            lblSoldBY.Text = Session["FullName"].ToString();
            pnlBilllist.Visible = false;
            pnlBillPrint.Visible = true;
        }
    }

    //savebill
    public int savebill()
    {
        int userID = int.Parse(Session["UserID"].ToString());
        int billid = BLLSales.saveBill(txtCustomername.Text,userID, 0, Convert.ToDouble(lblTotal.Text), Convert.ToDouble(lblTotal.Text));
        BLLSales.savesales(Addeditems, billid);
        return billid;
    }

    public void clearform()
    {
        txtCustomername.Text = "";
        txtServicePrice.Text = "";
        txtServiceQyt.Text = "";
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
        getTotal();
        bindBill();
    }

    //After print
    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        pnlBillPrint.Visible = false;
        pnlBilllist.Visible = true;
        Addeditems.Clear();
        bindBill();
        getTotal();
        clearform();
    }
}