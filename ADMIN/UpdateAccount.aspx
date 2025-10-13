<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UpdateAccount.aspx.vb" Inherits="UpdateAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightsteelblue">
        <br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Navy"
            Text="UPDATE PASSWORD" Width="184px"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Label ID="lblUser" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Navy"
            Width="240px"></asp:Label><br />
        <br />
        <asp:Label ID="lblSuccess" runat="server" BackColor="AliceBlue" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="Navy" Height="24px" Visible="False" Width="536px"></asp:Label><br />
        <asp:Label ID="lblError" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
            ForeColor="White" Height="24px" Visible="False" Width="544px"></asp:Label><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblusername" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="USERNAME" Width="112px"></asp:Label><strong><span style="color: #000099"></span>
            </strong>
        <asp:TextBox ID="txtuser" runat="server" Style="left: -12px; top: 149px" ToolTip="Enter UserName"
            Width="205px" BackColor="#FFFFC0" Font-Bold="True" ReadOnly="True"></asp:TextBox><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblpassword" runat="server" BackColor="SteelBlue"
            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
            ForeColor="White" Text="PASSWORD" Width="112px"></asp:Label><span style="color: #000099">
            </span>
        <asp:TextBox ID="txtpassword" runat="server" Style="left: -12px; top: 149px"
            ToolTip="Old Password" Width="207px" BackColor="#FFFFC0" Font-Bold="True" ReadOnly="True"></asp:TextBox>&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Label ID="lblNewPw" runat="server" BackColor="SteelBlue"
            BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
            ForeColor="White" Text="NEW PASSWORD" Width="120px"></asp:Label>
        <asp:TextBox ID="txtNewPassword" runat="server" ToolTip="Enter New Password" Width="208px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ValidateNewPw" runat="server" ControlToValidate="txtNewPassword"
            ErrorMessage="Please Enter New Password" Font-Bold="True"></asp:RequiredFieldValidator><br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;<asp:Button ID="btnewpassword" runat="server" Font-Bold="True" Font-Names="Georgia"
            Height="28px" Style="left: -12px; top: 149px" Text="Update Password" ToolTip="New Password"
            UseSubmitBehavior="False" Width="136px" ForeColor="Navy" />&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button
                ID="btnClear" runat="server" CausesValidation="False" Font-Bold="True" ForeColor="Navy"
                Height="28px" Text="Clear" Width="88px" />&nbsp;&nbsp;
        <asp:Button ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
            ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
            Width="118px" CausesValidation="False" /><br />
        <hr />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
