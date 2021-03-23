<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditUsers.ascx.cs" Inherits="AdvanceSystem.Settings.EditUsers" %>
<%@ Register Src="~/UpdatePassword.ascx" TagPrefix="uc1" TagName="UpdatePassword" %>
<%@ Register Src="~/UpdateUsers.ascx" TagPrefix="uc1" TagName="UpdateUsers" %>


<%--   <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>USER CREDENTIALS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">--%>


<div class="span12" style="margin-bottom:20px;width:100% !important;padding:50px; box-shadow:0 0 20px rgba(0,0,0,0.8);">
     <%-- <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>--%>
      <h2>SYSTEM USERS</h2> 
     <br />
     <asp:GridView ID="GridViewUsers" EmptyDataText="NO USER FOUND" ShowFooter="true" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewUsers_RowDataBound" OnRowUpdating="GridViewUsers_RowUpdating" OnRowUpdated="GridViewUsers_RowUpdated" OnRowCommand="GridViewUsers_RowCommand" OnRowEditing="GridViewUsers_RowEditing" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
                    <Columns>
                               <asp:TemplateField HeaderStyle-Width="100px">
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-primary dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
							<ul class="dropdown-menu">
							    <li><a id="BtnUpdate" runat="server" onserverclick="BtnUpdate_ServerClick"><i class="icon32 icon-blue icon-edit"></i>Update User Information</a></li>					
							    <li><a id="BtnPassword" runat="server" onserverclick="BtnPassword_ServerClick"><i class="icon32 icon-blue icon-edit"></i>Change Password</a></li>					
							<%--	<li class="divider"></li>
								<li><a id="BtnLoginHistory" runat="server" onserverclick="BtnLoginHistory_ServerClick"><i class="icon32 icon-color icon-unlocked"></i>Login HISTORY</a></li>
                      			<li><a id="BtnApprovalHis" runat="server" onserverclick="BtnApprovalHis_ServerClick"><i class="icon32 icon-orange icon-clipboard"></i>Approving HISTORY</a></li>
						--%>	<li class="divider"></li>
						     <li><a id="BtnDelete2" runat="server" onserverclick="BtnDelete2_ServerClick"><i class="icon32 icon-color icon-trash"></i>Delete User</a></li>			
                                </ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
						    <%--<asp:CommandField HeaderText="Edit" HeaderStyle-Width="150px" ControlStyle-CssClass="btn" ShowEditButton="True" />--%> 
        
                        <asp:TemplateField HeaderText="Active Directory" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="User" runat="server" Text='<%# Eval("User") %>'></asp:Label>
								    <asp:Label ID="Password" Visible="false" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
							<EditItemTemplate>
						    <asp:Label ID="TxtUser" runat="server" Text='<%# Eval("User") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						    <asp:Label ID="TxtName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Email" Visible="True">
                            <ItemTemplate>
								<a class="icon32 icon-color icon-mail-closed"></a>
                                <asp:Label ID="Email" Visible="true" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
							  	<EditItemTemplate>
						    <asp:Label ID="TxtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Section" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						    <asp:Label ID="TxtSection" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Station" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
                            </ItemTemplate>
							   	<EditItemTemplate>
						    <asp:Label ID="TxtStation" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role" Visible="true">
                            <ItemTemplate>
								         <asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Role" runat="server" Visible="false" Text='<%# Eval("Role") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						   <asp:DropDownList ID="DropRole" SelectedValue='<%# Eval("Role") %>' CssClass="select" runat="server">
                    <asp:ListItem></asp:ListItem>
							    <asp:ListItem Value="0">Administrator</asp:ListItem>
             <asp:ListItem Value="1">First Approver</asp:ListItem>
                 <asp:ListItem Value="2">Second Approver</asp:ListItem>
                 <asp:ListItem Value="3">Voucher Handler</asp:ListItem>
          <asp:ListItem Value="4">Accounts (Cashier)</asp:ListItem>
            </asp:DropDownList>
							</EditItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Position" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Position" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
                            </ItemTemplate>
							     	<EditItemTemplate>
						    <asp:Label ID="TxtPosition" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        
      </div>

   <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
			<h2>Message</h2>
            <h3>
			<asp:Label ID="lblmessage" runat="server" Text=""></asp:Label></h3>
                     <a class="btn btn-success" runat="server" onserverclick="BtnSave_ServerClick"  id="BtnSave">
                                <i class="icon-ok icon-white"></i>
                                Save                                           
									</a>
             <a class="btn btn-danger" runat="server" id="A3" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
<%------------------------------------------------------------------------------------------------------------------------------------%>
                 <a href="#x" class="overlay" runat="server" id="ModalUpdateUsers"></a>
        <div class="popup" style="width:60%">
            <h2>Update Section</h2>
			<div style="max-height:90%;">
				<uc1:UpdateUsers runat="server" ID="UpdateUsers" />
			<%--<uc1:UpdateUsers runat="server" ID="UpdateUsers" />--%>
			</div>
				   <a class="btn" runat="server" onserverclick="BtnUpdate_ServerClick1" id="BtnUpdate">
                                <i class="icon-ok icon-blue"></i>
                                Update User                                           
									</a>
            
             <a class="btn btn-danger" runat="server" id="A4" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                      
									</a>
              <a class="close" href="#close"></a>
        </div>
<%------------------------------------------------------------------------------------------------------------------------------------%>
                 <a href="#x" class="overlay" runat="server" id="ModalUpdatePassword"></a>
        <div class="popup" style="width:600px">
            <h2>Change User Password</h2>
			<div style="max-height:90%">
				<uc1:UpdatePassword runat="server" ID="UpdatePassword" />
				<%--<uc1:UpdatePassword runat="server" id="UpdatePassword" />--%>
				   <a class="btn" runat="server" onserverclick="BtnChangePassword_ServerClick" id="BtnChangePassword">
                                <i class="icon-ok icon-blue"></i>
                                Change Password                                           
									</a>
            
             <a class="btn btn-danger" runat="server" onserverclick="A2_ServerClick" id="A2" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                      
									</a>
			</div>
              <a class="close" href="#close"></a>
        </div>

	 <asp:TextBox ID="txtClickedOption" Visible="false" runat="server"></asp:TextBox>
                <asp:TextBox ID="email" Visible="false" runat="server"></asp:TextBox>
				       <asp:TextBox ID="user" Visible="false" runat="server"></asp:TextBox>
				<%--		</div>
					</div>
	   </div>--%>