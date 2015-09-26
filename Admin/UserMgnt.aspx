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
<br /><br />

<div id="divMenu" class="container">
    <div class="row">
        <div class="col-sm-3">
            <ol>
                <li><a href="Services.aspx">Services</a></li>
                <li><a href="Sales.aspx">Sales</a></li>
                <li>User Management</li>
                <ul>
                    <li><asp:LinkButton ID="LnkAddUsers" runat="server" onclick="LnkAddUsers_Click">Add Users</asp:LinkButton></li>
                    <li><asp:LinkButton ID="LnkEditUsers" runat="server" onclick="LnkEditUsers_Click">Edit Users</asp:LinkButton></li>
                    <li><asp:LinkButton ID="LnkChngPassword" runat="server" onclick="LnkChngPassword_Click">Admin Password</asp:LinkButton></li>
                </ul>
            </ol>
        </div>
        <div class="col-sm-9">
            <div id="divContext">
                <asp:Panel ID="PnlAddUser" runat="server" GroupingText="Add Users">
                    <table style="padding:10px;">
                        <tr>
                            <td>User Name: </td>
                            <td><asp:TextBox ID="txtUserName" runat="server" placeHolder="User Name"></asp:TextBox></td>
                        </tr>

                         <tr>
                            <td>First Name: </td>
                            <td><asp:TextBox ID="txtFirstName" runat="server" placeHolder="First Name"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>Last Name: </td>
                            <td><asp:TextBox ID="txtLastName" runat="server" placeHolder="Last Name"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>Password: </td>
                            <td><asp:TextBox ID="txtPassword" runat="server" placeHolder="Password" TextMode="Password"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td>Conform Password: </td>
                            <td><asp:TextBox ID="txtConPassword" runat="server" placeHolder="Conform Password" TextMode="Password"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td colspan='2'><center><asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label></center></td>
                        </tr>

                        <tr>
                            <td colspan='2'><asp:Button ID="btnAdd" runat="Server" Text="Add" onclick="btnAdd_Click" />  <asp:Button ID="btnCancel" runat="Server" Text="Cancel" onclick="btnCancel_Click" style="margin-left:20px" /></td>
                        </tr>
                    </table>
                </asp:Panel>

                <asp:Panel ID="PnlEditUsers" runat="server" GroupingText="Edit Users">
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
                </asp:Panel>

                <asp:Panel ID="PnlChngAdminPW" runat="server" GroupingText="Change Admin Password">
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
                </asp:Panel>
            </div>
        </div>
    </div>    
</div>

<div id="divNotification" style="display: none;">
        <div id="divNotificationHeader" style="background-color:red">
           Gulz Beauty Parlour
        </div>
        <div id="divNotificationContent" style="background-color:gray">
            <br />
            <center><strong><asp:Label ID="Label1" runat="server" forecolor="Red"></asp:Label></strong></center>
            <br />
            <a href="#" style="padding-left: 290px; font-weight: bold;" onclick="ShowNotification(0);Popup.hide('modal');return false;">
                OK</a>
        </div>
    </div>
</asp:Content>

