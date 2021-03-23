<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdvanceDetails.ascx.cs" Inherits="AdvanceSystem.RequestDetails.AdvanceDetails" %>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well">
			<h2>ADVANCE DETAILS</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content" style="overflow:auto">
			<asp:GridView ID="GridViewAdvanceDetails" EmptyDataText="No Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
				<Columns>
			<%--		<asp:BoundField DataField="Start Date" HeaderText="Start Date" />
					<asp:BoundField DataField="EndDate" HeaderText="End Date" />--%>
					<asp:TemplateField HeaderText="Start Date">
														<ItemTemplate>
															<asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("Start Date", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
						<asp:TemplateField HeaderText="End Date">
														<ItemTemplate>
															<asp:Label ID="lblend" runat="server" Text='<%# Eval("EndDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
						
					<asp:BoundField DataField="Current Salary" HeaderText="Net Pay" />
					<asp:BoundField DataField="Advance Amount" HeaderText="Advance Amount" />
					<asp:BoundField DataField="Recovery Duration" HeaderText="Duration" />
					<asp:BoundField DataField="Balance" HeaderText="Balance BF" />	
				</Columns>
			</asp:GridView>
		</div>
	</div>
</div>
