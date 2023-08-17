<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDispleList.aspx.cs" Inherits="Expenses_Tracker.UserDispleList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserHomePage.aspx">User Home Page</asp:HyperLink>
                    </td>
                    <td><asp:Button ID="btnLogout" runat="server" CausesValidation="False" OnClick="btnLogout_Click" Text="Logout" />
                    </td>
                </tr>
                <tr>
                    <td>Select Category</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" Height="51px" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" Width="166px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCategory" ErrorMessage="Select the Category " ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Select Category</td>
                    <td>
                        <asp:DropDownList ID="ddlCategoryList" runat="server" Height="51px" Width="166px">
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="chkSub" runat="server" Text="Check  Sub Category " />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" Width="120px" />
                    </td>
                </tr>
            </table>
        </div>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
    </form>
</body>
</html>
