<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RehabDetails.aspx.vb" Inherits="ArrestDetails" %>

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
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <StaticSelectedStyle BackColor="#507CD1" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <Items>
                    <asp:MenuItem Text="LETTERS" ToolTip="Hospital Letter" Value="Hospital Letter">
                        <asp:MenuItem NavigateUrl="~/Letter/HospitalLetter.aspx" Text="Hospital Letter" ToolTip="Hospital Letter"
                            Value="Hospital Letter"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            </asp:Menu>
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="Transparent" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="Navy" Height="24px" Text="Update Rehab Record" Width="184px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:Label ID="lblmember" runat="server"
                Font-Bold="True" Font-Size="Large" ForeColor="Desktop" Width="327px"></asp:Label><br />
            <br />
            <asp:Label ID="lblUpdateSuccess"
                runat="server" BackColor="Azure" Font-Bold="True" ForeColor="Navy" Height="32px"
                Width="432px" BorderStyle="Ridge"></asp:Label>
            <asp:Label ID="lblFailed"
                runat="server" BackColor="Red" BorderColor="White" BorderStyle="Ridge" Font-Bold="True"
                ForeColor="White" Height="40px" Width="472px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <hr style="height: 1px" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <br />
            <asp:Label ID="lblrehabid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="RehabID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtrehabtid" runat="server" Enabled="False" MaxLength="8" TabIndex="2"
                Width="88px" ToolTip="RehabID" ReadOnly="True" BackColor="#FFFFC0"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblLicenseNumb" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="DCPLID"
                Width="96px"></asp:Label>
            <asp:TextBox ID="txtLicenseNum" runat="server" BackColor="#FFFFC0" ReadOnly="True"
                Width="88px"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="8" TabIndex="2"
                Width="88px" ToolTip="MemberID" ReadOnly="True" BackColor="#FFFFC0"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="lblLetterMailed" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Letter Mailed"
                Width="96px"></asp:Label>
            <asp:TextBox ID="txtLetterMailed" runat="server" BackColor="White" Font-Bold="True"
                ForeColor="Black" Width="96px"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblhospitalname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*HospitalName" Width="102px"></asp:Label>
            &nbsp;<asp:TextBox ID="txthospitalname" runat="server" Width="592px"></asp:TextBox>&nbsp;
            <br />
            <asp:RequiredFieldValidator ID="HospitalVal" runat="server" ControlToValidate="txthospitalname"
                ErrorMessage="Please Enter Hospital Name" Font-Bold="True" Width="192px"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lbladdress" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Address"
                Width="166px"></asp:Label>
            <asp:TextBox ID="txtaddress" runat="server" MaxLength="50" TabIndex="2" Width="533px" ToolTip="Address"></asp:TextBox>
            &nbsp;&nbsp;<br />
            <asp:RequiredFieldValidator ID="AddressVal" runat="server" ControlToValidate="txtaddress"
                ErrorMessage="Please Enter Hospital Address" Font-Bold="True" Width="224px"></asp:RequiredFieldValidator>&nbsp;<br />
            <asp:Label ID="lblcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*City" Width="57px"></asp:Label>
            <asp:TextBox ID="txtcity" runat="server" Width="228px" ForeColor="Black">
            </asp:TextBox>&nbsp;
            <asp:Label ID="lblstate" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*State"
                Width="99px"></asp:Label>&nbsp;<asp:TextBox ID="txtstate" runat="server" Width="48px" ForeColor="Black"></asp:TextBox>
            <asp:Label ID="lblzip" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Zip Code" Width="96px"></asp:Label>
            <asp:TextBox ID="txtzip" runat="server" Width="91px" ForeColor="Black">
            </asp:TextBox><br />
            <asp:RequiredFieldValidator ID="CityVal" runat="server" ControlToValidate="txtcity"
                ErrorMessage="Please Enter City" Font-Bold="True"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="StateVal" runat="server" ControlToValidate="txtstate"
                EnableTheming="True" ErrorMessage="Please Enter State" Font-Bold="True"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="ZipVal" runat="server" ControlToValidate="txtzip"
                ErrorMessage="Please Enter ZIP" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lbldoctorsfirstname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Doctors First Name" Width="156px"></asp:Label>
            <asp:TextBox ID="txtdoctorsfirstname" runat="server" MaxLength="20" TabIndex="2" Width="208px" ToolTip="Doctors First Name"></asp:TextBox>&nbsp;<br />
            <asp:Label ID="lbldoctorslastname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Doctors Last Name" Width="153px"></asp:Label>
            <asp:TextBox ID="txtdoctorslastname" runat="server" MaxLength="20" TabIndex="2" Width="212px" ToolTip="Doctors Last Name"></asp:TextBox><br />
            <asp:Label ID="lblphonenumber" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Phone Number" Width="153px"></asp:Label>
            <asp:TextBox ID="txtphonenumber" runat="server" MaxLength="10" TabIndex="2" Width="157px" ToolTip="Doctors Phone Number"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblemail" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Email"
                Width="75px"></asp:Label>
            <asp:TextBox ID="txtemail" runat="server" MaxLength="40" TabIndex="2" Width="291px" ToolTip="Doctors Email"></asp:TextBox><br />
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="lblrehab" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Rehab Description"
                Width="208px"></asp:Label>
            <br />
            <asp:TextBox ID="txtrehab" runat="server" Height="160px" MaxLength="255" TabIndex="13"
                ToolTip="Rehab Description" Width="575px" TextMode="MultiLine"></asp:TextBox><br />
            &nbsp;<asp:RequiredFieldValidator ID="DescrVal" runat="server" ControlToValidate="txtrehab"
                ErrorMessage="Please Enter Description" Font-Bold="True" Width="208px"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;&nbsp;
            <br />
            <asp:RegularExpressionValidator ID="valDateFrom" runat="server" ControlToValidate="txtdatefrom"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;
            <asp:RegularExpressionValidator ID="valDateTo" runat="server" ControlToValidate="txtdateto"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
            <asp:Label ID="lbldatefrom" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Date From " Width="88px"></asp:Label>
            <asp:TextBox ID="txtdatefrom" runat="server" MaxLength="8" TabIndex="2" Width="144px" ToolTip="Date From "></asp:TextBox>
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblDateto" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Date To"
                Width="92px"></asp:Label>
            <asp:TextBox ID="txtdateto" runat="server" MaxLength="8" TabIndex="2" Width="138px" ToolTip="Date To "></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="DateFromVal" runat="server" ControlToValidate="txtdatefrom"
                ErrorMessage="Please Enter Date FROM" Font-Bold="True"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="DateToVal" runat="server" ControlToValidate="txtdateto"
                ErrorMessage="Please Enter Date TO" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="Label2" runat="server" BackColor="SteelBlue" BorderColor="White" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Rehab Cleared" Width="152px"></asp:Label>
            <asp:CheckBox ID="chkBoxRehabCleared" runat="server" /><br />
            <br />
            <asp:Label ID="lblUserName" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Updated By"
                Width="112px"></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
            <hr />
            &nbsp;<asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Record"
                ToolTip="Update Rehab Record" Width="112px" Font-Bold="True" ForeColor="Navy" />
            <asp:Button ID="btndelete" runat="server" Text="Delete Record"
                ToolTip="Delete Record" Font-Bold="True" ForeColor="Navy" Height="24px" Width="104px" CausesValidation="False" TabIndex="-1" />
            <asp:Button ID="btnCuncel" runat="server"
                        Font-Bold="True" ForeColor="Navy" Text="Clear" Width="72px" ToolTip="Clear all previous changes" CausesValidation="False" TabIndex="-1" />
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Grid/RehabList.aspx" Text="Rehab History"
                    ToolTip="List Of All Rehabe Records" Width="122px" CausesValidation="False" TabIndex="-1" />&nbsp;<asp:Button ID="btnMemberPortal"
                        runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MEMBER/Console.aspx"
                        Text="Member Portal" ToolTip="Return To Member Portal" Width="104px" CausesValidation="False" TabIndex="-1" />
            &nbsp;<asp:Button ID="btnHome" runat="server"
                        BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White" PostBackUrl="~/PistolLicense.aspx"
                        Text="Main Menu" ToolTip="Main Menu" Width="118px" CausesValidation="False" /><br />
            <br />
            <table>
                <tr>
                    <td style="width: 68px; height: 96px">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdatefrom"></cc1:calendarextender>
            <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateto"></cc1:calendarextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="If you delete this record, status of assigned Pistol License could be automatically updated. Are you sure you want to delete this record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="If you update 'Rehab Cleared' check box, then status of assigned Pistol License could be automatically update. Are you sure you want to update this record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
