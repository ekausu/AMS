<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Databound.aspx.cs" Inherits="AdvanceSystem.Reporting_Grid.Databound" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
		<rsweb:ReportViewer ID="ReportViewer1" runat="server">
			<LocalReport ></LocalReport>
		</rsweb:ReportViewer>
    </form>
</body>
</html>
