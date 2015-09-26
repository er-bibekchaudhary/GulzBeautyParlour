<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Services</title>
    <style type="text/css">
        #divMenu ul li a
        {
            text-decoration:none;          
            margin-left:10px;
            color:Red;
        } 
        
         #divContext ul li
        {
             display:inline;
             Margin-left:10px;
        }
         .category
        {
             color:rosybrown;
        }
       
        .category:hover {
            cursor:pointer
       }

       .menu:hover {
            cursor:pointer
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
        <%--  $(function(){
            var CatID;

            $("#divEditService").hide();

            $('.category').click(function () {
                $("#<%=txtCategory.ClientID %>").val($(this).text());
                CatID = $(this).attr('data-rel');
                $("#<%=btnAddCategory.ClientID %>").hide();
                $("#<%=btnSaveCategory.ClientID %>").show();
                $("#<%=btnDelCategory.ClientID %>").show();
                $("#btnUpdateCat").show();
            });

            $(".Save").click(function () {
                $("#<%=btnAddCategory.ClientID %>").show();
                $("#<%=btnSaveCategory.ClientID %>").hide();
                $("#<%=btnDelCategory.ClientID %>").hide();
            });

            //$("#aService").click(function () {
            //    $("#divAddService").show();
            //    $("#divEditService").hide();
            //});

            //$("#eService").click(function () {
            //    $("#divEditService").show();
            //    $("#divAddService").hide();
            //});

            $("#btnUpdateCat").click(function (e) {

                var catageryName = $("#<%=txtCategory.ClientID %>").val();
                var param = {
                    CategoryName: catageryName,
                    CategoryID: CatID
                };
                $.ajax({
                    type: 'POST',
                    async: false,
                    url: "/WebMethods/CategoryServices.asmx/UpdateCategories",
                    data: JSON.stringify(param),
                    dataType: 'json',
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        alert(1);
                    }
                    
                });
            });

        });--%>
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
<br />
<br />
    <div id="divMenu" class="container">
    <div class="row">
        <div class="col-sm-3">
    <ol>
    <li>Services</li>
    <ul>
        <li class="menu"><asp:LinkButton runat="server" ID="lnkAddService" OnClick="lnkAddService_Click">Add Service</asp:LinkButton></li>
        <li class="menu"><asp:LinkButton runat="server" ID="lnkEditService" OnClick="lnkEditService_Click">Edit Service</asp:LinkButton></li>
    </ul>
    <li><a href="Sales.aspx">Sales</a></li>
    <li><a href="UserMgnt.aspx">User Management</a></li>
</ol>
 </div>
        
 <div class="col-sm-9" id="divContext">
<div class="row">
<div class="col-sm-12">
<center>
<table>
<tr>
    <th colspan='3'><center>Add Category</center></th>
</tr>

<tr>
    <td>Category Name:</td>
    <td><asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox></td>
    <td><asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success" onclick="btnAddCategory_Click" />
        <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category" CssClass="btn btn-success" Visible="false"  OnClick="btnSaveCategory_Click"/>
        <asp:Button ID="btnDelCategory" runat="server" Text="Delete Category" CssClass="btn btn-danger" Visible="false"  OnClick="btnDelCategory_Click"/>
    </td>
</tr>
</table>
<center>
<ul>
<li><font color="gray">Existing Category : </font></li>
<asp:Repeater ID="rptrCategory" runat="server" >
<ItemTemplate>

    <li class="category"> 
        <asp:LinkButton ID="lnkLoad" runat="server" CommandArgument='<%#Eval("categoryID")%>' onclick="btnEditCat_Click">
           <%#Eval("categoryName")%>
        </asp:LinkButton>     
    </li>
</ItemTemplate>
</asp:Repeater>
</ul>
</center>
</center>
</div>
</div>
<br /><br /><br />

<div class="row">
    <div class="col-sm-12">
        <asp:Panel ID="pnlAdd" runat="server">
            <table style="padding:10px;">
                <tr>
                    <td>Category: </td>
                    <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" ></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    
                <td>
                    Service Name:
                </td>
                    <td>
                        <asp:TextBox ID="txtService" CssClass="form-control" runat="server">

                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Price:
                       
                    </td>
                    <td>
                        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnAddService" Text="Add Service" CssClass="btn btn-success" runat="server" OnClick="btnAddService_Click" /> 
                        <asp:Button Text="Cancel" runat="server" CssClass="btn btn-danger" OnClick="Unnamed1_Click" />
                    </td>
                </tr>

            </table>

        </asp:Panel>

        <asp:Panel ID="pnlEditService" runat="server">
            <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <b>Services: </b><br />
                    <asp:Repeater ID="rptrService" runat="server">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkLoad" runat="server" CommandArgument='<%#Eval("ServiceID") %>' onclick="btnLoad_Click">
                                            <%#Eval("ServiceName") %>
                                        </asp:LinkButton>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>

                </div>

                <div class="col-sm-10">
                        <table>
                <tr>
                    <td>Category: </td>
                    <td>
                    <asp:DropDownList ID="ddlCategoryEdit" runat="server"  ></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    
                <td>
                    Service Name:
                </td>
                    <td>
                        <asp:TextBox ID="txtServiceEdit" runat="server">

                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Price:
                       
                    </td>
                    <td>
                        <asp:TextBox ID="txtPriceEdit" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnsaveEditService" Text="Save Service" runat="server" OnClick="btnsaveEditService_Click" /> 
                        <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btncancelEdit_Click" />
                    </td>
                </tr>


            </table>
                </div>

            </div>
            </div>
       </asp:Panel>

    </div>
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
            <center><strong><asp:Label ID="lblMessage" runat="server" forecolor="Red"></asp:Label></strong></center>
            <br />
            <a href="#" style="padding-left: 290px; font-weight: bold;" onclick="ShowNotification(0);Popup.hide('modal');return false;">
                OK</a>
        </div>
    </div>

</asp:Content>

