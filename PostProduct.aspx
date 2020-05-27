<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostProduct.aspx.cs" Inherits="finalmilestone3.PostProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    
        <br />
             <asp:Label ID="lbl_P" runat="server" Text="PRODUCT  NAME: "></asp:Label>
    
        <asp:TextBox ID="txt_product" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
            
        <br />
        <asp:Label ID="lbl_C" runat="server" Text="CATEGORY "></asp:Label>
        <asp:TextBox ID="txt_CATEGORY" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
 <br />
        <asp:Label ID="Label1" runat="server" Text="PRODUCT DESCRIBTION "></asp:Label>
        <asp:TextBox ID="txt_product_description" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
  <br />
        <asp:Label ID="Label2" runat="server" Text="PRICE  "></asp:Label>
        <asp:TextBox ID="txt_price" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
<br />
        <asp:Label ID="Label3" runat="server" Text="COLOR  "></asp:Label>
        <asp:TextBox ID="txt_color" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />

<br />
        <asp:Button ID="btn_login" runat="server" Text="POST PRODUCT"  Width="194px" OnClick="Post_product"/>
        </div>
    </form>
</body>
</html>
