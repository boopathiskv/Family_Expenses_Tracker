<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHomePage.aspx.cs" Inherits="Expenses_Tracker.UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 72%;
            height: 134px;
        }
        .auto-style2 {
            width: 250px;
        }
        .auto-style3 {
            width: 250px;
            height: 45px;
        }
        .auto-style4 {
            height: 45px;
            width: 394px;
        }
        .auto-style5 {
            width: 394px;
        }
        .auto-style6 {
            width: 250px;
            height: 41px;
        }
        .auto-style7 {
            width: 394px;
            height: 41px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>            
            <h1> User Home page...
                &nbsp;<asp:Button ID="btnLogout" runat="server" CausesValidation="False" OnClick="btnLogout_Click" Text="Logout" />
            </h1>
            <table class="auto-style1">
                <tr>
                    <td>Insert Expencse</td>
                    <td>
                <asp:HyperLink ID="hlrecords" runat="server" NavigateUrl="~/UserDispleList.aspx">Records List</asp:HyperLink>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style3">Category</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" Height="51px" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" Width="166px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddlCategory" ErrorMessage="Select the Category " ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Category List</td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="ddlCategoryList" runat="server" Height="51px" Width="166px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlCategoryList" ErrorMessage="Select the Category List" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Date[DD/MM/YYYY]</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtdate" runat="server" Height="27px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdate" ErrorMessage="Enter the Date" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Bill No \ GST NO </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtgst" runat="server" Height="27px" Width="199px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtgst" ErrorMessage="Enter the Bill No " ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">Cost</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtcost" runat="server" Height="27px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcost" ErrorMessage="Enter the Cost" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">About</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="txtAbout" runat="server" Height="27px" Width="200px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAbout" ErrorMessage="Enter the about" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="btninsert" runat="server" OnClick="btninsert_Click" Text="Submit" Width="92px" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
