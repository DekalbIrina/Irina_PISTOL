<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BatchMasterDetails.aspx.vb" Inherits="BatchDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dekalb County Pistol License</title>
</head>
<body>
    <form id="form1" defaultfocus="txtbatchtype" runat="server">
    <div>
        <div style="background-color: lightsteelblue">
            &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp;&nbsp; &nbsp;<br />
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"
                ConfirmText="PLEASE, CHKECK FOR EXISTING BATCH ENTRIES, before Deletion. If there are entries, you will not be able to update dates for 'Mailed Date' and 'Return Date' values automatically for thouse Entries in the Future." TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;<asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Update Batch Details" Width="191px"></asp:Label>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="If you updated 'BATCH SENT DATE' field, please be sure its an end of the correspondend week.After Batch has been sent to Mental Health Department, no License can be created for this batch. Do you want to update the record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdateofrequest"></cc1:calendarextender>
            <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateofapproval"></cc1:calendarextender>
            <cc1:calendarextender id="CalendarExtender3" runat="server" targetcontrolid="txtreturndate"></cc1:calendarextender>
            
            <asp:Label ID="lblFailed" runat="server"
                BackColor="Red" BorderStyle="Ridge" Font-Bold="True" ForeColor="White" Height="40px"
                Visible="False" Width="424px"></asp:Label>
            <asp:Label ID="lblUpdateDone" runat="server" BackColor="AliceBlue" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="56px" Visible="False" Width="480px"></asp:Label>           
            <cc1:calendarextender id="CalendarExtender5" runat="server" targetcontrolid="txtLicenseIssued"></cc1:calendarextender>
            &nbsp;&nbsp;
            
            
            <br />
            <hr />
            <br />
            <asp:Label ID="lbltransid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="TransID" Width="99px"></asp:Label>
            <asp:TextBox ID="txttransid" runat="server" MaxLength="5"
                ToolTip="Transaction ID" Width="61px" BackColor="LightGoldenrodYellow" ReadOnly="True"></asp:TextBox>
            &nbsp;<br />
            <asp:Label ID="lblbatchnumber" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch #" Width="99px"></asp:Label>
            <asp:TextBox ID="txtbatchnumber" runat="server" MaxLength="5"
                ToolTip="Batch Number" Width="61px" BackColor="LightGoldenrodYellow" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lblbatchdate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch Date" Width="122px"></asp:Label>
            <asp:TextBox ID="txtbatchdate" runat="server" MaxLength="20"
                ToolTip="Batch Date" Width="91px" BackColor="LightGoldenrodYellow" ReadOnly="True"></asp:TextBox>&nbsp;<br />
            <asp:Label ID="lblformsent" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Forms Sent" Width="99px"></asp:Label>
            <asp:TextBox ID="txtformsent" runat="server" MaxLength="5" TabIndex="1" ToolTip="Forms Sent"
                Width="61px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblbatchtype" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch Type" Width="96px"></asp:Label>
            <asp:TextBox ID="txtbatchtype" runat="server" MaxLength="50" TabIndex="2" ToolTip="Batch Type"
                Width="230px"></asp:TextBox><br />
            <asp:Label ID="lblcheckpayable" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Check Payable To" Width="152px"></asp:Label>
            <asp:TextBox ID="txtcheckpayable" runat="server" MaxLength="50" TabIndex="3" ToolTip="Check Payable"
                Width="360px"></asp:TextBox><br />
            <asp:Label ID="lblcheckreceivedby" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Check Receivable By" Width="155px"></asp:Label>
            <asp:TextBox ID="txtcheckrecievable" runat="server" MaxLength="50" TabIndex="4" ToolTip="Check Recievable By"
                Width="360px"></asp:TextBox>
            &nbsp; &nbsp; &nbsp;<br />
            &nbsp;<br />
            <asp:Label ID="lbldateofrequest" runat="server" BackColor="SteelBlue"
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                    ForeColor="White" Text="Date of Request" Width="134px"></asp:Label>
            <asp:TextBox ID="txtdateofrequest" runat="server" MaxLength="20"
                TabIndex="5" ToolTip="Date of Request" Width="91px"></asp:TextBox>
            <asp:Label ID="lbldateofapproval"
                    runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                    Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Date of Approval"
                    Width="133px"></asp:Label>
            <asp:TextBox ID="txtdateofapproval" runat="server" MaxLength="20"
                TabIndex="6" ToolTip="Supervisor Approving " Width="93px"></asp:TextBox><br />
            <asp:RegularExpressionValidator ID="valDateFormat" runat="server" ControlToValidate="txtdateofrequest"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="ValDateOfAppr" runat="server" ControlToValidate="txtdateofapproval"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="lblsupervisorapproval" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Supervisor Approving" Width="162px"></asp:Label>
            <asp:TextBox ID="txtSupervisorApproving" runat="server" MaxLength="20" TabIndex="7"
                ToolTip="Supervisor Approving " Width="240px"></asp:TextBox>
            &nbsp;<br />
            <asp:Label ID="lblcashiersname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Cashiers Name" Width="160px"></asp:Label>
            <asp:TextBox ID="txtcashiersname" runat="server" MaxLength="20" TabIndex="8" ToolTip="Cashiers Name"
                Width="240px"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblCheckNumber" runat="server" BackColor="SteelBlue"
                    BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                    ForeColor="White" Text="Check Number" Width="133px"></asp:Label>
            <asp:TextBox ID="txtchecknumber" runat="server" MaxLength="5" TabIndex="9" ToolTip="Check Number"
                Width="62px" BackColor="White"></asp:TextBox>
            <asp:Label ID="lblcheckamount" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Check Amount " Width="133px"></asp:Label>
            <asp:TextBox ID="txtcheckamount" runat="server" MaxLength="20" TabIndex="10" ToolTip="Check Amount"
                Width="74px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
            <br />
            <br />
            <asp:Label ID="lblmaileddate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch Sent Date" Width="232px"></asp:Label>
            <asp:TextBox ID="txtmaileddate" runat="server" BackColor="White" Font-Bold="True"
                ForeColor="Black" Width="104px" TabIndex="10"></asp:TextBox>
            <asp:RegularExpressionValidator ID="valBatchSentDate" runat="server" ControlToValidate="txtmaileddate"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <br />
            <asp:Label ID="lblreturndate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch Returned Date" Width="232px"></asp:Label>
            <asp:TextBox ID="txtreturndate" runat="server" Width="104px" TabIndex="11"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="valFormReturn" runat="server" ControlToValidate="txtreturndate" ErrorMessage="Date format is mm/dd/yyyy"
                Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
            <asp:Label ID="lblformsreturned" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Forms Returned" Width="232px"></asp:Label>
            <asp:TextBox ID="txtformsreturned"
                    runat="server" BackColor="White" BorderWidth="1px" ForeColor="Black" MaxLength="20"
                    TabIndex="12" ToolTip="Forms Returned" Width="61px" BorderStyle="Groove"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblLicenseIssueDate" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="License Issued Date"
                Width="232px"></asp:Label>
            <asp:TextBox ID="txtLicenseIssued" runat="server" Width="104px" TabIndex="13"></asp:TextBox>
            <asp:RegularExpressionValidator ID="ValIssueDate" runat="server" ControlToValidate="txtLicenseIssued"
                ErrorMessage="Date format is mm/dd/yyyy" Font-Bold="True" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
            <asp:Label ID="lblLisnseExparation" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="License Expiration Date" Width="232px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtLicensExparation" runat="server" Width="104px" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
            <br />
            <br />
            <asp:Label ID="lblOperator" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Last Updated By:" Width="128px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtOperator" runat="server" BackColor="LightGoldenrodYellow" ReadOnly="True" TabIndex="15"></asp:TextBox>&nbsp;<br />
            &nbsp;&nbsp;
            <hr />
            &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Batch" ToolTip="Delete Record"
                Width="114px" Font-Bold="True" ForeColor="Navy" Visible="False" />
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="14" Text="Update Batch"
                ToolTip="Update Batch Master" Width="92px" Font-Bold="True" ForeColor="Navy" />
            &nbsp; &nbsp;<asp:Button ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy"
                Text="Clear" Width="72px" ToolTip="Clear entered data" CausesValidation="False" TabIndex="-1" />
            &nbsp;<asp:Button ID="btnbatchentries" runat="server" Text="View Batch Entries" Width="132px" ToolTip="View Batch Entries" Font-Bold="True" ForeColor="Navy" CausesValidation="False" TabIndex="-1" />
            &nbsp;<asp:Button ID="btnBatchList" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Grid/BatchMasterlist.aspx"
                Text="Batch Master List" Width="136px" CausesValidation="False" TabIndex="-1" />
            &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Button ID="bntMainMenu" runat="server"
                        Font-Bold="True" Font-Underline="True" ForeColor="White" PostBackUrl="~/PistolLicense.aspx"
                        Text="Main Menu" ToolTip="Main Menu" Width="108px" BackColor="Navy" CausesValidation="False" TabIndex="-1" /><br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
