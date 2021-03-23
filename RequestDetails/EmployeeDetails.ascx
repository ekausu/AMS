<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.ascx.cs" Inherits="AdvanceSystem.RequestDetails.EmployeeDetails" %>
<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well">
			<h2>EMPLOYEE DETAILS</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
				<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
				<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
			</div>
		</div>
		<div class="box-content" style="overflow:auto">
			<asp:GridView ID="GridViewEmployeeDetails" EmptyDataText="No Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
				<Columns>
					<asp:BoundField DataField="Employee Number" HeaderText="Employee Number" />
					<asp:BoundField DataField="First Name" HeaderText="First Name" />
					<asp:BoundField DataField="Last Name" HeaderText="Last Name" />
					<asp:BoundField DataField="Rank" HeaderText="Rank" />
					<asp:BoundField DataField="Station" HeaderText="Station" />
					<asp:BoundField DataField="Trade" HeaderText="Trade" />
					<asp:BoundField DataField="Unit" HeaderText="Unit" />
					<asp:BoundField DataField="Appointment" HeaderText="Appointment" />
					<asp:BoundField DataField="Email" HeaderText="Email" />
					<asp:BoundField DataField="Phone" HeaderText="Phone" />
				</Columns>
			</asp:GridView>
		</div>
	</div>
</div>

