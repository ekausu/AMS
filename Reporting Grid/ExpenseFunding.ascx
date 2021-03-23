<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExpenseFunding.ascx.cs" Inherits="AdvanceSystem.Reporting_Grid.ExpenseFunding" %>
<asp:GridView ID="GridView1" OnDataBound="GridView1_DataBound" AutoGenerateColumns="false" runat="server">
    <Columns>
        <asp:BoundField DataField="Period" HeaderText="Period (Year)" />
        <asp:BoundField DataField="Month" HeaderText="Month" />
        <asp:BoundField DataField="Date" HeaderText="Date" />
        <asp:BoundField DataField="Total" HeaderText="Total Funded (K)" />
        <asp:BoundField DataField="Section" HeaderText="Section" />
        <asp:BoundField DataField="Station" HeaderText="Station" />
        <asp:BoundField DataField="Amount" HeaderText="Station Funding (K)" />
        <asp:BoundField DataField="Description" HeaderText="Description" />
         <asp:BoundField DataField="Expr3" HeaderText="Used" />
       <asp:BoundField DataField="Expense" HeaderText="Expense" />
         <asp:BoundField DataField="Balance" HeaderText="Balance" />
    </Columns>
</asp:GridView>

