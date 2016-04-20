using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Bill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            int id = int.Parse(Request.QueryString["id"]);

            BillInfo _bill = BLLSales.getbillbyid(id);
            lblCustomerName.Text = _bill.CustomerName;
            lblDate.Text = _bill.salesDate.ToShortDateString();
            lblsoldby.Text = _bill.SoldBy;
            lbltotal.Text = _bill.TotalAmount.ToString();
            lblDiscount.Text = _bill.DiscountAmount.ToString();
            lblnetAmount.Text = _bill.NetAmount.ToString();
            lblbillNO.Text = _bill.BillID.ToString();

            rptrbill.DataSource = BLLSales.getsells(id);
            rptrbill.DataBind();
            
        }
    }
}