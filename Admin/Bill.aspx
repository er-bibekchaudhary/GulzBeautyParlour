<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Admin_Bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
    .bordered
    {
        border:dashed 1px solid black;
    }

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Customer Name:<asp:Label ID="lblCustomerName" runat="server" Text="" ForeColor="Red"></asp:Label><br />
        Billed date:<asp:Label ID="lblDate" runat="server" Text="" ForeColor="Red"></asp:Label>
    <table>
                    <caption><h4>Detail Bill : <asp:Label ID="lblbillNO" runat="server" Text="" ForeColor="Red"></asp:Label></h4> </caption> 
                    <tr class="bordered">
                        <th>service name</th>
                        <th>price </th>
                        <th>qyt</th>
                        <th>Amount</th>
                    </tr>
                
                <asp:Repeater ID="rptrbill" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("ServiceName")%></td>
                            <td><%#Eval("SalesPrice")%></td>
                            <td><%#Eval("Qyt")%></td>
                            <td><%#Eval("SalesAmount")%> </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr class="bordered">
                        <td colspan="3">Total:<asp:Label ID="lbltotal" runat="server" Text="" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td align="right">sold by:<asp:Label ID="lblsoldby" runat="server" Text="" ForeColor="Red" /></td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
