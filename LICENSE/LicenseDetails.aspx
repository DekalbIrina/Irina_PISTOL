<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LicenseDetails.aspx.vb" Inherits="LisenseDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dekalb County Pistol License</title>
</head>
<body>
    <form id="form1" defaultfocus="txtmemberid" runat="server">
    <div>
        <div style="background-color: lightsteelblue">
            <asp:Menu ID="Menu1" runat="server" BackColor="Navy" DynamicHorizontalOffset="2"
                Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="#E0E0E0" Height="32px"
                Orientation="Horizontal" StaticSubMenuIndent="10px" Width="704px">
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="MidnightBlue" ForeColor="White" />
                <DynamicMenuStyle BackColor="SteelBlue" />
                <StaticSelectedStyle BackColor="#507CD1" />
                <DynamicSelectedStyle BackColor="Desktop" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <Items>       
                    <asp:MenuItem Text="BackGround" Value="BackGround">
                        <asp:MenuItem Text="Add/Update Background Status" Value="Add/Update Background Status" NavigateUrl="~/Member/AddChecklist.aspx"></asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem Text="Search Background Status" Value="Search Background Status" NavigateUrl="~/Grid/BackgroundList.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Duplicate License" Value="Duplicate License">
                        <asp:MenuItem Text="Add Duplicate License" Value="Add Duplicate License" NavigateUrl="~/License/AddDuplicateLicense.aspx"></asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem Text="Search/Update Duplicate License" Value="Search/Update Duplicate License" NavigateUrl="~/Grid/DuplicateLicenseList.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Print Duplicate License" Value="Print Duplicate License" NavigateUrl="~/APPLICATION/DuplicateLicensePrint.aspx"></asp:MenuItem>
                        
                    </asp:MenuItem>
                    
                          <asp:MenuItem Text="Copy issued License" Value="Copy issued License"> 
                        <asp:MenuItem Text="Add Copy Issued License" Value="Add Copy Issued License" NavigateUrl="~/License/AddCopyIssuedLicense.aspx"></asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem Text="Search/Update Copy Issued License" Value="Search/Update Copy Issued License" NavigateUrl="~/Grid/CopyLicenseList.aspx"></asp:MenuItem>
                        <asp:MenuItem Text="Print Copy Issued License" Value="Print Copy Issued License" NavigateUrl="~/APPLICATION/CopyLicensePrint.aspx"></asp:MenuItem>
                        
                    </asp:MenuItem>
                    
                    <asp:MenuItem Text="Revoked License" Value="Revoked License">
                        <asp:MenuItem Text="Add Revoked" Value="Add Revoked" NavigateUrl="~/License/AddRevoke.aspx"></asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem Text="Search/Update Revoked License" Value="Search/Update Revoked License" NavigateUrl="~/Grid/RevokedList.aspx">
                        </asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="Applications" Value="Applications">
                        <asp:MenuItem NavigateUrl="~/application/BlankFireArmsApplication.aspx" Text="Blank Application"
                                ToolTip="Blank FireArms License Application" Value="Blank Application"></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/application/firearmsapplication.aspx" Text="FireArms License Application "
                            Value="FireArms License Application "></asp:MenuItem>                            
                                                                           

                        <asp:MenuItem NavigateUrl="~/application/FirstTimeLicensePrint.aspx" Text="First Time License" ToolTip="First Time License"
                            Value="First Time License">
                          </asp:MenuItem>                                   
                            <asp:MenuItem NavigateUrl="~/application/RenewalLicensePrint.aspx" Text="Renewal License"
                                ToolTip="Renewal License" Value="Renewal License">
                           </asp:MenuItem>
                 
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/APPLICATION/LicenseWaiver.aspx" Text="Mental Health Waiver" Value="Mental Health Waiver">
                        </asp:MenuItem>
                        <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/letter/LawEnforcement.aspx" Text="Law Enforcement Affidavit"
                            Value="Law Enforcement Affidavit"></asp:MenuItem>                     
                        <asp:MenuItem></asp:MenuItem>
                        
                          <asp:MenuItem></asp:MenuItem>
                        <asp:MenuItem NavigateUrl="~/letter/LawOfficerAffidavit.aspx" Text="Law Officer Affidavit"
                            Value="Law Officer Affidavit"></asp:MenuItem>                     
                        <asp:MenuItem></asp:MenuItem>
                        
                                                 <asp:MenuItem NavigateUrl="~/application/PistolCheckList.aspx" Text="Pistol License Check List" ToolTip="Pistol License Check List"
                            Value="Pistol License Check List">
                          </asp:MenuItem> 
                          
                        
                        <asp:MenuItem Text="Print Application Package" ToolTip="Print Application Package"
                            Value="Print Application Package" NavigateUrl="~/application/firearmsapplicationpackage.aspx"></asp:MenuItem>
                    </asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            </asp:Menu>
            &nbsp;&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
            <asp:Label ID="lblLisenseUpdate" runat="server" Font-Bold="True" Font-Names="Georgia"
                Font-Size="Large" ForeColor="Navy" Text="LICENSE PORTAL" Width="184px"></asp:Label>
            <asp:ScriptManager ID="ScriptManager2" runat="server">
            </asp:ScriptManager>
            <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure you want to udpate record?"
                TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            <cc1:ConfirmButtonExtender ID="cnfbuttonextender" runat="server" ConfirmText="By deleting this record you will delete all information about this License, including Arrest and Rehab Information. Do you want to delete record?"
                TargetControlID="btndelete">
            </cc1:ConfirmButtonExtender>
            <cc1:calendarextender id="CalendarExtender2" runat="server" targetcontrolid="txtlicenseissued"></cc1:calendarextender>
            <cc1:calendarextender id="CalendarExtender1" runat="server" targetcontrolid="txtlicensemailed"></cc1:calendarextender>
            
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
            <br />
            <br />
            &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp;
            <asp:Label ID="lblErrorMessage" runat="server" Height="48px" Width="552px" BackColor="Red" BorderStyle="Ridge" Font-Bold="True" ForeColor="White" Visible="False"></asp:Label>
            &nbsp; &nbsp;
            <asp:Label ID="lblUpdateDone" runat="server" BackColor="AliceBlue" BorderStyle="Ridge"
                Font-Bold="True" ForeColor="Navy" Height="56px" Visible="False" Width="480px"></asp:Label>
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
            &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
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
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            <asp:Label ID="lblmember" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Navy"
                Width="182px" style="z-index: 102; left: 272px; position: absolute; top: 224px"></asp:Label>
            &nbsp;<asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="MemberID" Width="99px"></asp:Label><asp:TextBox ID="txtmemberid" runat="server" MaxLength="5"
                Width="40px" ToolTip="Batch#" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black" TabIndex="1"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblrehabid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="LicenseID" Width="99px"></asp:Label>
            <asp:TextBox ID="txtlicenseid" runat="server" MaxLength="20"
                Width="170px" ToolTip="License #" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox>
            <asp:Label ID="lblbatchno" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Batch #" Width="113px"></asp:Label>
            <asp:TextBox ID="txtBatchNumber" runat="server" MaxLength="5"
                Width="61px" ToolTip="Member ID" BackColor="#FFFFC0" ReadOnly="True" ForeColor="Black"></asp:TextBox>&nbsp;<br />
            <br />
            &nbsp;<asp:Label ID="lbllicensetype" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="*LicenseType" Width="99px"></asp:Label>&nbsp;
                <asp:DropDownList ID="ddtype" runat="server"
                    BackColor="White" ToolTip="License Type" Width="96px" CausesValidation="True" Enabled="False" TabIndex="2" AutoPostBack="True">                                                     
                </asp:DropDownList>
            <asp:Label ID="lblTempOption" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Temporary" Width="96px"></asp:Label>&nbsp;<asp:DropDownList
                    ID="ddTempOption" runat="server" Width="56px" Enabled="False" TabIndex="3">                                               
                </asp:DropDownList>
                
                &nbsp; <asp:Label ID="lblstatus" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Status"
                Width="64px"></asp:Label>
            <asp:TextBox ID="txtstatus" runat="server" MaxLength="20"
                Width="144px" ToolTip="Status" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
            <asp:Label ID="lblHold" runat="server" BackColor="SteelBlue" BorderColor="White"
                Font-Bold="True" ForeColor="White" Text="Holding" Width="56px"></asp:Label><asp:CheckBox
                    ID="chHld" runat="server" Enabled="False" Font-Bold="True" ForeColor="Black"
                    Width="80px" BackColor="Transparent" /><br />
            &nbsp;<br />
            <asp:Label ID="lblapplied" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Applied" Width="99px"></asp:Label>
            <asp:TextBox ID="txtapplied" runat="server" MaxLength="10"
                Width="72px" ToolTip="Date Applied for License" ReadOnly="True" BackColor="#FFFFC0" ForeColor="Black"></asp:TextBox>
            <asp:Label ID="lblstatemailed" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailed to State" Width="114px"></asp:Label>
            <asp:TextBox ID="txtstatemailed" runat="server" MaxLength="10"
                Width="72px" ToolTip="Date Mailed To State" ReadOnly="True" BackColor="#FFFFC0"></asp:TextBox>
            &nbsp; 
            <asp:Label ID="lblStateReturned" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Returned From State" Width="152px"></asp:Label>
            <asp:TextBox ID="txtReturnedfromState" runat="server" Width="80px" MaxLength="10" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
            &nbsp;&nbsp;<br />
            <br />
            <asp:Label ID="lbllicenseissued" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="License Issued" Width="112px"></asp:Label>
            <asp:TextBox ID="txtlicenseissued" runat="server" Width="104px" BackColor="White" MaxLength="10" TabIndex="4"></asp:TextBox>
            &nbsp;<asp:Label ID="lbllicensexpiration" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="License Expiration" Width="143px"></asp:Label>
            <asp:TextBox ID="txtlicenseexpiration" runat="server" MaxLength="10" Width="71px" ToolTip="Date License Expired" Enabled="False" BackColor="#FFFFC0" ForeColor="Black" ReadOnly="True"></asp:TextBox>&nbsp;
            <asp:Label ID="lbllicensemailed" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Mailed to Licensee" Width="134px"></asp:Label>
            <asp:TextBox ID="txtlicensemailed" runat="server" MaxLength="10"
                TabIndex="5" Width="96px" ToolTip="Date License Mailed To Customer" BackColor="White"></asp:TextBox>&nbsp;<br />
            <br />
            &nbsp;<asp:Label ID="lblcomments" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Comments" Width="120px"></asp:Label>
            &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp;
            &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
            <asp:TextBox ID="txtcomments" runat="server" Height="184px" TextMode="MultiLine"
                Width="640px" TabIndex="6"></asp:TextBox><br />
            <br />
            <asp:Label ID="lblOperator" runat="server" BackColor="SteelBlue" Font-Bold="True"
                ForeColor="White" Text="Updated By:" Width="88px"></asp:Label>
            <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
                ForeColor="Black" ReadOnly="True" TabIndex="7"></asp:TextBox><br />
            <br />
            <asp:Label ID="lbllicensefee" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="License Fee" Width="95px" Visible="False"></asp:Label>
            <asp:TextBox ID="txtlicensefee" runat="server" MaxLength="10"
                Width="97px" Enabled="False" ToolTip="License Fee Paid" BackColor="#FFFFC0" Visible="False"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lbllicensepaid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="License Paid" Width="95px" Visible="False"></asp:Label>
            <asp:TextBox ID="txtlicensepaid" runat="server" MaxLength="10"
                Width="97px" Enabled="False" ToolTip="Total Money Paid to Date" BackColor="#FFFFC0" Visible="False"></asp:TextBox>
            &nbsp;
            <asp:Label ID="lblbalance" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
                BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
                Text="Balance" Width="95px" Visible="False"></asp:Label>
            <asp:TextBox ID="txtbalance" runat="server" MaxLength="10"
                Width="97px" Enabled="False" ToolTip="Balance Remaining " BackColor="#FFFFC0" Visible="False"></asp:TextBox>&nbsp;
            &nbsp;<br />
            <hr />
            &nbsp; &nbsp;<asp:Button ID="btnupdate" runat="server" EnableViewState="False" TabIndex="8" Text="Update License"
                ToolTip="Update License Record" Width="112px" Font-Bold="True" ForeColor="Navy" />
            &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete License"
                ToolTip="Delete License" Width="112px" Font-Bold="True" ForeColor="Navy" TabIndex="-1" />
            &nbsp;&nbsp;<asp:Button
                    ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy" Text="Clear"
                    ToolTip="Clear all changes" Width="56px" TabIndex="-1" />
            &nbsp;
            <asp:Button ID="btnsearch" runat="server"
                    Font-Bold="True" ForeColor="Navy" PostBackUrl="~/grid/PistolLicenseList.aspx" Text="Pistol License List"
                    ToolTip="Go Back To Pistol License List" Width="128px" TabIndex="-1" />&nbsp;<asp:Button ID="btnMemberPortal" runat="server" Font-Bold="True" ForeColor="Navy"
                PostBackUrl="~/MEMBER/Console.aspx" Text="Member Portal" ToolTip="Return To Member Portal"
                Width="104px" TabIndex="-1" />
            &nbsp;<asp:Button ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
                ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
                Width="88px" TabIndex="-1" />&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
            <br />
        </div>
    
    </div>
    </form>
</body>
</html>
