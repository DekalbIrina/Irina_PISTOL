<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MailingDetails.aspx.vb" Inherits="MailAddressDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="background-color: lightsteelblue">
            <br />
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="Transparent" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="Navy" Height="24px" Text="Update Mailing Address " Width="221px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp;
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="363px"></asp:Label><br />
            <br />
            <asp:Label ID="lblUpdateSuccess" runat="server" BackColor="Azure" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="32px" Width="424px"></asp:Label><br />
            <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
                ForeColor="White" Height="32px" Width="552px"></asp:Label><br />
            <hr />
            <asp:Label ID="lblrehabid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MailID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtmailid" runat="server" Enabled="False" MaxLength="4" TabIndex="2"
                Width="61px" ToolTip="Mail ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="5" TabIndex="2"
                Width="61px" ToolTip="Member ID" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="lblmailaddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailing Address" Width="136px"></asp:Label>
            <asp:TextBox ID="txtmailaddress" runat="server" Width="528px"></asp:TextBox>
            &nbsp; &nbsp; &nbsp;&nbsp;<br />
            &nbsp;<asp:RequiredFieldValidator ID="ValidateMailingAddress" runat="server" ErrorMessage="Please, Enter Maling Address"
                Font-Bold="True" Width="248px" ControlToValidate="txtmailaddress"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblmailcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailing City" Width="98px"></asp:Label>&nbsp;<asp:TextBox ID="txtcity" runat="server"
                    Width="150px">
                </asp:TextBox>
            <asp:RequiredFieldValidator ID="ValCity" runat="server" ControlToValidate="txtcity"
                ErrorMessage="Please, Enter Mailing City" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblmailstate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailing State" Width="96px"></asp:Label>&nbsp;<asp:TextBox ID="txtstate" runat="server"
                    Width="152px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValState" runat="server" ControlToValidate="txtstate"
                ErrorMessage="Please, Enter Mailing State" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblmailzip" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailing Zip" Width="96px"></asp:Label>
            <asp:TextBox ID="txtzip" runat="server" Width="152px"></asp:TextBox>&nbsp;
            <asp:RequiredFieldValidator ID="ValZip" runat="server" ControlToValidate="txtzip"
                ErrorMessage="Please, Enter Mailing Zip Code" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <br />
            <asp:CheckBox ID="chkCurrentAddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Text="Current Address" Width="145px" ToolTip="Current Address" ForeColor="White" />
            &nbsp;&nbsp;<br />
            &nbsp;&nbsp;<br />
            <asp:Label ID="lblComments" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Comments"
                Width="144px"></asp:Label><br />
            <asp:TextBox ID="txtComment" runat="server" Height="192px" TextMode="MultiLine" Width="680px"></asp:TextBox><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            &nbsp;
            <cc1:confirmbuttonextender id="ConfirmButtonExtender1" runat="server" confirmtext="Do you want to delete record?"
                targetcontrolid="btndelete"></cc1:confirmbuttonextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            &nbsp;<asp:Label ID="lblUser" runat="server" BackColor="SteelBlue" BorderStyle="Double"
                BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Updated By" Width="112px"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" BackColor="#FFFFC0" Font-Bold="True"
                ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
            <hr />
            &nbsp;<br />
            &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Record"
                ToolTip="Delete Record" Font-Bold="True" ForeColor="Navy" Width="120px" CausesValidation="False" />
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Record"
                ToolTip="Update Mailing Address Record" Width="112px" Font-Bold="True" ForeColor="Navy" />
            &nbsp;<asp:Button ID="btnClear" runat="server" Text="Clear" Font-Bold="True" ForeColor="Navy" CausesValidation="False" />
            <asp:Button ID="btnMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy"
                PostBackUrl="~/MEMBER/Console.aspx" Text="Member Portal" Width="120px" CausesValidation="False" />
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/GRID/MailingList.aspx" Text="Mailing History"
                    ToolTip="Go Back To Mailing List" Width="122px" CausesValidation="False" />&nbsp;<asp:Button ID="btnHome"
                        runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="118px" CausesValidation="False" /><br />
            <br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
