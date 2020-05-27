<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancel.aspx.cs" Inherits="finalmilestone3.cancel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>


            <asp:Label ID="Label2" runat="server" Text="Order ID:"></asp:Label>
            <asp:TextBox ID="cancel_txt" runat="server"></asp:TextBox>
            <p></p>

            <asp:Button ID="cancel_btn" runat="server" Text="Cancel" OnClick="cancelO" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="redirect" runat="server" Text="Return to My Cart"  Width="253px" OnClick="returnCart"     />
        </div>
    </form>
</body>
</html>
