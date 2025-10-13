<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CopyLicenseDetails.aspx.vb" Inherits="CopyLicenseDetails" %>

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
            <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2"
                Font-Bold="True" Font-Names="Verdana" Font-Size="Small" ForeColor="#284E98" StaticSubMenuIndent="10px">
                <StaticSelectedStyle BackColor="#507CD1" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <Items>
                    <asp:MenuItem Text="LETTERS" ToolTip="Affidavit" Value="Affidavit">
                        <asp:MenuItem NavigateUrl="~/LETTER/CopyLicenseAffidavit.aspx" Text="Copy License Issued In Mail Affidavit" ToolTip="Copy License Issued In Mail Affidavit"
                            Value=""></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
            </asp:Menu>
            &nbsp; &nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtLostInMail"></cc1:calendarextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            &nbsp;&nbsp;<br />
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblUpdateCopyIssueLic" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Update Copy License Issued in Mail" Width="312px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="363px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <br />
            <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
                ForeColor="White" Height="48px" Width="552px"></asp:Label><br />
            <asp:Label ID="lblUpdateSuccess" runat="server" BackColor="Lavender" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="40px" Width="592px"></asp:Label><br />
            <hr />
            <asp:Label ID="lbltransid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Trans ID" Width="99px"></asp:Label>
            <asp:TextBox ID="txttransid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                ToolTip="TransID" Width="72px" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lbldcplid" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="DCPLID"
                Width="99px"></asp:Label>
            <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="111px" ToolTip="DCPLID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="112px" ToolTip="MemberID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblAffidavitDate" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Affidavit Date"
                Width="104px"></asp:Label>
            <asp:TextBox ID="txtAffidavitDate" runat="server" BackColor="#FFFFC0" Font-Bold="True"
                ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblStatus" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="License Status" Width="152px"></asp:Label>
            <asp:TextBox ID="txtLicenseStatus" runat="server" BackColor="#FFFFC0" BorderColor="Transparent"
                Font-Bold="True" ForeColor="Black" ReadOnly="True" Width="288px"></asp:TextBox><br />
            <asp:Label ID="lblIssueDate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Original  License Issue Date "
                Width="232px"></asp:Label>
            <asp:TextBox ID="txtIssueDate" runat="server" BackColor="#FFFFC0" ReadOnly="True" Width="208px"></asp:TextBox><br />
            <asp:Label ID="lblExpirationDate" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Original License Expiration Date"
                Width="232px"></asp:Label>
            <asp:TextBox ID="txtExpirationDate" runat="server" BackColor="#FFFFC0" ReadOnly="True" Width="208px"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblMailedDate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Original Mailed Date" Width="232px"></asp:Label>
            <asp:TextBox ID="txtMailedDate" runat="server" MaxLength="8" TabIndex="2" Width="208px" ToolTip="DateLost" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
            <asp:Label ID="lblLostInMail" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="*Lost In Mail Date"
                Width="232px"></asp:Label>
            &nbsp;<asp:TextBox ID="txtLostInMail" runat="server" Width="208px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="ValLostInMail" runat="server" ControlToValidate="txtLostInMail"
                ErrorMessage="Enter Lost In Mail Date" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
            &nbsp; &nbsp;
            &nbsp;&nbsp;<br />
            <asp:Label ID="lblCopyIssueDate" runat="server" BackColor="SteelBlue"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                ForeColor="White" Text="Copy License Issue Date" Width="224px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtCopyIssueDate" runat="server" MaxLength="8" TabIndex="2" Width="216px" ToolTip="DateReplaced" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="lblComments" runat="server" Text="Comments" BackColor="SteelBlue" Font-Bold="True" ForeColor="White" Width="144px"></asp:Label><br />
            <asp:TextBox ID="txtComments" runat="server" Height="168px" Width="680px" TextMode="MultiLine"></asp:TextBox><br />
            <br />
            <asp:Label ID="lbloperator" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Updated By" Width="112px"></asp:Label>&nbsp;<asp:TextBox ID="txtoperatorname"
                    runat="server" Width="112px" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>&nbsp;<br />
            &nbsp; &nbsp; <br />
            <hr />
            &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Record"
                ToolTip="Delete Record" Width="103px" Visible="False" />&nbsp;<br />
            &nbsp;<asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Copy License"
                ToolTip="Update Copy License Record" Width="176px" Font-Bold="True" ForeColor="Navy" />&nbsp;<asp:Button
                    ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear" CausesValidation="False" />
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/GRID/CopyLicenseList.aspx" Text="Copy  License List"
                    ToolTip="Duplicate License List" Width="152px" CausesValidation="False" />&nbsp;<asp:Button
                    ID="btnLicensePortal" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
                    Text="License Portal" Width="112px" CausesValidation="False" />
            <asp:Button ID="btnHome" runat="server"
                        BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White" PostBackUrl="~/PistolLicense.aspx"
                        Text="Main Menu" ToolTip="Main Menu" Width="118px" CausesValidation="False" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
            &nbsp;
            <br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
