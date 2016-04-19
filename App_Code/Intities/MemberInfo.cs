using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MemberInfo
/// </summary>
public class MemberInfo
{
	public MemberInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public int MemberId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public string PhoneNumber { get; set; }
    public DateTime CreatedDate { get; set; }
    public DateTime ValidUpto { get; set; }
}