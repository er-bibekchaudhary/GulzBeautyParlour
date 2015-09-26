<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users_Users" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
    <link href="Bootstrap/bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrap/bootstrap.min.js"></script>
    <script src="Bootstrap/jquery.min.js"></script>
<script type="text/javascript">
<!--
    function printContent(id) {
        str = document.getElementById(id).innerHTML
        newwin = window.open('', 'printwin', 'left=100,top=100,width=400,height=400')
        newwin.document.write('<HTML>\n<HEAD>\n')
        newwin.document.write('<script>\n')
        newwin.document.write('function chkstate(){\n')
        newwin.document.write('if(document.readyState=="complete"){\n')
        newwin.document.write('window.close()\n')
        newwin.document.write('}\n')
        newwin.document.write('else{\n')
        newwin.document.write('setTimeout("chkstate()",2000)\n')
        newwin.document.write('}\n')
        newwin.document.write('}\n')
        newwin.document.write('function print_win(){\n')
        newwin.document.write('window.print();\n')
        newwin.document.write('chkstate();\n')
        newwin.document.write('}\n')
        newwin.document.write('<\/script>\n')
        newwin.document.write('</HEAD>\n')
        newwin.document.write('<BODY onload="print_win()">\n')
        newwin.document.write(str)
        newwin.document.write('</BODY>\n')
        newwin.document.write('</HTML>\n')
        newwin.document.close()
    }
//-->
</script>


<style type="text/css">
        
#DivHead
{
   background:gray;
   height:100px;  
}
#DivServices
{
    background-color:#413737;
    float:left;
    height:500px;
}
#DivBill
{
    min-height:500px;
    background-color:#8A857F;
}

#DivBody
{
    background-color:#BBB5AF;
}
#DivItem
{
    float:left; 
    height:500px; 
    background-color:#808080;
}

</style>

    

</head>
<body bgcolor="black">
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12" id="DivHead">
                    <center>
                    <br />
   
                    <h3>
                    Welcome to Galz Beauty Parlour Billings

                    </h3>
                        
                    </center>
                
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2" id="DivServices">
                 
                    <center>
                        <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="True" onselectedindexchanged="ddlService_SelectedIndexChanged">           
                        </asp:DropDownList>
                    </center>
                    <br />
                    <table>
                        <asp:Repeater ID="rptrList" runat="server" >
                            <ItemTemplate>
                                <tr>
                                    <td align="center" width="100px"> <asp:LinkButton runat="server"  CommandArgument='<%#Eval("ServiceID") %>' Text='<%#Eval("ServiceName") %> ' OnClick="btnAdd_Click" ForeColor="Red"></asp:LinkButton> </td> 
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                
            </div>
            <div class="col-sm-10" id="DivBill">
                <asp:Panel ID="pnlBilllist" runat="server">
                    <div class="row">
                        <div class="col-sm-4" id="DivItem">
                            <h3>service Details:</h3>
                            <asp:Label ID="lblServiceID" runat="server" Visible="false"></asp:Label>
                            Service Name: 
                            <br />
                            <asp:Label ID="lblServiceName" runat="server" Text="" ForeColor="#6666ff"></asp:Label><br /><br />
                            Price:
                            <br />
                            <asp:TextBox ID="txtServicePrice" runat="server"></asp:TextBox>
                            <br /><br />
                            Quantity:
                            <br />
                            <asp:TextBox ID="txtServiceQyt" runat="server"></asp:TextBox>
                            <br /><br />
                            <asp:Button ID="btnAddToList" runat="server" Text="Add To Bill" OnClick="btnAddToList_Click" />
                        </div>
                        <div class="col-sm-8">
                           <div id="DivBillList" style="height:350px;">
                                <br />
                                <center>
                                    <h3>Galz Beauty Parlour</h3>
                                    <h5>
                                        Pako, Newroad<br />
                                        Phone : +977-1-1234567
                                    </h5>
                                    Customer Name: 
                                    <asp:TextBox ID="txtCustomername" runat="server" placeHolder="Customer Name"></asp:TextBox>
                                </center>

                                <hr />
                                <table>
                                    <tr>
                                        <td style="width: 27px;">Sno.</td>
                                        <td style="width: 618px;text-align:center;">Service Name</td>
                                        <td style=" width: 112px;">Price</td>
                                        <td style=" width: 112px;">Qyt</td>
                                        <td style=" width: 112px;">Amount</td>
                                    </tr>
                                </table>
                                <hr />
                                <table>
                                    <asp:Repeater ID="rptrBill" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td style="width: 27px;"><%#Eval("SalesID") %></td>
                                                <td style="padding-left:4px; width: 618px;"><%#Eval("ServiceName") %></td> 
                                                <td style=" width: 112px;"><%#Eval("Rate") %></td>
                                                <td style=" width: 112px;"><%#Eval("Quantity") %></td>
                                                <td style=" width: 112px;"><%#Eval("Amount") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                            <div id="DivTotal" style="height:37px;">
                                <hr />
                                <table>                
                                    <tr>
                                        <td style="width: 649px;">Total</td>
                                        <td style="width: 112px;"><asp:Label ID="lblTotal" runat="server"></asp:Label> </td>
                                    </tr>
                                </table>
                                <hr />
                                <asp:Button ID="btnAddTobill" runat="server" Text="Done" OnClick="btnAddTobill_Click" />
                            </div>
                        </div>
                    </div>
                    
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlBillPrint" runat="server" Visible="false">
            <div id="DivBilling">
                 <div id="DivBillListPrint" style="height:350px;">
                <br />
                <center>
                <h3>Galz Beauty Parlour</h3>
                <h5>Pako, Newroad<br />
                Phone : +977-1-1234567</h5>
                <h4>
                    Service to: <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                </h4>
                    <div class="row">
                        <div class="col-sm-6">
                            <p align="left">Bill no: <asp:Label ID="lblBillNO" runat="server"></asp:Label></p>
                        </div>
                        <div class="col-sm-6">
                            <p align="right">
                                Date: <asp:Label ID="lblDate" runat="server"></asp:Label>
                            </p>
                        </div>
                    </div>
                </center>
                <hr />
                <table>
                    <tr>
                        <td style="width: 27px;">Sno.</td>
                                        <td style="width: 618px;text-align:center;">Service Name</td>
                                        <td style=" width: 112px;">Price</td>
                                        <td style=" width: 112px;">Qyt</td>
                                        <td style=" width: 112px;">Amount</td>
                    </tr>
                    </table>
                    <hr />
                    <table>
                    
                <asp:Repeater ID="rptrBillPrint" runat="server">
                    <ItemTemplate>
                    <tr>
                        <td style="width: 27px;"><%#Eval("SalesID") %></td>
                                                <td style="padding-left:4px; width: 618px;"><%#Eval("ServiceName") %></td> 
                                                <td style=" width: 112px;"><%#Eval("Rate") %></td>
                                                <td style=" width: 112px;"><%#Eval("Quantity") %></td>
                                                <td style=" width: 112px;"><%#Eval("Amount") %></td>
                    </tr>
                    </ItemTemplate>
                </asp:Repeater>
                </table>
            </div>
            <div id="DivTotalPrint" style="height:37px;">
                <hr />
                <table>                
                    <tr>
                        <td style="width: 649px;">Total</td>
                        <td style="width: 112px;"><asp:Label ID="lblTotalPrint" runat="server"></asp:Label> </td>
                    </tr>
                </table>
                <hr />
                    <p align="right">Sold By:<asp:Label ID="lblSoldBY" runat="server"></asp:Label> </p>

            </div>
            <br />
            </div>
                    <asp:Button runat="server" Text="print" OnClick="Unnamed1_Click" onClientClick="printContent('DivBilling')" />
        </asp:Panel>
            </div>
        </div>
    </div>
 </form>
</body>
</html>
