<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Services</title>
    <style type="text/css">
        #divMenu ul li a {
            text-decoration: none;
            margin-left: 10px;
            color: Red;
        }

        #divContext ul li {
            display: inline;
            Margin-left: 10px;
        }

        .category {
            color: rosybrown;
        }

            .category:hover {
                cursor: pointer;
            }

        .menu:hover {
            cursor: pointer;
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="Server">
    <br />
    <br />
    <div id="divMenu" class="container">
        <div class="row">
            <div class="col-sm-3">
                <ol>
                    <li class="menu">
                        <asp:LinkButton runat="server" ID="lnkAddService" OnClick="lnkAddService_Click">Add Service</asp:LinkButton></li>
                    <li class="menu">
                        <asp:LinkButton runat="server" ID="lnkEditService" OnClick="lnkEditService_Click">Edit Service</asp:LinkButton></li>
                </ol>
            </div>
            <div class="col-sm-9">




                <div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#addcategoy" aria-controls="home" role="tab" data-toggle="tab">Add Category</a></li>
    <li role="presentation"><a href="#addservice" aria-controls="profile" role="tab" data-toggle="tab">Add Service</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="addcategoy">

                <h3>Add Category</h3>


             <div class="form-horizontal">
                  <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Category Name:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-success">Add Category</button>
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </div>
                  </div>

                     <div class="form-group">

 <ul>
                                    <li><font color="gray">Existing Category : </font></li>
                                    <asp:Repeater ID="rptrCategory" runat="server">
                                        <ItemTemplate>

                                            <li class="category">
                                                <asp:LinkButton ID="lnkLoad" runat="server" CommandArgument='<%#Eval("categoryID")%>' OnClick="btnEditCat_Click">
           <%#Eval("categoryName")%>
                                                </asp:LinkButton>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                         </div>
                </div>


    </div>
    <div role="tabpanel" class="tab-pane" id="addservice">




                <div class="form-horizontal">
                  <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Category:</label>
                    <div class="col-sm-10">
                      <select class="form-control">
                          <option>asdf asfda</option>
                          <option>asdf asfda</option>
                          <option>asdf asfda</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="Service Name" class="col-sm-2 control-label">Service Name:</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" placeholder="Service Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="Service Name" class="col-sm-2 control-label">Price: </label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-success">Add Service</button>
                        <button type="submit" class="btn btn-danger">Cancel</button>
                    </div>
                  </div>
                </div>
            </div>




















    </div>
  </div>

</div>

























            <div class="col-sm-9" id="divContext">
                <div class="row">
                    <div class="col-sm-12">
                            <table>
                                <tr>
                                    <th colspan='3'>
                                        <center>Add Category</center>
                                    </th>
                                </tr>

                                <tr>
                                    <td>Category Name:</td>
                                    <td>
                                        <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control"></asp:TextBox></td>
                                    <td>
                                        <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success" OnClick="btnAddCategory_Click" />
                                        <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category" CssClass="btn btn-success" Visible="false" OnClick="btnSaveCategory_Click" />
                                        <asp:Button ID="btnDelCategory" runat="server" Text="Delete Category" CssClass="btn btn-danger" Visible="false" OnClick="btnDelCategory_Click" />
                                    </td>
                                </tr>
                            </table>
                        
                               
                         
                    </div>
                </div>
                <br />
                <br />
                <br />

                <div class="row" style="display:none;">
                    <div class="col-sm-12">
                        <asp:Panel ID="pnlAdd" runat="server">
                            <table style="padding: 10px;">
                                <tr>
                                    <td>Category: </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    <td>Service Name:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtService" CssClass="form-control" runat="server">

                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Price:
                       
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
                                        <b>Services: </b>
                                        <br />
                                        <asp:Repeater ID="rptrService" runat="server">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkLoad" runat="server" CommandArgument='<%#Eval("ServiceID") %>' OnClick="btnLoad_Click">
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
                                                    <asp:DropDownList ID="ddlCategoryEdit" runat="server"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>Service Name:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServiceEdit" runat="server">

                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Price:
                       
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
        <div id="divNotificationHeader" style="background-color: green; padding: 10px 15px; color: #fff">
            Gulz Beauty Parlour
        </div>
        <div id="divNotificationContent" style="background-color: white">
            <br />
            <center><strong>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></strong></center>
            <br />
            <button class="btn btn-success pull-right" style="margin:0 10px 10px 0;"><a href="#" style="color:#fff;" onclick="ShowNotification(0);Popup.hide('modal');return false;">OK</a></button>
        </div>
    </div>

</asp:Content>

