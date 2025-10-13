<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DuplicateLicenseList.aspx.vb" Inherits="DuplicateLicenseList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body style="color: #000000">
    <form id="form1" runat="server">
    <div>
        <span><span style="background-color: #006699"></span>
        </span><span style="font-size: 16pt;
            color: #000099"><strong><em><span style="color: infotext"><span style="text-decoration: underline overline">
                Duplicate License History</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp;</span>
            </em>&nbsp; &nbsp;&nbsp;
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button
                    ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/LICENSE/LicenseDetails.aspx"
                    Text="Pistol License" ToolTip="Pistol License" Width="122px" /><br />
            </strong></span>&nbsp;
        &nbsp;
        &nbsp;&nbsp;<br />
        <br />
        <asp:GridView ID="grddisplaced" runat="server" BackColor="White" BorderColor="#999999"
            BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Size="Small" GridLines="Vertical"
            Height="1px" HorizontalAlign="Left" RowHeaderColumn="Payment Transaction #" Width="628px">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="TransID"
                    DataTextField="TransID" HeaderImageUrl="~/Images/PREVIEW.BMP" DataNavigateUrlFormatString="~/LICENSE/DuplicateLicenseDetails.aspx?id={0}" />
            </Columns>
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
    </form>
</body>
</html>
