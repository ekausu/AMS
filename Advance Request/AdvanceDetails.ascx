<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdvanceDetails.ascx.cs" Inherits="AdvanceSystem.Advance_Request.AdvanceDetails" %>
<div class="block-100" style="width:80%;margin-bottom:150px">
     <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
    <h2>ADVANCE DETAILS</h2>
    <br />
                          <div class="top-row">
         <div class="field-wrap">
              <label>
                                                          Advance Amount(K)
                                                        </label>
             <asp:TextBox ID="TxtAdvance" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" OnTextChanged="TxtAdvance_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
         <%--<input type="number" class="inputz" id="TxtAmount" runat="server" placeholder="Salary" required="required" />--%>
             </div>
                <div class="field-wrap">
                     <label>
              Recovery Period(Months)
                 </label>
					 <%--<asp:TextBox ID="TxtDuration" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" OnTextChanged="TxtDuration_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>--%>
      <asp:DropDownList ID="DropDownDuration" OnSelectedIndexChanged="DropDownDuration_SelectedIndexChanged" AutoPostBack="true" Width="90%" CssClass="Inputz" runat="server">
      </asp:DropDownList>
                 </div>
               </div>
    <hr />
      <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         New Net Pay
                                                        </label>
             <input type="number" class="inputz" id="TxtNewNetPay" disabled="disabled" runat="server"/>
        
           </div>
                <div class="field-wrap">
              <label>
                                                         Status
                                                        </label>
             <input type="text" class="inputz" id="TxtStatus" disabled="disabled" runat="server"/>
        
           </div>
               </div>
						  <div class="top-row" id="Reason" visible="false" runat="server">
              <label>
                                                        Give Reasons for your advance
                                                        </label>
               <asp:TextBox ID="TxtReason" TextMode="MultiLine" ForeColor="Black" BackColor="White" Height="70px" CssClass="Inputz" runat="server"></asp:TextBox>
               </div>
						<br />
                     
                      <%--  <div runat="server" id="Above">  <a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Send Request</a>
                         </div>
                        <div runat="server" id="Below" visible="false"><a class="btn btn-success" href="#ModalBelow"><i class="icon icon-white icon-save"></i>Send Request</a>
                      </div>--%>
                      <asp:TextBox ID="txtCheif" Visible="false" ForeColor="Black" BackColor="White" Height="70px" CssClass="Inputz" runat="server"></asp:TextBox>
                 <asp:TextBox ID="txtBool" Visible="false" ForeColor="Black" BackColor="White" Height="70px" CssClass="Inputz" runat="server"></asp:TextBox>
              
                    </ContentTemplate>
                        </asp:UpdatePanel>
	    <div class="top-row">
              <label>
                                                         In Accordance with the Provision of general Order E10/E11 of the following grounds
                                                        </label>
               <asp:TextBox ID="TxtGeneralOrder" OnTextChanged="TxtGeneralOrder_TextChanged" AutoPostBack="false" TextMode="MultiLine" ForeColor="Black" BackColor="White" Height="70px" CssClass="Inputz" runat="server"></asp:TextBox>
               </div>
</div>
    