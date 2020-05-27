<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="finalmilestone3.ViewProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       
             <br />
        <div>
            <asp:GridView ID="XX" runat="server"></asp:GridView>
        </div>

          <br />

            <br />
        <asp:Button ID="btn_view" runat="server" Text="VIEW PRODUCTS"  Width="194px" OnClick="view_product"/>
        </div>

    </form>
</body>
</html>
