<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Funded.ascx.cs" Inherits="AdvanceSystem.Reporting_Grid.Funded" %>

<h2 style="text-align:left;color:black">TOTAL AMOUNT: K<asp:Label ForeColor="Black" ID="lblTotal" runat="server" Text="0"></asp:Label>
	<%-- [Funded: K<asp:Label ForeColor="Black" ID="lblFunded" runat="server" Text="0"></asp:Label>]
	 [Balance: K<asp:Label ForeColor="Black" ID="lblBalance" runat="server" Text="0"></asp:Label>]--%>
</h2>
<asp:GridView ID="GridViewFunded" OnDataBound="GridViewFunded_DataBound" OnRowDataBound="GridViewFunded_RowDataBound" AllowSorting="true" CssClass="table table-striped jambo_table bulk_action" runat="server" Width="1187px">
<Columns>
	     <asp:TemplateField HeaderText="" Visible="false" >
                <ItemTemplate>
                <asp:Label ID="TxtTotal" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>  
	 <%--  <asp:TemplateField HeaderText="" Visible="false" >
                <ItemTemplate>
                <asp:Label ID="TxtFunded" runat="server" Text='<%# Eval("Funded") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>  
	   <asp:TemplateField HeaderText="" Visible="false" >
                <ItemTemplate>
                <asp:Label ID="TxtBalance" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>  --%>
</Columns>
</asp:GridView>
