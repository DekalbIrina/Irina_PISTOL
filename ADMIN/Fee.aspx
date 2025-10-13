<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Fee.aspx.vb" Inherits="Proofofdeceased" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <span><span><span><span style="text-decoration: underline"><span style="background-color: #003399">
            <span style="color: white"><strong>
            <span style="font-size: 16pt">License Fees<asp:ScriptManager ID="ScriptManager1"
                runat="server">
            </asp:ScriptManager>
            </span></strong><br />
            </span></span>
        </span>
        </span>
        </span></span>
        <asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="#C00000" Width="409px"></asp:Label><br />
        <table style="border-left-color: #000099; border-bottom-color: #000099; border-top-style: solid; border-top-color: #000099; border-right-style: solid; border-left-style: solid; height: 354px; background-color: background; border-right-color: #000099; border-bottom-style: solid; text-align: center;">
            <tr>
                <td style="width: 396px; height: 318px;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        CaptionAlign="Left" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="Small"
                        ForeColor="#333333" GridLines="None" Height="1px" Width="307px">
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
                </td>
                <td style="width: 346px; height: 318px; background-color: lightgrey">
                    &nbsp;<asp:Label ID="lblfee" runat="server" BackColor="SteelBlue" Font-Bold="True"
                        ForeColor="White" Text="License Fee" ToolTip="License Fee" Width="113px"></asp:Label>&nbsp;
                    <asp:TextBox ID="txtcategory" runat="server" Width="201px" ToolTip="Enter Fee"></asp:TextBox>&nbsp;<br />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                    <asp:Button ID="btnaddcategory" runat="server" Text="Add Category" ToolTip="Add Category" />
                    &nbsp;
                    &nbsp;<asp:Button
                        ID="btnHome" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="White"
                        PostBackUrl="~/PistolLicense.aspx" Text="Main Menu" Width="118px" ToolTip="Main Menu" BackColor="Navy" /></td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnpistol %>"
            SelectCommand="SELECT [ID], [FeeAmount] FROM [Fee] ORDER BY [FeeAmount]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Fee] WHERE [ID] = @original_ID AND [FeeAmount] = @original_FeeAmount" InsertCommand="INSERT INTO [Fee] ([FeeAmount]) VALUES (@FeeAmount)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Fee] SET [FeeAmount] = @FeeAmount WHERE [ID] = @original_ID AND [FeeAmount] = @original_FeeAmount" ProviderName="<%$ ConnectionStrings:cnpistol.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_FeeAmount" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FeeAmount" Type="Decimal" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_FeeAmount" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="FeeAmount" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        &nbsp;</div>
    </form>
</body>
</html>
