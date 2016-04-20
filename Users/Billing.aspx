<%@ Page Title="" Language="C#" MasterPageFile="~/Users/user.master" AutoEventWireup="true" CodeFile="Billing.aspx.cs" Inherits="Users_Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #divMessage, #divMembers {
            border: 1px solid #333;
            background: #fff;
            width: 347px !important;
            position: absolute;
            left: 50% !important;
            top: 0%;
            margin: 120px 0 0 -180px;
            z-index: 9999;
            -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
            box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
        }

         #divItems{
            border: 1px solid #333;
            background: #fff;
            width: 347px !important;
            position: absolute;
            left: 50% !important;
            top: 0%;
            margin: 150px 0 0 -180px;
            z-index: 9999;
            -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
            box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
        }
        #divItemsBody, #divMembersBody {
            padding-left:20px;
            padding-right:20px;
        }


    </style>
    <script type="text/javascript">
        <!--
    function printContent(id) {
        str = document.getElementById(id).innerHTML
        newwin = window.open('', 'printwin', 'left=100,top=100,width=700')
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
    <script type="text/javascript">

        function ShowItems(show) {
            if (show == true) {
                document.getElementById('divItems').style.display = "block";
            }
            else {
                document.getElementById('divItems').style.display = "none";
            }
        }
        function ShowMembers(show) {
            if (show == true) {
                document.getElementById('divMembers').style.display = "block";
            }
            else {
                document.getElementById('divMembers').style.display = "none";
            }
        }
        function ShowMessage(show) {
            if (show == true) {
                document.getElementById('divMessage').style.display = "block";
            }
            else {
                document.getElementById('divMessage').style.display = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-sm-3">
            <aside>
                <center>
                        <asp:DropDownList ID="ddlService" CssClass="form-control" runat="server" AutoPostBack="True" onselectedindexchanged="ddlService_SelectedIndexChanged">           
                        </asp:DropDownList>
                    </center>
                <br />
                <table>
                    <asp:Repeater ID="rptrList" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ServiceID") %>' Text='<%#Eval("ServiceName") %> ' OnClick="btnAdd_Click" ForeColor="white"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </aside>
        </div>


        <div class="col-sm-9">
            <div class="main-content">
                <asp:Panel ID="pnlBilllist" runat="server">
                    <div id="DivBillList">
                        <br />
                        <center>
                                    <h3>Galz Beauty Parlour</h3>
                                    <h5>
                                        Pako, Newroad<br />
                                        Phone : +977-1-1234567
                                    </h5>

                        
                            Service to : 
                            <asp:LinkButton ID="lnkshowMembers" runat="server" Text="Click Here" OnClick="lnkshowMembers_Click"></asp:LinkButton> 
                               
                        </center>
                        <hr />
                        <table>
                            <tr>
                                <td style="width: 27px;">Sno.</td>
                                <td style="width: 618px; text-align: center;">Service Name</td>
                                <td style="width: 112px;">Price</td>
                                <td style="width: 112px;">Qyt</td>
                                <td style="width: 112px;">Amount</td>
                            </tr>
                        </table>
                        <hr />
                        <table>
                            <asp:Repeater ID="rptrBill" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td style="width: 27px;"><%#Eval("SalesID") %></td>
                                        <td style="padding-left: 4px; width: 618px;"><%#Eval("ServiceName") %></td>
                                        <td style="width: 112px;"><%#Eval("Rate") %></td>
                                        <td style="width: 112px;"><%#Eval("Quantity") %></td>
                                        <td style="width: 112px;"><%#Eval("Amount") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <div id="DivTotal" style="height: 37px;">
                        <hr />
                        <table>
                             <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Total</span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Discount <asp:Label ID="lblDiscountPercentage" runat="server"></asp:Label> % </span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblDiscountAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Net Amount</span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblNetAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                        </table>
                        <hr />
                        <asp:Button ID="btnAddTobill" CssClass="btn btn-success" runat="server" Text="Done" OnClick="btnAddTobill_Click" />
                        <asp:Button ID="btnClear" CssClass="btn btn-danger" runat="server" Text="Clear" OnClick="Unnamed1_Click" />
                    </div>

                    <br />
                </asp:Panel>
                <asp:Panel ID="pnlBillPrint" runat="server" Visible="false">
                    <div id="DivBilling">
                        <div id="DivBillListPrint">
                            <table style="align-content: center; width: 100%">
                                <tr>
                                    <td colspan="2">
                                        <center><font size="5"> Galz Beauty Parlour</font></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center><font size="4">Pako, Newroad <br />Phone : +977-1-1234567</font></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <center> <font size="3"> Service to: <asp:Label ID="lblCustomerName" runat="server"></asp:Label> </font></center>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="align-content: flex-start">
                                        <p align="left">Bill no:
                                            <asp:Label ID="lblBillNO" runat="server"></asp:Label></p>
                                    </td>
                                    <td style="align-content: flex-end">
                                        <p align="right">
                                            Date:
                                            <asp:Label ID="lblDate" runat="server"></asp:Label>
                                        </p>
                                    </td>
                                </tr>
                            </table>

                            <hr />
                            <table>
                                <tr>
                                    <td style="width: 27px;">Sno.</td>
                                    <td style="width: 618px; text-align: center;">Service Name</td>
                                    <td style="width: 112px;">Price</td>
                                    <td style="width: 112px;">Qyt</td>
                                    <td style="width: 112px;">Amount</td>
                                </tr>
                            </table>
                            <hr />
                            <table>

                                <asp:Repeater ID="rptrBillPrint" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width: 27px;"><%#Eval("SalesID") %></td>
                                            <td style="padding-left: 4px; width: 618px;"><%#Eval("ServiceName") %></td>
                                            <td style="width: 112px;"><%#Eval("Rate") %></td>
                                            <td style="width: 112px;"><%#Eval("Quantity") %></td>
                                            <td style="width: 112px;"><%#Eval("Amount") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                        <div id="DivTotalPrint">
                            <hr />
                            <table>
                                 <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Total</span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblTotalPrint" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Discount <asp:Label ID="lblDiscountPercentPrint" runat="server"></asp:Label> % </span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblDiscountAmountPrint" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 869px;"><span style="text-align:right">Net Amount</span></td>
                                    <td style="width: 112px;">
                                        <asp:Label ID="lblNetAmountPrint" runat="server"></asp:Label>
                                    </td>
                                </tr>
                               
                            </table>
                            <hr />
                            <p align="right">Sold By:<asp:Label ID="lblSoldBY" runat="server"></asp:Label>
                            </p>

                        </div>
                        <br />
                    </div>
                    <div>
                        <asp:Button runat="server" CssClass="btn btn-default" Text="print" OnClick="Unnamed1_Click" OnClientClick="printContent('DivBilling')" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

    <div id="divItems" style="display: none;">
        <div id="divServiceHeader" style="background-color: green; padding: 10px 15px; color: #fff">
            Service/Items
        </div>
        <div class="row" id="divItemsBody">
            <div class="col-sm-12">
                <h3>service Details:</h3>
                <asp:Label ID="lblServiceID" runat="server" Visible="false"></asp:Label>
                <fieldset class="form-group">
                    <label for="lblServiceName">Service Name:</label>
                    <asp:Label ID="lblServiceName" runat="server" Text="" ForeColor="#6666ff"></asp:Label>
                </fieldset>

                 <fieldset class="form-group">
                    <label for="txtServicePrice">Price:</label>
                    <asp:TextBox CssClass="form-control" ID="txtServicePrice"  runat="server"></asp:TextBox>
                </fieldset>

                 <fieldset class="form-group">
                    <label for="txtServiceQyt">Quantity:</label>
                    <asp:TextBox CssClass="form-control" ID="txtServiceQyt"  runat="server"></asp:TextBox>
                </fieldset>

                 <fieldset class="form-group">
                    <asp:Button ID="btnAddToList" CssClass="btn btn-info" runat="server" Text="Add To Bill" OnClick="btnAddToList_Click" />
                    <asp:Button ID="btnCancelAddToList" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnAddToList1_Click" />
                </fieldset>

            </div>
        </div>
    </div>

    <div id="divMembers" style="display: none;">
        <div id="divMembersHeader" style="background-color: green; padding: 10px 15px; color: #fff">
            Member Search
        </div>
        
        <div id="divMembersBody">
            <h3>Customer Details:</h3>
                <fieldset class="form-group">
                    <label for=""> Valid Till: :</label>
                    <asp:Label ID="lblValidDate" runat="server" Text="" ForeColor="#6666ff"></asp:Label>
                </fieldset>
                
               <fieldset class="form-group">
                    <label for="">Discount Percentage: </label>
                    <asp:TextBox CssClass="form-control" TextMode="Number" ID="txtDiscountPercent" width="40%" runat="server" placeHolder="Discount %"></asp:TextBox>
                </fieldset>

            <fieldset class="form-group">
                    <label for="">Membership Number: </label>
                    <asp:TextBox CssClass="form-control" TextMode="Number" ID="txtMemberShipID"  runat="server" placeHolder="Membership ID"></asp:TextBox>
                </fieldset>

            <fieldset class="form-group">
                    <label for="">Customer Name: </label>
                    <asp:TextBox ID="txtCustomername" CssClass="form-control" runat="server" placeHolder="Customer Name"></asp:TextBox>
                </fieldset>
                
            <fieldset class="form-group">
                    <asp:Button ID="BtnGetMembers" CssClass="btn btn-info" runat="server" Text="Get Member" OnClick="BtnGetMembers_Click" />
                <asp:Button ID="btnDoneMembers" CssClass="btn btn-success" runat="server" Text="Done" OnClick="btnDoneMembers_Click" />
            </fieldset>
                
            </div>
    </div>

     <div id="divMessage" style="display: none;">
        <div id="divMessageHeader" style="background-color: green; padding: 10px 15px; color: #fff">
            Gulz Beauty Parlour
        </div>
        <div id="divMessageContent" style="background-color: white">
            <br />
            <center><strong>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></strong></center>
            <br />
            <button class="btn btn-success pull-right" style="margin:0 10px 10px 0;"><a href="#" style="color:#fff;" onclick="ShowMessage(0);Popup.hide('modal');return false;">OK</a></button>
        </div>
    </div>
</asp:Content>

