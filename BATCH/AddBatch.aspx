<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddBatch.aspx.vb" Inherits="AddBatch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: background">
        &nbsp; &nbsp;<table>
            <tr>
                <td style="width: 394px; height: 124px">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Batch" Width="138px"></asp:Label></td>
                <td style="width: 252px; height: 124px">
                    &nbsp;</td>
            </tr>
        </table>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">          
        </asp:ScriptManager> 
        
         <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdateofrequest"></cc1:calendarextender>
          <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateofapproval"></cc1:calendarextender>
        
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        <asp:Label ID="lblFailed" runat="server" BackColor="Red" Font-Bold="True" Font-Underline="True"
            ForeColor="White"
            Width="544px" BorderStyle="Ridge" Height="48px" Visible="False"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;<br />
        <hr />
        <asp:Label ID="lblbatchdate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Batch Date" Width="147px"></asp:Label>
        <asp:TextBox ID="txtbatchdate" runat="server" MaxLength="20" TabIndex="2"
            ToolTip="Batch Date" Width="91px" ReadOnly="True" BackColor="LightGoldenrodYellow"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblBatchNumber" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Batch Number" Width="128px"></asp:Label>
        <asp:TextBox ID="txtBatchNumber" runat="server" BackColor="LightGoldenrodYellow" Enabled="False"
            MaxLength="20" TabIndex="2" ToolTip="Week Number" Width="56px" ReadOnly="True" Font-Bold="True" Font-Size="Larger" Font-Underline="True"></asp:TextBox><br />
        <asp:Label ID="lblformsent" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Forms Sent" Width="99px"></asp:Label>
        <asp:TextBox ID="txtformsent" runat="server" MaxLength="5" TabIndex="2" ToolTip="Forms Sent"
            Width="61px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br />
        <asp:Label ID="lblbatchtype" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Batch Type" Width="96px"></asp:Label>
        <asp:TextBox ID="txtbatchtype" runat="server" MaxLength="20" TabIndex="2" ToolTip="Batch Type"
            Width="223px"></asp:TextBox><br />
        <asp:Label ID="lblcheckpayable" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Check Payable To" Width="136px"></asp:Label>
        <asp:TextBox ID="txtcheckpayable" runat="server" MaxLength="20" TabIndex="2" ToolTip="Check Payable"
            Width="199px"></asp:TextBox>
        &nbsp;<br />
        <asp:Label ID="lblcheckreceivedby" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Check Receivable By" Width="155px"></asp:Label>
        <asp:TextBox ID="txtcheckrecievable" runat="server" MaxLength="20" TabIndex="2" ToolTip="Check Recievable By"
            Width="215px"></asp:TextBox><br />
        <asp:Label ID="lbldateofrequest" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Date of Request" Width="134px"></asp:Label>
        <asp:TextBox ID="txtdateofrequest" runat="server" MaxLength="20"
            TabIndex="2" ToolTip="Date of Request" Width="91px"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="valDateFormat" runat="server" ControlToValidate="txtdateofrequest" ErrorMessage="Date format is mm/dd/yyyy"
                Font-Bold="True" ForeColor="White" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lblsupervisorapproval" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Supervisor Approving" Width="162px"></asp:Label>
        <asp:TextBox ID="txtSupervisorApproving" runat="server" MaxLength="20" TabIndex="2"
            ToolTip="Supervisor Approving " Width="292px"></asp:TextBox><br />
        <asp:Label ID="lbldateofapproval" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Date of Approval" Width="133px"></asp:Label>
        <asp:TextBox ID="txtdateofapproval" runat="server" MaxLength="20"
            TabIndex="2" ToolTip="Supervisor Approving " Width="93px"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator
                ID="ValDateOfAppr" runat="server" ControlToValidate="txtdateofapproval" ErrorMessage="Date format is mm/dd/yyyy"
                Font-Bold="True" ForeColor="White" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lblcashiersname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Cashiers Name" Width="133px"></asp:Label>
        <asp:TextBox ID="txtcashiersname" runat="server" MaxLength="20" TabIndex="2" ToolTip="Cashiers Name"
            Width="320px"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <asp:Label ID="lblCheckNumber" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Check Number" Width="133px"></asp:Label>
        <asp:TextBox ID="txtchecknumber" runat="server" MaxLength="5" TabIndex="2" ToolTip="Check Number"
            Width="93px" BackColor="White"></asp:TextBox>
        &nbsp;
        <asp:Label ID="lblcheckamount" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Check Amount" Width="133px"></asp:Label>
        <asp:TextBox ID="txtcheckamount" runat="server" MaxLength="20" TabIndex="2" ToolTip="Check Amount"
            Width="93px" BackColor="White"></asp:TextBox>
        &nbsp; &nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="Label2" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Added By:" Width="112px"></asp:Label>
        <asp:TextBox ID="txtOperator" runat="server" BackColor="LightGoldenrodYellow" Font-Bold="True" ForeColor="Black"
            ReadOnly="True"></asp:TextBox><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnnewmember" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add New Batch" ToolTip="Add Batch" Width="112px" Font-Bold="True" ForeColor="Navy" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server"
            Text="Clear" Width="104px" Font-Bold="True" ForeColor="Navy" CausesValidation="False" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="btListView" runat="server"
            Font-Bold="True" ForeColor="Navy" Text="Batch Master List" Width="120px" CausesValidation="False" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="btMainMenu" runat="server" BackColor="Navy"
            Font-Bold="True" Font-Underline="True" ForeColor="White" Text="Main Menu" Width="112px" CausesValidation="False" />
        &nbsp;
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
