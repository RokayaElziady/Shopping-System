<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="credit2.aspx.cs" Inherits="finalmilestone3.credit2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Label ID="credit_txtbox" runat="server" Text="Amount paid in credit: "></asp:Label>
    
            <br />
            <br />
    
        <asp:TextBox ID="credit_amount" runat="server"></asp:TextBox>
    
           <%-- <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="cash_amount" ErrorMessage=" Type only Number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
            <br />
    --%>
            <br />
        <br />
             <asp:Button ID="payCredit" runat="server" Text="Submit"  Width="90px" OnClick="creditPay" />
    
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
    
            <asp:Button ID="redirect" runat="server" Text="Return to My Cart"  Width="253px" OnClick="returnCart"     />
        </div>
    </form>
</body>
</html>
