<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UserMgnt.aspx.cs" Inherits="Admin_UserMgnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>User Management</title>
   <style type="text/css">
     #divMenu ul li a
        {
            text-decoration:none;          
            margin-left:20px;
            color:Red;
        }    
    
      #divNotification {
            border: 1px solid #333;
            background: #fff;
            width: 347px !important;
            position: absolute;
            left: 50% !important;
            top: 0%;
            margin: 200px 0 0 -180px;
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
<br /><br />

<div id="divMenu" class="container">
    <div class="row">
        <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#AddUsers" aria-controls="home" role="tab" data-toggle="tab">Add Users</a></li>
    <li role="presentation"><a href="#EditUsers" aria-controls="profile" role="tab" data-toggle="tab">Edit Users</a></li>
    <li role="presentation"><a href="#ChngPassword" aria-controls="profile" role="tab" data-toggle="tab">Admin Password</a></li>
  </ul>

        
        <div class="tab-content">
               <div role="tabpanel" class="tab-pane active" id="AddUsers">
        <h3>Add Users</h3>
               <div class="form-horizontal">
                  <div class="form-group">
                    <label for="txtUserName" class="col-sm-2 control-label">User Name: </label>
                    <div class="col-sm-10">
                            <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" placeHolder="User Name"></asp:TextBox> 
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="txtFirstName" class="col-sm-2 control-label">First Name:</label>
                    <div class="col-sm-10">
                            <td><asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server" placeHolder="First Name"></asp:TextBox> 
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="txtLastName" class="col-sm-2 control-label">Last Name: </label>
                    <div class="col-sm-10">
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" placeHolder="Last Name"></asp:TextBox> 
                    </div> 
                  </div>

                  <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password: </label>
                    <div class="col-sm-10">
                           <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" placeHolder="Password" TextMode="Password"></asp:TextBox> 
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Conform Password:  </label>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtConPassword" CssClass="form-control" runat="server" placeHolder="Conform Password" TextMode="Password"></asp:TextBox> 
                    </div>
                  </div>

                 <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <center><asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                    </div>
                  </div>
                       
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                           <asp:Button ID="btnAdd" runat="Server" CssClass="btn btn-success" Text="Add" onclick="btnAdd_Click" />  <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="Server" Text="Cancel" onclick="btnCancel_Click" style="margin-left:20px" />
                    </div>
                  </div>
                    </div>
               </div>

                <div role="tabpanel" class="tab-pane" id="EditUsers">
        <h3>Edit Users</h3>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-2">
                                <asp:Repeater ID="rptrUsers" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkLoad" runat="server" CommandArgument='<%#Eval("UserID") %>' onclick="btnLoad_Click">
                                            <%#Eval("FirstName") %> &nbsp; <%#Eval("LastName") %> 
                                        </asp:LinkButton>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="col-sm-10"> 
                                    <table style="padding:10px;">
                                        <tr>
                                            <td>User Name: </td>
                                            <td><asp:TextBox ID="txtUnameEdit" runat="server" placeHolder="User Name"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td>First Name: </td>
                                            <td><asp:TextBox ID="txtFnameEdit" runat="server" placeHolder="First Name"></asp:TextBox></td>
                                        </tr>

                                        <tr>
                                            <td>Last Name: </td>
                                            <td><asp:TextBox ID="txtLnameEdit" runat="server" placeHolder="Last Name"></asp:TextBox></td>
                                        </tr>   
    
                                        <tr>
                                            <td colspan='2'><center><asp:Label ID="lblEMessage" runat="server" ForeColor="Red" Text=""></asp:Label></center></td>
                                        </tr>

                                        <tr>
                                            <td colspan='2'>
                                                <asp:Button ID="btnEdit" runat="Server" Text="Save" onclick="btnEdit_Click"/> 
                                                <asp:Button ID="btnResetPassword" runat="Server" onclick="btnResetPassword_Click" Text="Reset Password" Style="margin-left:10px" />
                                                <asp:Button ID="btnDelUser" runat="Server" Text="Delete User" onclick="btnDelUser_Click"  Style="margin-left:10px"/>                                                   
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                        </div>
                    </div> 
                </div>

                <div role="tabpanel" class="tab-pane" id="ChngPassword">
        <h3>Change Admin Password</h3>
                    <table>
                        <tr style="margin:10px">
                            <td>Old Password:</td>
                            <td><asp:TextBox ID="txtOpass" runat="server" placeHolder="Old Password" TextMode="Password"></asp:TextBox></td>
                        </tr>

                        <tr style="margin:10px">
                            <td>New Password:</td>
                            <td><asp:TextBox ID="txtNpass" runat="server" placeHolder="New Password" TextMode="Password"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>Re-Enter New Password:</td>
                            <td><asp:TextBox ID="txtRNpass" runat="server" placeHolder="Conform Password" TextMode="Password"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td colspan='2'><center><asp:Label ID="lblCpassword" runat="server" ForeColor="Red" Text=""></asp:Label></center></td>
                        </tr>

                        <tr>
                            <td colspan='2'><asp:Button ID="BtnChangeAdmin" runat="Server" Text="Change Password" onclick="BtnChangeAdmin_Click"/> </td>
                        </tr>
                    </table>
                </div>
        </div>
    </div>    
</div>

< <div id="divNotification" style="display: none;">
        <div id="divNotificationHeader" style="background-color: green; padding: 10px 15px; color: #fff">
            Gulz Beauty Parlour
        </div>
        <div id="divNotificationContent" style="background-color: white">
            <br />
            <center><strong>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label></strong></center>
            <br />
            <button class="btn btn-success pull-right" style="margin:0 10px 10px 0;"><a href="#" style="color:#fff;" onclick="ShowNotification(0);Popup.hide('modal');return false;">OK</a></button>
        </div>
    </div>
</asp:Content>

