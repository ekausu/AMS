<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ranks.ascx.cs" Inherits="AdvanceSystem.Settings.Ranks" %>


<%--<div class="box span6">
	<div class="box-header well">
		<h2><i class="icon icon-blue icon-profile"></i>RANKS</h2>
	</div>--%>
<div class="span12" style="margin-bottom: 20px; width: 100% !important; padding: 50px; box-shadow: 0 0 20px rgba(0,0,0,0.8);">
	<div class="box-content">
		<h2>RANKS LIST</h2>
	<br />
		<asp:UpdatePanel runat="server"><ContentTemplate>
		  <div class="top-row">
         <div class="field-wrap">
              
         <input type="text" id="txtAddRank" class="inputz" runat="server" placeholder="Ranks" />
             </div>
                <div class="field-wrap">
           		<a id="BtnAdd"  runat="server" class="btn btn-info" onserverclick="BtnAdd_ServerClick"><i class="icon icon-color icon-plus"></i>Add Rank</a>			
                    </div>
               </div>
		 
		<asp:GridView ID="GridViewRanks" runat="server" EmptyDataText="NO RANKS FOUND" ShowFooter="false" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewRanks_RowDataBound" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable">
	<Columns>
		<asp:TemplateField HeaderStyle-Width="100px">
			<ItemTemplate>
				<div class="btn-group" style="width: 90%">
					<a id="BtnDelete2" runat="server" onserverclick="BtnDelete2_ServerClick"><i class="icon32 icon-color icon-trash"></i></a></li>
				</div>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Rank">
			<ItemTemplate>
				<asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("id") %>'></asp:Label>
					<asp:Label ID="lblRank" Visible="true" runat="server" Text='<%# Eval("Rank") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
			</ContentTemplate></asp:UpdatePanel>
		<%--<ul class="dashboard-list">
			<li>
				<asp:TextBox ID="txtRanks" runat="server"></asp:TextBox>
			</li>
			<li>
				<a href="#">
					<i class="icon icon-red icon-trash"></i>
					Major
							</a>
			</li>
			<li>
				<a href="#">
					<i class="icon32 icon-trash"></i>
					<span class="blue">36</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-comment"></i>
					<span class="yellow">45</span>
					User reviews                                    
							</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-arrow-up"></i>
					<span class="green">112</span>
					New Comments                                    
							</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-arrow-down"></i>
					<span class="red">31</span>
					New Registrations
							</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-minus"></i>
					<span class="blue">93</span>
					New Articles                                    
							</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-comment"></i>
					<span class="yellow">254</span>
					User reviews                                    
							</a>
			</li>
		</ul>--%>
	</div>
</div>
