<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CashPayments.ascx.cs" Inherits="AdvanceSystem.RequestDetails.CashPayments" %>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well">
			<h2>CASH PAYMENT DETAILS</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content" style="overflow: auto">
			<asp:GridView ID="GridViewCashClearance" EmptyDataText="No Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
				<Columns>
					<asp:TemplateField HeaderText="Date">
						<ItemTemplate>
							<asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("Date", "{0:dd/MMM/yyyy}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="Rank" HeaderText="Rank" />						
					<asp:BoundField DataField="First Name" HeaderText="First Name" />
					<asp:BoundField DataField="Last Name" HeaderText="Last Name" />
					<asp:BoundField DataField="TotalAmount" HeaderText="Paid Amount" />		
					<asp:BoundField DataField="PaidBy" HeaderText="Paid By" />
				</Columns>
			</asp:GridView>
		</div>
	</div>
</div>