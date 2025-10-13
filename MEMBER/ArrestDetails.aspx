<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ArrestDetails.aspx.vb" Inherits="ArrestDetails" %>

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
            <asp:Menu ID="Menu1" runat="server" Font-Bold="True" Height="3px" Orientation="Horizontal"
                Width="1px" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" ForeColor="#284E98" StaticSubMenuIndent="10px">
                <Items>
                    <asp:MenuItem Text="LETTERS" Value="Reports">                    
                           <asp:MenuItem NavigateUrl="~/Letter/ComplicationLetter.aspx" Text="Complication Letter" ToolTip="Complication Letter" 
                            Value="Complication Letter"></asp:MenuItem>                            
                        <asp:MenuItem NavigateUrl="~/Letter/Disposition.aspx" Text="Disposition Letter" ToolTip="Disposition Letter"
                            Value="Disposition Letter"></asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                 
                    </asp:MenuItem>
                </Items>
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <StaticSelectedStyle BackColor="#507CD1" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            </asp:Menu>
            &nbsp; &nbsp;&nbsp;<br />
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Update Arrest Record" Width="184px"></asp:Label>
            &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="227px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
            <asp:Label ID="lblUpdateSuccess" runat="server" BackColor="AliceBlue" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="32px" Visible="False" Width="488px"></asp:Label><br />
            <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
                ForeColor="White" Height="32px" Visible="False" Width="568px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <hr style="width: 711px" />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="83px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="46px" ToolTip="Member ID" ReadOnly="True" BackColor="#FFFFC0"></asp:TextBox>
            <asp:Label ID="lblarrestid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="ArrrestID" Width="36px"></asp:Label>
            <asp:TextBox ID="txtarrestid" runat="server" Enabled="False" Height="14px" ReadOnly="True"
                Width="32px" BackColor="#FFFFC0"></asp:TextBox>&nbsp; 
            <asp:Label ID="lblarrestdate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Arrest Date" Width="102px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtarrestdate" runat="server" MaxLength="10" TabIndex="2" Width="104px" ToolTip="Arrest Date"></asp:TextBox>&nbsp;&nbsp;
            <asp:Label ID="lblLicenseNumber" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="DCPLID" BorderStyle="Solid" BorderWidth="1px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtLicenseNumber" runat="server" BackColor="#FFFFC0" ForeColor="Black" ReadOnly="True" Width="128px"></asp:TextBox><br />
            <asp:Label ID="lblcomplicationletter" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Letter Mailed" ToolTip="Complication Letter" Width="104px"></asp:Label>
            <asp:TextBox ID="txtcomplication" runat="server" MaxLength="20" TabIndex="2" ToolTip="Complication Letter"
                Width="85px"></asp:TextBox>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:RequiredFieldValidator ID="DateVal" runat="server" ControlToValidate="txtarrestdate"
                ErrorMessage="Please Enter Arrest Date" Font-Bold="True" Font-Size="Smaller"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                    ID="valArrestDate" runat="server" ControlToValidate="txtarrestdate" ErrorMessage="Date format is mm/dd/yyyy"
                    Font-Bold="True" Font-Size="Smaller" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
            <asp:Label ID="lblcharges" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Charges (1)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge1" runat="server" Width="296px"></asp:TextBox>
            <asp:Label ID="lbldisposition" runat="server" BackColor="SteelBlue"
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                    ForeColor="White" Text="Disposition(1)" Width="104px"></asp:Label><asp:TextBox ID="txtdisposition1"
                        runat="server" Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition"
                        Width="138px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared1" runat="server" BackColor="SteelBlue"
                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                            Width="56px" /><br />
            <asp:Label ID="lblcharges2" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                                Text="Charges (2)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge2" runat="server" Width="296px"></asp:TextBox>
            <asp:Label ID="lbldisposition2" runat="server" BackColor="SteelBlue"
                                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                                    ForeColor="White" Text="Disposition(2)" Width="104px"></asp:Label>
            <asp:TextBox ID="txtdisposition2"
                                        runat="server" Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition"
                                        Width="139px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared2" runat="server" BackColor="SteelBlue"
                                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                                            Width="72px" /><br />
            <asp:Label ID="lblcharges3" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                                                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                                                Text="Charges (3)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge3" runat="server" Width="296px"></asp:TextBox>
            &nbsp;<asp:Label ID="lblDisposition3" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Disposition(3)" Width="104px"></asp:Label>
            <asp:TextBox ID="txtdisposition3" runat="server"
                    Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition" Width="138px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared3" runat="server" BackColor="SteelBlue"
                                                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                                                            Width="64px" /><br />
            <asp:Label ID="lblcharges4" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                                                                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                                                                Text="Charges (4)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge4" runat="server" Width="296px"></asp:TextBox>
            <asp:Label ID="lbldisposition4" runat="server" BackColor="SteelBlue"
                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                                                                    ForeColor="White" Text="Disposition(4)" Width="104px"></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="txtdisposition4"
                                                                        runat="server" Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition"
                                                                        Width="139px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared4" runat="server" BackColor="SteelBlue"
                                                                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                                                                            Width="64px" /><br />
            <asp:Label ID="lblcharges5" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                                                                                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                                                                                Text="Charges (5)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge5" runat="server" Width="296px"></asp:TextBox>
            <asp:Label ID="lbldisposition5" runat="server" BackColor="SteelBlue"
                                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                                                                                    ForeColor="White" Text="Disposition(5)" Width="104px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtdisposition5"
                                                                                        runat="server" Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition"
                                                                                        Width="138px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared5" runat="server" BackColor="SteelBlue"
                                                                                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                                                                                            Width="64px" /><br />
            <asp:Label ID="lblcharges6" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                                                                                                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                                                                                                Text="Charges (6)" Width="96px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtcharge6" runat="server" Width="296px"></asp:TextBox>
            <asp:Label ID="lbldisposition6" runat="server" BackColor="SteelBlue"
                                                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                                                                                                    ForeColor="White" Text="Disposition(6)" Width="104px"></asp:Label>&nbsp;&nbsp;
            <asp:TextBox ID="txtdisposition6"
                                                                                                        runat="server" Height="17px" MaxLength="255" TabIndex="2" ToolTip="Case Disposition"
                                                                                                        Width="138px"></asp:TextBox>&nbsp;
            <asp:CheckBox ID="chkcleared6" runat="server" BackColor="SteelBlue"
                                                                                                            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Cleared"
                                                                                                            Width="72px" /><br />
            <asp:Label ID="lblagency" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Agency"
                Width="99px"></asp:Label>
            <asp:TextBox ID="txtagency" runat="server" MaxLength="40" TabIndex="2" Width="229px" ToolTip="Agency"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblcasenumber" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Case Number" Width="99px"></asp:Label>
            <asp:TextBox ID="txtcasenumber" runat="server" MaxLength="30" TabIndex="2" Width="276px" ToolTip="Case Number"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="AgencyVal" runat="server" ControlToValidate="txtagency"
                ErrorMessage="Please Enter Agency " Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblSID" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="SID"
                Width="99px"></asp:Label>
            <asp:TextBox ID="txtsid" runat="server" MaxLength="30" TabIndex="2" Width="176px" ToolTip="SID"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lbltrackingnumber" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Tracking Number" Width="137px"></asp:Label>
            <asp:TextBox ID="txttrackingnumber" runat="server" MaxLength="30" TabIndex="2" Width="161px" ToolTip="Tracking Number"></asp:TextBox>&nbsp;
            <br />
            <asp:Label ID="lblfirstoffender" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="First Offender" Width="109px"></asp:Label>
            <asp:TextBox ID="txtfirstoffender" runat="server" MaxLength="20" TabIndex="2" Width="139px" ToolTip="First Offender"></asp:TextBox>
            &nbsp;&nbsp;<br />
            <asp:Label ID="lbloperator" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Updated By" Width="104px"></asp:Label>
            <asp:TextBox ID="txtoperator" runat="server" MaxLength="20" TabIndex="2" Width="258px" ToolTip="Operator" BackColor="#FFFFC0" ForeColor="Black" ReadOnly="True"></asp:TextBox>&nbsp;&nbsp;<br />
            <br />
            <hr />
            &nbsp;
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Arrest"
                ToolTip="Update Arrest Record" Width="104px" Font-Bold="True" ForeColor="Navy" />
            &nbsp; &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Arrest"
                ToolTip="Delete Record" Width="100px" Font-Bold="True" ForeColor="Navy" CausesValidation="False" TabIndex="-1" />&nbsp; <asp:Button
                    ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear"
                    Width="64px" ToolTip="Clear all previous changes" CausesValidation="False" TabIndex="-1" />&nbsp;
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Grid/ArrestList.aspx" Text="Arrest History  List"
                    ToolTip="Go Back To Arrest List" Width="128px" CausesValidation="False" TabIndex="-1" />&nbsp;<asp:Button ID="btbMemberPortal"
                        runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MEMBER/Console.aspx"
                        Text="Member Portal" Width="128px" CausesValidation="False" TabIndex="-1" />&nbsp; &nbsp;<asp:Button ID="btnHome" runat="server"
                        BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White" PostBackUrl="~/PistolLicense.aspx"
                        Text="Main Menu" ToolTip="Main Menu" Width="118px" CausesValidation="False" TabIndex="-1" /><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            &nbsp;
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtarrestdate"></cc1:calendarextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="If you delete this record, status of assigned Pistol License could be automatically updated. Are you sure you want to delete this record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="WARNING: If Dispositions for all existing Charges are cleared, please DO NOT ADD new Charges for this Arrest. Are you sure you want to update the record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            &nbsp; &nbsp;
            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtcomplication">
            </cc1:CalendarExtender>
            &nbsp;
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
