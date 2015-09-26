using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Sales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnGetMonthsReport_Click(object sender, EventArgs e)
    {
        PnlMonthlySale.Visible = true;

        DataTable dt = BLLSales.GetMonthlyReport(int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue));

        double sumAmount = 0;
        double sumDiscount = 0;
        double sumNetIncome = 0;
        foreach (DataRow dr in dt.Rows)
        {
            sumAmount += Convert.ToDouble(dr["TotalAmount"]);
            sumDiscount += Convert.ToDouble(dr["TotalDiscount"]);
            sumNetIncome += Convert.ToDouble(dr["NetAmount"]);
        }
        lblTotlalMonthly.Text = sumAmount.ToString();
        lblTotalDiscountMonthly.Text = sumDiscount.ToString();
        lblTotalIncomeMonthly.Text = sumNetIncome.ToString();

        rptrMonthlyReport.DataSource = dt;
        rptrMonthlyReport.DataBind();
        lblMonthYear.Text = ddlMonth.SelectedItem.Text + " " + ddlYear.SelectedItem.Text;
    }
    protected void ViewDaily_Click(object sender, EventArgs e)
    {
        DateTime date = Convert.ToDateTime((sender as LinkButton).CommandArgument.ToString());
        string date1 = date.ToShortDateString();
        PnlDailySale.Visible = true;
        lblDateofSales.Text = date.ToLongDateString().ToString();
        DataTable dt = BLLSales.GetReportBydate(date1);

        double sumAmount = 0;
        double sumDiscount = 0;
        double sumNetIncome = 0;
        foreach (DataRow dr in dt.Rows)
        {
            sumAmount += Convert.ToDouble(dr["TotalAmount"]);
            sumDiscount += Convert.ToDouble(dr["Discount"]);
            sumNetIncome += Convert.ToDouble(dr["NetAmount"]);
        }
        //DataRow[] dr = dt.Select("SUM(TotalAmount)");
        lblTotalAmountDaily.Text = sumAmount.ToString();
        lblTotalDiscountDaily.Text = sumDiscount.ToString();
        lblTotalNetDaily.Text = sumNetIncome.ToString();
        rptrDaily.DataSource = dt;
        rptrDaily.DataBind();
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