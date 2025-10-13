<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddArrest.aspx.vb" Inherits="AddArrest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="txtarrestdate" runat="server">
    <div style="background-color: background">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtarrestdate">
        </cc1:CalendarExtender>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Arrest" Width="138px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label
            ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label>
        <asp:Label ID="lblErrorMessage"
            runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True" ForeColor="White"
            Height="40px" Visible="False" Width="608px"></asp:Label><br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="20" TabIndex="2" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp; &nbsp; &nbsp;<asp:Label ID="lbPCLicenseNumber" runat="server" BackColor="LightSteelBlue"
            Font-Bold="True" Text="*Lisense Number" Width="120px"></asp:Label>&nbsp;<asp:DropDownList
                ID="ddLicenseNumber" runat="server" BackColor="#FFFFC0">
           </asp:DropDownList><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;
        <asp:RequiredFieldValidator ID="LicenseVal" runat="server" ControlToValidate="ddLicenseNumber"
            ErrorMessage="Please Enter License Number" Font-Bold="True" ForeColor="White"
            Width="208px"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblarrestdate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Arrest Date" Width="131px"></asp:Label>
        <asp:TextBox ID="txtarrestdate" runat="server" MaxLength="10" TabIndex="1" Width="98px" ToolTip="Arrest Date"></asp:TextBox>&nbsp;
        <asp:Label ID="lbldatevalidation" runat="server" Font-Bold="False" ForeColor="ButtonShadow"
            Text="" Visible="False" Width="255px"></asp:Label><br />
        <asp:RequiredFieldValidator ID="DateVal" runat="server" ControlToValidate="txtarrestdate"
            ErrorMessage="Please Enter Arrest Date" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="valArrestDate" runat="server" ControlToValidate="txtarrestdate"
            ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lblcharges" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Charges (1)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge1" runat="server" Width="368px" TabIndex="2"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <!-- IRINA
        <asp:Label ID="lbldisposition" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition1" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="150px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared1" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Font-Names="Georgia" Font-Size="Small" Text="Cleared" Width="86px" /><br />
            -->
        <asp:Label ID="lblcharges2" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Charges (2)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge2" runat="server" Width="368px" TabIndex="3"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <!-- IRINA
        <asp:Label ID="lbldisposition2" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition2" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="149px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared2"
                runat="server" BackColor="LightSteelBlue" Font-Bold="True" Font-Names="Georgia"
                Font-Size="Small" Text="Cleared" Width="87px" />&nbsp;
                -->
        <br />
        <asp:Label ID="lblcharges3" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Charges (3)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge3" runat="server" Height="17px" MaxLength="255" TabIndex="4"
            ToolTip="Charge Description" Width="368px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<!-- IRINA
        <asp:Label ID="lbldisposition3" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition3" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="149px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared3" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Font-Names="Georgia" Font-Size="Small" Text="Cleared" Width="87px" />
            --><br />
        <asp:Label ID="lblcharges4" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Charges (4)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge4" runat="server" Height="17px" MaxLength="255" TabIndex="5"
            ToolTip="Charge Description" Width="368px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<!-- IRINA
        <asp:Label ID="lbldisposition4" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition4" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="150px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared4" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Font-Names="Georgia" Font-Size="Small" Text="Cleared" Width="87px" />
            --><br />
        <asp:Label ID="lblcharges5" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Charges (5)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge5" runat="server" Height="17px" MaxLength="255" TabIndex="6"
            ToolTip="Charge Description" Width="368px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <!-- IRINA
        <asp:Label ID="lbldisposition5" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition5" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="150px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared5"
                runat="server" BackColor="LightSteelBlue" Font-Bold="True" Font-Names="Georgia"
                Font-Size="Small" Text="Cleared" Width="87px" />
                --><br />
        <asp:Label ID="lblcharges6" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Charges (6)" Width="112px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtcharge6" runat="server" Height="17px" MaxLength="255" TabIndex="7"
            ToolTip="Charge Description" Width="368px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        <!-- IRINA
        <asp:Label ID="lbldisposition6" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Disposition" Width="87px"></asp:Label>
        <asp:TextBox ID="txtdisposition6" runat="server" Height="17px" MaxLength="255" TabIndex="2"
            ToolTip="Case Disposition" Width="150px"></asp:TextBox>
        <asp:CheckBox ID="chkcleared6" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Font-Names="Georgia" Font-Size="Small" Text="Cleared" Width="87px" />&nbsp;
            --><br />
        <asp:Label ID="lblagency" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Agency"
            Width="99px"></asp:Label>&nbsp;<asp:TextBox ID="txtagency" runat="server" Width="232px" TabIndex="8"></asp:TextBox>&nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;<asp:Label ID="lblcasenumber" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Case Number" Width="99px"></asp:Label>
        <asp:TextBox ID="txtcasenumber" runat="server" MaxLength="20" TabIndex="9" Width="216px" ToolTip="Case Number"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="AgencyVal" runat="server" ControlToValidate="txtagency"
            ErrorMessage="Please Enter Agency " Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblSID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="SID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtsid" runat="server" MaxLength="20" TabIndex="10" Width="232px" ToolTip="SID"></asp:TextBox>
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        <asp:Label ID="lbltrackingnumber" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Tracking Number" Width="137px"></asp:Label>
        <asp:TextBox ID="txttrackingnumber" runat="server" MaxLength="20" TabIndex="11" Width="176px" ToolTip="Tracking Number"></asp:TextBox>&nbsp;<br />
        &nbsp;<br />
        <asp:Label ID="lblfirstoffender" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="First Offender" Width="109px"></asp:Label>&nbsp;
            <asp:DropDownList ID="ddfirstoffender"
                runat="server" ToolTip="First Offense" Width="104px" TabIndex="12">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:DropDownList>
        &nbsp;<br />
        <asp:Label ID="lbloperator" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Added By:" Width="109px"></asp:Label>
        <asp:TextBox ID="txtOperator" runat="server" Width="168px" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True" TabIndex="13"></asp:TextBox><br />
        <br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnAddNewArrest" runat="server" EnableViewState="False" TabIndex="14"
            Text="Add New Arrest" ToolTip="Add Arrest To Pistol Database" Width="112px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;
        <asp:Button ID="bntCancel" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="80px" CausesValidation="False" TabIndex="-1" />
        &nbsp; &nbsp; &nbsp;<asp:Button
                ID="btMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Member/Console.aspx"
                Text="Member Portal" ToolTip="Member Portal" Width="104px" CausesValidation="False" TabIndex="-1" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
            ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
            Width="118px" CausesValidation="False" TabIndex="-1" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
