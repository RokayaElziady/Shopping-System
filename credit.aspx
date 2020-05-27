<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="credit.aspx.cs" Inherits="finalmilestone3.credit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    <asp:DropDownList ID="DropDownList1" runat="server" onselectedindexchanged="payC"
                AutoPostBack="true" AppendDataBoundItems="true"  DataTextField="cc_number" DataValueField="cc_number">
                <asp:ListItem Text="Select Credit Card" Value="0" />
            </asp:DropDownList>

        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
                 <asp:Button ID="return" runat="server" Text="Return To My Cart"  Width="146px" OnClick="returnCart" />

        </p>
    </form>
</body>
</html>
