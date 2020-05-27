<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="choose.aspx.cs" Inherits="finalmilestone3.choose" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                        
            <br />
         <asp:Button ID="btn_cash" runat="server" Text="Pay With Cash"  Width="253px" OnClick="payCash"    />

            <br />
            <br />
            <asp:Button ID="btn_credit" runat="server" Text="Pay With Credit"  Width="253px" OnClick="enterCredit"    />

            <br />
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="redirect" runat="server" Text="Return to My Cart"  Width="253px" OnClick="returnCart"     />


        </p>
    </form>
</body>
</html>
