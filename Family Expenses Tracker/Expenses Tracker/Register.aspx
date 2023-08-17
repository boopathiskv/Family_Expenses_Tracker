<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Expenses_Tracker.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 229px;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style2 {
            width: 207px;
        }
        .auto-style3 {
            width: 479px;
        }
        .auto-style4 {
            width: 207px;
            height: 37px;
        }
        .auto-style5 {
            width: 479px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-left: 40px">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">First Name</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtfname" runat="server" Height="28px" Width="294px" ValidateRequestMode="Enabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfname" ErrorMessage="Enter the First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtlname" runat="server" Height="28px" Width="294px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtlname" ErrorMessage="Enter the Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Moblie Number</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtmobileno" runat="server" Height="28px" Width="294px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtmobileno" ErrorMessage="Enter theMoblie Number" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">E-mail ID</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtemail" runat="server" Height="28px" Width="294px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter the E-mail ID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="txtpassword" runat="server" Height="28px" Width="294px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter the Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="Register_Function" Width="85px" />
                    &nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#009933" NavigateUrl="~/LoginPage.aspx">Login</asp:HyperLink>
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
