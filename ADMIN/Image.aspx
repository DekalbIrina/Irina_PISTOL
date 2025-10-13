<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Image.aspx.vb" Inherits="Image" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightsteelblue">
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnHome" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#0000C0"
            PostBackUrl="~/Console.aspx" Text="Member Portal" Width="119px" ToolTip="Member Portal" /><br />
        <br />
        <table style="background-color: #003399">
            <tr>
                <td style="width: 198px">
                    <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Member ID:" Width="94px"></asp:Label><asp:TextBox
                        ID="txtmemberid" runat="server" BorderStyle="None" Width="96px" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 249px">
                    <asp:Label ID="lblfirstname" runat="server" ForeColor="White" Text="First Name" Width="88px"></asp:Label>
                    <asp:TextBox ID="txtfirstname" runat="server" BorderStyle="None" ReadOnly="True"></asp:TextBox></td>
                <td style="width: 283px; background-color: #003399">
                    <asp:Label ID="lbllastname" runat="server" ForeColor="White" Text="Last Name:" Width="88px"></asp:Label><asp:TextBox
                        ID="txtlastname" runat="server" BorderStyle="None" Width="148px" ReadOnly="True"></asp:TextBox></td>
            </tr>
        </table>
        &nbsp;
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" Width="627px" Height="23px" ToolTip="Browse Directory Path of Image" />
        <br />
        <asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid" Height="294px"
            Width="311px" BorderWidth="2px" style="z-index: 100; left: 195px; position: absolute; top: 201px" />
        &nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
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
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp; <asp:Button ID="btnviewimage" runat="server" Text="View Image" ToolTip="View Image" /><br />
        <br />
        &nbsp;<asp:Label ID="lblimagedescription" runat="server" BackColor="Silver" BorderColor="White"
            BorderStyle="Outset" Font-Bold="True" ForeColor="Navy" Text="Image Description"
            Width="157px"></asp:Label>
        <asp:TextBox ID="txtimagedescription" runat="server" Width="474px" ToolTip="Type Description of Image"></asp:TextBox><br />
        <asp:TextBox ID="txtfilename" runat="server" Width="541px" ToolTip="Image Path Chosen" ReadOnly="True"></asp:TextBox>
        <asp:Button
            ID="btnimage" runat="server" Height="24px" Text="Add File To DB" Width="105px" ToolTip="Add Image Path to DB" /><br />
        &nbsp;<br />
        <br />
        &nbsp;<br />
        &nbsp;
        <br />
        <br />
    </div>
    </form>
</body>
</html>
