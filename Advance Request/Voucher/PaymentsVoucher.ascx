<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentsVoucher.ascx.cs" Inherits="AdvanceSystem.Advance_Request.Voucher.PaymentsVoucher" %>

 <div class="block-100" style="width:95%;margin-bottom:150px">
      <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
     <h2>PAYMENT VOUCHER</h2>
     <br />
     <br />
       <div class="top-row">
         <div class="field-wrap">
              <label>
                                                          Date
                                                        </label>
         <input type="text" class="input-xlarge datepicker" style="width:100%" id="TxtDate" runat="server" placeholder="Date" required="required" />
             </div>
                <div class="field-wrap">
                   
                    </div>
               </div>
         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Account Type
                                                        </label>
         <input type="text" class="inputz" id="TxtAccountType" runat="server" required="required" />
             </div>
                <div class="field-wrap">
                     <label>
                                                          Department
                                                        </label>
        <input type="text" class="inputz" id="TxtDept" runat="server" required="required" />
                    </div>
               </div>
             	   <div class="top-row">
         <div class="field-wrap">
              <label>
                                                          Station
                                                        </label>
             <asp:TextBox ID="TxtStation" CssClass="inputz" runat="server"></asp:TextBox>
         <%--<input type="text" class="inputz" id="TxtENumber" runat="server" placeholder="Employee Number" required="required" />--%>
             </div>
                <div class="field-wrap">
                      <label>
                                                           Ministry
                                                        </label>
                <asp:TextBox ID="TxtMinistry" CssClass="inputz" runat="server"></asp:TextBox>
    
            
                    </div>
               </div>
     <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-edit"></i> VOUCHER</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                        <asp:GridView ID="GridViewVoucher" OnRowDeleting="GridViewVoucher_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewVoucher_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>
                                 <asp:TemplateField HeaderText="Class/ Function" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtClass" runat="server" Text='<%# Eval("Class/Function") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtClass" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Head" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtHead" runat="server" Text='<%# Eval("Head") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtHead" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Dept" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtDept" runat="server" Text='<%# Eval("Dept") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtDept" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Unit" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtUnit" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Accounting Officer" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtOfficer" runat="server" Text='<%# Eval("Accounting Officer") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtOfficer" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Programme" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtProg" runat="server" Text='<%# Eval("Programme") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtProg"  runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Activity" Visible="false">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtActivity" runat="server" Text='<%# Eval("Activity") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtActivity" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Account Code" Visible="false">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtAccountCode" runat="server" Text='<%# Eval("Account Code") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAccountCode" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Subsidiary" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtSubsidiary" runat="server" Text='<%# Eval("Subsidiary") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtSubsidiary" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Amount(K)" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                     <asp:Label ID="TxtAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAmount" BackColor="Yellow" OnTextChanged="TxtAmount_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                                     <asp:TemplateField>
                                                <ItemTemplate>
                                                          <asp:LinkButton ID="LinkButton1" Width="100%" CommandName="Delete" Text="<div class='btn btn-danger'><i class='icon-trash icon-white'></i>Delete</div>" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                      
        </Columns>
    </asp:GridView>
                          <div class="top-row">
         <div class="field-wrap">
			  <label>
                                                       ADVANCE REQUESTED
                                                        </label>
                                             <asp:TextBox Width="80%" ID="TxtAdvance" ReadOnly="true" Text="0" runat="server"></asp:TextBox>
    
              
             </div>
                <div class="field-wrap">
                     <label>
                                                       TOTAL
                                                        </label>
                                             <asp:TextBox Width="80%" ID="TxtTotal" ReadOnly="true" Text="0" BackColor="SkyBlue" placeholder="TOTAL (Kw)" runat="server"></asp:TextBox>
    
                    </div>
               </div>
                      
                        </div>
 
                        </div>
                    </div>
       <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Payee
                                                        </label>
         <input type="text" class="inputz" id="TxtPayee" runat="server" placeholder="Payee Name" required="required" />
             </div>
                <div class="field-wrap">
                     <label>
                                                       Authorities
                                                        </label>
        <input type="text" class="inputz" id="TxtAuthorit" runat="server" required="required" />
                    </div>
               </div>
      <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-info" style="         text-align: center;
         font-size: small">REMITTANCE TO BE SENT</p>
                                                    </div>
                                                </div>
       <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Name
                                                        </label>
         <input type="text" class="inputz" id="TxtName" runat="server" required="required" />
             </div>
                <div class="field-wrap">
                     <label>
                                                          Address
                                                        </label>
        <input type="text" class="inputz" id="TxtAddress" runat="server" placeholder="Physical Address" required="required" />
                    </div>
               </div>
       <div class="top-row">
                     <label>
                                                          Description of payment
                                                        </label>
<asp:TextBox ID="TxtDescription" TextMode="MultiLine" Height="150px" ForeColor="Black" CssClass="inputz" runat="server"></asp:TextBox>
        <%--<input type="text" class="inputz" id="Text5" runat="server" placeholder="Last Name" required="required" />--%>
                    </div>
        <a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Save voucher</a>
       
         </div>
       
    