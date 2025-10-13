<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddRehab.aspx.vb" Inherits="AddRehab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="txthospital" runat="server">
    <div style="background-color: background" title="Rehab">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdatefrom"></cc1:calendarextender>
        <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateto"></cc1:calendarextender>
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Rehab" Width="138px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label><br />
        <br />
        <br />
        &nbsp;
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="40px" Width="632px"></asp:Label>
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="109px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="1" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="#400000" ReadOnly="True"></asp:TextBox>
        &nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblLicenseNumber" runat="server" BackColor="LightSteelBlue"
            BorderColor="Transparent" Font-Bold="True" ForeColor="Black" Text="*License Number"
            Width="128px"></asp:Label>&nbsp;
        <asp:DropDownList ID="ddLicenseNumber" runat="server" Width="104px" BackColor="#FFFFC0">
        </asp:DropDownList><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="LicenseVal" runat="server" ControlToValidate="ddLicenseNumber"
            ErrorMessage="Please Enter License Number" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblhospital" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Hospital" Width="109px"></asp:Label>
        <asp:TextBox ID="txthospital" runat="server" Width="592px" TabIndex="1"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="HospitalVal" runat="server" ControlToValidate="txthospital"
            ErrorMessage="Please Enter Hospital Name" Font-Bold="True" ForeColor="White"
            Width="192px"></asp:RequiredFieldValidator><br />
        
        <asp:Label ID="lbladdress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Address" Width="109px"></asp:Label>
        <asp:TextBox ID="txtaddress" runat="server"
                MaxLength="35" TabIndex="2" Width="592px" ToolTip="Address"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="AddressVal" runat="server" ControlToValidate="txtaddress"
            ErrorMessage="Please Enter Hospital Address" Font-Bold="True" ForeColor="White"
            Width="224px"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblcity" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*City"
            Width="109px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcity" runat="server"
                Width="224px" ToolTip="City" TabIndex="3"></asp:TextBox>
        <asp:Label ID="lblstate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*State"
            Width="64px"></asp:Label>
        <asp:TextBox ID="txtstate" runat="server" Width="48px" ToolTip="State" TabIndex="4"></asp:TextBox>&nbsp;
        <asp:Label ID="lblzip" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Zip"
            Width="68px"></asp:Label>
        <asp:TextBox ID="txtzip" runat="server" Width="110px" ToolTip="Zip" TabIndex="5"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="CityVal" runat="server" ControlToValidate="txtcity"
            ErrorMessage="Please Enter City" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator
            ID="StateVal" runat="server" ControlToValidate="txtstate" EnableTheming="True"
            ErrorMessage="Please Enter State" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<asp:RequiredFieldValidator ID="ZipVal" runat="server"
            ControlToValidate="txtzip" ErrorMessage="Please Enter ZIP" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Label ID="lbldoctorsname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Doctors First Name" Width="152px"></asp:Label>
        <asp:TextBox ID="txtdoctorsname" runat="server"
                MaxLength="20" TabIndex="6" Width="160px" ToolTip="Doctors Name"></asp:TextBox><asp:Label ID="lbldoctorslastname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Doctors Last Name" Width="144px"></asp:Label><asp:TextBox ID="txtdoctorslastname"
                runat="server" MaxLength="20" TabIndex="7" Width="240px" ToolTip="Doctors Last Name"></asp:TextBox><br />
        <asp:Label ID="lblemail" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Email"
            Width="73px"></asp:Label>
        <asp:TextBox ID="txtemail" runat="server" MaxLength="25" TabIndex="8" Width="632px" ToolTip="Email Address"></asp:TextBox>
        <br />
        <asp:Label ID="lblphonenumber" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Phone Number" Width="124px"></asp:Label>
        <asp:TextBox ID="txtphonenumber" runat="server" MaxLength="12" TabIndex="9" Width="136px" ToolTip="Phone Number"></asp:TextBox>&nbsp;
        <asp:Label ID="lblphonevalidation" runat="server" Font-Bold="False" ForeColor="Silver" Text="Phone needs 10 numeric digits"
            Width="384px" Visible="False"></asp:Label><br />
        <asp:Label ID="lblrehab" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Rehab Description"
            Width="184px"></asp:Label>
        &nbsp; &nbsp;
        <br />
        <asp:TextBox ID="txtrehab" runat="server" Height="152px"
                MaxLength="1000" TabIndex="10" ToolTip="Rehab Description" Width="712px" TextMode="MultiLine"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="DescrVal" runat="server" ControlToValidate="txtrehab"
            ErrorMessage="Please Enter Description" Font-Bold="True" ForeColor="White" Width="208px"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="valDateFrom" runat="server" ControlToValidate="txtdatefrom"
            ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ForeColor="White" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="valDateTo" runat="server" ControlToValidate="txtdateto"
            ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ForeColor="White" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lbldatefrom" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Date From" Width="124px"></asp:Label>
        <asp:TextBox ID="txtdatefrom" runat="server"
                MaxLength="10" TabIndex="11" Width="96px" ToolTip="Date From"></asp:TextBox>&nbsp;
        <asp:Label ID="lbldateto" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Date to"
            Width="71px"></asp:Label>
        <asp:TextBox ID="txtdateto" runat="server" MaxLength="10"
                TabIndex="12" Width="96px" ToolTip="Date To"></asp:TextBox>
        <asp:Label ID="lbldatevalidation" runat="server" Font-Bold="False" ForeColor="Silver"
            Text="Date From and To need 8 numeric digits" Width="273px" Visible="False"></asp:Label>&nbsp;<br />
        <asp:RequiredFieldValidator ID="DateFromVal" runat="server" ControlToValidate="txtdatefrom"
            ErrorMessage="Please Enter Date FROM" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="DateToVal" runat="server" ControlToValidate="txtdateto"
            ErrorMessage="Please Enter Date TO" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Label ID="lbloperator" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Added By" Width="120px"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" TabIndex="13"></asp:TextBox><br />
        <br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnnewmember" runat="server" EnableViewState="False" TabIndex="14"
            Text="Add New Rehab" ToolTip="Add Rehab To Pistol Database" Width="112px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;<asp:Button
                ID="bntCancel" runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear"
                Width="64px" CausesValidation="False" TabIndex="-1" />
        &nbsp; &nbsp;
        <asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Member/Console.aspx"
                Text="Member Portal" ToolTip="Member Portal" Width="122px" CausesValidation="False" TabIndex="-1" />&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnHome"
                    runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                    PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="118px" CausesValidation="False" TabIndex="-1" /><br />
        &nbsp;
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
