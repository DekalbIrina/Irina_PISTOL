<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmployerList.aspx.vb" Inherits="ArrestList" %>

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
                Employment History</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>
            </em>&nbsp; &nbsp;&nbsp;
                <br />
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button
                    ID="btnconsole" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Console.aspx"
                    Text="Member Portal" ToolTip="Member Portal" /><br />
            </strong></span>
        <br />
        <asp:GridView ID="grdemployment" runat="server" CellPadding="3" Font-Size="Small"
            GridLines="Vertical" Height="1px" Width="628px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" HorizontalAlign="Left">
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="employmentid" DataNavigateUrlFormatString="employmentdetails.aspx?id={0}"
                    DataTextField="employmentid" HeaderText="Employment ID" HeaderImageUrl="~/Images/PREVIEW.BMP" />
            </Columns>
        </asp:GridView>
        &nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
    </form>
</body>
</html>
