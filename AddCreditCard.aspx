<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCreditCard.aspx.cs" Inherits="finalmilestone3.AddCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <div>
            <div>
            <asp:Label ID="Label1" runat="server" Text="Credit Card Number"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" style="margin-bottom: 0px"></asp:TextBox>
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="CVV"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
            </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Expiry Date"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

            </p>
        <p>

            <asp:Button ID="Button1" runat="server"  onclick="add" Text="Add" />
        </p>
        </div>
    </form>
</body>
</html>
