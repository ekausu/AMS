<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalaryDetails.ascx.cs" Inherits="AdvanceSystem.RequestDetails.SalaryDetails" %>
<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well">
			<h2>SALARY DETAILS</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content" style="overflow:auto">
			<asp:GridView ID="GridViewSalaryDetails" EmptyDataText="No Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
				<Columns>
					<asp:BoundField DataField="Current Salary" HeaderText="Net Pay" />
					<%--<asp:BoundField DataField="Advance Amount" />
					<asp:BoundField DataField="Recovery Duration" />--%>
					<asp:BoundField DataField="Reason" HeaderText="Reason for the Advance" />
					<asp:BoundField DataField="Details" HeaderText="General Order E10/E11" />
					<asp:BoundField DataField="Advance State" HeaderText="Status" />
				</Columns>
			</asp:GridView>
		</div>
	</div>
</div>
