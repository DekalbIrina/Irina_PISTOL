<%@ Page Language="VB" AutoEventWireup="false" CodeFile="location.aspx.vb" Inherits="Proofofdeceased" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span><span><span style="color: darkblue"><span style="text-decoration: underline"><span style="font-size: 16pt"></span>
        </span>
        </span>
        </span></span><strong><span style="font-size: 16pt; color: white; text-decoration: underline; background-color: #003399;">
            Location<br />
        </span></strong>
        <asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="#C00000" Width="409px"></asp:Label><br />
        <table style="border-left-color: #000099; border-bottom-color: #000099; border-top-style: solid; border-top-color: #000099; border-right-style: solid; border-left-style: solid; height: 354px; background-color: background; border-right-color: #000099; border-bottom-style: solid; text-align: center;">
            <tr>
                <td style="width: 390px; height: 18px; text-align: left;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        CaptionAlign="Left" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="Small"
                        ForeColor="#333333" GridLines="None" Height="1px" Width="374px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderImageUrl="~/Images/TXT.BMP" />
                            <asp:CommandField ShowSelectButton="True" HeaderImageUrl="~/Images/PROP.BMP" />
                            <asp:CommandField ShowDeleteButton="True" HeaderImageUrl="~/Images/DELETE.BMP" />
                        </Columns>
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <EditRowStyle BackColor="#999999" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    &nbsp; &nbsp; &nbsp;
                </td>
                <td style="width: 390px; height: 18px; background-color: gainsboro; text-align: left">
                    <asp:Label ID="lblcity" runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White"
                        Text="City" Width="65px"></asp:Label>
                    <asp:TextBox ID="txtcity" runat="server" MaxLength="30" ToolTip="Enter City" Width="248px"></asp:TextBox>
                    <asp:Label ID="lblstate" runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White"
                        Text="State" Width="65px"></asp:Label>
                    <asp:TextBox ID="txtstate" runat="server" MaxLength="30" ToolTip="Enter State" Width="248px"></asp:TextBox>
                    <asp:Label ID="lblcounty" runat="server" BackColor="SteelBlue" Font-Bold="True" ForeColor="White"
                        Text="County" Width="65px"></asp:Label>
                    <asp:TextBox ID="txtCounty" runat="server" MaxLength="30" ToolTip="Enter County"
                        Width="248px"></asp:TextBox>
                    <asp:Label ID="lblZipCode" runat="server" BackColor="SteelBlue" Font-Bold="True"
                        ForeColor="White" Text="Zip Code" Width="65px"></asp:Label>
                    <asp:TextBox ID="txtzipcode" runat="server" MaxLength="5" ToolTip="Enter County"
                        Width="77px"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="btnaddcategory" runat="server" Text="Add Category" ToolTip="Add Category" />
                    <asp:Button
                        ID="btnHome" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" Width="118px" ToolTip="Main Menu" BackColor="Navy" /></td>
            </tr>
        </table>
        &nbsp; &nbsp;&nbsp;
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnpistol %>"
            SelectCommand="SELECT [ID], [City], [State], [County], [ZipCode] FROM [Location] ORDER BY [State]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Location] WHERE [ID] = @original_ID AND [City] = @original_City AND [State] = @original_State AND [County] = @original_County AND [ZipCode] = @original_ZipCode" InsertCommand="INSERT INTO [Location] ([City], [State], [County], [ZipCode]) VALUES (@City, @State, @County, @ZipCode)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Location] SET [City] = @City, [State] = @State, [County] = @County, [ZipCode] = @ZipCode WHERE [ID] = @original_ID AND [City] = @original_City AND [State] = @original_State AND [County] = @original_County AND [ZipCode] = @original_ZipCode" ProviderName="<%$ ConnectionStrings:cnpistol.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_County" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_City" Type="String" />
                <asp:Parameter Name="original_State" Type="String" />
                <asp:Parameter Name="original_County" Type="String" />
                <asp:Parameter Name="original_ZipCode" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="County" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
