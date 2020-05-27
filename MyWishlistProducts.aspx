<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyWishlistProducts.aspx.cs" Inherits="finalmilestone3.MyWishlistProducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <asp:Button ID="Button1" runat="server" onclick="add" Text="Add To WishList" />
            <asp:Button ID="Button2" runat="server" onclick="remove" Text="Remove From Wishlist" />
        </div>
    </form>
</body>
</html>
