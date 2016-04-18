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
    </style>

    <script>
        $(document).ready(function (e) {
            $("#divAddMembers").hide();
             
            $("#btnshowAdd").click(function (e) {
                e.preventDefault();
                $("#divListMembers").hide();
                $("#divAddMembers").slideDown();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row" id="divListMembers">
        <br />
        <div class="col-sm-12">
            <div id="divuserMgnt">
                <div class="form-group">
                    <div class="col-sm-6">
                        <button id="btnshowAdd" class="btn btn-success">Add Members</button>
                    </div>
                    <div class="col-sm-4">
                         <input type="text" id="txtSearch" placeholder="SearchKey" class="form-control" />
                    </div>
                    <div class="col-sm-2">
                        <button id="btnsearch" class="btn btn-info">Search</button>
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
                                    <th>Sno.</th>
                                    <th>Memebership ID</th>
                                    <th>Full Name</th>
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>valid From</th>
                                    <th>Valid Through</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- add Members -->
    <div class="row" id="divAddMembers">
        <br />
        <br />
        <div class="col-sm-12">
            <button id="btnhideAdd" class="btn btn-default"> << Back</button>
        </div>
        <div class="col-sm-12">
            <h3>Add Members</h3>
             <div class="form-horizontal">
                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">First Name: </label>
                    <div class="col-sm-10">
                        <input id="txtFirstName" placeholder="First Name"  class="form-control" type="text" /></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Last Name: </label>
                    <div class="col-sm-10">
                        <input id="txtLastName" type="text" class="form-control" placeholder="Last Name" /></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Address: </label>
                    <div class="col-sm-10">
                        <input id="txtAddress" type="text"  class="form-control" placeholder="Address" /></div>
                </div>

                <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Phone Number: </label>
                    <div class="col-sm-10">
                        <input id="txtPhoneNumber"  class="form-control" placeholder="Phone Number" type="text" /></div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="btnAdd" class="btn btn-success">Add Menebers</button>
                        <button id="btnCancel" style="margin-left: 20px" class="btn btn-danger">Cancel</button></div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

