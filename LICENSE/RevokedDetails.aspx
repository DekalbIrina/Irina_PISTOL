<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RevokedDetails.aspx.vb" Inherits="ArrestDetails" %>

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
            &nbsp;&nbsp;
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            &nbsp;&nbsp;<br />
            &nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Update Revoke License" Width="264px"></asp:Label>
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="363px"></asp:Label>
            &nbsp; 
            <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="White" Height="40px" Width="528px"></asp:Label>
            &nbsp;<asp:Label ID="lblUpdateSuccess" runat="server" BackColor="Linen" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="32px" Width="520px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;<br />
            &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <hr />
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="112px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
            &nbsp;&nbsp;<br />
            <asp:Label ID="lbltransid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="TransID" Width="99px"></asp:Label>
            <asp:TextBox ID="txttransid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="112px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
            &nbsp; &nbsp;
            <br />
            <br />
            <asp:Label ID="lbldcplid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="DCPLID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="111px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
            <asp:Label ID="lblRevokeDate" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Revoke Date" Width="104px"></asp:Label>
            <asp:TextBox ID="txtRevokeDate" runat="server" BackColor="#FFFFC0" ForeColor="Black"
                ReadOnly="True" Width="104px"></asp:TextBox><br />
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="reason1" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Reason 1"
                Width="103px"></asp:Label><asp:TextBox ID="txtreason1" runat="server" MaxLength="100"
                    TabIndex="2" Width="581px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="ValidateOneReason" runat="server" ControlToValidate="txtreason1"
                ErrorMessage="Please Enter Reason" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblreason2" runat="server"
                        BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia"
                        Font-Size="Small" ForeColor="White" Text="Reason 2" Width="103px"></asp:Label><asp:TextBox
                            ID="txtreason2" runat="server" MaxLength="100" TabIndex="2" Width="581px"></asp:TextBox><asp:Label
                                ID="lblreason3" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Reason 3"
                                Width="103px"></asp:Label><asp:TextBox ID="txtreason3" runat="server" MaxLength="100"
                                    TabIndex="2" Width="581px"></asp:TextBox><asp:Label ID="lblreason4" runat="server"
                                        BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia"
                                        Font-Size="Small" ForeColor="White" Text="Reason 4" Width="103px"></asp:Label><asp:TextBox
                                            ID="txtreason4" runat="server" MaxLength="100" TabIndex="2" Width="581px"></asp:TextBox><asp:Label
                                                ID="lblreason5" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Reason 5"
                                                Width="103px"></asp:Label><asp:TextBox ID="txtreason5" runat="server" MaxLength="100"
                                                    TabIndex="2" Width="581px"></asp:TextBox><asp:Label ID="lblreason6" runat="server"
                                                        BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia"
                                                        Font-Size="Small" ForeColor="White" Text="Reason 6" Width="103px"></asp:Label><asp:TextBox
                                                            ID="txtreason6" runat="server" MaxLength="100" TabIndex="2" Width="581px"></asp:TextBox><asp:Label
                                                                ID="lblotherreason" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                                                                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Other Reason"
                                                                Width="103px"></asp:Label><asp:TextBox ID="txtotherreason" runat="server" MaxLength="100"
                                                                    TabIndex="2" Width="581px"></asp:TextBox><asp:Label ID="lblcourtname" runat="server"
                                                                        BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia"
                                                                        Font-Size="Small" ForeColor="White" Text="Court Name" Width="103px"></asp:Label><asp:TextBox
                                                                            ID="txtcourtname" runat="server" MaxLength="100" TabIndex="2" Width="581px"></asp:TextBox><br />
            <asp:Label ID="lblcourtdate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Court Date" Width="103px"></asp:Label>
            <asp:TextBox ID="txtcourtdate" runat="server" MaxLength="20" TabIndex="2" Width="168px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="ValidateDate" runat="server" ControlToValidate="txtcourtdate"
                ErrorMessage="Please Enter Court Date" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblcourttime" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Court Time" Width="103px" Visible="False"></asp:Label>
            <asp:TextBox ID="txtcourttime" runat="server" MaxLength="20" TabIndex="2" Width="167px" Visible="False"></asp:TextBox><br />
            <asp:Label ID="lblcourtaddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*Court Address" Width="103px"></asp:Label>
            <asp:TextBox ID="txtcourtaddress" runat="server" MaxLength="100" TabIndex="2" Width="577px"></asp:TextBox><br />
            <asp:RequiredFieldValidator ID="ValidateAddress" runat="server" ControlToValidate="txtcourtaddress"
                ErrorMessage="Please Enter Address" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*City"
                Width="103px"></asp:Label>&nbsp;<asp:TextBox ID="txtcity" runat="server" Width="174px">
                </asp:TextBox>
            &nbsp;<asp:Label ID="lblstate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*State" Width="62px"></asp:Label>&nbsp;<asp:TextBox ID="txtstate" runat="server"
                    Width="146px">
                </asp:TextBox>
            <asp:Label ID="lblzip" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Zip"
                Width="62px"></asp:Label>&nbsp;<asp:TextBox ID="txtzip" runat="server" Width="114px">
                </asp:TextBox><br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="ValidateCity" runat="server" ControlToValidate="txtcity"
                ErrorMessage="Please Enter City" Font-Bold="True"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="ValidateState" runat="server" ControlToValidate="txtstate"
                ErrorMessage="Please Enter State" Font-Bold="True"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:RequiredFieldValidator ID="ValidateZip" runat="server" ControlToValidate="txtzip"
                ErrorMessage="Please Enter Zip Code" Font-Bold="True"></asp:RequiredFieldValidator><br />
            <asp:Label ID="lblComments" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Comments" Width="96px"></asp:Label>&nbsp;<br />
            <asp:TextBox ID="txtComments" runat="server" Height="112px" Width="696px"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblOperator" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Updated By:" Width="104px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
            <br />
            <br />
            <hr />
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="By deleting this record you will delete all information about this License, including Arrest and Rehab Information. Do you want to delete record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            &nbsp;
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtcourtdate"></cc1:calendarextender>
            <asp:Button ID="btndelete" runat="server" Text="Delete Revoked  License"
                ToolTip="Delete License from System" Width="168px" Font-Bold="True" ForeColor="Navy" Visible="False" />
            &nbsp;
            &nbsp;&nbsp;
<%--            <cc1:MaskedEditExtender ID="MaskedEditExtender1" runat="server" AcceptAMPM="True"
                MaskType="Time" TargetControlID="txtcourttime" ClearMaskOnLostFocus="False" Mask="00:00">
            </cc1:MaskedEditExtender>--%>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            &nbsp;
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Revoked License"
                ToolTip="Update Revoked Record" Width="168px" Font-Bold="True" ForeColor="Navy" />&nbsp;<asp:Button
                    ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear" CausesValidation="False" />
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Grid/RevokedList.aspx" Text="Revoked License List"
                    ToolTip="Go Back To Revoked List" Width="168px" CausesValidation="False" />&nbsp;<asp:Button ID="btnLicensePortal"
                        runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
                        Text="License Portal" ToolTip="Return to License Detail Screen" Width="104px" CausesValidation="False" />
            &nbsp;
            <asp:Button ID="btnHome"
                        runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="96px" CausesValidation="False" /><br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
