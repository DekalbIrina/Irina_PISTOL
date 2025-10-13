<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddLicense.aspx.vb" Inherits="AddLicense" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="ddtype"  runat="server">
    <div style="background-color: background">
        &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;
        
         <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Silver"
            Width="232px" style="z-index: 102; left: 232px; position: absolute; top: 104px"></asp:Label>
            
                                <asp:Label ID="lblFormName" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Large" Font-Underline="False"
            ForeColor="White" Height="32px" Text="Add New License" Width="200px" style="z-index: 100; left: 264px; position: absolute; top: 48px"></asp:Label>
        &nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        

        <br />
        &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
        <asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="40px" Visible="False" Width="688px"></asp:Label>
        <hr style="height: 1px" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        
            <asp:ScriptManager ID="ScriptManager1" runat="server">          
        </asp:ScriptManager>  
             
         
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="5" Width="61px" Enabled="False" ToolTip="Member ID" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox>
        &nbsp;&nbsp;<asp:Label ID="lbldcplid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="DCPLID" Width="74px"></asp:Label>
        <asp:TextBox ID="txtdcplid" runat="server" MaxLength="20" Width="98px" ToolTip="DCPLID" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox>&nbsp;&nbsp;
        &nbsp;
        <asp:Label ID="lblBarchNumber" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Batch Number" Width="104px"></asp:Label>
        <asp:TextBox ID="txtBatchNumber" runat="server" Width="48px" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox><br />
        <br />
        &nbsp;<asp:Label
            ID="lbltype" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Type"
            Width="46px"></asp:Label>&nbsp;<asp:DropDownList ID="ddtype" runat="server" Width="118px" ToolTip="License Type" BackColor="White" TabIndex="1" AutoPostBack="True">               
                <asp:ListItem>FirstTime</asp:ListItem>
                <asp:ListItem>Renewal</asp:ListItem>
                 <asp:ListItem></asp:ListItem>
          
            </asp:DropDownList>&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblTempOption" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Temporary"></asp:Label>&nbsp;
            <asp:DropDownList ID="ddTempOption" runat="server" TabIndex="2"> 
                   <asp:ListItem ></asp:ListItem>                
                  <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem> 
                         
                   
            </asp:DropDownList><br />
        <br />
        <asp:Label ID="lblstatus" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Status"
            Width="46px"></asp:Label>&nbsp;
            <asp:TextBox ID="txtstatus" runat="server" Width="144px" ToolTip="Status" BackColor="#FFFFC0" Enabled="False" Font-Bold="True" ReadOnly="True" ForeColor="Black"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblapplied" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Applied" Width="46px"></asp:Label>
        <asp:TextBox ID="txtapplied" runat="server" MaxLength="8" Width="137px" ToolTip="Date Applied" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox>
        &nbsp;&nbsp;<br />
        <br />
        <asp:Label ID="lblstatemailed" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Mailed to Mental Health Department" Width="264px" Visible="False"></asp:Label>
        <asp:TextBox ID="txtstatemailed" runat="server" MaxLength="10" Width="98px" ToolTip="State Mailed" BackColor="#FFFFC0" ReadOnly="True" Visible="False"></asp:TextBox>&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp;<asp:Label ID="lbllicfee" runat="server"
            BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia"
            Font-Size="Small" ForeColor="Black" Text="License Fee" Width="89px" Visible="False"></asp:Label>&nbsp;&nbsp;<asp:DropDownList
                ID="ddlicensefee" runat="server" Width="92px" BackColor="White" Visible="False" TabIndex="3">
            </asp:DropDownList>
        &nbsp; &nbsp; &nbsp;<br />
        &nbsp;<br />
        <asp:Label ID="lblcomments" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Comments" Width="99px"></asp:Label><br />
        <asp:TextBox ID="txtcomments" runat="server" Height="88px" MaxLength="255"
            Width="624px" BackColor="White" TabIndex="4"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblOperator" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            Text="Added By:" Width="96px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ReadOnly="True" ForeColor="Black" TabIndex="5"></asp:TextBox><br />
        &nbsp;&nbsp;&nbsp;<br />
        <br />
        <hr style="height: 1px" />
        &nbsp;<asp:Button ID="btnnewlicense" runat="server" EnableViewState="False" TabIndex="6"
            Text="Add New License" ToolTip="Add License To Pistol Database" Width="136px" Font-Bold="True" ForeColor="Navy" />
        &nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="96px" ToolTip="Clear entry" TabIndex="-1" />
        &nbsp; &nbsp;<asp:Button ID="btnMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Member Portal" Width="128px" ToolTip="Come back to Member Information Screen" TabIndex="-1" PostBackUrl="~/MEMBER/Console.aspx" />
        &nbsp; &nbsp;<asp:Button ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
            ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
            Width="118px" TabIndex="-1" />
        &nbsp;<br />
        <br />
    
    </div>
    </form>
</body>
</html>
