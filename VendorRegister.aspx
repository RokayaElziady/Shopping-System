<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorRegister.aspx.cs" Inherits="finalmilestone3.VendorRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <p></p>
            <asp:Label ID="Label2" runat="server" Text="First_Name"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <p></p>
            <asp:Label ID="Label3" runat="server" Text="Last_Name"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <p></p>
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <p></p>
            <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <p></p>
             <asp:Label ID="Label6" runat="server" Text="Company Name"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <p></p>
             <asp:Label ID="Label7" runat="server" Text="Bank Account Number"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <p></p>

            <asp:Button ID="Button1" runat="server" onclick="vendregister" Text="Register" />
        </div>
        
    </form>
</body>
</html>
