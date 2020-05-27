<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeOrder.aspx.cs" Inherits="finalmilestone3.MakeOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btn_cash" runat="server" Text="Proceed with Payment"  Width="253px" OnClick="pay"   />
        </div>
    </form>
</body>
</html>
