<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomePage.aspx.cs" Inherits="finalmilestone3.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <h1> WELCOME TO GUCBAY</h1>
            <asp:Button ID="Button1" runat="server" onclick="cusregister" Text="Customer Register" />
            <asp:Button ID="Button2" runat="server" onclick="vendregister" Text="Vendor Register" />
            <asp:Button ID="Button3" runat="server"  onclick="login" Text="Login" />
        </div>
    </form>
</body>
</html>
