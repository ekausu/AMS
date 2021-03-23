<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VoucherDetails.ascx.cs" Inherits="AdvanceSystem.RequestDetails.VoucherDetails" %>
 <tr>
                 <td colspan="12">
                <asp:Panel ID="Panel1" runat="server" Visible="false" Style=" box-shadow: 0 0 20px rgba(0,0,0,0.8);">
                       <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header well">
                                <h2>VOUCHER DETAILS</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                                    <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                                    <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content ">
                             <asp:GridView ID="GridViewVoucherTable" AutoGenerateColumns="false" EmptyDataText="No Previous Advance Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered"  OnRowDataBound="GridViewVoucherTable_RowDataBound" runat="server">
                          <Columns>
                               <asp:BoundField HeaderText="Class/Function" DataField="Class/Function" />
                                    <asp:BoundField HeaderText="Head" DataField="Head" />
                                    <asp:BoundField HeaderText="Dept" DataField="Dept" />
                                    <asp:BoundField HeaderText="Unit" DataField="Unit" />
                                    <asp:BoundField HeaderText="Accounting Officer" DataField="Accounting Officer" />
                                    <asp:BoundField HeaderText="Programme" DataField="Programme" />
                                    <asp:BoundField HeaderText="Subsidiary" DataField="Subsidiary" />
                                  <asp:BoundField HeaderText="Amount" DataField="Amount" />
                          </Columns>
                                 </asp:GridView>
                                </div>
                            </div>
                           </div>
                          </asp:Panel>
					 </td>
	 </tr>