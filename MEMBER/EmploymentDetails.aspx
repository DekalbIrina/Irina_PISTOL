<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EmploymentDetails.aspx.vb" Inherits="ArrestDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
<script language="javascript" type="text/javascript">
// <!CDATA[

function HR1_onclick() {

}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="background-color: lightsteelblue">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtdatestarted"></cc1:calendarextender>
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdateended"></cc1:calendarextender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Do you want to delete record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            &nbsp;&nbsp;<br />
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
                Font-Names="Georgia" Font-Overline="False" Font-Size="Medium" Font-Underline="True"
                ForeColor="White" Height="24px" Text="Employment Details" Width="176px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;<asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large"
                ForeColor="Desktop" Width="363px"></asp:Label>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            &nbsp; &nbsp;&nbsp;
            <br />
            <hr />
            <asp:Label ID="lblarrestid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Employment ID" Width="124px"></asp:Label>
            <asp:TextBox ID="txtemploymentid" runat="server" Enabled="False" MaxLength="20" TabIndex="2"
                Width="61px" ToolTip="Employment ID"></asp:TextBox><br />
            <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="123px"></asp:Label>
            <asp:TextBox ID="txtmemberid" runat="server" Enabled="False" MaxLength="5" TabIndex="2"
                Width="61px" ToolTip="Member ID"></asp:TextBox><br />
            <asp:Label ID="lblcompany" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Company" Width="99px"></asp:Label>
            <asp:TextBox ID="txtcompany" runat="server" MaxLength="40" TabIndex="2"
                Width="569px" ToolTip="Company"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;<br />
            <asp:Label ID="lbladdress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Address" Width="99px"></asp:Label>
            <asp:TextBox ID="txtaddress" runat="server" MaxLength="40" TabIndex="2" Width="570px" ToolTip="Address"></asp:TextBox>
            &nbsp;&nbsp;<br />
            <asp:Label ID="lblcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="City"
                Width="99px"></asp:Label>&nbsp;<asp:DropDownList ID="ddcity" runat="server" Width="120px">
                </asp:DropDownList>&nbsp;
            <asp:Label ID="lblstate" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="State"
                Width="99px"></asp:Label>&nbsp;<asp:DropDownList ID="ddstate" runat="server" Width="120px">
                </asp:DropDownList>&nbsp;
            <asp:Label ID="lblzip" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Zip"
                Width="99px"></asp:Label>
            <asp:DropDownList ID="ddzip" runat="server" Width="111px">
            </asp:DropDownList><br />
            <asp:Label ID="lblphone" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Phone"
                Width="99px"></asp:Label>
            <asp:TextBox ID="txtphone" runat="server" MaxLength="10" TabIndex="2" Width="112px" ToolTip="phone"></asp:TextBox>&nbsp;
            <asp:Label ID="lblextension" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Extension" Width="99px"></asp:Label>
            <asp:TextBox ID="txtextension" runat="server" MaxLength="20" TabIndex="2" Width="112px" ToolTip="Extension"></asp:TextBox><br />
            <asp:Label ID="lblwebaddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Web Address" Width="99px"></asp:Label>
            <asp:TextBox ID="txtwebaddress" runat="server" MaxLength="40" TabIndex="2" Width="570px" ToolTip="Web Address"></asp:TextBox><br />
            <asp:Label ID="lblapplicantmanager" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Applicant Manager" Width="161px"></asp:Label>
            <asp:TextBox ID="txtapplicantmanager" runat="server" MaxLength="20" TabIndex="2"
                Width="508px" ToolTip="Applicant Manager"></asp:TextBox><br />
            <asp:Label ID="lblmanageremailaddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Manager Email" Width="161px"></asp:Label>
            <asp:TextBox ID="txtmanageremail" runat="server" MaxLength="40" TabIndex="2" Width="508px" ToolTip="Manager Email"></asp:TextBox><br />
            <asp:Label ID="lbldatestarted" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Date Started" Width="110px"></asp:Label>
            <asp:TextBox ID="txtdatestarted" runat="server" MaxLength="8" TabIndex="2" Width="87px" ToolTip="Date Started"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lbldatended" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Date Ended" Width="110px"></asp:Label>
            <asp:TextBox ID="txtdateended" runat="server" MaxLength="8" TabIndex="2" Width="87px" ToolTip="Date Ended"></asp:TextBox><br />
            <asp:Label ID="lblapplicanttitle" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Applicant Title" Width="161px"></asp:Label>
            <asp:TextBox ID="txtapplicanttitle" runat="server" MaxLength="40"
                TabIndex="2" Width="288px" ToolTip="Applicant Title"></asp:TextBox>&nbsp;
            <asp:Label ID="lblyearsworked" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Years Worked" Width="110px"></asp:Label>
            <asp:TextBox ID="txtyearsworked" runat="server" MaxLength="2" TabIndex="2"
                Width="87px" ToolTip="Years Worked"></asp:TextBox><br />
            <asp:CheckBox ID="chkcurrentemployer" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Text="Current Employer" Width="150px" ToolTip="Current Employer" ForeColor="White" /><br />
            <hr id="HR1" onclick="return HR1_onclick()" />
            &nbsp;
            <asp:Button ID="btndelete" runat="server" Text="Delete Record" ToolTip="Delete Record"
                Width="108px" />
            <asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="25" Text="Update"
                ToolTip="Update Employment Record" Width="112px" /><asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/EmployerList.aspx" Text="Employment List"
                    ToolTip="Go Back To Employment List" Width="122px" />&nbsp;<asp:Button ID="btnHome"
                        runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="118px" /><br />
            <br />
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
