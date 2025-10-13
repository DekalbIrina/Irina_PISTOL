<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PaymentDetails.aspx.vb" Inherits="ArrestDetails" %>

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
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Payment Details" Width="176px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="363px"></asp:Label><br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:confirmbuttonextender id="ConfirmButtonExtender1" runat="server" confirmtext="Do you want to delete record?"
                targetcontrolid="btndelete"></cc1:confirmbuttonextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            <hr />
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Member ID" Width="92px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="61px"></asp:TextBox>
            &nbsp; &nbsp;
            <asp:Label ID="lblDCPLID" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="DCPLID"
                Width="80px"></asp:Label>
            <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="111px"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="lbltransid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Payment Trans. ID" Width="150px"></asp:Label>&nbsp;
            <asp:TextBox ID="txttransid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="61px"></asp:TextBox><br />
            <asp:Label ID="lblamountpaid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Amount Paid" Width="105px"></asp:Label>
            <asp:TextBox ID="txtamountpaid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="61px"></asp:TextBox>&nbsp;
            <asp:Label ID="lbldatepaid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Date Paid" Width="105px"></asp:Label>
            <asp:TextBox ID="txtdatepaid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="86px"></asp:TextBox>
            &nbsp; &nbsp;<asp:CheckBox ID="chkpaymentexempt" runat="server" BackColor="SteelBlue"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Text="Payment Exempt"
                Width="153px" ForeColor="White" /><br />
            <br />
            <asp:Label ID="lblreasonexempt" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Reason Exempt" Width="125px"></asp:Label>&nbsp;<br />
            <asp:TextBox ID="txtreasonexempt" runat="server" Height="59px" MaxLength="255"
                TabIndex="2" Width="586px"></asp:TextBox><br />
            <br />
            <hr />
            <br />
            &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Record"
                ToolTip="Delete Record" />
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update"
                ToolTip="Update Payment Record" Width="112px" /><asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/PaymentList.aspx" Text="Payment List"
                    ToolTip="Go Back To Payment List " Width="122px" />&nbsp;<asp:Button ID="btnHome"
                        runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="118px" /><br />
            <br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
