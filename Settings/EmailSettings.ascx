<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailSettings.ascx.cs" Inherits="AdvanceSystem.Settings.EmailSettings" %>

<div class="span12" style="margin-bottom: 20px; width: 100% !important; padding: 50px; box-shadow: 0 0 20px rgba(0,0,0,0.8);">
	<h2>EMAIL SETUP</h2>
	<br />
	<table style="margin-bottom: 20px; padding: 10px">
		<tr>
			<td>UserId</td>
			<td>UserPassword</td>
			<td>EmailAddress</td>
			<td>SMTPClientHost</td>
			<td>Status</td>

		</tr>
		<tr>
			<td>
				<asp:TextBox Style="height: 30px !important; width: 150px" runat="server" ID="txtUserId"></asp:TextBox></td>
			<td>
				<asp:TextBox Style="height: 30px !important" runat="server" ID="txtUserPassword"></asp:TextBox></td>
			<td>
				<asp:TextBox Style="height: 30px !important" runat="server" ID="txtEmailAddress"></asp:TextBox></td>
			<td>
				<asp:TextBox Style="height: 30px !important" runat="server" ID="txtSMTPClientHost"></asp:TextBox></td>
			<td>
				<asp:DropDownList ID="DropActive" runat="server">
					<asp:ListItem Value="1">Active</asp:ListItem>
					<asp:ListItem Value="0">Inactive</asp:ListItem>
				</asp:DropDownList></td>
		</tr>
		<tr>
			<td colspan="5"><a href="#" id="BtnAdd" runat="server" style="height: 30px; width: 150px" class="btn btn-success dropdown-toggle" onserverclick="BtnAdd_ServerClick"><i class="icon-th-list"></i>Add</a><%--<asp:Button ID="BtnAddStation" runat="server" CssClass="btn btn-primary" Text="Add Station" />--%></td>

		</tr>
	</table>
	<asp:GridView ID="GridViewEmailSettings" runat="server" EmptyDataText="NO STATIONS FOUND" ShowFooter="false" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewEmailSettings_RowDataBound" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable">
		<Columns>
			<asp:TemplateField HeaderStyle-Width="100px">
				<ItemTemplate>
					<%--<asp:Button runat="server" ID="BtnDelete" CssClass="btn btn-primary" Text="Delete" />--%>

					<div class="btn-group" style="width: 90%">
						<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
						<ul class="dropdown-menu">

							<li><a id="BtnDelete2" runat="server" onserverclick="BtnDelete2_ServerClick"><i class="icon32 icon-color icon-trash"></i>Delete Connection</a></li>
						</ul>
					</div>
				</ItemTemplate>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="Status" Visible="FALSE">
				<ItemTemplate>
					<asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("id") %>'></asp:Label>
				</ItemTemplate>
				<%--	<EditItemTemplate>
						    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>'></asp:Label>
							</EditItemTemplate>--%>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="<a class='icon32 icon-blue icon-locked'></a> UserId" Visible="true">
				<ItemTemplate>
					<asp:Label ID="lblicon" runat="server"></asp:Label>
					<asp:Label ID="lblActive" Visible="false" runat="server" Text='<%# Eval("Active") %>'></asp:Label>
					<asp:Label ID="lblUserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
				</ItemTemplate>
				<%--<EditItemTemplate>
						    <asp:Label ID="UserId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
							</EditItemTemplate>--%>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="<a class='icon32 icon-blue icon-unlocked'></a> UserPassword" Visible="True">
				<ItemTemplate>
					<asp:Label ID="UserPassword" Visible="true" runat="server" Text='<%# Eval("UserPassword") %>'></asp:Label>
				</ItemTemplate>
				<%--	  	<EditItemTemplate>
						    <asp:Label ID="UserPassword" runat="server" Text='<%# Eval("UserPassword") %>'></asp:Label>
							</EditItemTemplate>--%>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="<a class='icon32 icon-blue icon-mail-closed'></a> EmailAddress" Visible="True">
				<ItemTemplate>
					<asp:Label ID="EmailAddress" Visible="true" runat="server" Text='<%# Eval("EmailAddress") %>'></asp:Label>
				</ItemTemplate>
				<%--	  	<EditItemTemplate>
						    <asp:Label ID="EmailAddress" runat="server" Text='<%# Eval("EmailAddress") %>'></asp:Label>
							</EditItemTemplate>--%>
			</asp:TemplateField>
			<asp:TemplateField HeaderText="<a class='icon32 icon-blue icon-rssfeed'></a> SMTPClientHost" Visible="True">
				<ItemTemplate>
					<asp:Label ID="SMTPClientHost" Visible="true" runat="server" Text='<%# Eval("SMTPClientHost") %>'></asp:Label>
				</ItemTemplate>
				<%--	<EditItemTemplate>
						    <asp:Label ID="SMTPClientHost" runat="server" Text='<%# Eval("SMTPClientHost") %>'></asp:Label>
							</EditItemTemplate>--%>
			</asp:TemplateField>

		</Columns>
	</asp:GridView>
</div>


<%--<div class="box span12">
	

	<div class="box-content">
		<form class="form-horizontal">

			<fieldset>
				<div class="control-group">
					Receiver Email
								
					<div class="controls">
						<div class="input-prepend">
							<asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Width="250px"></asp:TextBox>
						</div>
					</div>
				</div>
				<div class="control-group">
					Message
							
					<div class="controls">
						<asp:TextBox runat="server" TextMode="MultiLine" ForeColor="Black" Height="100px" ID="txtMessage"></asp:TextBox>
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" runat="server" id="BtnSendEmail" onserverclick="BtnSendEmail_ServerClick" class="btn btn-primary">Send Test Email</button>

				</div>
			</fieldset>
		</form>
	</div>
</div>--%>
