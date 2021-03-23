<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Stations.ascx.cs" Inherits="AdvanceSystem.Settings.Stations" %>

<div class="span12" style="margin-bottom:20px;width:100% !important;padding:50px; box-shadow:0 0 20px rgba(0,0,0,0.8);">
	<h2>STATIONS</h2>
	<br />
<table style="margin-bottom:20px;padding:10px">
	<tr>
		<td>Description</td>
		<td>Station </td>
		<td>Code</td>
		<td></td>
	</tr>
	<tr>
		<td><asp:TextBox style="height:30px !important;width:150px" runat="server" ID="txtDesc"></asp:TextBox></td>
		<td><asp:TextBox  style="height:30px !important" runat="server" ID="txtStation"></asp:TextBox></td>
		<td><asp:TextBox  style="height:30px !important" runat="server" ID="txtCode"></asp:TextBox></td>
		<td><a href="#" id="BtnAdd" runat="server" style="height:30px"  class="btn btn-success dropdown-toggle"  onserverclick="BtnAdd_ServerClick"><i class="icon-th-list"></i>Add Station</a><%--<asp:Button ID="BtnAddStation" runat="server" CssClass="btn btn-primary" Text="Add Station" />--%></td>
	</tr>
</table>
<asp:GridView ID="GridViewStations" EmptyDataText="NO STATIONS FOUND" ShowFooter="false" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewStations_RowDataBound" OnRowUpdating="GridViewStations_RowUpdating" OnRowUpdated="GridViewStations_RowUpdated" OnRowCommand="GridViewStations_RowCommand" OnRowEditing="GridViewStations_RowEditing" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
                    <Columns>
                               <asp:TemplateField HeaderStyle-Width="100px">
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-primary dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
							<ul class="dropdown-menu">
						
						     <li><a id="BtnDelete2" runat="server" onserverclick="BtnDelete2_ServerClick"><i class="icon32 icon-color icon-trash"></i>Delete User</a></li>			
                                </ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
		
                        <asp:TemplateField HeaderText="<a class='icon32 icon-color icon-web'></a> Station" Visible="True">
                            <ItemTemplate>
								<%--<pre class="prettyprint linenums">--%>
							  <asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
									<%--</pre>--%>
                            </ItemTemplate>
								<EditItemTemplate>
						    <asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>	
                        <asp:TemplateField HeaderText="<a class='icon32 icon-color icon-info'></a> Description" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Description" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
						    </ItemTemplate>
							<EditItemTemplate>
						    <asp:Label ID="Description" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="<a class='icon32 icon-color icon-document'></a> Code" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Code1" Visible="true" runat="server" Text='<%# Eval("Code1") %>'></asp:Label>
                            </ItemTemplate>
							  	<EditItemTemplate>
						    <asp:Label ID="Code1" runat="server" Text='<%# Eval("Code1") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>
</div>     