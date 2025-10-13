<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddEmployment.aspx.vb" Inherits="AddArrest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: background" title="Rehab">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdatestart"></cc1:calendarextender>
        <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdateend"></cc1:calendarextender>
        <br />
        &nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Employment" Width="194px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblmember" runat="server" Font-Bold="True"
            Font-Size="Large" ForeColor="Silver" Width="363px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <hr />
        <asp:Label ID="lblmemberid" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="MemberID" Width="99px"></asp:Label>
        <asp:TextBox ID="txtmemberid" runat="server" MaxLength="5" TabIndex="1" Width="61px" Enabled="False" ToolTip="MemberID"></asp:TextBox>
        &nbsp;&nbsp;<asp:Label ID="lblcompany" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Company" Width="109px"></asp:Label>
        <asp:TextBox ID="txtcompany" runat="server" MaxLength="35" TabIndex="2" Width="398px" ToolTip="Company"></asp:TextBox><br />
        <asp:Label ID="lblstart" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Date Started"
            Width="96px"></asp:Label><asp:TextBox ID="txtdatestart" runat="server" MaxLength="8"
                TabIndex="3" Width="72px" ToolTip="Date Started"></asp:TextBox>&nbsp;
        <asp:Label ID="lbldateend" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Date Ended" Width="96px"></asp:Label><asp:TextBox ID="txtdateend" runat="server"
                MaxLength="8" TabIndex="4" Width="68px" ToolTip="Date Ended"></asp:TextBox>
        <asp:Label ID="lbldatevalidation" runat="server" ForeColor="Silver" Text="Date Started/Ended Must Have 8 numeric digits"
            Visible="False" Width="340px"></asp:Label><br />
        <asp:Label ID="lbladdress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Address" Width="109px"></asp:Label>
        <asp:TextBox ID="txtaddress" runat="server" MaxLength="35" TabIndex="5" Width="582px" ToolTip="Address"></asp:TextBox><br />
        <asp:Label ID="lblcity" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="City"
            Width="63px"></asp:Label>&nbsp;
            
         
            <asp:DropDownList ID="ddcity" runat="server" Width="136px" TabIndex="6" ToolTip="City">
            </asp:DropDownList>
         
        <asp:Label ID="lblstate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="State"
            Width="65px"></asp:Label>&nbsp;<asp:DropDownList ID="ddstate" runat="server" Width="134px" TabIndex="7" ToolTip="State">
            </asp:DropDownList>
        <asp:Label ID="lblzip" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Zip"
            Width="46px"></asp:Label>&nbsp;<asp:DropDownList ID="ddzip" runat="server" Width="134px" TabIndex="8" ToolTip="Zip Code">
            </asp:DropDownList><br />
        <asp:Label ID="lblphone" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Phone"
            Width="62px"></asp:Label>
        <asp:TextBox ID="txtphone" runat="server" MaxLength="10" TabIndex="9" Width="168px" ToolTip="Phone"></asp:TextBox>
        <asp:Label ID="lblphonevalidation" runat="server" ForeColor="Silver" Text="Phone Must Have 10 numeric digits"
            Visible="False" Width="231px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblextension" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Extension" Width="62px"></asp:Label>
        <asp:TextBox ID="txtextension" runat="server" MaxLength="5" TabIndex="10" Width="94px" ToolTip="Extension"></asp:TextBox><br />
        <asp:Label ID="lblwebaddress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Web Address" Width="106px"></asp:Label>
        <asp:TextBox ID="txtwebaddress" runat="server" MaxLength="30" TabIndex="11" Width="471px" ToolTip="Web Address"></asp:TextBox><br />
        <asp:Label ID="lblapplicationtitle" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Applicant Title" Width="180px"></asp:Label>
        <asp:TextBox ID="txtapplicationtitle" runat="server" MaxLength="30" TabIndex="12"
            Width="400px" ToolTip="Applicant Title"></asp:TextBox><br />
        <asp:Label ID="lblyearsofservice" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Years of Service" Width="180px"></asp:Label>
        <asp:DropDownList ID="ddyearsofservice" runat="server" TabIndex="13">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
        </asp:DropDownList>
        <asp:CheckBox ID="ckbcurrentemployer" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Text="Current Employer" Width="179px" TabIndex="14" ToolTip="Current Employer" /><br />
        <asp:Label ID="lblapplicationmanager" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Manager" Width="159px"></asp:Label>
        <asp:TextBox ID="txtapplicationmanager" runat="server" MaxLength="30" TabIndex="15"
            Width="419px" ToolTip="Application Manager"></asp:TextBox>&nbsp;<br />
        <asp:Label ID="lblmanageremailaddress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Manager Email Address" Width="180px"></asp:Label>
        <asp:TextBox ID="txtmanageremail" runat="server" MaxLength="30" TabIndex="16" Width="399px" ToolTip="Managers Email Address"></asp:TextBox><br />
        &nbsp;<br />
        <hr />
        &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnaddemployment" runat="server" EnableViewState="False" TabIndex="25"
            Text="Add New Employment" ToolTip="Add Employment To Pistol Database" Width="153px" /><asp:Button
                ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/Console.aspx"
                Text="Member Portal" ToolTip="Member Portal" Width="122px" />&nbsp;<asp:Button ID="btnHome"
                    runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                    PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="118px" /><br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
