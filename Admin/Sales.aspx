<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Admin_Sales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Sales</title>
    <style type="text/css">
     #divMenu ul li a
        {
            text-decoration:none;          
            margin-left:20px;
            color:Red;
        } 
     table
     {
         padding:10px;
         border:2px solid black;
     }
     th
     {
          border:1px solid black;
          text-align:center;
          padding-left:2px;
          padding-right:2px;
     }
     td
     {
         border:1px solid black;
         text-align:right;
         padding-left:2px;
         padding-right:2px;
     }

     #divNotification
        {
	        border: 1px solid #333;
            background: #fff;
            width: 347px !important;
            position: absolute;
            left: 50% !important;
            top:0%;
            margin:200px 0 0 -180px;
            z-index: 9999;
        }
        
    </style>

     <script type="text/javascript">
      
            function ShowNotification(show) {
                if (show == true) {
                    document.getElementById('divNotification').style.display = "block";
                }
                else {
                    document.getElementById('divNotification').style.display = "none";
                }
            }
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" Runat="Server">
<div id="divMenu" class="container">
    <div class="row">
        <div class="col-sm-3">
    
            <ol>
                <li><a href="Services.aspx">Services</a></li>
                <li>Sales</li>

                <ul>
                    <li><asp:LinkButton ID="LnkCheckSales" runat="server">Check Sales</asp:LinkButton></li>
                    <li><asp:LinkButton ID="LnkPrintMonth" runat="server">Print Monthly report</asp:LinkButton></li>
                </ul>
            
                <li><a href="UserMgnt.aspx">User Management</a></li>
            </ol>
        </div>
        
        <div class="col-sm-9" id="divContext">
            <br />
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-3">
                    Month: <asp:DropDownList ID="ddlMonth" runat="server">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>

                    </asp:DropDownList>
                </div>
                <div class="col-sm-3">
                    Year : <asp:DropDownList ID="ddlYear" runat="server">
                        <asp:ListItem Value="2015">2015</asp:ListItem>
                        <asp:ListItem Value="2016">2016</asp:ListItem>
                        <asp:ListItem Value="2017">2017</asp:ListItem>
                        <asp:ListItem Value="2018">2018</asp:ListItem>
                        <asp:ListItem Value="2019">2019</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-3">
                    <asp:Button ID="btnGetMonthsReport" runat="server" Text="Get Report" OnClick="btnGetMonthsReport_Click" />
                </div>
                <div class="col-sm-2"></div>
            </div>   
        </div>
    </div>
    <div class="row">
        <div class="col-sm-5">
            <asp:Panel ID="PnlMonthlySale" runat="server">
                <table>
                    <caption><h4>Detail Sales on Month of : <asp:Label ID="lblMonthYear" runat="server" Text="" ForeColor="Red"></asp:Label></h4> </caption> 
                    <tr>
                        <th>Date of sales</th>
                        <th>Total Amount </th>
                        <th>Total Discount</th>
                        <th>Net Income</th>
                    </tr>
                
                <asp:Repeater ID="rptrMonthlyReport" runat="server">
                    <ItemTemplate>
                        <tr>
                            
                            <td><%#Eval("DateOfSales")%></td>
                            <td><%#Eval("TotalAmount")%></td>
                            <td><%#Eval("TotalDiscount")%></td>
                            <td><%#Eval("NetAmount")%> </td>
                            <td><asp:LinkButton runat="server"  CommandArgument='<%#Eval("DateOfSales")%>' Text='View' OnClick="ViewDaily_Click"></asp:LinkButton></td>
                            
                            
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                        <td>Total:</td>
                        <td><asp:Label ID="lblTotlalMonthly" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblTotalDiscountMonthly" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblTotalIncomeMonthly" runat="server"></asp:Label></td>
                    </tr>
            </table>
            </asp:Panel>
        </div>

        <div class="col-sm-7">
            <asp:Panel ID="PnlDailySale" runat="server">
                <table>
                    <caption><h4>Detail Sales of Date: <asp:Label ID="lblDateofSales" runat="server" Text="" ForeColor="Red"></asp:Label></h4> </caption> 
                    <tr>
                        <th>Bill No.</th>
                        <th>Customer Name</th>
                        <th>Sold By</th>
                        <th>Total Amount</th>
                        <th>Discount %</th>
                        <th>Net Amount</th>
                    </tr>
                    <asp:Repeater ID="rptrDaily" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("BillID")%></td>
                                <td><%#Eval("CustomerName")%></td>
                                <td><%#Eval("SoldBy")%></td>
                                <td><%#Eval("TotalAmount")%></td>
                                <td><%#Eval("Discount")%></td>
                                <td><%#Eval("NetAmount")%></td>
                                <td><a href='Bill.aspx?id=<%#Eval("BillID")%>' target="_blank">View Bill</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                    <tr>
                        <td colspan="3">Total:</td>
                        <td><asp:Label ID="lblTotalAmountDaily" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblTotalDiscountDaily" runat="server"></asp:Label></td>
                        <td><asp:Label ID="lblTotalNetDaily" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</div>

<div id="divNotification" style="display: none;">
        <div id="divNotificationHeader" style="background-color:red">
           Gulz Beauty Parlour
        </div>
        <div id="divNotificationContent" style="background-color:gray">
            <br />
            <center><strong><asp:Label ID="lblMessage" runat="server" forecolor="Red"></asp:Label></strong></center>
            <br />
            <a href="#" style="padding-left: 290px; font-weight: bold;" onclick="ShowNotification(0);Popup.hide('modal');return false;">
                OK</a>
        </div>
    </div>

</asp:Content>

