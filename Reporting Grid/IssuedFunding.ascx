<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IssuedFunding.ascx.cs" Inherits="AdvanceSystem.Reporting_Grid.IssuedFunding" %>
<%--<input id="myInput" onkeyup="myFunction()" type="text" />--%>
<%--<script src="../js/jquery.js"></script>--%>
<%--<input type="text" id="FilterTextBox" name="FilterTextBox" onkeyup="filter(this, 'GridViewTotalIssued', 0)"/>--%>

<asp:GridView ID="GridViewTotalIssued" AllowSorting="true" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server" Width="1187px">
</asp:GridView>
<asp:GridView ID="GridViewExtraData" Visible="true" CssClass="table table-striped jambo_table bulk_action" runat="server" Width="1184px">
</asp:GridView>
<script type="text/javascript" charset="utf-8">
	function filter(term, _id, cellNr) {
        var suche = term.value.toLowerCase();
        var table = document.getElementById(_id);
        var ele;
        for (var r = 1; r < table.rows.length; r++) {
            ele = table.rows[r].cells[cellNr].innerHTML.replace(/<[^>]+>/g, "");
            if (ele.toLowerCase().indexOf(suche) >= 0)
                table.rows[r].style.display = '';
            else table.rows[r].style.display = 'none';
        }
    }
</script>
