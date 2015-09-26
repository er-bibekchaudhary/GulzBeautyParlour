<%@ Page Title="" Language="C#" MasterPageFile="~/Users/user.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="Users_Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        <!--
        function printContent(id) {
            str = document.getElementById(id).innerHTML
            newwin = window.open('', 'printwin', 'left=100,top=100,width=400')
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
        #DivServices
    {
        background-color:#413737;
        float:left;
        height:600px;
        border:3px solid black;
    }
    #DivBill
    {
        background-color:#8A857F;
        height:600px;
        border:3px solid black;
       
    }

    #DivBody
    {
        background-color:#BBB5AF;
        /*border:3px solid black;*/
    }
    #DivItem
    {
        float:left; 
        height:600px; 
        background-color:#808080;
        border:3px solid black;
    }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
            <div class="col-sm-2" id="DivServices">
                 
                    <center>
                        <asp:DropDownList ID="ddlService" CssClass="form-control" runat="server" AutoPostBack="True" onselectedindexchanged="ddlService_SelectedIndexChanged">           
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
        <div class="col-sm-3" id="DivItem">
            <div class="row">
                <div class="col-sm-12">
                    <h3>service Details:</h3>
                    <asp:Label ID="lblServiceID" runat="server" Visible="false"></asp:Label>
                    Service Name: 
                    <asp:Label ID="lblServiceName" runat="server" Text="" ForeColor="#6666ff"></asp:Label><br />
                    Price:<br />
                    <asp:TextBox CssClass="form-control" ID="txtServicePrice" Width="80%" runat="server"></asp:TextBox><br />
                    Quantity:<br />
                    <asp:TextBox CssClass="form-control" ID="txtServiceQyt" Width="80%" runat="server"></asp:TextBox><br />
                    <asp:Button ID="btnAddToList" CssClass="btn btn-default" runat="server" Text="Add To Bill" OnClick="btnAddToList_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <hr />
                    <h3>Customer Details:</h3>
                    Valid Till: 
                    <asp:Label ID="lblValidDate" runat="server" Text="" ForeColor="#6666ff"></asp:Label><br />
                    Discount Percentage: 
                    <asp:Label ID="lblDiscount" runat="server" Text="" ForeColor="#6666ff"></asp:Label><br /><br />
                    Membership Number:<br />
                    <asp:TextBox CssClass="form-control" ID="txtMemberShipID" Width="80%" runat="server"  placeHolder="Membership ID"></asp:TextBox><br />
                    Customer Name: <br />
                    <asp:TextBox ID="txtCustomername" Width="80%" CssClass="form-control" runat="server" placeHolder="Customer Name"></asp:TextBox><br />
                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Get Member"/>
                </div>
            </div>
       </div>
                        
            <div class="col-sm-7" id="DivBill">
                <asp:Panel ID="pnlBilllist" runat="server">
                           <div id="DivBillList" style="height:350px;">
                                <br />
                                <center>
                                    <h3>Galz Beauty Parlour</h3>
                                    <h5>
                                        Pako, Newroad<br />
                                        Phone : +977-1-1234567
                                    </h5>
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
                                <asp:Button ID="btnAddTobill" CssClass="btn btn-default" runat="server" Text="Done" OnClick="btnAddTobill_Click" />
                            </div>
                    
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlBillPrint" runat="server" Visible="false">
            <div id="DivBilling">
                 <div id="DivBillListPrint" style="height:350px;">
               <table style="align-content:center; width:100%">
                   <tr>
                       <td colspan="2"><center><font size="5"> Galz Beauty Parlour</font></center></td>
                   </tr>
                   <tr>
                       <td colspan="2"><center><font size="4">Pako, Newroad <br />Phone : +977-1-1234567</font></center></td>
                   </tr>
                    <tr>
                       <td colspan="2"><center> <font size="3"> Service to: <asp:Label ID="lblCustomerName" runat="server"></asp:Label> </font></center></td>
                   </tr>
                   <tr>
                       <td style="align-content:flex-start"><p align="left">Bill no: <asp:Label ID="lblBillNO" runat="server"></asp:Label></p></td>
                       <td style="align-content:flex-end"><p align="right">
                                Date: <asp:Label ID="lblDate" runat="server"></asp:Label>
                            </p></td>
                   </tr>
               </table> 

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
                    <div>
                    <asp:Button runat="server" CssClass="btn btn-default" Text="print" OnClick="Unnamed1_Click" onClientClick="printContent('DivBilling')" />
        </div>
                        </asp:Panel>
            </div>
        </div>
</asp:Content>

