<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Voucher.ascx.cs" Inherits="AdvanceSystem.RequestDetails.Voucher" %>
<%@ Register Src="~/RequestDetails/VoucherDetails.ascx" TagPrefix="uc1" TagName="VoucherDetails" %>

<div class="row-fluid sortable">
					<div class="box-header well">
						<h2>VOUCHER</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
                    <div class="box-content">
                             <asp:GridView ID="GridViewVoucher" AutoGenerateColumns="false" EmptyDataText="No Previous Advance Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnRowDataBound="GridViewVoucher_RowDataBound" runat="server">
                             <Columns>
               <asp:TemplateField>
              <ItemTemplate>
               <asp:ImageButton ID="imgVoucher" runat="server" Width="20px" Height="20px" OnClick="imgVoucher_Click"
                                                        ImageUrl="~/Plus.ico" CommandArgument="Show" />
                </ItemTemplate>
             </asp:TemplateField> 
          <asp:TemplateField Visible="false" HeaderText="Request id" >
              <ItemTemplate>
                <asp:Label ID="Reqid" runat="server"  Text='<%# Eval("Reqid") %>'></asp:Label>
                        <asp:Label ID="vid" runat="server"  Text='<%# Eval("vid") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
                                         <asp:BoundField HeaderText="Date" DataField="Date" />
                            
   <asp:BoundField HeaderText="Account Type" DataField="Account Type" />
   <asp:BoundField HeaderText="Department" DataField="Department" />
                                    <asp:BoundField HeaderText="Station" DataField="Station" />
                                    <asp:BoundField HeaderText="Ministry" DataField="Ministry" />
                                    <asp:BoundField HeaderText="Payee" DataField="Payee" />

                                    <asp:BoundField HeaderText="Authorities" DataField="Ministry" />
                                    <asp:BoundField HeaderText="Name" DataField="Payee" />
                                    <asp:BoundField HeaderText="Address" DataField="Ministry" />
                                    <asp:BoundField HeaderText="Description" DataField="Ministry" />
                                    <asp:BoundField HeaderText="Status" DataField="Ministry" />
                                    <asp:BoundField HeaderText="Payee" DataField="Payee" />
                                 
        <%-------------------------------------EXPAND VOUCHER RECORDS-----------------------------------------------------%>
              <asp:TemplateField>
               <ItemTemplate>
				   <uc1:VoucherDetails runat="server" id="VoucherDetails" />
                </ItemTemplate>
             </asp:TemplateField> 
            <%------------------------------------END EXPAND VOUCHER-----------%> 
                  </Columns>
                             </asp:GridView>
                        </div>
                    </div>
               