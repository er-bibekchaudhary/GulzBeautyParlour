<%@ Page Title="" Language="C#" MasterPageFile="~/Users/user.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Users_Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #tblMemebers {
            border: 2px;
            width: 100%;
            align-content: center;
        }

        #gpsearch {
            float: right;
        }
        #divMessage {
            border: 1px solid #333;
            background: #fff;
            width: 347px !important;
            position: absolute;
            left: 50% !important;
            top: 0%;
            margin: 200px 0 0 -180px;
            z-index: 9999;
            -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
            box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
        }
        #divEdit{
            border: 1px solid #333;
            background: #fff;
            width: 600px !important;
            position: absolute;
            left: 50% !important;
            top: 0%;
            margin: 150px 0 0 -300px;
            z-index: 9999;
            -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
            box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
        }

        #divEditContent{
            padding-left:20px;
            padding-right:20px;
        }
    </style>

    <script>
        function ShowMessage(show) {
            if (show == true) {
                document.getElementById('divNotification').style.display = "block";
            }
            else {
                document.getElementById('divNotification').style.display = "none";
            }
        }

        function ShowEdit(show) {
            if (show == true) {
                document.getElementById('divEdit').style.display = "block";
            }
            else {
                document.getElementById('divEdit').style.display = "none";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel runat="server" ID="pnlListMembers">
    <div class="row" >
        <br />
        <div class="col-sm-12">
            <div id="divuserMgnt">
                <div class="form-group">
                    <div class="col-sm-6">
                        <asp:Button runat="server" ID="btnshowAdd" Text="Add Members" Cssclass="btn btn-success" OnClick="btnshowAdd_Click"></asp:Button>
                    </div>
                    <div class="col-sm-4">
                         <asp:TextBox type="text" runat="server" ID="txtSearch" placeholder="SearchKey" Cssclass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button runat="server" ID="btnsearch" Text="Search" Cssclass="btn btn-info"></asp:Button>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div class="row">
                    <div class="col-sm-12">
                        <table id="tblMemebers">
                            <thead>
                                <tr>
                                    <th>Memebership ID</th>
                                    <th>Full Name</th>
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>Member Since</th>
                                    <th>Valid Through</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptrMember" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("MemberId") %></td>
                                        <td><%#Eval("FirstName") %> <%#Eval("LastName") %></td>
                                        <td><%#Eval("Address") %></td>
                                        <td><%#Eval("PhoneNumber") %></td>
                                        <td><%#Eval("CreatedDate") %></td>
                                        <td><%#Eval("ValidUpto") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
    <!-- add Members -->
    <asp:Panel runat="server" ID="pnlAddMembers">
    <div class="row" >
        <br />
        <br />
        <div class="col-sm-12">
            <asp:Button runat="server" ID="btnhideAdd" Text="<< Back" Cssclass="btn btn-default" OnClick="btnhideAdd_Click"></asp:Button>
        </div>
        <div class="col-sm-12">
            <h3>Add Members</h3>
             <div class="form-horizontal">
                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">First Name: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name"  Cssclass="form-control" type="text" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Last Name: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtLastName" runat="server" type="text" Cssclass="form-control" placeholder="Last Name" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Address: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtAddress" runat="server" type="text"  Cssclass="form-control" placeholder="Address" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Phone Number: </label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPhoneNumber"  Cssclass="form-control" placeholder="Phone Number" type="text" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button runat="server" ID="btnAdd" Text="Add Menebers" Cssclass="btn btn-success"  OnClick="btnAdd_Click"></asp:Button>
                        <asp:Button runat="server" ID="btnCancel" Text="Clear" style="margin-left: 20px" Cssclass="btn btn-danger"  OnClick="btnCancel_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </asp:Panel>

     <div id="divEdit">
        <div id="divEditHeader" style="background-color: green; padding: 10px 15px; color: #fff">
           Edit Members
        </div>
        <div id="divEditContent" style="background-color: white">
            <div class="row" >
        <br />
        <br />
        <div class="col-sm-12">
             <div class="form-horizontal">
                 <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">MembershipID: </label>
                    <div class="col-sm-10">
                        <asp:Label runat="server" ID="lblMembersID" Text="" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">First Name: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtFirstNameEdit" runat="server" placeholder="First Name"  Cssclass="form-control" type="text" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Last Name: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtLastNameEdit" runat="server" type="text" Cssclass="form-control" placeholder="Last Name" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Address: </label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtAddressEdit" runat="server" type="text"  Cssclass="form-control" placeholder="Address" ></asp:TextBox></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Phone Number: </label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtPhoneEdit"  Cssclass="form-control" placeholder="Phone Number" type="text" ></asp:TextBox></div>
                </div>
                 <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Renew Membership: </label>
                    <div class="col-sm-10">
                        <asp:CheckBox runat="server" ID="chkUpdateMembership" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button runat="server" ID="btnEdit" Text="Edit Menebers" Cssclass="btn btn-success" OnClick="btnEdit_Click"></asp:Button>
                        <asp:Button runat="server" ID="btnEditCancel" Text="Cancel" style="margin-left: 20px" Cssclass="btn btn-danger"  OnClick="btnEditCancel_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
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

