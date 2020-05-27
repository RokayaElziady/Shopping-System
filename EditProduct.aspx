<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="finalmilestone3.EditProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
       
             <br />
        <asp:Label ID="Label1" runat="server" Text="PRODUCT SERIAL NUMBER "></asp:Label>
        <asp:TextBox ID="txt_serial" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label2" runat="server" Text="PRODUCT NAME "></asp:Label>
        <asp:TextBox ID="txt_productName" runat="server" TextMode="Password" Width="299px"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label3" runat="server" Text="CATEGORY "></asp:Label>
        <asp:TextBox ID="txt_category" runat="server" TextMode="Password" Width="352px"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label5" runat="server" Text="PRODUCT DESCRIPTION "></asp:Label>
        <asp:TextBox ID="txt_description" runat="server" TextMode="Password" Height="18px" Width="433px"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label6" runat="server" Text="PRICE"></asp:Label>
        <asp:TextBox ID="txt_price" runat="server" TextMode="Password" Width="195px"></asp:TextBox>
    
        <br />
             <br />
        <asp:Label ID="Label7" runat="server" Text="COLOR "></asp:Label>
        <asp:TextBox ID="txt_color" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />

            <br />
        <asp:Button ID="btn_edit" runat="server" Text="EDIT PRODUCT"  Width="194px" OnClick="edit_product"/>
        </div>


      
    </form>
</body>
</html>
