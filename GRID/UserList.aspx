<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserList.aspx.vb" Inherits="UserList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body style="color: #000000">
    <form id="form1" runat="server">
    <div>
        <span style="font-size: 16pt;
            color: #000099"><strong><em><span style="color: infotext">List Of Users &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span>
            </em>&nbsp; &nbsp;&nbsp;
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button
                    ID="btnconsole" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/PistolLicense.aspx"
                    Text="Main Menu" ToolTip="Return to Main Menu" /><br />
            </strong></span>
        <br />
        <asp:GridView ID="grdUsers" runat="server" CellPadding="3" Font-Size="Small"
            GridLines="Vertical" Height="1px" Width="628px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" HorizontalAlign="Left" AllowPaging="True">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="userid" DataNavigateUrlFormatString="~/admin/userDetails.aspx?userid={0}"
                    DataTextField="userid" HeaderText="User ID" HeaderImageUrl="~/Images/PREVIEW.BMP" />
            </Columns>
        </asp:GridView>
        &nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <asp:Label ID="lblError" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
            ForeColor="White" Height="40px" Visible="False" Width="504px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
    </form>
</body>
</html>
