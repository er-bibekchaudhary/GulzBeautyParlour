using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SellsInfo
/// </summary>
public class SellsInfo
{
    public int SalesID { get; set; }
    public int BillID { get; set; }
    public string ServiceName { get; set; }
    public double Rate { get; set; }
    public int Quantity { get; set; }
    public double Amount { get; set; }


    public SellsInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}