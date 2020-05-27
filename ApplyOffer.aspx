<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyOffer.aspx.cs" Inherits="finalmilestone3.ApplyOffer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
           <div>
             
             <br />
        <asp:Label ID="Label1" runat="server" Text="OFFER ID "></asp:Label>
        <asp:TextBox ID="txt_offerid" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label2" runat="server" Text="PRODUCT SERIAL NUMBER "></asp:Label>
        <asp:TextBox ID="txt_serial" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
            <br />
             <br />
        <asp:Button ID="btn_applyoffer" runat="server" Text="APPLY OFFER"  Width="805px" OnClick="apply_offer"/>
        </div>
        
    </form>
</body>
</html>
