<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" defaultfocus="txtuser" runat="server">
    <div style="background-color: #000000; text-align: left;">
        <br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<asp:Image ID="Image1" runat="server"
            Height="165px" ImageUrl="~/Images/FireArms.jpg" Width="658px" />
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /><hr />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <table>
            <tr>
                <td style="width: 160px; height: 132px;">
                </td>
                <td style="width: 314px; height: 132px;">
                    <strong><span style="color: #d3d3d3"><span style="color: #ccccff"></span><span style="color: #ccccff">
                USERNAME
                        <asp:TextBox ID="txtuser" runat="server" Width="186px" style="left: -12px; top: 149px" ToolTip="Enter UserName"></asp:TextBox></span><br />
                        <br />
                        <span style="color: #ccccff">
                PASSWORD</span><span><strong><span style="color: #ccccff">
                        </span></strong><span style="color: #6699cc"><span style="color: #ccccff">&nbsp;</span><asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="183px" style="left: -12px; top: 149px" ToolTip="Enter Password"></asp:TextBox><br />
                            &nbsp; &nbsp; &nbsp; &nbsp;<br />
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<asp:Button ID="btnlogon" runat="server" Font-Bold="True" Font-Names="Georgia" Height="28px"
                    Text="Log On" Width="85px" style="left: -12px; top: 149px" ToolTip="Log On To System" UseSubmitBehavior="False" /><br />
                        </span></span></span></strong>
                </td>
                <td style="width: 212px; height: 132px;">
                    <asp:Label ID="lblinvalidpassword" runat="server" ForeColor="#FFFFFF" Text="Invalid Password, Try Again!"
                        Visible="False" Width="200px"></asp:Label></td>
            </tr>
        </table>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <hr />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblError" runat="server"
            BackColor="Red" BorderStyle="Ridge" Font-Bold="True" ForeColor="White" Height="48px"
            Visible="False" Width="456px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<strong> </strong><span style="color: #6699cc">
            &nbsp; &nbsp; &nbsp; </span>
        <span style="font-family: Georgia"><span style="color: #ffffff; background-color: #000000;">
    <em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        </em></span></span>&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<br />
    </div>
    </form>
</body>
</html>
