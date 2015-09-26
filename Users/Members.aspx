<%@ Page Title="" Language="C#" MasterPageFile="~/Users/user.master" AutoEventWireup="true" CodeFile="Members.aspx.cs" Inherits="Users_Members" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #tblMemebers {
            border:2px;
            width:100%;
            align-content:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="row">
       <div class="col-sm-3">
           <div class="row">
                <div class="col-sm-12">
                    <table style="padding:10px;">
                       <tr>
                            <td>First Name: </td>
                            <td><input id="txtFirstName" placeHolder="First Name" type="text" /></td>
                        </tr>

                        <tr>
                            <td>Last Name: </td>
                            <td><input id="txtLastName" type="text" placeHolder="Last Name" /></td>
                        </tr>

                        <tr>
                            <td>Address: </td>
                            <td><input id="txtAddress" type="text" placeHolder="Address" /></td>
                        </tr>

                        <tr>
                            <td>Phone Number: </td>
                            <td><input id="txtPhoneNumber" placeHolder="Phone Number" type="text" /></td>
                        </tr>

                        <tr>
                            <td colspan='2'><button id="btnAdd" >Add Menebers</button>  <button id="btnCancel" style="margin-left:20px">Cancel</button></td>
                        </tr>
                    </table>
                </div>
            </div>
       </div>
       <div class="col-sm-9">
           <div id="divuserMgnt">
               <div class="row">
                    <div class="col-sm-12">
                        <span align="left">
                            <input type="text" id="txtSearch" placeholder="SearchKey" />
                            <button id="btnsearch">Search</button>
                        </span>
                    </div>
               </div>
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
    
</asp:Content>

