<%@ page title="" language="C#" masterpagefile="~/Admin/Admin.master" autoeventwireup="true" codefile="Services.aspx.cs" inherits="Admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Services</title>
    <style type="text/css">
        #divMenu ul li a {
            text-decoration: none;
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
            -webkit-box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
            box-shadow:  0px 0px 0px 9999px rgba(0, 0, 0, 0.5);
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

<asp:content id="Content3" contentplaceholderid="ContentBody" runat="Server">
    <br />
    <br />
    <div role="tabpanel" id="divMenu" class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><asp:LinkButton ID="Lnkaddcategoy" runat="server" role="tab" OnClick="Lnkaddcategoy_Click">Add Category</asp:LinkButton></li>
    <li role="presentation"><asp:LinkButton ID="Lnkaddservice" runat="server" role="tab" OnClick="Lnkaddservice_Click">Add Service</asp:LinkButton></li>
    <li role="presentation"><asp:LinkButton ID="LnkEditService" runat="server" role="tab" OnClick="LnkEditService_Click">Edit Servicece</asp:LinkButton></li>
  </ul>

  <!-- Tab panes -->
  <div role="tabpanel" >
    <asp:panel runat="server" ID="addcategoy">

             <h3>Add Category</h3>

             <div class="form-horizontal">
                  <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Category Name:</label>
                    <div class="col-sm-10">
                      <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Category Name"></asp:TextBox>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success" OnClick="btnAddCategory_Click" />
                        <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category" CssClass="btn btn-success" Visible="false" OnClick="btnSaveCategory_Click" />
                        <asp:Button ID="btnDelCategory" runat="server" Text="Delete Category" CssClass="btn btn-danger" Visible="false" OnClick="btnDelCategory_Click" /> 
                        <asp:Button ID="btnCancelCategory" runat="server" Text="Cancel" CssClass="btn btn-info" Visible="false" OnClick="btncancelCategory_Click" />        
                    </div>
                  </div>

                  <div class="form-group">

 
                                <font color="gray">Existing Category : </font>
                                <ul>
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


    </asp:panel>
    <asp:panel  runat="server" class="tab-pane" ID="addservice">
        <h3>Add Service</h3>
        <div class="form-horizontal">
                  <div class="form-group">
                    <label for="Category" class="col-sm-2 control-label">Category:</label>
                    <div class="col-sm-10">
                      <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="Service Name" class="col-sm-2 control-label">Service Name:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtService" CssClass="form-control" placeholder="Service Name" runat="server"> </asp:TextBox>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="Price" class="col-sm-2 control-label">Price: </label>
                    <div class="col-sm-10">
                      <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="Price" runat="server"></asp:TextBox>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <asp:Button ID="btnAddService" Text="Add Service" CssClass="btn btn-success" runat="server" OnClick="btnAddService_Click" />
                      <asp:Button Text="Cancel" runat="server" CssClass="btn btn-danger" OnClick="Unnamed1_Click" />
                    </div>
                  </div>
                </div>
    </asp:panel>
    <asp:panel runat="server" class="tab-pane" ID="EditService">
        <div class="container">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <b>Services: </b>
                                        <br />
                                        <asp:Repeater ID="rptrService" runat="server">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ServiceID") %>' OnClick="btnLoad_Click">
                                            <%#Eval("ServiceName") %>
                                                </asp:LinkButton>
                                                <br />
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </div>

                                    <div class="col-sm-10">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label for="Category" class="col-sm-2 control-label"> Category: </label>
                                                <div class="col-sm-10">
                                                    <asp:DropDownList ID="ddlCategoryEdit" CssClass="form-control" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="Category" class="col-sm-2 control-label"> Service Name: </label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtServiceEdit" CssClass="form-control" placeholder="Service Name" runat="server"> </asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label for="Category" class="col-sm-2 control-label"> Price: </label>
                                                <div class="col-sm-10">
                                                    <asp:TextBox ID="txtPriceEdit" CssClass="form-control" placeholder="Price" runat="server"></asp:TextBox>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <asp:Button ID="btnsaveEditService" Text="Save Service" CssClass="btn btn-success" runat="server" OnClick="btnsaveEditService_Click" />
                                                    <asp:Button ID="btnDelete" Text="Delete" runat="server" CssClass="btn btn-danger" OnClick="btncancelEdit_Click" />
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
    </div>
    </asp:panel>
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

</asp:content>

