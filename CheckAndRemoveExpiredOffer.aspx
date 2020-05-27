<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckAndRemoveExpiredOffer.aspx.cs" Inherits="finalmilestone3.CheckAndRemoveExpiredOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
             <br />
        <asp:Label ID="Label4" runat="server" Text="OFFER ID "></asp:Label>
        <asp:TextBox ID="txt_offerid" runat="server" TextMode="Password"></asp:TextBox>
    <br />
        <asp:Button ID="btn_expiredoffer" runat="server" Text="CHECK AND REMOVE EXPIRED OFFER"  Width="653px" OnClick="check_expired_offer"/>
        </div>
    </form>
</body>
</html>
