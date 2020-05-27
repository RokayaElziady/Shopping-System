<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cash.aspx.cs" Inherits="finalmilestone3.cash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
         <asp:Label ID="cash_txtbox" runat="server" Text="Amount paid in cash: "></asp:Label>
    
            <br />
            <br />
    
        <asp:TextBox ID="cash_amount" runat="server"></asp:TextBox>
    
         <%--<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="cash_amount" ErrorMessage=" Type only Number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
            <br />--%>
    
        <br />
             <asp:Button ID="payC" runat="server" Text="Submit"  Width="90px" OnClick="enterCash"/>
        </div>
    <p>
        &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
     <asp:Button ID="return" runat="server" Text="Return To My Cart"  Width="136px" OnClick="returnCart" />
        </p>
    </form>
</body>
</html>
