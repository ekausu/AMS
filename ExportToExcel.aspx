<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ExportToExcel.aspx.cs" Inherits="AdvanceSystem.ExportToExcel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			   <asp:GridView ID="GridView1" Visible="true" OnDataBound="GridView1_DataBound" HeaderStyle-BackColor="#3AC0F2" HeaderStyle-ForeColor="White"
        RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
        runat="server">
    </asp:GridView>
			 <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick ="btnExport_Click" />
        </div>
    </form>
</body>
</html>
