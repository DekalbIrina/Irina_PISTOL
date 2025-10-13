<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Console.aspx.vb" Inherits="Console" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dekalb County Pistol License</title>
</head>
<body>
    <form id="form1" defaultfocus="txtfirstname" runat="server">
    <div style="background-color: lightsteelblue">
                    <asp:Menu ID="Menu1" runat="server" BackColor="Desktop" DynamicHorizontalOffset="1"
                        Font-Bold="True" Font-Names="Arial" Font-Size="Small" ForeColor="White"
                        Height="40px" StaticSubMenuIndent="10px" Width="752px" Orientation="Horizontal">
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                        <DynamicMenuStyle BackColor="SteelBlue" />
                        <StaticSelectedStyle BackColor="#507CD1" />
                        <DynamicSelectedStyle BackColor="#507CD1" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <Items>
                            <asp:MenuItem Text="Arrest History" Value="Arrest History">
                                <asp:MenuItem Text="Add Arrest" Value="Add Arrest" NavigateUrl="~/Member/AddArrest.aspx"></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem Text="Search/Update Arrest" Value="Search Arrest" NavigateUrl="~/Grid/ArrestList.aspx"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Rehab History" Value="Rehab History">
                                <asp:MenuItem Text="Add Rehab" Value="Add Rehab" NavigateUrl="~/Member/AddRehab.aspx"></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem Text="Search/Update Rehab" Value="Search Rehab" NavigateUrl="~/Grid/RehabList.aspx"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="Mailing History" Value="Mailing History">
                                <asp:MenuItem Text="Add Mailing Address" Value="Add Mailing Address" NavigateUrl="~/Member/AddMailing.aspx"></asp:MenuItem>
                                <asp:MenuItem></asp:MenuItem>
                                <asp:MenuItem Text="Search/Update Mailing Address" Value="Search Mailing Address" NavigateUrl="~/Grid/MailingList.aspx"></asp:MenuItem>
                            </asp:MenuItem>
                            <asp:MenuItem Text="License " Value="License ">
                                <asp:MenuItem Text="Add License" Value="Add New License" NavigateUrl="~/License/AddLicense.aspx"></asp:MenuItem>
                                
                             
                            </asp:MenuItem>                                       
                        </Items>
                        <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    </asp:Menu>
        <hr />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="lblMemberDetail" runat="server" Font-Bold="True" Font-Names="Georgia"
            Font-Size="Large" ForeColor="Navy" Text="MEMBER PORTAL" Width="192px"></asp:Label><em><span><span style="font-size: 14pt"><strong><span style="font-family: Georgia; text-decoration: underline overline"><br />
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
        
               
                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="All Pistol License for this Member will be Deleted. " TargetControlID="btndelete">
                </cc1:ConfirmButtonExtender>
                <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" ConfirmText="Are you sure you want to update record?" TargetControlID="btnupdate">
            </cc1:ConfirmButtonExtender>
            
        <asp:Label ID="lblFailed" runat="server" BackColor="Red" BorderStyle="Ridge" Font-Bold="True"
            ForeColor="White" Height="48px" Visible="False" Width="568px"></asp:Label><br />
            </span></strong></span></span></em>
            <asp:Label ID="lblUpdateDone" runat="server" BackColor="AliceBlue" BorderStyle="Ridge"
                ForeColor="Navy" Height="30px" Width="568px" Font-Bold="True" Visible="False"></asp:Label><br />
        <asp:Label ID="lblmemberid" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="MemID" Width="48px"></asp:Label>&nbsp; <asp:Label ID="lblfirstname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="*FirstName" Width="168px"></asp:Label>
        &nbsp;&nbsp; 
        <asp:Label ID="lblmiddle" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="MiddleName"
            Width="96px"></asp:Label>&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lbllastname" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="*LastName" Width="256px"></asp:Label><br />
        <asp:TextBox ID="txtmemberid" runat="server" Width="48px" MaxLength="8" ToolTip="Member ID" ReadOnly="True" BackColor="#FFFFC0" Font-Bold="True"></asp:TextBox>
        &nbsp;<asp:TextBox ID="txtfirstname" runat="server" Width="168px" MaxLength="20" ToolTip="First Name" TabIndex="1"></asp:TextBox>&nbsp;&nbsp;
        &nbsp;<asp:TextBox ID="txtmiddle" runat="server" Width="96px" MaxLength="20" ToolTip="Middle Name" TabIndex="2"></asp:TextBox>
        &nbsp; <asp:TextBox ID="txtlastname" runat="server" Width="256px" MaxLength="20" ToolTip="Last Name" TabIndex="3"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="fNameValidator" runat="server" ControlToValidate="txtfirstname"
            ErrorMessage="Please Enter First Name" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="LNameValidator" runat="server" ControlToValidate="txtlastname"
            ErrorMessage="Please Enter Last Name" Font-Bold="True"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblAddress" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="*Address" Width="224px"></asp:Label>
        &nbsp;&nbsp;<asp:Label ID="lblcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*City"
            Width="133px"></asp:Label>&nbsp;
        <asp:Label ID="lblstate" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="State"
            Width="56px"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblzipcode" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="*ZipCode" Width="86px"></asp:Label>
        <asp:Label ID="lblcounty" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="County"
            Width="88px"></asp:Label><br />
        <asp:TextBox ID="txtaddress" runat="server" Width="224px" MaxLength="30" ToolTip="Address" TabIndex="4"></asp:TextBox>&nbsp;
        
        <asp:TextBox
            ID="txtcity" runat="server" Width="128px" TabIndex="5"></asp:TextBox>&nbsp; <asp:TextBox ID="txtstate" runat="server" Width="56px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
        
        <asp:TextBox ID="txtzip" runat="server" Width="80px" TabIndex="6"></asp:TextBox>
        
        <asp:TextBox ID="txtcounty" runat="server" Width="88px" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="AddressVal" runat="server" ControlToValidate="txtaddress"
            ErrorMessage="Please Enter Address" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="CityValid" runat="server" ControlToValidate="txtcity"
            ErrorMessage="Please Enter City" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="ZipCodeVal" runat="server" ControlToValidate="txtzip"
            ErrorMessage="Please Enter Zip Code" Font-Bold="True"></asp:RequiredFieldValidator><br />
        
        <asp:Label ID="lblphone" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Phone(xxxxxxxxxx)"
            Width="160px"></asp:Label>&nbsp;
        <asp:Label ID="lblcellphone" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="Cell Phone(xxxxxxxxxx)" Width="184px"></asp:Label>&nbsp;
        <asp:Label ID="lblemail" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="Email"
            Width="272px"></asp:Label><br />
        <asp:TextBox ID="txtphone" runat="server" Width="152px" MaxLength="10" ToolTip="Phone" TabIndex="7"></asp:TextBox>&nbsp;
        <asp:TextBox ID="txtcellphone" runat="server" Width="184px" MaxLength="10" ToolTip="Cell Phone" TabIndex="8"></asp:TextBox>&nbsp;
        <asp:TextBox ID="txtemail" runat="server" Width="272px" MaxLength="30" ToolTip="Email" TabIndex="9"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="PhoneValid" runat="server" ControlToValidate="txtphone"
            ErrorMessage=" Enter Phone" Font-Bold="True" Font-Size="Smaller"></asp:RequiredFieldValidator>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="ValidateCellPhone" runat="server" ControlToValidate="txtcellphone"
            ErrorMessage=" Enter Cell Phone" Font-Bold="True" Font-Size="Smaller" Enabled="False"></asp:RequiredFieldValidator><br />
        <asp:RegularExpressionValidator ID="ValidPhone" runat="server" ControlToValidate="txtphone"
            ErrorMessage="Wrong Phone Format" Font-Bold="True" Font-Size="Smaller" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="CellPhoneVal" runat="server" ControlToValidate="txtcellphone"
            ErrorMessage="Wrong Cell Format" Font-Bold="True" Font-Size="Smaller" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator><br />
        <asp:Label ID="lblbirthcity" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White"
            Text="*Place of Birth" Width="232px"></asp:Label>&nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <asp:Label ID="lbldob" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*DOB(mmddyyyy)"
            Width="144px"></asp:Label>&nbsp;&nbsp; &nbsp;<br />
        <asp:DropDownList ID="ddcityofbirth" runat="server" TabIndex="10" Width="232px"></asp:DropDownList>
        &nbsp;<asp:TextBox ID="txtPlaceBirth" runat="server" TabIndex="11" Width="232px" Visible="False"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
        <asp:TextBox ID="txtdateofbirth" runat="server" Width="144px" MaxLength="10" ToolTip="Date of Birth" TabIndex="12"></asp:TextBox>&nbsp;
        &nbsp; &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="txtCityOfBirhtVal" runat="server" ControlToValidate="txtPlaceBirth"
            ErrorMessage="Please Enter City" Font-Bold="True" Enabled="False"></asp:RequiredFieldValidator>
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="DOBVald" runat="server" ControlToValidate="txtdateofbirth"
            ErrorMessage="Please Enter DOB" Font-Bold="True"></asp:RequiredFieldValidator>
        <asp:Label ID="lblagelimit" runat="server"
                Font-Bold="True" ForeColor="Navy" Width="152px"></asp:Label><br />
        <asp:Button ID="btnAddNewPlace" runat="server" CausesValidation="False" Font-Bold="True"
            ForeColor="Navy" Text="Add New Place" ToolTip="Add New Place Of Birth" Width="104px" />
        &nbsp;
        <asp:Button ID="btnCancelBirthCity" runat="server" CausesValidation="False" Font-Bold="True"
            ForeColor="Navy" Text="Cancel" Width="104px" /><br />
        <br />
        <asp:Label ID="lblExempt" runat="server" BackColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" ForeColor="White" Text="Exempt" Width="48px"></asp:Label>
        &nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblAgencyName" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Agency Name" Width="274px"></asp:Label><br />
        <asp:DropDownList ID="ddExempt" runat="server" Width="56px" TabIndex="13">
                   <asp:ListItem ></asp:ListItem>
                  <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem> 
        </asp:DropDownList>
        &nbsp; &nbsp;<asp:TextBox ID="txtAgencyName" runat="server" TabIndex="14" Width="274px"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblINS" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="INC Allien  Admission Number"
            Width="224px"></asp:Label>
        &nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lblrace" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Race"
            Width="158px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblsex" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Sex"
            Width="98px"></asp:Label><br />
        <asp:TextBox ID="txtINSAdmission" runat="server" Width="224px" MaxLength="20" ToolTip="INS Admission" TabIndex="15"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddrace" runat="server" ToolTip="Race" Width="160px" TabIndex="16">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Hispanic</asp:ListItem>
            <asp:ListItem>Caucasian</asp:ListItem>
            <asp:ListItem>African American</asp:ListItem>
            <asp:ListItem>Asian</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
            <asp:ListItem>Multi-Racial</asp:ListItem>
            <asp:ListItem>Pacific Islander</asp:ListItem>
            <asp:ListItem>Native American</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList
            ID="ddsex" runat="server" ToolTip="Sex" Width="101px" TabIndex="17">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:DropDownList><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RaceVal" runat="server" ControlToValidate="ddrace"
            ErrorMessage="Please Enter Race" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="GenderVal" runat="server" ControlToValidate="ddsex"
            ErrorMessage="Please Enter Gender" Font-Bold="True"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblhair" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Hair"
            Width="109px"></asp:Label>&nbsp;&nbsp; &nbsp;
        <asp:Label ID="lbleyes" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Eyes"
            Width="109px"></asp:Label>
        &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="lblheight" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Height"
            Width="104px"></asp:Label>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Label ID="lblweight" runat="server" BackColor="SteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="White" Text="*Weight"
            Width="109px"></asp:Label>&nbsp;
        <br />
        <asp:DropDownList ID="ddhair" runat="server" ToolTip="Hair" Width="110px" TabIndex="18">
             <asp:ListItem></asp:ListItem>
            <asp:ListItem>Black</asp:ListItem>
            <asp:ListItem>Brown</asp:ListItem>
            <asp:ListItem>Blonde</asp:ListItem>
            <asp:ListItem>Gray</asp:ListItem>
             <asp:ListItem>Red</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>       
        </asp:DropDownList>
        &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<asp:DropDownList ID="ddeyes" runat="server" ToolTip="Eyes" Width="110px" TabIndex="19">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Green</asp:ListItem>
            <asp:ListItem>Blue</asp:ListItem>
            <asp:ListItem>Brown</asp:ListItem>
            <asp:ListItem>Black</asp:ListItem>
            <asp:ListItem>Hazal</asp:ListItem>
            <asp:ListItem>Grey</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>&nbsp;&nbsp; &nbsp; &nbsp;<asp:TextBox ID="txtheight" runat="server" Width="104px" MaxLength="10" ToolTip="Height" TabIndex="20"></asp:TextBox>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="txtweight" runat="server" Width="107px" MaxLength="10" ToolTip="Weight" TabIndex="21"></asp:TextBox>&nbsp;<br />
        <asp:RequiredFieldValidator ID="HairVal" runat="server" ControlToValidate="ddhair"
            ErrorMessage="Please Enter Hear" Font-Bold="True" Width="128px"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="EyesVal" runat="server" ControlToValidate="ddeyes"
            ErrorMessage="Please Enter Eyes" Font-Bold="True"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="HeighVal" runat="server" ControlToValidate="txtheight"
            ErrorMessage="Please Enter Height" Font-Bold="True"></asp:RequiredFieldValidator>&nbsp;
        <asp:RequiredFieldValidator ID="WeightVal" runat="server" ControlToValidate="txtweight"
            ErrorMessage="Please Enter Weight" Font-Bold="True"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblComments" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Comments" Width="104px"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="144px" Width="672px" TextMode="MultiLine" TabIndex="22"></asp:TextBox><br />
        &nbsp;<asp:Label ID="lblOperator" runat="server" BackColor="SteelBlue" Font-Bold="True"
            ForeColor="White" Text="Last Updated By:" Width="128px"></asp:Label>
        <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" ReadOnly="True" TabIndex="23"></asp:TextBox>&nbsp;<br />
            <br />
        <asp:Button ID="btnupdate" runat="server" Text="Update Record" ToolTip="Update"
            Width="128px" Font-Bold="True" ForeColor="Navy" TabIndex="24" />
        &nbsp;<asp:Button ID="btndelete" runat="server" Text="Delete Record"
            ToolTip="Delete Record" Width="104px" BackColor="White" Font-Bold="True" ForeColor="Navy" CausesValidation="False" TabIndex="-1" />
        <asp:Button ID="btnCancel" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="64px" CausesValidation="False" TabIndex="-1" />
        &nbsp;<asp:Button ID="btnAllLicenseHistory" runat="server" Font-Bold="True"
            ForeColor="Navy" Text="Pistol License List" Width="144px" PostBackUrl="~/GRID/PistolLicenseList.aspx" CausesValidation="False" TabIndex="-1" />
        <asp:Button ID="btnsearch" runat="server" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MainSearch.aspx"
            Text="Search Screen" ToolTip="Search Screen" Width="107px" CausesValidation="False" TabIndex="-1" />&nbsp;
        <asp:Button ID="btnHome"
                runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True" ForeColor="White"
                PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu" Width="104px" CausesValidation="False" TabIndex="-1" />
        <hr />
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
