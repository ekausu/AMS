<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddUsers.ascx.cs" Inherits="AdvanceSystem.Settings.AddUsers" %>


<div class="span12" style="margin-bottom:20px;width:100% !important;padding:50px; box-shadow:0 0 20px rgba(0,0,0,0.8);">
    <%-- <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>--%>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
    <h2>NEW USER </h2>
             	         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Full Name
                                                        </label>
         <input type="text" id="TxtUserName" class="inputz" runat="server" placeholder="User Name" />
             </div>
                <div class="field-wrap">
                     <label>
                                                           Position
                                                        </label>
        <input type="text" id="TxtPosition" runat="server" placeholder="Position" />
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
	  <asp:DropDownList ID="DropStation" runat="server"></asp:DropDownList>
          <%--<asp:TextBox ID="TxtStation"  runat="server"></asp:TextBox>--%>
               </div>
               </div>
                         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Email
                                                        </label>
             <asp:TextBox ID="TxtEmail" AutoPostBack="true" runat="server"></asp:TextBox>
           </div>
                  <div class="field-wrap">
              <label>
                                                         Role
                                                        </label>
               <asp:DropDownList ID="DropDownRole" runat="server" Width="100%">
                   <asp:ListItem></asp:ListItem>
                   <asp:ListItem Value="1">First Approver</asp:ListItem>
                   <asp:ListItem Value="2">Second Approver</asp:ListItem>
				    <asp:ListItem Value="3">Voucher Handler</asp:ListItem>
                   <asp:ListItem Value="4">Accounts (Cashier)</asp:ListItem>
                   <asp:ListItem Value="0">Admin</asp:ListItem>

               </asp:DropDownList>
                        </div>
               </div>
						  <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-warning" style="text-align: center; font-size: small">LOGIN CREDENTIALS</p>
                                                    </div>
                                                </div>
                           <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Password User Name
                                                        </label>
             <asp:TextBox ID="TxtPName" AutoPostBack="true" runat="server"></asp:TextBox>
           </div>
                  <div class="field-wrap">
              <label>
                                                         Password
                                                        </label>
                       <input type="password" id="TxtPwrd" placeholder="password" runat="server" />
           </div>
               </div>
        <a class="btn btn-succcess" id="BtnOpenSave" runat="server" onserverclick="BtnOpenSave_ServerClick" href="#" >
                                <i class="icon icon-color icon-save"></i>
                               Save                                       
									</a>
                    </ContentTemplate>
                        </asp:UpdatePanel>
</div>
          <%--------------------MODAL Save---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
          Are you sure you want to save?
			<br />
			  <a class="btn btn-succcess" runat="server" onserverclick="BtnSave_ServerClick" id="BtnSave" >
                                <i class="icon icon-white icon-tick"></i>
                               Save                                       
									</a>
         <a class="btn btn-danger" runat="server" id="BtnCancel" >
                                <i class="icon icon-white icon-cross"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
           <%---------------------------------------------------------------------------------------------%>             
                   