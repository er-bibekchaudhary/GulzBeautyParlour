using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BillInfo
/// </summary>
public class BillInfo
{
    public int BillID { get; set; }
    public string SoldBy { get; set; }
    public string CustomerName { get; set; }
    public int DiscountAmount { get; set; }
    public int TotalAmount { get; set; }
    public int NetAmount { get; set; }
    public DateTime salesDate { get; set; }

	public BillInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}