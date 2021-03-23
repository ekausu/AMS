<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Months.ascx.cs" Inherits="AdvanceSystem.Settings.Months" %>
<%--<div class="box span6">
	<div class="box-header well">
		<h2><i class="icon-list"></i>Advance Deduction Months Range</h2>
	</div>--%>
<div class="span12" style="margin-bottom: 20px; width: 100% !important; padding: 50px; box-shadow: 0 0 20px rgba(0,0,0,0.8);">

	<div class="box-content">
		<h2>MONTHS RANGE</h2>
	<br />
		<asp:UpdatePanel runat="server" ID="Upda"><ContentTemplate>
		<div class="top-row">
			<div class="field-wrap">
				<label>
					<i class="icon32 icon-color icon-transfer-ew"></i>
					Start Range
				</label>
				<input type="text" id="txtStartRange" class="inputz" runat="server" placeholder="Start" />
			</div>
			<div class="field-wrap">
				<label>
					<i class="icon32 icon-blue icon-transfer-ew"></i>
					End Range
				</label>
				<input type="text" id="txtEndRange" runat="server" placeholder="End" />
			</div>
		</div>
		<div class="top-row">
			   <div class="field-wrap">
           		<a id="BtnAdd"  runat="server" class="btn btn-info" onserverclick="BtnAdd_ServerClick"><i class="icon icon-color icon-plus"></i>Add Range</a>			
                    </div>
			</div>
			<asp:GridView ID="GridViewMonths" runat="server" EmptyDataText="NO RANKS FOUND" ShowFooter="false" ShowHeaderWhenEmpty="true" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable">
	<Columns>
		<asp:TemplateField HeaderText="Month Details">
			<ItemTemplate>
					<asp:Label ID="blMonth" Visible="true" runat="server" Text='<%# Eval("Month") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Start">
			<ItemTemplate>
					<asp:Label ID="lblStart" Visible="true" runat="server" Text='<%# Eval("Start") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
			<asp:TemplateField HeaderText="End">
			<ItemTemplate>
					<asp:Label ID="lblEnd" Visible="true" runat="server" Text='<%# Eval("End") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
			</ContentTemplate></asp:UpdatePanel>
		<%--<ul class="dashboard-list">
							<li>
								<asp:TextBox ID="txtMonths" runat="server"></asp:TextBox>
								<asp:TextBox ID="txtMonths2" runat="server"></asp:TextBox>
							</li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-down"></i>
							  <span class="red">15</span>
							  Start Range
							</a>
						  </li>
						  <li>
							<a href="#">
							  <i class="icon-arrow-up"></i>                               
							  <span class="green">112</span>
							  End Rang                                    
							</a>
						  </li>
						
					
						
						</ul>--%>
	</div>
</div>
