<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateUsers.ascx.cs" Inherits="AdvanceSystem.UpdateUsers" %>
<%--	<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>NEW USERS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">--%>
<style>
	.top-row, .field-wrap {
		margin-bottom:5px !important;
	}
</style>

                        <div style="width:100%;">
							  <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-info" style="text-align: center; font-size: small">USER DETAILS</p>
                                                    </div>
                                                </div>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
      <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Full Name
                                                        </label>
         <input type="text" class="inputz" id="TxtUserName" runat="server" placeholder="User Name" />
             </div>
                <div class="field-wrap">
                     <label>
                                                           Position
                                                        </label>
        <input type="text" class="inputz" id="TxtPosition" runat="server" placeholder="Position" />
                    </div>
               </div>
                          <div class="top-row">
         <div class="field-wrap">
         
              <label>
                                                           Section
                                                        </label>
             <asp:TextBox ID="TxtSection" runat="server"></asp:TextBox>
               </div>
  <div class="field-wrap">
         
              <label>
                                                          Station
                                                        </label>
	  <asp:DropDownList runat="server" ID="DropStation"></asp:DropDownList>
         <%-- <asp:TextBox ID="TxtStation"  runat="server"></asp:TextBox>--%>
               </div>
               </div>
                         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Email
                                                        </label>
             <asp:TextBox ID="TxtEmail" CssClass="input" runat="server"></asp:TextBox>
		   </div>
                  <div class="field-wrap">
              <label>
                                                         Role
                                                        </label>
               <asp:DropDownList ID="DropDownRole" CssClass="DropDown" runat="server" Width="100%">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem Value="1">First Approver</asp:ListItem>
                   <asp:ListItem Value="2">Second Approver</asp:ListItem>
				     <asp:ListItem Value="3">Accounts (Cashier)</asp:ListItem>
                   <asp:ListItem Value="4">Voucher Handler</asp:ListItem>
                   <asp:ListItem Value="0">Admin</asp:ListItem>

               </asp:DropDownList>
                        </div>
               </div>
						  <asp:TextBox ID="TxtOLdEmail" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TxtUser" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TxtPassword" Visible="false" runat="server"></asp:TextBox>
        
        
      
                    </ContentTemplate>
                        </asp:UpdatePanel>
</div>
    

				<%--	</div>
				</div>--%>
                  