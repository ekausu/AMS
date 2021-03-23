<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="History.ascx.cs" Inherits="AdvanceSystem.RequestDetails.History" %>
                    <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well">
						<h2>HISTORY</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
                    <div class="box-content">
                             <asp:GridView ID="GridViewAdvHistory" EmptyDataText="No Previous Advance Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridViewAdvHistory_RowDataBound" runat="server">
                             <Columns>
                                <%-- <asp:BoundField HeaderText="Start Date" DataField="Start Date" />
                                 <asp:BoundField HeaderText="End Date" DataField="EndDate" />--%>
								 <asp:BoundField HeaderText="Status" DataField="Advance State" />
								 	<asp:TemplateField HeaderText="Start Date">
														<ItemTemplate>
															<asp:Label ID="lblStartDate" runat="server" Text='<%# Eval("Start Date", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
						<asp:TemplateField HeaderText="End Date">
														<ItemTemplate>
															<asp:Label ID="lblend" runat="server" Text='<%# Eval("EndDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
                                 <asp:BoundField HeaderText="Net Salary" DataField="Current Salary" />
                                 <asp:BoundField HeaderText="Advance Amount" DataField="Advance Amount" />
                                 <asp:BoundField HeaderText="Recovery(Months)" DataField="Recovery Duration" />
                                 <asp:BoundField HeaderText="Reason" DataField="Reason" />
                                    <asp:BoundField HeaderText="Unit" DataField="Unit" />
                                 <asp:BoundField HeaderText="Section" DataField="Section" />

								 <asp:TemplateField HeaderText="Entered Date">
														<ItemTemplate>
															<asp:Label ID="lblEnteredDate" runat="server" Text='<%# Eval("Entered Date", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
                                <%-- <asp:BoundField HeaderText="Entered By" DataField="Entered by" />
                                 <asp:BoundField HeaderText="Entered Date" DataField="Entered Date" />--%>

                             </Columns>
                             </asp:GridView>
                        </div>
                    </div>
                                                                          </DIV>
                         