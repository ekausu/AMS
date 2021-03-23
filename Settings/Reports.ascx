<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Reports.ascx.cs" Inherits="AdvanceSystem.Settings.Reports" %>
<%--<div class="box span6">
	<div class="box-header well">
		<h2><i class="icon icon-blue icon-profile"></i>REPORTS LIBRARY</h2>
	</div>--%>
<div class="span12" style="margin-bottom: 20px; width: 100% !important; padding: 50px; box-shadow: 0 0 20px rgba(0,0,0,0.8);">

	<div class="box-content">
		<h2>REPORTS LIBRARY</h2>
	<br />
		  <div class="top-row">
         <div class="field-wrap">
              
         <input type="text" id="txtTitle" class="inputz" runat="server" placeholder="Title" />
             </div>
                <div class="field-wrap">
					 <input type="text" id="txtLink" class="inputz" runat="server" placeholder="Link" />
        
           	        </div>
               </div>
		  <div class="top-row">
         <div class="field-wrap">
			 	<a id="BtnAdd"  runat="server" class="btn btn-info" onserverclick="BtnAdd_ServerClick"><i class="icon icon-color icon-plus"></i>Add Reports</a>			
            
			 </div>
			  </div>
		 
		<asp:GridView ID="GridViewReports" runat="server" EmptyDataText="NO REPORTS FOUND" ShowFooter="false" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewReports_RowDataBound" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable">
	<Columns>
		<asp:TemplateField HeaderStyle-Width="50px">
			<ItemTemplate>
				<div class="btn-group" style="width: 90%">
					<a id="BtnDelete2" runat="server" onserverclick="BtnDelete2_ServerClick"><i class="icon32 icon-color icon-trash"></i></a></li>
				</div>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="Title">
			<ItemTemplate>
				<asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("lid") %>'></asp:Label>
				<i class="icon32 icon-color icon-document"></i>
					<asp:Label ID="lblTitle" Visible="true" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
			<asp:TemplateField HeaderText="Link">
			<ItemTemplate>
					<a><asp:Label ID="lbllink" Visible="true" runat="server" Text='<%# Eval("Link") %>'></asp:Label></a>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</asp:GridView>
	</div>
</div>
