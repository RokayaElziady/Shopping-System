<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="finalmilestone3.AddToCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>

      
        

            <asp:Label ID="Label2" runat="server" Text="serial_no"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            

            <p>

            <asp:Button ID="Button1" runat="server"  onclick="add"  Text ="add" />
            </p>
        </div>  
    </form>
</body>
</html>
