<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewWishlist.aspx.cs" Inherits="finalmilestone3.ViewWishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:Label ID="Label1" runat="server" Text="Wishlist Name"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" onclick="viewmywishlist" Text="View" />
        </p>
    </form>
</body>
</html>
