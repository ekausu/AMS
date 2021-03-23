<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Deductions.ascx.cs" Inherits="AdvanceSystem.RequestDetails.Deductions" %>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well">
			<h2>DEDUCTION DETAILS</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content" style="overflow: auto">
			<asp:GridView ID="GridViewDeductions" EmptyDataText="No Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
				<Columns>
					<asp:TemplateField HeaderText="Event Date">
						<ItemTemplate>
							<asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("Date", "{0:dd/MMM/yyyy HH:mm}") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:BoundField DataField="Entered by" HeaderText="Entered by" />
					<asp:BoundField DataField="Amount" HeaderText="Amount" />		
				</Columns>
			</asp:GridView>
		</div>
	</div>
</div>
