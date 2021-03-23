<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutstandingAdvance.ascx.cs" Inherits="AdvanceSystem.RequestDetails.OutstandingAdvance" %>
    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header well">
                                <h2>PENDING ADVANCE DETAILS</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                                    <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                                    <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content" style="overflow:auto">
                                <asp:GridView ID="GridViewAdvanceDetails" EmptyDataText="No Previous Advance Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridViewAdvanceDetails_RowDataBound" runat="server">
    <Columns>
         <asp:TemplateField HeaderText="Net Pay" >
                <ItemTemplate>
                   K<asp:Label ID="lblSalary"  runat="server" Text='<%# Eval("Current Salary") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="Advance Amount" >
                <ItemTemplate>
                   K<asp:Label ID="lblAdvanceAm" runat="server" Text='<%# Eval("Advance Amount") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
          <asp:TemplateField HeaderText="Recovery(Months)" >
                <ItemTemplate>
                   <asp:Label ID="lblDur" runat="server" Text='<%# Eval("Recovery Duration") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
        <%--<asp:BoundField HeaderText="Advance Amount" DataField="Advance Amount" />--%>
        <%--<asp:BoundField HeaderText="Recovery Duration(Months)" DataField="Recovery Duration" />--%>
        <asp:TemplateField HeaderText="Deduction (Month)" >
                <ItemTemplate>
                    K<asp:Label ID="lblPaymentPlan" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
         <asp:TemplateField HeaderText="Salary After Deduction" >
                <ItemTemplate>
                    K<asp:Label ID="lblSalaryAfter" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
		<asp:TemplateField HeaderText="End Date">
														<ItemTemplate>
															<asp:Label ID="lblend" runat="server" Text='<%# Eval("EndDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
        <%--<asp:BoundField HeaderText="End Date" DataField="EndDate" />--%>
         <asp:TemplateField HeaderText="Status" >
             <HeaderStyle Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
                    <asp:Label ID="lblShowState" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
        <%--<asp:BoundField HeaderText="State" DataField="Advance State" />--%>
    </Columns>
</asp:GridView>
                             </div>

                            </div>
                            </div>