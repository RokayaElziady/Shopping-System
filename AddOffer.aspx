<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOffer.aspx.cs" Inherits="finalmilestone3.AddOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
        <asp:Label ID="Label4" runat="server" Text="OFFER AMOUNT "></asp:Label>
        <asp:TextBox ID="txt_offeramount" runat="server" TextMode="Password"></asp:TextBox>
        <br />
            <br />
        <asp:Label ID="Label1" runat="server" Text="EXPIRY DATE "></asp:Label>
        <asp:TextBox ID="txt_expirydate" runat="server" TextMode="Password"></asp:TextBox>
    
        
            <br />
            <br />
        <asp:Button ID="btn_addoffer2" runat="server" Text="CREATE OFFER"  Width="194px" OnClick="add_offer"/>
        </div>
    </form>
</body>
</html>
