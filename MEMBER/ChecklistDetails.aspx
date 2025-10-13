<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ChecklistDetails.aspx.vb" Inherits="ArrestDetails" %>

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
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblchecklist" runat="server" BackColor="Transparent" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="Navy" Height="24px" Text="Update Background  Status" Width="336px"></asp:Label><br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Desktop"
                Width="363px"></asp:Label><br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:confirmbuttonextender id="ConfirmButtonExtender1" runat="server" confirmtext="Do you want to delete the record?"
                targetcontrolid="btndelete"></cc1:confirmbuttonextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            <br />
            <asp:Label ID="lblInformationMessage" runat="server" BackColor="LavenderBlush" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Red" Height="40px" Visible="False" Width="584px"></asp:Label><br />
            <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="White" Height="48px" Visible="False" Width="584px"></asp:Label><br />
            <hr />
            &nbsp;
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Member ID" Width="92px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="61px" ToolTip="Member ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
            &nbsp; &nbsp;
            <asp:Label ID="lblDCPLID" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="DCPLID"
                Width="80px"></asp:Label>
            <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="111px" ToolTip="DCPLID" BackColor="#FFFFC0" ForeColor="Black" ReadOnly="True" Font-Bold="True"></asp:TextBox>
            &nbsp;&nbsp; 
            <asp:Label ID="lblBatchNumber" runat="server" BackColor="SteelBlue" BorderColor="White"
                Font-Bold="True" ForeColor="White" Text="Batch Number" Width="112px" BorderStyle="Solid" BorderWidth="1px"></asp:Label>
            <asp:TextBox ID="txtBatchNumber" runat="server" BackColor="#FFFFC0" Font-Bold="True"
                ForeColor="Black" ReadOnly="True" Width="32px"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblBackground" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Background" Width="99px"></asp:Label><br />
            <asp:RadioButtonList ID="RDBBackground" runat="server" BorderColor="Black" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" ForeColor="ControlText" Width="344px" ToolTip="BackGround" Height="176px">
                <asp:ListItem>FBI-GBI Complete</asp:ListItem>
                <asp:ListItem>Pending Dispositions</asp:ListItem>
                <asp:ListItem>Dispositions Complete</asp:ListItem>
                 <asp:ListItem>Holding</asp:ListItem> 
                <asp:ListItem>Active</asp:ListItem>       
                <asp:ListItem>Denial</asp:ListItem>
                 <asp:ListItem>Revoked</asp:ListItem>
               
                
            </asp:RadioButtonList><br />
            <asp:CheckBox ID="chkMH" runat="server" Font-Bold="True" ForeColor="Black" Width="104px" ToolTip="Menatl Health Check Box" Height="8px" BackColor="Transparent" />&nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" ForeColor="White" Text="Mental Health" Width="184px"></asp:Label><br />
            <br />
            <asp:CheckBox ID="chkHL"
                    runat="server" Font-Bold="True" ForeColor="Black"
                    Width="96px" ToolTip="Hospital Letter Check Box" />
            &nbsp;&nbsp; &nbsp;
            <asp:Label ID="Label3" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" ForeColor="White" Text="Hospital Letter" Width="184px"></asp:Label>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <br />
            <asp:CheckBox ID="chRehCl" runat="server" Font-Bold="True" ForeColor="Black" Width="88px" />
            &nbsp; &nbsp;
            <asp:Label ID="lblRehabClear" runat="server" BackColor="SteelBlue" BorderColor="White"
                BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Rehab Record Cleared"
                Width="184px"></asp:Label><br />
            <br />
            <br />
            <asp:Label ID="lblstatus" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Status" Width="92px"></asp:Label>
            <asp:TextBox ID="txtbackground" runat="server" Enabled="False" ForeColor="Black"
                Width="152px" BackColor="#FFFFC0" Font-Bold="True" ReadOnly="True"></asp:TextBox><br />
            <br />
            <asp:Label ID="Label2" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Background Notes"
                Width="153px"></asp:Label><asp:TextBox ID="txtbackgroundnotes" runat="server" Height="112px"
                    TextMode="MultiLine" Width="721px"></asp:TextBox>
            &nbsp;
            &nbsp;<asp:Label ID="lblUpdatedBy" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Updated By" Width="96px" BorderStyle="Solid" BorderWidth="1px"></asp:Label>
            <asp:TextBox ID="txtUpdatedBy" runat="server" BackColor="#FFFFC0" Font-Bold="True"
                ForeColor="Black" Width="136px"></asp:TextBox>
            &nbsp; &nbsp; &nbsp;
            <asp:Button ID="btndelete" runat="server" Text="Delete Record" ToolTip="Delete Record"
                Width="120px" Font-Bold="True" ForeColor="Navy" Visible="False" />
            <br />
            <br />
            <hr />
            &nbsp;&nbsp;
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update Record"
                ToolTip="Update Background Record" Width="112px" Font-Bold="True" ForeColor="Navy" />
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx" Text="License Portal"
                    ToolTip="License Portal" Width="112px" />&nbsp;<asp:Button
                    ID="btnMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MEMBER/Console.aspx"
                    Text="Member Portal" ToolTip="Member Screen" Width="104px" />
            &nbsp;<asp:Button ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy"
                Text="Clear" ToolTip="Clear Information" Width="88px" />
            <asp:Button ID="btnHome" runat="server"
                        BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White" PostBackUrl="~/PistolLicense.aspx"
                        Text="Main Menu" ToolTip="Main Menu" Width="118px" /><br />
            &nbsp;<br />
        </div>
    
    </div>
    </form>
</body>
</html>
