<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewImage.aspx.vb" Inherits="Image" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>DeKalb County FIREARMS LICENSE APPLICATION</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightsteelblue">
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <asp:Button ID="btnHome" runat="server" Font-Bold="True" Font-Underline="True" ForeColor="#0000C0"
            PostBackUrl="~/Console.aspx" Text="Member Portal" ToolTip="Member Portal" Width="119px" />
        <asp:TextBox ID="txtmemberid" runat="server" Visible="False"></asp:TextBox><br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PictureID" DataSourceID="SqlDataSource1"
            Font-Size="Small" ForeColor="#333333" GridLines="None" Width="651px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="PictureID" HeaderText="PictureID" InsertVisible="False"
                    ReadOnly="True" SortExpression="PictureID" />
                <asp:BoundField DataField="MemberID" HeaderText="MemberID" SortExpression="MemberID" />
                <asp:BoundField DataField="PicturePath" HeaderText="PicturePath" SortExpression="PicturePath" />
                <asp:BoundField DataField="PictureDescription" HeaderText="PictureDescription" SortExpression="PictureDescription" />
                <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/Images/PREVIEW.BMP" />
                <asp:CommandField ButtonType="Image" ShowDeleteButton="True" DeleteImageUrl="~/Images/DELETE.BMP" />
            </Columns>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        &nbsp;
        &nbsp;&nbsp;
        <asp:Label ID="lblerror" runat="server" ForeColor="Red" Width="212px"></asp:Label>
        <asp:TextBox ID="txtfilename" runat="server" Width="300px" Visible="False"></asp:TextBox><br />
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:Image ID="Image1" runat="server" BorderColor="Black" BorderStyle="Solid" Height="303px"
            Width="281px" BorderWidth="2px" style="position: static" /><br />
        &nbsp;<br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnpistol %>"
            SelectCommand="SELECT [PictureID], [MemberID], [PicturePath], [PictureDescription] FROM [MemberImages] WHERE ([MemberID] = @MemberID)" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [MemberImages] WHERE [PictureID] = @original_PictureID AND [MemberID] = @original_MemberID AND [PicturePath] = @original_PicturePath AND [PictureDescription] = @original_PictureDescription" InsertCommand="INSERT INTO [MemberImages] ([MemberID], [PicturePath], [PictureDescription]) VALUES (@MemberID, @PicturePath, @PictureDescription)" UpdateCommand="UPDATE [MemberImages] SET [MemberID] = @MemberID, [PicturePath] = @PicturePath, [PictureDescription] = @PictureDescription WHERE [PictureID] = @original_PictureID AND [MemberID] = @original_MemberID AND [PicturePath] = @original_PicturePath AND [PictureDescription] = @original_PictureDescription">
            <DeleteParameters>
                <asp:Parameter Name="original_PictureID" Type="Int32" />
                <asp:Parameter Name="original_MemberID" Type="Int32" />
                <asp:Parameter Name="original_PicturePath" Type="String" />
                <asp:Parameter Name="original_PictureDescription" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="MemberID" Type="Int32" />
                <asp:Parameter Name="PicturePath" Type="String" />
                <asp:Parameter Name="PictureDescription" Type="String" />
                <asp:Parameter Name="original_PictureID" Type="Int32" />
                <asp:Parameter Name="original_MemberID" Type="Int32" />
                <asp:Parameter Name="original_PicturePath" Type="String" />
                <asp:Parameter Name="original_PictureDescription" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="MemberID" Type="Int32" />
                <asp:Parameter Name="PicturePath" Type="String" />
                <asp:Parameter Name="PictureDescription" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="MemberID" SessionField="memberid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
