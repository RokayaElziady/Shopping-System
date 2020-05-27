<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="finalmilestone3.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style2 {
            z-index: 1;
            left: 114px;
            top: 78px;
            position: absolute;
            width: 121px;
        }
        .auto-style4 {
            height: 11px;
            width: 132px;
        }
        .auto-style5 {
            z-index: 1;
            left: 9px;
            top: 29px;
            position: absolute;
            width: 169px;
            height: 25px;
        }
        .auto-style6 {
            z-index: 1;
            left: 4px;
            top: 77px;
            position: absolute;
            width: 99px;
            height: 26px;
            right: 828px;
        }
        .auto-style7 {
            z-index: 1;
            left: 8px;
            top: 200px;
            position: absolute;
            width: 121px;
        }
        .auto-style8 {
            position: absolute;
            top: 236px;
            left: 122px;
            right: 706px;
            z-index: 1;
        }
        .auto-style9 {
            z-index: 1;
            left: 6px;
            top: 239px;
            position: absolute;
            width: 121px;
            bottom: 112px;
        }
        .auto-style12 {
            z-index: 1;
            left: 9px;
            top: 391px;
            position: absolute;
            width: 113px;
            right: 809px;
        }
        .auto-style13 {
            z-index: 1;
            left: 8px;
            top: 467px;
            position: absolute;
            width: 121px;
            bottom: 142px;
        }
        .auto-style16 {
            z-index: 1;
            top: 504px;
            position: absolute;
            width: 100px;
            left: 4px;
            right: 827px;
        }
        .auto-style20 {
            z-index: 1;
            left: 18px;
            top: 623px;
            position: absolute;
            width: 113px;
            right: 800px;
        }
        .auto-style26 {
            z-index: 1;
            left: 9px;
            top: 843px;
            position: absolute;
            width: 113px;
            right: 809px;
            height: 26px;
        }
        .auto-style30 {
            z-index: 1;
            left: 15px;
            top: 993px;
            position: absolute;
            width: 113px;
            right: 803px;
            height: 26px;
        }
        .auto-style32 {
            z-index: 1;
            left: 7px;
            top: 336px;
            position: absolute;
            width: 121px;
        }
        .auto-style35 {
            position: absolute;
            top: 503px;
            left: 124px;
            z-index: 1;
        }
        .auto-style36 {
            z-index: 1;
            left: 4px;
            top: 552px;
            position: absolute;
            width: 121px;
        }
        .auto-style37 {
            position: absolute;
            top: 553px;
            left: 127px;
            z-index: 1;
        }
        .auto-style38 {
            z-index: 1;
            left: 3px;
            top: 690px;
            position: absolute;
            width: 121px;
            right: 807px;
        }
        .auto-style39 {
            z-index: 1;
            left: 5px;
            top: 754px;
            position: absolute;
            width: 121px;
            right: 1002px;
        }
        .auto-style40 {
            z-index: 1;
            left: 4px;
            top: 774px;
            position: absolute;
            width: 121px;
            right: 806px;
        }
        .auto-style41 {
            position: absolute;
            top: 737px;
            left: 96px;
            z-index: 1;
        }
        .auto-style42 {
            position: absolute;
            top: 774px;
            left: 98px;
            z-index: 1;
        }
        .auto-style43 {
            z-index: 1;
            left: 5px;
            top: 897px;
            position: absolute;
            width: 121px;
            }
        .auto-style44 {
            z-index: 1;
            left: 2px;
            top: 949px;
            position: absolute;
            width: 121px;
        }
        .auto-style45 {
            position: absolute;
            top: 950px;
            left: 76px;
            z-index: 1;
        }
        .auto-style46 {
            width: 166px;
            height: 37px;
            position: absolute;
            top: 338px;
            left: 168px;
            z-index: 1;
        }
        .auto-style47 {
            z-index: 1;
            left: 18px;
            top: 141px;
            position: absolute;
            width: 113px;
            right: 866px;
        }
        .auto-style48 {
            z-index: 1;
            left: 84px;
            top: 279px;
            position: absolute;
            width: 113px;
            right: 734px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
        <div class="auto-style4">
            <asp:Label ID="Label1" runat="server" Text="To activatevendors:
                " CssClass="auto-style5"></asp:Label>
            <br />
        </div>
        <p>
            &nbsp;</p>
        <p>
        <asp:TextBox ID="vendorname" runat="server" CssClass="auto-style2"></asp:TextBox>
            <asp:Label ID="Label3" runat="server" Text="vendorusername:
                " CssClass="auto-style6"></asp:Label>
        </p>
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="activate" Text="Activate" CssClass="auto-style47" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:TextBox ID="ordernumber" runat="server" CssClass="auto-style8"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="To update status:
                " CssClass="auto-style7"></asp:Label>
        </p>
    <p>
        <asp:Button ID="Button7" runat="server" OnClick="updatingstatus" Text="Update" CssClass="auto-style48" />
        </p>
    <p>
        &nbsp;</p>
        <p>
            <asp:Label ID="Label17" runat="server" Text="To review orders:
                " CssClass="auto-style32"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="orderno:
                " CssClass="auto-style9"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="Table" EmptyDataText="There are no orders to display" runat="server" CssClass="auto-style46">
            </asp:GridView>
        </p>
        <p>
            &nbsp;&nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Button3" runat="server" OnClick="review" Text="Review" CssClass="auto-style12" />
        </p>
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
            <asp:Label ID="Label8" runat="server" Text="Add todays deal on product:
                " CssClass="auto-style38"></asp:Label>
            </p>
        <p>
            <asp:Label ID="Label9" runat="server" Text="deal amount:
                " CssClass="auto-style16"></asp:Label>
            <asp:Label ID="Label18" runat="server" Text="create Todays Deal:
                " CssClass="auto-style13"></asp:Label>
            <p>
            <asp:TextBox ID="dealid" runat="server" CssClass="auto-style41"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="dealamount" runat="server" CssClass="auto-style35"></asp:TextBox>
        </p>
    <p>
        <asp:Button ID="Button4" runat="server" OnClick="addtodaysdealonproduct" Text="Add" CssClass="auto-style26" />
        </p>
    <p>
        &nbsp;</p>
    <p>
            <asp:Label ID="Label20" runat="server" Text="expiry date:
                " CssClass="auto-style36"></asp:Label>
            </p>
    <p>
            <asp:TextBox ID="expirydate" runat="server" CssClass="auto-style37"></asp:TextBox>
        </p>
    <p>
            <asp:Label ID="Label21" runat="server" Text="serial no:
                " CssClass="auto-style40"></asp:Label>
            <asp:Label ID="Label22" runat="server" Text="deal id:
                " CssClass="auto-style39"></asp:Label>
            <asp:TextBox ID="serialno" runat="server" CssClass="auto-style42"></asp:TextBox>
        </p>
    <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Button5" runat="server" OnClick="Createtodaysdeal" Text="Create" CssClass="auto-style20" />
        </p>
        <p>
            <asp:Label ID="Label23" runat="server" Text="remove expired deal:
                " CssClass="auto-style43"></asp:Label>
            </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Label ID="Label24" runat="server" Text="Deal id:
                " CssClass="auto-style44"></asp:Label>
            <asp:TextBox ID="Deal" runat="server" CssClass="auto-style45"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="Button6" runat="server" OnClick="removeexpireddeal" Text="Remove" CssClass="auto-style30" />
        </p>
    </form>
    </body>
</html>
