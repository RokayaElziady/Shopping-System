<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Offers.aspx.cs" Inherits="finalmilestone3.Offers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
             <br />
        <asp:Button ID="Button1" runat="server" Text="POST PRODUCT"  Width="959px" OnClick="P_PRODUCT"/>
            <br />
             <br />
        <asp:Button ID="Button2" runat="server" Text="VEIW PRODUCT"  Width="959px" OnClick="V_PRODUCT"/>
            <br />
             <br />
        <asp:Button ID="Button3" runat="server" Text="EDIT PRODUCT "  Width="958px" OnClick="E_PRODUCT"/>
            <br />
            <br />
        <asp:Button ID="add_offer" runat="server" Text="CREATE OFFER"  Width="959px" OnClick="add_offers"/>
            <br />
             <br />
        <asp:Button ID="apply_offer" runat="server" Text="APPLY OFFER"  Width="958px" OnClick="apply_offers"/>
            <br />
             <br />
        <asp:Button ID="check_and_remove_ex_offer" runat="server" Text="CHECK AND REMOVE EXPIRED OFFER"  Width="959px" OnClick="remove_offers"/>
        </div>
    </form>
</body>
</html>
