<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="finalmilestone3.MyCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

              <asp:Button ID="Button2" runat="server" onclick="addtocart" Text="Add To Cart" />
            <asp:Button ID="Button1" runat="server" onclick="removefromcart" Text="Remove From Cart" />
             <asp:Button ID="Button3" runat="server" Text="Make Order" OnClick="make_order" />
            <asp:Button ID="Button4" runat="server" Text="Cancel Order" OnClick="cancel"  />
        </div>
    </form>
</body>
</html>
