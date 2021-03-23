<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdateEmail.ascx.cs" Inherits="AdvanceSystem.UpdateEmail" %>

     <div style="width:100%;">
		   <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-info" style="text-align: center; font-size: small">EMAIL CREDENTIALS</p>
                                                    </div>
                                                </div>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
						<div class="top-row">
     
                     <label>
                                                         Current Email
                                                        </label>
						   <asp:TextBox Visible="true" Enabled="false" ID="TxtEmail" runat="server"></asp:TextBox>
							</div>
		
      <div class="top-row">
     
                     <label>
                                                         New Email
                                                        </label>
        <input type="email" class="inputz" id="TxtNewEmail" runat="server" placeholder="New Email" />
                    </div>
              
						  <div class="top-row">
								<asp:Label ID="lblcheck" Font-Size="Large" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
						<%----------------------------------------------------------%>
						<input type="text" class="inputz" Visible="false" id="TxtUserName" runat="server" placeholder="User Name" />
        <input type="text" class="inputz" Visible="false" id="TxtPosition" runat="server" placeholder="Position" />
             <asp:TextBox ID="TxtSection" Visible="false" runat="server"></asp:TextBox>
          <asp:TextBox Visible="false" ID="TxtStation"  runat="server"></asp:TextBox>
          				   <asp:TextBox ID="txtRole" Visible="false" runat="server"></asp:TextBox>
        				  <asp:TextBox ID="TxtOLdEmail" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TxtUser" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TxtPassword" Visible="false" runat="server"></asp:TextBox>
        

						<%------------------------------------------------------------------%>
						

						</ContentTemplate>
		  </asp:UpdatePanel>
		 </div>