<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveFromCart.aspx.cs" Inherits="finalmilestone3.RemoveFromCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        

             <div>
      
        <asp:Label ID="Label1" runat="server" Text="Serial_no"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

        <p>

        <asp:Button ID="Button1" runat="server"  onclick="remove" Text="Remove" />
        </p>
              
        </div>
    </form>
</body>
</html>
