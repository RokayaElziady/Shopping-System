<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveFromWishlist.aspx.cs" Inherits="finalmilestone3.RemoveFromWishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            <asp:Label ID="Label1" runat="server" Text="serial_no"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" onclick="remove" Text="Remove" />
        </p>
    </form>
</body>
</html>
