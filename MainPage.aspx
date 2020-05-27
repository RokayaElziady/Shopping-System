<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="finalmilestone3.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="Button5" runat="server" onclick="viewwishlist" Text="View Wishlist" />
        <asp:Button ID="Button1" runat="server" onclick="viewcart" Text="View My Cart" />
        <asp:Button ID="Button2" runat="server" onclick="create" Text="Create Wishlist" />
        <asp:Button ID="Button4" runat="server" onclick="add" Text="Add Credit Card" />
        <asp:Button ID="Button3" runat="server" onclick="addmobile" Text="Add Mobile" />

        </div>
    </form>
</body>
</html>
