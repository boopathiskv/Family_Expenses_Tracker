<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Expenses_Tracker.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 79%;
            height: 232px;
        }
        .auto-style2 {
            width: 244px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">EMail ID</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" Height="37px" Width="250px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Enter The Email ID"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Password</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server" Height="37px" TextMode="Password" Width="250px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter The Password"></asp:RequiredFieldValidator>
                    </td>
                </tr>                
                <tr>
                    <td class="auto-style2" id="register">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnUserLogin" runat="server" Text="Login" Width="138px" OnClick="btnUserLogin_Click" Height="31px" />
                    &nbsp;
                        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#009933" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
