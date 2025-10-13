<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddMember.aspx.vb" Inherits="AddMember" %>

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
    <form id="form1" runat="server" defaultfocus="txtfirstname">
    
    <div style="color: #336699; background-color: background;">
        <span style="vertical-align: super; text-transform: uppercase;">
            <strong>
            </strong></span>
        <asp:Label ID="Label1" runat="server" BackColor="Desktop" Font-Bold="True" Font-Italic="False"
            Font-Names="Georgia" Font-Overline="True" Font-Size="Medium" Font-Underline="True"
            ForeColor="White" Height="24px" Text="Add New Member " Width="168px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp;

         <asp:ScriptManager ID="ScriptManager1" runat="server">          
        </asp:ScriptManager>         
       
   
        &nbsp;<asp:Label ID="lblErrorMessage" runat="server" BackColor="Red" BorderStyle="Ridge"
            Font-Bold="True" ForeColor="White" Height="56px" Visible="False" Width="648px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        <hr />
        <asp:Label ID="lblfirstname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*FirstName" Width="176px"></asp:Label>&nbsp;&nbsp;
        <asp:Label ID="lblmiddle" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="MiddleName"
            Width="96px"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lbllastname" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*LastName" Width="288px"></asp:Label><br />
        <asp:TextBox ID="txtfirstname" runat="server" MaxLength="20" BorderStyle="Solid" Width="168px" ToolTip="First Name" TabIndex="1"></asp:TextBox>&nbsp;&nbsp;
        
        
        &nbsp;<asp:TextBox ID="txtmiddle" runat="server" Width="88px" MaxLength="20" ToolTip="Middle Name" TabIndex="2"></asp:TextBox>&nbsp; &nbsp;<asp:TextBox ID="txtlastname" runat="server" Width="280px" MaxLength="20" ToolTip="Last Name" TabIndex="3"></asp:TextBox>&nbsp;<br />
        <asp:RequiredFieldValidator ID="fNameValidator" runat="server" ErrorMessage="Please Enter First Name"
            Font-Bold="True" ForeColor="White" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; \<asp:RequiredFieldValidator ID="LNameValidator" runat="server" ErrorMessage="Please Enter Last Name"
            Font-Bold="True" ForeColor="White" ControlToValidate="txtlastname"></asp:RequiredFieldValidator><br />
        <asp:Label ID="lblAddress" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Address" Width="232px"></asp:Label>&nbsp;
        <asp:Label ID="lblcity" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*City"
            Width="128px"></asp:Label>&nbsp; &nbsp;<asp:Label ID="lblstate" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="State"
            Width="56px"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblzipcode" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*ZipCode" Width="72px"></asp:Label>&nbsp;<asp:Label ID="lblcounty" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="County"
            Width="64px"></asp:Label><br />
            
         
        <asp:TextBox ID="txtaddress" runat="server" Width="224px" MaxLength="30" TabIndex="4"></asp:TextBox>&nbsp;&nbsp;
                 
        
        <asp:TextBox
            ID="txtcity" runat="server" Width="128px" ToolTip="City" TabIndex="5"></asp:TextBox>
        
        &nbsp;
               
        <asp:TextBox ID="txtState" runat="server" Width="56px" MaxLength="30" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>&nbsp;
        
        
        <asp:TextBox ID="txtzipcode" runat="server" Width="64px" ToolTip="Zip Code" TabIndex="6"></asp:TextBox>
          
              
               <asp:TextBox ID="txtCounty" runat="server" Width="56px" ToolTip="County" BackColor="#FFFFC0" ReadOnly="True"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="AddressVal" runat="server" ErrorMessage="Please Enter Address"
            Font-Bold="True" ForeColor="White" ControlToValidate="txtaddress"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="CityValid" runat="server" ErrorMessage="Please Enter City"
            Font-Bold="True" ForeColor="White" ControlToValidate="txtcity"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="ZipCodeVal" runat="server" ErrorMessage="Please Enter Zip Code"
            Font-Bold="True" ForeColor="White" ControlToValidate="txtzipcode"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <asp:Label ID="lblphone" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Phone(xxxxxxxxxx)"
            Width="160px"></asp:Label>&nbsp;
        <asp:Label ID="lblcellphone" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="Cell Phone(xxxxxxxxxx)" Width="184px"></asp:Label>&nbsp;&nbsp;<asp:Label ID="lblemail" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="Email"
            Width="224px"></asp:Label><br />
        <asp:TextBox ID="txtphone" runat="server" Width="152px" MaxLength="10" ToolTip="Phone" TabIndex="7"></asp:TextBox>&nbsp;&nbsp;
        <asp:TextBox
            ID="txtcellphone" runat="server" MaxLength="10" Width="176px" TabIndex="8"></asp:TextBox>&nbsp;
        &nbsp;<asp:TextBox ID="txtemail" runat="server" Width="224px" MaxLength="35" ToolTip="Email" TabIndex="9"></asp:TextBox>&nbsp;
        <br />
        <asp:RequiredFieldValidator ID="PhoneValid" runat="server" ControlToValidate="txtphone"
            ErrorMessage=" Enter Phone" Font-Bold="True" ForeColor="White" Font-Size="Smaller"></asp:RequiredFieldValidator>&nbsp;&nbsp;<asp:RegularExpressionValidator
                ID="PhoneValidat" runat="server" ControlToValidate="txtphone" ErrorMessage="Wrong Phone Format"
                Font-Bold="True" Font-Size="Smaller" ForeColor="White" ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator>
        &nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator ID="ValidateCellPhone" runat="server" ControlToValidate="txtcellphone"
            ErrorMessage="Enter Cell Phone" Font-Bold="True" ForeColor="White" Font-Size="Smaller" Enabled="False"></asp:RequiredFieldValidator>
        &nbsp; &nbsp;
        <asp:RegularExpressionValidator ID="CellPhoneVal" runat="server" ControlToValidate="txtcellphone"
            ErrorMessage="Wrong Cell Format" Font-Bold="True" Font-Size="Smaller" ForeColor="White"
            ValidationExpression="^[0-9]{10}"></asp:RegularExpressionValidator><br />
        &nbsp;<br />
        <asp:Label ID="lblExempt" runat="server" BackColor="LightSteelBlue"
            Font-Bold="True" ForeColor="Black" Text="Exempt" Width="64px"></asp:Label>
        &nbsp; &nbsp;&nbsp; &nbsp;<asp:Label ID="lblAgencyName" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Agency Name" Width="280px"></asp:Label><br />
        <asp:DropDownList ID="ddExempt" runat="server" Width="64px" TabIndex="10">  
        <asp:ListItem></asp:ListItem>     
                <asp:ListItem Value="Yes">Yes</asp:ListItem>
                <asp:ListItem Value="No">No</asp:ListItem>        
        </asp:DropDownList>&nbsp;&nbsp; &nbsp; &nbsp;
        <asp:TextBox ID="txtAgencyName" runat="server" Width="274px" TabIndex="11"></asp:TextBox>&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
        <br />
        &nbsp;<asp:Label ID="Label2" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
            Text="*Place of Birth" Width="224px"></asp:Label>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <asp:Label ID="lbldob" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*DOB(mmddyyyy)"
            Width="152px"></asp:Label>&nbsp;
        <br />
        <asp:DropDownList ID="ddcityofbirth" runat="server" MaxLength="50" Width="232px" TabIndex="12"></asp:DropDownList>
        &nbsp;&nbsp;&nbsp; &nbsp;<asp:TextBox ID="txtPlaceBirth" runat="server" Width="232px" Visible="False" TabIndex="13"></asp:TextBox>
        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
        <asp:TextBox ID="txtdateofbirth" runat="server" Width="152px" MaxLength="10" ToolTip="Date of Birth" TabIndex="14"></asp:TextBox><br />
        &nbsp;<asp:RequiredFieldValidator ID="txtCityOfBirhtVal" runat="server" ControlToValidate="txtPlaceBirth"
            ErrorMessage="Please Enter City " Font-Bold="True" ForeColor="White" Enabled="False"></asp:RequiredFieldValidator>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:RequiredFieldValidator ID="DOBVald" runat="server" ControlToValidate="txtdateofbirth"
            ErrorMessage="Please Enter DOB" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp;<asp:Label ID="lblagelimit" runat="server"
                Font-Bold="True" ForeColor="Navy" Width="96px"></asp:Label>
        &nbsp; &nbsp; 
        <br />
        <asp:Button ID="btnAddNewPlace" runat="server" CausesValidation="False"
            Font-Bold="True" ForeColor="Navy" Text="Add New Place" Width="104px" ToolTip="Add New Place Of Birth" TabIndex="-1" />
        &nbsp; &nbsp;<asp:Button ID="btnCancelBirthCity" runat="server"
            CausesValidation="False" Font-Bold="True" ForeColor="Navy" Text="Cancel" Width="104px" TabIndex="-1" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp;&nbsp; 
                <br />

        <asp:Label ID="lblINS" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="INC Allien  Admission Number"
            Width="320px"></asp:Label>&nbsp;&nbsp; &nbsp;
        <asp:Label ID="lblrace" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
            Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Race"
            Width="120px"></asp:Label>
        &nbsp; &nbsp; &nbsp;
        <asp:Label ID="lblSex" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="*Sex" Width="64px"></asp:Label>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:TextBox
                ID="txtINSAdmission" runat="server" Width="312px" MaxLength="20" ToolTip="INS Admission" TabIndex="17"></asp:TextBox>&nbsp;&nbsp;
        &nbsp; &nbsp;<asp:DropDownList ID="ddrace" runat="server" Width="120px" TabIndex="18">
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
        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<asp:DropDownList ID="ddgender" runat="server" Width="64px" TabIndex="19">
        <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="Male">Male</asp:ListItem>
            <asp:ListItem Value="Female">Female</asp:ListItem>
        </asp:DropDownList>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:RequiredFieldValidator
            ID="RaceVal" runat="server" ControlToValidate="ddrace" ErrorMessage="Please Enter Race"
            Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RequiredFieldValidator ID="GenderVal" runat="server" ControlToValidate="ddgender"
            ErrorMessage="Please Enter Gender" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>                            
      
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;


  
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        <asp:Label ID="lblhair" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid"
                    BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black"
                    Text="*Hair" Width="109px"></asp:Label>&nbsp;&nbsp; &nbsp; &nbsp; 
        <asp:Label ID="lbleyes" runat="server" BackColor="LightSteelBlue"
                        BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Georgia" Font-Size="Small"
                        ForeColor="Black" Text="*Eyes" Width="109px"></asp:Label>&nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Label ID="lblheight"
                            runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                            Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Height" Width="56px"></asp:Label>&nbsp;&nbsp;
        &nbsp; &nbsp;<asp:Label
                                ID="lblweight" runat="server" BackColor="LightSteelBlue" BorderStyle="Solid" BorderWidth="1px"
                                Font-Bold="True" Font-Names="Georgia" Font-Size="Small" ForeColor="Black" Text="*Weight "
                                Width="72px"></asp:Label><br />
        <asp:DropDownList ID="ddhair" runat="server" Width="106px" TabIndex="20" ToolTip="Hair">
            <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="Black">Black</asp:ListItem>
                                    <asp:ListItem Value="Brown">Brown</asp:ListItem>
                                    <asp:ListItem Value="Blonde">Blonde</asp:ListItem>
                                    <asp:ListItem Value="Gray">Gray</asp:ListItem>
                                    <asp:ListItem Value="Red">Red</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:DropDownList ID="ddeyes" runat="server" Width="112px" TabIndex="21" ToolTip="Eyes">
            <asp:ListItem></asp:ListItem>
                                    <asp:ListItem Value="Green">Green</asp:ListItem>
                                    <asp:ListItem Value="Blue">Blue</asp:ListItem>
                                    <asp:ListItem Value="Brown">Brown</asp:ListItem>
                                    <asp:ListItem Value="Black">Black</asp:ListItem>
                                    <asp:ListItem Value="Hazal">Hazal</asp:ListItem>
                                    <asp:ListItem Value="Grey">Grey</asp:ListItem>
                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                </asp:DropDownList>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;<asp:TextBox ID="txtheight" runat="server" Width="56px" MaxLength="8" ToolTip="Height" TabIndex="22"></asp:TextBox>&nbsp;&nbsp;
        &nbsp; &nbsp;
        <asp:TextBox
                                    ID="txtweight" runat="server" Width="56px" MaxLength="8" ToolTip="Weight" TabIndex="23"></asp:TextBox>&nbsp;<br />
        <asp:RequiredFieldValidator ID="HairVal" runat="server" ControlToValidate="ddhair"
            ErrorMessage="Please Enter Hear" Font-Bold="True" ForeColor="White" Width="128px"></asp:RequiredFieldValidator>&nbsp;
        <asp:RequiredFieldValidator ID="EyesVal" runat="server" ControlToValidate="ddeyes"
            ErrorMessage="Please Enter Eyes" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp; &nbsp;<asp:RequiredFieldValidator ID="HeighVal" runat="server"
            ControlToValidate="txtheight" ErrorMessage="Please Enter Height" Font-Bold="True"
            ForeColor="White"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RequiredFieldValidator ID="WeightVal" runat="server" ControlToValidate="txtweight"
            ErrorMessage="Please Enter Weight" Font-Bold="True" ForeColor="White"></asp:RequiredFieldValidator><br />
        <br />
        <asp:Label ID="lblComments" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Comments" Width="104px"></asp:Label><br />
        <asp:TextBox ID="txtComments" runat="server" Height="136px" Width="600px" TabIndex="24"></asp:TextBox><br />
        <br />
        <asp:Label ID="lblOperator" runat="server" BackColor="LightSteelBlue" Font-Bold="True"
            ForeColor="Black" Text="Added By:" Width="88px"></asp:Label>
        <asp:TextBox ID="txtOperator" runat="server" BackColor="#FFFFC0" Font-Bold="True"
            ForeColor="Black" ReadOnly="True" TabIndex="25"></asp:TextBox><br />
        <hr />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
        &nbsp; &nbsp; 
        <asp:Button ID="btnnewmember" runat="server" Text="Add New Member" Width="128px" ToolTip="Add New Member To Pistol Database" Font-Bold="True" ForeColor="Navy" TabIndex="26" />
        &nbsp; &nbsp;<asp:Button ID="btbCancel" runat="server" Font-Bold="True" ForeColor="Navy"
            Text="Clear" Width="128px" ToolTip="Clear all entries" CausesValidation="False" TabIndex="-1" />
        &nbsp; &nbsp;<asp:Button ID="btnsearch" runat="server" Text="Search Screen" Width="128px" Font-Bold="True" ForeColor="Navy" PostBackUrl="~/MainSearch.aspx" ToolTip="Search Screen" CausesValidation="False" TabIndex="-1" />&nbsp;&nbsp; &nbsp;
        <asp:Button
            ID="btnHome" runat="server" BackColor="Navy" Font-Bold="True" Font-Underline="True"
            ForeColor="White" PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" ToolTip="Main Menu"
            Width="118px" CausesValidation="False" TabIndex="-1" />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<br />
        <br />
        <br />
    </div>
    </form>
 
</body>
</html>
