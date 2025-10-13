<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UserDetails.aspx.vb" Inherits="UserDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightsteelblue">
        <strong><span style="font-size: 16pt; color: lightsteelblue; text-decoration: underline">
            <span style="background-color: background">
                <br />
                <br />
                <br />
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" ForeColor="White"
                    Text="Update User" Width="120px"></asp:Label><br />
                <br />
                <asp:Label ID="lblUserLastandFistName" runat="server" Font-Bold="True" Font-Size="Smaller"
                    ForeColor="White" Width="360px" BackColor="Transparent"></asp:Label><br />
                <br />
                </span><asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <em></em>
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtdateadded"></cc1:calendarextender>
        <asp:Label ID="lblSuccess" runat="server" BackColor="Lavender" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="Navy" Height="40px" Width="576px"></asp:Label>
        <asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="White" Width="576px" BackColor="Red" BorderStyle="Ridge" Height="40px"></asp:Label></span></strong><br />
        <asp:Label ID="lblfirstname" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="FirstName" Width="82px"></asp:Label>
        <asp:TextBox ID="txtfirstname"
                runat="server" ToolTip="Enter FirstName" Width="208px"></asp:TextBox>
        &nbsp; &nbsp;
        <asp:Label ID="lblastname"
                    runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White" Text="LastName"
                    Width="82px"></asp:Label>
        <asp:TextBox ID="txtlastname" runat="server" ToolTip="Enter Last Name"
                        Width="168px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="ValidateFirstName" runat="server" ControlToValidate="txtfirstname"
            ErrorMessage="Please Enter First Name" Font-Bold="True" Width="184px"></asp:RequiredFieldValidator>&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="ValidateLastName" runat="server" ControlToValidate="txtlastname"
            ErrorMessage="Please Enter Last Name" Font-Bold="True" Width="168px"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblJobTitle" runat="server" BackColor="SteelBlue"
                            Font-Bold="True" ForeColor="White" Text="Job Title" Width="80px"></asp:Label>
        <asp:TextBox
                                ID="txtjobtitle" runat="server" ToolTip="Enter Job Title" Width="208px"></asp:TextBox>&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;
        <br />
        <asp:Label ID="lblusername" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Username" ToolTip="Enter Username" Width="82px"></asp:Label>
        <asp:TextBox ID="txtusername" runat="server" ToolTip="Enter UserName" Width="208px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
        &nbsp;
        <asp:Label ID="lblUserID" runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White"
            Text="User ID" Width="80px"></asp:Label>
        <asp:TextBox ID="txtUserID" runat="server" BackColor="#FFFFC0" Font-Bold="True" ForeColor="Black"
            ReadOnly="True" Width="56px"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="ValidateUserName" runat="server" ControlToValidate="txtusername"
            ErrorMessage="Please Enter User Name" Font-Bold="True"></asp:RequiredFieldValidator><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        <asp:Label ID="lblpermissions"
                    runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White" Text="Permission"
                    ToolTip="Enter Permission" Width="79px"></asp:Label>&nbsp;<asp:DropDownList ID="ddpermissions"
                        runat="server" Width="216px">
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Guest</asp:ListItem>
                        <asp:ListItem>User</asp:ListItem>
                    </asp:DropDownList>
        &nbsp;&nbsp; &nbsp;<asp:Label ID="lbldateadded" runat="server" BackColor="SteelBlue"
                        Font-Bold="True" ForeColor="White" Text="Date Added" ToolTip="Enter Password"
                        Width="88px"></asp:Label>
        <asp:TextBox ID="txtdateadded" runat="server" ToolTip="Enter Password"
                            Width="96px"></asp:TextBox>&nbsp; <asp:CheckBox ID="chksworn" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Sworn" Width="75px" />&nbsp;<br />
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; <asp:RequiredFieldValidator ID="ValidatePermis" runat="server" ControlToValidate="ddpermissions"
            ErrorMessage="Please Enter Permission" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:RequiredFieldValidator ID="ValidateDate" runat="server" ControlToValidate="txtdateadded"
            ErrorMessage="Please Enter Date" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp;
        <br />
        <asp:Label ID="lblComments" runat="server" Font-Bold="True" Text="Comments" Width="136px" BackColor="SteelBlue" ForeColor="White"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="128px" TextMode="MultiLine"
            Width="568px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblOperator" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Updated By:" ToolTip="Operator Name" Width="152px"></asp:Label>&nbsp;
        <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True"></asp:TextBox><br />
        &nbsp;
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<br />
        &nbsp; &nbsp; 
        <asp:Button ID="btnDeleteUser" runat="server" CausesValidation="False" Font-Bold="True"
            ForeColor="Navy" Text="Delete User" Width="120px" />&nbsp; &nbsp;<asp:Button ID="btnUpdateUser" runat="server" Text="Update User" ToolTip="Update  User" BackColor="White" Font-Bold="True" ForeColor="Navy" />
        &nbsp; &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" ToolTip="Clear " Width="80px" CausesValidation="False" />
        &nbsp; &nbsp;<asp:Button ID="btnListofUsers" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="List Of Users" ToolTip="User's List" Width="112px" CausesValidation="False" PostBackUrl="~/GRID/UserList.aspx" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button
                        ID="btnHome" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" Width="118px" ToolTip="Main Menu" BackColor="Navy" CausesValidation="False" /><br />
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnpistol %>"
            SelectCommand="SELECT [UserID], [Firstname], [Lastname], [EmpUserName], [EmpPermissions], [JobTitle], [Sworn] FROM [PCUser] ORDER BY [EmpUserName]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [PCUser] WHERE [UserID] = @original_UserID AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [EmpUserName] = @original_EmpUserName AND [EmpPermissions] = @original_EmpPermissions AND [JobTitle] = @original_JobTitle AND [Sworn] = @original_Sworn" InsertCommand="INSERT INTO [PCUser] ([Firstname], [Lastname], [EmpUserName], [EmpPermissions], [JobTitle], [Sworn]) VALUES (@Firstname, @Lastname, @EmpUserName, @EmpPermissions, @JobTitle, @Sworn)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [PCUser] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [EmpUserName] = @EmpUserName, [EmpPermissions] = @EmpPermissions, [JobTitle] = @JobTitle, [Sworn] = @Sworn WHERE [UserID] = @original_UserID AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [EmpUserName] = @original_EmpUserName AND [EmpPermissions] = @original_EmpPermissions AND [JobTitle] = @original_JobTitle AND [Sworn] = @original_Sworn" ProviderName="<%$ ConnectionStrings:cnpistol.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Lastname" Type="String" />
                <asp:Parameter Name="original_EmpUserName" Type="String" />
                <asp:Parameter Name="original_EmpPermissions" Type="String" />
                <asp:Parameter Name="original_JobTitle" Type="String" />
                <asp:Parameter Name="original_Sworn" Type="Boolean" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="EmpUserName" Type="String" />
                <asp:Parameter Name="EmpPermissions" Type="String" />
                <asp:Parameter Name="JobTitle" Type="String" />
                <asp:Parameter Name="Sworn" Type="Boolean" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
                <asp:Parameter Name="original_Firstname" Type="String" />
                <asp:Parameter Name="original_Lastname" Type="String" />
                <asp:Parameter Name="original_EmpUserName" Type="String" />
                <asp:Parameter Name="original_EmpPermissions" Type="String" />
                <asp:Parameter Name="original_JobTitle" Type="String" />
                <asp:Parameter Name="original_Sworn" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="EmpUserName" Type="String" />
                <asp:Parameter Name="EmpPermissions" Type="String" />
                <asp:Parameter Name="JobTitle" Type="String" />
                <asp:Parameter Name="Sworn" Type="Boolean" />
            </InsertParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
