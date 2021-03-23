<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.ascx.cs" Inherits="AdvanceSystem.UpdatePassword" %>
	
     <div style="width:100%;">
		   <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-danger" style="text-align: center; font-size: small">LOGIN CREDENTIALS</p>
                                                    </div>
                                                </div>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
      <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           New Password
                                                        </label>
         <%--<input type="password" class="inputz" id="TxtPassword" runat="server" placeholder="New Password" />--%>
			 	 <asp:TextBox ID="TxtPassword" TextMode="Password" placeholder="New Password" runat="server"></asp:TextBox>
      <ajaxToolkit:PasswordStrength ID="PS" runat="server"
    TargetControlID="TxtPassword"
    DisplayPosition="BelowLeft"
    StrengthIndicatorType="Text"
    PreferredPasswordLength="10"
    PrefixText="Strength:"
    TextCssClass="TextIndicator_TextBox1"
    MinimumNumericCharacters="2"
    MinimumSymbolCharacters="1"
    RequiresUpperAndLowerCaseCharacters="false"
    TextStrengthDescriptions="Very Poor;Weak;Average;Strong;Excellent"
    TextStrengthDescriptionStyles="cssClass1;cssClass2;cssClass3;cssClass4;cssClass5"
    CalculationWeightings="50;15;15;20" />
             </div>
                <div class="field-wrap">
                     <label>
                                                         Retype Password
                                                        </label>
					 <asp:TextBox ID="TxtRetypePassword" TextMode="Password" placeholder="Retype Password" runat="server"></asp:TextBox>
        <%--<input type="password" class="inputz" id="TxtRetypePassword" runat="server" placeholder="Retype Password" />--%>
                    </div>
               </div>
						  <div class="top-row">
								<asp:Label ID="lblcheck" Font-Size="Large" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
						<%----------------------------------------------------------%>
						<input type="text" class="inputz" Visible="false" id="TxtUserName" runat="server" placeholder="User Name" />
        <input type="text" class="inputz" Visible="false" id="TxtPosition" runat="server" placeholder="Position" />
             <asp:TextBox ID="TxtSection" Visible="false" runat="server"></asp:TextBox>
          <asp:TextBox Visible="false" ID="TxtStation"  runat="server"></asp:TextBox>
             <asp:TextBox Visible="false" ID="TxtEmail" runat="server"></asp:TextBox>
						   <asp:TextBox ID="txtRole" Visible="false" runat="server"></asp:TextBox>
        				  <asp:TextBox ID="TxtOLdEmail" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TxtUser" Visible="false" runat="server"></asp:TextBox>
						  <asp:TextBox ID="TextBox1" Visible="false" runat="server"></asp:TextBox>
        

						<%------------------------------------------------------------------%>
						

						</ContentTemplate>
		  </asp:UpdatePanel>
		 </div>