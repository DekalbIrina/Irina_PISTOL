<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MainSearch.aspx.vb" Inherits="MainSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body bgcolor="lightsteelblue">
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table style="height: 103px">
            <tr>
                <td style="width: 115px; height: 66px; background-color: #336699">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" BackColor="Desktop" BorderColor="Black"
            Font-Bold="False" Font-Size="Large" ForeColor="White" Height="62px" Width="364px" Font-Italic="True" Font-Names="Georgia" AutoPostBack="True">
             <asp:ListItem Value="1">Search By First And Last Name</asp:ListItem>
             <asp:ListItem Value="2">Search By DCPLID</asp:ListItem>
             <asp:ListItem Value="3">Search By First And Last Name And DOB</asp:ListItem>
            <asp:ListItem Value="4">Search By Member ID</asp:ListItem>                           
            <asp:ListItem Value="5">Search For Old Licenses</asp:ListItem>
            
        </asp:RadioButtonList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp;
                    <asp:Button ID="btnnewmember" runat="server" Enabled="False" PostBackUrl="~/member/AddMember.aspx"
                        Style="z-index: 100; left: 304px; position: absolute; top: 248px" Text="(+) New Member"
                        Width="168px" ToolTip="New Member" TabIndex="-1" Font-Bold="True" ForeColor="Navy" Height="24px" CausesValidation="False" />
                    <br />
                    <asp:Button ID="btnpistolconsole" runat="server" PostBackUrl="~/PistolLicense.aspx"
                        Style="z-index: 102; left: 136px; position: absolute; top: 248px" Text="Main Menu"
                        Width="140px" ToolTip="Main Menu" TabIndex="-1" BackColor="Navy" Font-Bold="True" ForeColor="White" CausesValidation="False" />
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    
                </td>
                <td style="width: 349px; height: 66px; background-color: #336699">
                    <asp:Button ID="btnsubmit" runat="server" Style="z-index: 100; left: 544px; position: absolute;
                        top: 248px" Text="Submit Search" Width="120px" ToolTip="Submit Search" TabIndex="6" Font-Bold="True" ForeColor="Navy" />
                    <asp:Label ID="lblfirst" runat="server" ForeColor="White" Style="z-index: 101;
                        left: 389px; position: absolute; top: 72px" Text="First Name" Width="75px" BackColor="Desktop" Font-Bold="True" Visible="False"></asp:Label>
                    <asp:Label ID="lbllast" runat="server" ForeColor="White" Style="z-index: 102; left: 391px;
                        position: absolute; top: 97px" Text="Last Name" Width="75px" BackColor="Desktop" Font-Bold="True" Visible="False"></asp:Label>
                    <asp:Label ID="lblDOB" runat="server" ForeColor="White" Style="z-index: 103; left: 392px;
                        position: absolute; top: 123px" Text="D.O.B (mm/dd/yyyy)" Width="136px" BackColor="Desktop" Font-Bold="True" Font-Size="Smaller" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtlastname" runat="server" Style="z-index: 104; left: 469px; position: absolute;
                        top: 96px" Width="170px" MaxLength="20" TabIndex="5" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtDOB" runat="server" Style="z-index: 105; left: 530px; position: absolute;
                        top: 122px" Width="109px" MaxLength="10" TabIndex="5" Visible="False"></asp:TextBox>
                    <asp:Label ID="lbldatevalidation" runat="server" ForeColor="ActiveBorder" Style="z-index: 107;
                        left: 394px; position: absolute; top: 146px" Text="Date Must Have Valid Format: mm/dd/yyyy"
                        Visible="False" Width="296px" Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;<asp:Button ID="btnClear" runat="server" Style="z-index: 100; left: 24px; position: absolute;
                        top: 248px" Text="Clear" Width="88px" ToolTip="Submit Search" TabIndex="-1" Font-Bold="True" ForeColor="Navy" CausesValidation="False" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RegularExpressionValidator ID="valDOB" runat="server" ControlToValidate="txtDOB"
            Enabled="False" ErrorMessage="DOB must have valid format: mm/dd/yyyy" Font-Bold="True"
            Font-Size="Larger" ValidationExpression="\d{1,2}/\d{1,2}\/\d{4}"></asp:RegularExpressionValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <br />
        &nbsp; 
        <asp:RegularExpressionValidator ID="valMemberID" runat="server" ControlToValidate="txtmemberid"
            ErrorMessage="Member ID should be Numeric." Font-Bold="True" ValidationExpression="^[0-9]*$"
            Width="272px" Enabled="False" Font-Size="Large"></asp:RegularExpressionValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <asp:GridView ID="grdsearch" runat="server" BackColor="White" BorderColor="#999999"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="724px" Font-Size="Small" RowHeaderColumn="MemberID" DataKeyNames="memberid" PageSize="5">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" /><Columns>
                <asp:ButtonField CommandName="Select" DataTextField="memberid" HeaderImageUrl="~/Images/PREVIEW.BMP"
                    Text="Button" />
            </Columns>
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        &nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;<asp:GridView ID="gridOldData" runat="server" BackColor="White" BorderColor="#999999"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableSortingAndPagingCallbacks="True"
            Font-Bold="True" Font-Overline="False" Font-Size="Smaller" Font-Underline="False"
            GridLines="Vertical" Height="136px" Visible="False" Width="720px" AllowSorting="True">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#000084" BorderColor="White" BorderStyle="Solid" BorderWidth="2px"
                ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;<br />
        &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
        <asp:Label ID="lblcount" runat="server" Font-Bold="True" ForeColor="Navy" Width="248px" BackColor="#FFC0C0" BorderStyle="Ridge" Height="16px" Visible="False"></asp:Label><br />
        <br />
        <br />
        &nbsp;
        <asp:TextBox ID="txtfirstname" runat="server" Style="z-index: 101; left: 468px;
            position: absolute; top: 71px" Width="170px" MaxLength="20" TabIndex="4" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txtmemberid" runat="server" Style="z-index: 102; left: 384px; position: absolute;
            top: 16px" Width="56px" MaxLength="8" TabIndex="1" Visible="False"></asp:TextBox>
        <asp:TextBox ID="SearchbyDCPLID" runat="server" Style="z-index: 103; left: 389px;
            position: absolute; top: 45px" Width="247px" MaxLength="13" TabIndex="2" Visible="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
            ForeColor="White" Height="32px" Width="616px" Visible="False"></asp:Label>
    </form>
</body>
</html>
