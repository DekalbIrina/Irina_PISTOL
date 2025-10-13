<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddChecklist.aspx.vb" Inherits="AddCheckList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: background" title="Rehab">
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add Background Status" Width="222px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="363px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="48px" Visible="False" Width="632px"></asp:Label><br />
        &nbsp;
        <asp:Label ID="lblInformationMessage" runat="server" BackColor="Lavender" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="Red" Height="32px" Visible="False" Width="672px"></asp:Label>
        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp;
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="10" TabIndex="2" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>&nbsp;
        <asp:Label ID="lblDCPLID" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="DCPLID"
            Width="99px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
            Width="104px" ToolTip="DCPLID" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
        &nbsp;
        <asp:Label ID="lblBatchNumber" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Batch Number" Width="112px"></asp:Label>
        <asp:TextBox ID="txtBatchNumber" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" Width="32px"></asp:TextBox><br />
        <br />
        &nbsp;&nbsp; &nbsp;
        <br />
        <asp:Label ID="lblBackground" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Background" Width="99px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;
        <br />
        <asp:RadioButtonList ID="RDBBackground" runat="server" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" ForeColor="White" Width="240px" Height="176px">
            <asp:ListItem>FBI-GBI Complete</asp:ListItem> 
            <asp:ListItem>Pending Dispositions</asp:ListItem>              
            <asp:ListItem>Dispositions Complete</asp:ListItem>                      
             <asp:ListItem>Holding</asp:ListItem> 
            <asp:ListItem>Denial</asp:ListItem>   
            
            
        </asp:RadioButtonList>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <asp:CheckBox ID="chkmentalhealth" runat="server" Font-Bold="True" ForeColor="White"
            Text="Mental Health Completed" Width="203px" Visible="False" />
        &nbsp;
        <asp:CheckBox ID="chkhospitalletter"
                runat="server" Font-Bold="True" ForeColor="White" Text="Hospital Letter" Width="159px" Visible="False" /><br />
        <br />
        <asp:Label ID="lblstatus" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Status" Width="99px"></asp:Label>
        <asp:TextBox ID="txtbackground" runat="server" Enabled="False" ForeColor="Black"
            Width="152px" BackColor="#FFFFC0" ReadOnly="True" Font-Bold="True"></asp:TextBox>
        &nbsp; &nbsp; 
        <br />
        &nbsp;
        <br />
        <asp:Label ID="Label2" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Background Notes" Width="153px"></asp:Label><br />
        <asp:TextBox ID="txtbackgroundnotes" runat="server" Height="104px" TextMode="MultiLine"
            Width="720px"></asp:TextBox><br />
        <br />
        <asp:Button ID="btnUser" runat="server" Font-Bold="True" ForeColor="Navy" Text="Added By:"
            Width="112px" />
        <asp:TextBox ID="txtUser" runat="server" BackColor="#FFFFC0" ReadOnly="True" Font-Bold="True" ForeColor="Black"></asp:TextBox><br />
        &nbsp;<br />
        <br />
        <hr />
        <asp:Button ID="btnchecklist" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add Record" ToolTip="Add Checklist Item" Width="131px" Font-Bold="True" ForeColor="Navy" />
        <asp:Button ID="btnCancel"
                    runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear" Width="56px" />
        <asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/license/LicenseDetails.aspx"
                Text="License Portal" ToolTip="Pistol License" Width="122px" />&nbsp;<asp:Button
                ID="btnMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy" Text="Member Portal"
                ToolTip="See Member Information" Width="120px" PostBackUrl="~/MEMBER/Console.aspx" />&nbsp;&nbsp;
        <asp:Button
                    ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                    ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                    Width="118px" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;<br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
