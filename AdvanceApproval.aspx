<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceApproval.aspx.cs" Inherits="AdvanceSystem.AdvanceApproval" MaintainScrollPositionOnPostback="true" %>


<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/RequestDetails/OutstandingAdvance.ascx" TagPrefix="uc1" TagName="OutstandingAdvance" %>
<%@ Register Src="~/RequestDetails/History.ascx" TagPrefix="uc1" TagName="History" %>
<%@ Register Src="~/RequestDetails/EmployeeDetails.ascx" TagPrefix="uc1" TagName="EmployeeDetails" %>
<%@ Register Src="~/RequestDetails/SalaryDetails.ascx" TagPrefix="uc1" TagName="SalaryDetails" %>
<%@ Register Src="~/RequestDetails/AdvanceDetails.ascx" TagPrefix="uc1" TagName="AdvanceDetails" %>
<%@ Register Src="~/RequestDetails/CashPayments.ascx" TagPrefix="uc1" TagName="CashPayments" %>
<%@ Register Src="~/RequestDetails/Deductions.ascx" TagPrefix="uc1" TagName="Deductions" %>



<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8">
	<title>AMS</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="img/Device-blockdevice-cubes.ico">
	<%--<style type="text/css">
.ajax__myTab .ajax__tab_header { font-family: Arial, Helvetica, sans-serif; font-size: 12px;font-weight: bold;color:#000;border-left:solid 1px #666666; border-bottom:thin 1px #666666 }
        .ajax__myTab .ajax__tab_outer { padding-right: 4px; height: 20px; background-color: #fff; margin-right: 1px; border-right: solid 1px #666666; border-top: solid 1px #666666 }
        .ajax__myTab .ajax__tab_inner { padding-left: 4px; background-color: #fff; }
        .ajax__myTab .ajax__tab_tab { height: 13px; padding: 4px; margin: 0; }
        .ajax__myTab .ajax__tab_hover .ajax__tab_outer { background-color:  #c9c9c9}
        .ajax__myTab .ajax__tab_hover .ajax__tab_inner { background-color:  #c9c9c9}
        .ajax__myTab .ajax__tab_hover .ajax__tab_tab { background-color: #c9c9c9; cursor:pointer }
        .ajax__myTab .ajax__tab_active .ajax__tab_outer { background-color:#9ebae8; border-left: solid 1px #999999; }
        .ajax__myTab .ajax__tab_active .ajax__tab_inner { background-color:#9ebae8; }
        .ajax__myTab .ajax__tab_active .ajax__tab_tab {background-color:#9ebae8;cursor:inherit }
        .ajax__myTab .ajax__tab_body {border: 1px solid #666666; padding: 6px; background-color: #ffffff; }
        .ajax__myTab .ajax__tab_disabled {color:Gray }
</style>--%>
	<style>
		.tableZ {
			background: #f5f5f5;
			border-collapse: separate;
			box-shadow: 0 0 20px rgba(0,0,0,0.8);
			font-size: 12px;
			line-height: 24px;
			margin: 30px auto;
			text-align: left;
			width: 800px;
		}

			.tableZ th {
				background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
				border-left: 1px solid #555;
				border-right: 1px solid #777;
				border-top: 1px solid #555;
				border-bottom: 1px solid #333;
				box-shadow: inset 0 1px 0 #999;
				color: #fff;
				font-weight: bold;
				padding: 10px 15px;
				position: relative;
				text-shadow: 0 1px 0 #000;
			}

				.tableZ th:after {
					background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
					content: '';
					display: block;
					height: 25%;
					left: 0;
					margin: 1px 0 0 0;
					position: absolute;
					top: 25%;
					width: 100%;
				}

				.tableZ th:first-child {
					border-left: 1px solid #777;
					box-shadow: inset 1px 1px 0 #999;
				}

				.tableZ th:last-child {
					box-shadow: inset -1px 1px 0 #999;
				}

		.Combo {
			line-height: 1.6;
		}

		.tableZ td {
			border-right: 1px solid #fff;
			border-left: 1px solid #e8e8e8;
			border-top: 1px solid #fff;
			border-bottom: 1px solid #e8e8e8;
			padding: 10px 15px;
			position: relative;
			transition: all 300ms;
		}

			.tableZ td:first-child {
				box-shadow: inset 1px 0 0 #fff;
			}

			.tableZ td:last-child {
				border-right: 1px solid #e8e8e8;
				box-shadow: inset -1px 0 0 #fff;
			}

		.tableZ tr {
			background: url(https://jackrugile.com/images/misc/noise-diagonal.png);
		}

			.tableZ tr:nth-child(odd) td {
				background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png);
			}

			.tableZ tr:last-of-type td {
				box-shadow: inset 0 -1px 0 #fff;
			}

				.tableZ tr:last-of-type td:first-child {
					box-shadow: inset 1px -1px 0 #fff;
				}

				.tableZ tr:last-of-type td:last-child {
					box-shadow: inset -1px -1px 0 #fff;
				}
		.tableZ tbody:hover tr:hover td {
			color: #444;
			text-shadow: 0 1px 0 #fff;
		}

		.Test2 {
			position: relative;
			display: inline-block;
			padding: 15px 25px;
			background-color: green; /*for compatibility with older browsers*/
			background-image: linear-gradient(green,lightgreen);
			/* text styles */
			text-decoration: none;
			color: #fff;
			font-size: 25px;
			font-family: sans-serif;
			font-weight: 100;
		}

			.Test2:after {
				content: '';
				position: absolute;
				top: 2px;
				left: 2px;
				width: calc(100% - 4px);
				height: 50%;
				background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.2));
				border-radius: 3px;
				box-shadow: 0px 1px 4px -2px #333;
				text-shadow: 0px -1px #333;
			}

		.Test {
			font-family: 'PT Sans', arial, serif;
			color: #ffffff;
			font-size: 24px;
			font-weight: bold;
			text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
			background: rgba(0,0,0,0.25);
			-o-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
			-webkit-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
			-moz-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
			box-shadow: 0 2px 8px rgba(0,0,0,0.5), /* Exterior Shadow */
			inset 0 1px rgba(255,255,255,0.3), /* Top light Line */
			inset 0 10px rgba(255,255,255,0.2), /* Top Light Shadow */
			inset 0 10px 20px rgba(255,255,255,0.25), /* Sides Light Shadow */
			inset 0 -15px 30px rgba(0,0,0,0.3); /* Dark Background */
			text-decoration: none;
		}
	</style>
	
</head>
<body onload="load()">
	<form runat="server" id="form1" enctype="multipart/form-data" method="post">
		<asp:ScriptManager ID="ScriptManager1" runat="server" />
		<uc1:StyleBox runat="server" ID="StyleBox" />
		<uc1:TopBar runat="server" ID="TopBar" />
		<!-- topbar ends -->
		<div class="container-fluid">
			<%--------------------------------------------------------------------------------------------------------------------------------------%>
			<div class="row-fluid">
				<uc1:MainMenu runat="server" ID="MainMenu" />
				<!-- left menu ends -->

				<div id="content" class="span10">

					<!-- content starts -->
					<uc1:BreadCrumb runat="server" ID="BreadCrumb" />
					<%------------------------------------------------------------------------%>
					<div class="block-area shortcut-area" id="BtnMenu" runat="server">
						<div class="dock" style="margin-left: 20%">
							<ul style="background: none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
								<li><a id="BtnSearch" runat="server" href="#ModaleEmployeeNumber">
									<img src="images/Loupe.png" /></a><span>Search</span></li>
								<li><a id="BtnCompleted" runat="server" onserverclick="BtnCompleted_ServerClick">
									<img src="images/512Documents.png" /></a><span>Completed</span></li>
								<li><a id="BtnRunning" runat="server" onserverclick="BtnRunning_ServerClick">
									<img src="images/512Pictures.png" /></a><span>Running</span></li>
								<li><a id="BtnDisplayAll" runat="server" onserverclick="BtnDisplayAll_ServerClick">
									<img src="images/512Group.png" /></a><span>All_Tasks</span></li>
								<li><a id="BtnMyApproval" runat="server" onserverclick="BtnMyApproval_ServerClick">
									<img src="images/512User.png" /></a><span>My_Tasks</span></li>
								<li><a id="BtnRejected" runat="server" onserverclick="BtnRejected_ServerClick">
									<img src="images/512Burn.png" /></a><span>Rejected</span></li>
							</ul>
						</div>
					</div>
					<%-------------------------------------------------------------------------------------%>
					<asp:TextBox ID="TxtStatus" Visible="false" Text="" runat="server"></asp:TextBox>
					<%--------------------------------------------------------------------------------%>
					<div class="row-fluid sortable">
						<div class="box span12">
							<div class="box-header well">
								<h2><i class="icon-file"></i>Advance Approval</h2>
								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
									<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">

								<%----------------------------------------------------------------------------------%>
								<asp:GridView ID="GridviewAdvanceReq" AllowPaging="true" OnPageIndexChanging="GridviewAdvanceReq_PageIndexChanging" PageSize="20" ShowHeaderWhenEmpty="true" OnRowDataBound="GridviewAdvanceReq_RowDataBound" AutoGenerateColumns="false" OnDataBound="GridviewAdvanceReq_DataBound" OnRowCommand="GridviewAdvanceReq_RowCommand" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
									<EmptyDataTemplate>
										<a style="width: 100%; text-align: center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
											<span class="icon32 icon-color icon-user"></span>
											<div>You have no Records Assigned to you</div>
											<div>Use Options above to load all records</div>
											<span class="notification green">AMS</span>
										</a>
									</EmptyDataTemplate>
									<Columns>
										<asp:TemplateField>
											<ItemTemplate>
												<asp:ImageButton ID="imgGrid2" runat="server" Width="20px" Height="20px" OnClick="imgGrid2_Click"
													ImageUrl="~/Plus.ico" CommandArgument="Show" />
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField Visible="false" HeaderText="Request id">
											<ItemTemplate>
												<asp:Label ID="id" runat="server" Text='<%# Eval("Reqid") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderStyle-Width="100px">
											<ItemTemplate>
												<div class="btn-group" style="width: 90%">
													<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
													<ul class="dropdown-menu">
														<li><a id="BtnApprovers" runat="server" onserverclick="BtnApprovers_ServerClick">
															<img src="images/note_edit.png" width="30" height="30" />View Approvers</a></li>
														<li><a id="BtnCalendar" runat="server" onserverclick="BtnCalendar_ServerClick"><i class="icon32 icon-color icon-calendar"></i>View Payment Scheedule</a></li>

														<li><a id="BtnReassign" runat="server" onserverclick="BtnReassign_ServerClick1"><%--<i class="icon32 icon-color icon-replyall"></i>--%><img src="images/users2.png" width="30" height="30" />Reassign</a></li>
														<li><a id="BtnAdvReassign" runat="server" onserverclick="BtnAdvReassign_ServerClick">
															<img src="images/community_users.png" width="30" height="30" />Reassign (Group)</a></li>
														<li class="divider"></li>
														<li><a id="BtnUpdateRequest" runat="server" onserverclick="BtnUpdateRequest_ServerClick">
															<img src="images/calculator_256x256.png" width="30" height="30" />Adjust Amount</a></li>
														<li class="divider"></li>
														<li><a id="BtnApprove" runat="server" onserverclick="BtnApprove_ServerClick">
															<img src="images/accept.png" width="30" height="30" />Approve</a></li>
														<li><a id="BtnPayslips" runat="server" onserverclick="BtnPayslips_ServerClick">
															<img src="images/folder_full.png" width="30" height="30" />Download Payslip</a></li>
													</ul>
												</div>
											</ItemTemplate>
										</asp:TemplateField>
									
										<asp:TemplateField Visible="false" HeaderText="Balance">
											<ItemTemplate>
												<asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
												<asp:Label ID="lblEmployeeNumber" Visible="false" runat="server" Text='<%# Eval("Employee Number") %>'></asp:Label>
												<asp:Label ID="lblReqid" Visible="false" runat="server" Text='<%# Eval("Reqid") %>'></asp:Label>
												<asp:Label ID="level" Visible="false" runat="server" Text='<%# Eval("level") %>'></asp:Label>
												<asp:Label ID="lblStation" Visible="false" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<%--<asp:BoundField DataField="Employee Number" HeaderText="Employee Number" lblBalance/>--%>
										<asp:BoundField DataField="Rank" HeaderText="Rank" />
									
										<asp:BoundField DataField="First Name" HeaderText="First Name" />
										<asp:BoundField DataField="Last Name" HeaderText="Last Name" />
											<asp:TemplateField HeaderText="Assigned TO">
											<ItemTemplate>
													<i class="icon32 icon-black icon-user"></i>
												
												<span class="label label-info" style="background:#000">
													<asp:Label ID="lblAssignedTO" runat="server" Text='<%# Eval("AssignedTo") %>'></asp:Label></span>
			
												</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="Below 40%">
											<ItemTemplate>
												<asp:Label ID="lblBelow" Visible="true" runat="server" Text=""></asp:Label>
												<asp:Label ID="lblBelow40" Visible="false" runat="server" Text='<%# Eval("Below 40%") %>'></asp:Label>
												<asp:Label ID="lblDetails" Visible="false" runat="server" Text='<%# Eval("Details") %>'></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:TemplateField HeaderText="State" HeaderStyle-Width="150px">
											<ItemTemplate>
												<asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
												<asp:Label ID="lblDisplayState" runat="server" Text=""></asp:Label>
											</ItemTemplate>
										</asp:TemplateField>
										<asp:BoundField DataField="Current Salary" Visible="false" HeaderText="Current Salary" />
										<%--<asp:BoundField DataField="Advance Amount" HeaderText="Advance Amount" />--%>
					<asp:TemplateField HeaderText="<i class='icon icon-black icon-briefcase'></i>Advance Amount">
                <ItemTemplate>
          		<h4><asp:Label ID="lblAdvanceAmount" runat="server"  Text='<%# Eval("Advance Amount") %>'></asp:Label></h4>
		        </ItemTemplate>
             </asp:TemplateField>				
					<asp:TemplateField HeaderText="<i class='icon icon-black icon-date'></i>Duration (Months)">
                <ItemTemplate>
          		<h4><asp:Label ID="lblRecoveryDuration" runat="server"  Text='<%# Eval("Recovery Duration") %>'></asp:Label></h4>
		        </ItemTemplate>
             </asp:TemplateField>
										<%--<asp:BoundField DataField="Recovery Duration" HeaderText="Duration (Months)" />--%>
										<asp:TemplateField>
											<ItemTemplate>
												<tr>
													<td colspan="12">
														<asp:Panel ID="Panel1" runat="server" Visible="false" Style="box-shadow: 0 0 20px rgba(0,0,0,0.8);">
															<div class="row-fluid sortable">
																<div class="box span12">
																	<div class="box-header well">
																		<h2>ADVANCE DETAILS</h2>
																		<div class="box-icon">
																			<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
																			<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
																			<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
																		</div>
																	</div>
																	<div class="box-content ">
				<ajaxToolkit:TabContainer ID="TabContainer1"  ForeColor="Black" runat="server" ActiveTabIndex="0" VerticalStripWidth="200px" UseVerticalStripPlacement="true" Width="100%">
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel1">
				<HeaderTemplate>
				
					  REQUEST DETAILS            
					 
				</HeaderTemplate>
				<ContentTemplate>
				<uc1:EmployeeDetails runat="server" ID="EmployeeDetails" />
				<uc1:SalaryDetails runat="server" ID="SalaryDetails" />
				<uc1:AdvanceDetails runat="server" ID="AdvanceDetails" />
				</ContentTemplate>			
			</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel2">
				<HeaderTemplate>
					  
					 OUTSTANDING ADVANCES      
				</HeaderTemplate>
				<ContentTemplate>
								<uc1:OutstandingAdvance runat="server" ID="OutstandingAdvance" />
											</ContentTemplate>						
			</ajaxToolkit:TabPanel>
					<ajaxToolkit:TabPanel ID="TabPanel3" runat="server">
						<HeaderTemplate>
					  
					 SUBMITTED PAYSLIPS          
				</HeaderTemplate>
				<ContentTemplate>
						<asp:Label ID="LblImages" runat="server" Text=""></asp:Label>
															
				</ContentTemplate>
			</ajaxToolkit:TabPanel>
							<ajaxToolkit:TabPanel runat="server" ID="TabPanel4">
					<HeaderTemplate>
					ADVANCE HISTORY    	  
				       
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:History runat="server" ID="History" />
											</ContentTemplate>						
			</ajaxToolkit:TabPanel>
						<ajaxToolkit:TabPanel runat="server" ID="TabPanel5">
					<HeaderTemplate>
					DEDUCTIONS    	  
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:CashPayments runat="server" id="CashPayments" />	
					<uc1:Deductions runat="server" id="Deductions" />
					</ContentTemplate>						
			</ajaxToolkit:TabPanel>
		</ajaxToolkit:TabContainer>
																		<%--------------------------------------------------------------------------%>
																		<%--<div class="panel panel-default tabs">
																			<ul class="nav nav-tabs" role="tablist">
																				<li><a href="#Req" runat="server" id="A1" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-doc"></i>REQUEST DETAILS</a></li>

																				<li><a href="#first" runat="server" id="tab1" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-doc"></i>OUTSTANDING ADVANCE</a></li>
																				<li><a href="#second" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-briefcase"></i>PAYSLIP</a></li>
																				<li><a href="#third" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-image"></i>HISTORY</a></li>

																			</ul>

																			<div class="panel-body tab-content">
																				<div class="tab-pane active" id="Req">
		
																				</div>
																				<div class="tab-pane" id="first">
																				</div>
																				<div class="tab-pane" id="second">
																					<div class="row-fluid sortable">
																						<div class="box span11">
																							<div class="box-header well">
																								<h2>PAYSLIP</h2>
																								<div class="box-icon">
																									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
																									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
																									<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
																								</div>
																							</div>
																							<div class="box-content">
																								<asp:Label ID="LblImages" runat="server" Text=""></asp:Label>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="tab-pane" id="third">
																				</div>
																			</div>
																		</div>--%>
																	</div>
																</div>
														</asp:Panel>
													</td>
												</tr>

											</ItemTemplate>
										</asp:TemplateField>

									</Columns>
								</asp:GridView>

							</div>
						</div>
						<!--/span-->

					</div>

				</div>
				<%--------------------MODAL APPROVERS LIST---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalApprove"></a>
				<div class="popup" style="width: 40%">
					<h2>Approve Section</h2>
					<p>Comments below</p>
					<div style="max-height: 300px; width: 100%; overflow: auto">
						<asp:Label ID="lblComments" runat="server" Text=""></asp:Label>
					</div>	
					<p>COMMENTS</p>
					<asp:TextBox ID="TxtReject" TextMode="MultiLine" ForeColor="Black" BackColor="white" Height="100px" placeholder="Type Comments..." Visible="true" Width="100%" runat="server"></asp:TextBox>
					<br />
					<hr />
					<a class="btn btn-success" runat="server" onserverclick="BtnApprove_ServerClick1" id="BtnApprove">
						<i class="icon-ok icon-white"></i>
						APPROVE                                           
					</a>

					
					<a class="btn btn-danger" href="#ModalReject" id="BtnReject">
						<i class="icon icon-white icon-cross"></i>
						REJECT                                       
					</a>
					<a class="btn btn-warning" href="#ModalTerminate" runat="server" id="A2">
						<i class="icon-remove icon-white"></i>
						TERMINATE                                       
					</a>
					<a class="btn btn-info" runat="server" id="BtnReassign" onserverclick="BtnReassign_ServerClick3">
						<i class="icon-user icon-white"></i>
						REASSIGN                                    
					</a>
					<a class="close" href="#close"></a>
				</div>
				<%--------------------------MODAL SEARCH-----------------------------------%>

				<a href="#x" class="overlay" runat="server" id="ModaleEmployeeNumber"></a>
				<div class="popup">
					<h3>Search</h3>
					<div class="control-group">
						<label class="control-label" for="appendedInputButton">Search for employee using employee Number</label>
						<div class="controls">
							<div class="input-append">
								<asp:TextBox ID="TxtEmployeeNumber" placeholder="Employee Number" runat="server"></asp:TextBox>
								<button class="btn" id="BtnFilter" runat="server" onserverclick="BtnFilter_ServerClick" type="button">Search</button>
							</div>
						</div>
					</div>
					<a class="close" href="#close"></a>
				</div>
				<%--------------------MODAL REJECT---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalReject"></a>
				<div class="popup">
					<h2>REJECT</h2>
					<br />
					Please state your reason for the reject
		      	<br />
					<asp:TextBox ID="txtComments" TextMode="MultiLine" ForeColor="Black" BackColor="white" Height="200px" placeholder="Type Comments..." Visible="true" Width="500px" runat="server"></asp:TextBox>
					
					<a class="btn btn-danger" runat="server" onserverclick="BtnReqReject_ServerClick" id="BtnReqReject">
						<i class="icon icon-white icon-cross"></i>
						REJECT                                       
									</a>
					<a class="close" href="#close"></a>
				</div>
					<%--------------------MODAL MODALTERMINATE---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalTerminate"></a>
				<div class="popup">
					<h2>TERMINATE</h2>
					<br />
					Please state your reason for Terminating this request
		      	<br />
					<asp:TextBox ID="txtTerminateComments" TextMode="MultiLine" ForeColor="Black" BackColor="white" Height="100px" placeholder="Type Comments..." Visible="true" Width="100%" runat="server"></asp:TextBox>
					
					<a class="btn btn-danger" runat="server" onserverclick="BtnTerminate_ServerClick" id="BtnTerminate">
						<i class="icon icon-white icon-cross"></i>
						TERMINATE                                       
									</a>
					<a class="close" href="#close"></a>
				</div>
				<%--------------------MODAL ASSIGNED---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalDet"></a>
				<div class="popup">
					<h2>DETAILS</h2>
					<div style="max-height: 400px; overflow: auto">
						<asp:GridView ID="GridViewDetails" EmptyDataText="NO Data found" Width="100%" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
						</asp:GridView>
					</div>
					<a class="close" href="#close"></a>
				</div>
				<%--------------------MODAL ASSIGNED---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalUsers"></a>
				<div class="popup">
					<h2>SEND TASK TO</h2>
					<br />
					Please select who the task should be sent to
            <br />
					<div style="max-height: 400px; overflow: auto">
						<asp:GridView ID="GridViewUsers"  EmptyDataText="NO USER FOUND" Width="400px" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
							<Columns>
								<asp:TemplateField HeaderText="">
									<ItemTemplate>
										<asp:Button ID="BtnUser" ClientIDMode="Static" OnClick="BtnUser_Click" Width="100%" CssClass="btn btn-success" Text="Select" runat="server"></asp:Button>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Active Directory" Visible="false">
									<ItemTemplate>
										<asp:Label ID="User" runat="server" Text='<%# Eval("User") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Name" Visible="True">
									<ItemTemplate>
										<asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Email" Visible="True">
									<ItemTemplate>
										<asp:Label ID="Email" Visible="false" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Section" Visible="True">
									<ItemTemplate>
										<asp:Label ID="Section" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Station" Visible="true">
									<ItemTemplate>
										<asp:Label ID="Location" runat="server" Text='<%# Eval("Location") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Station Code" Visible="true">
									<ItemTemplate>
										<asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Role" Visible="false">
									<ItemTemplate>
										<asp:Label ID="Role" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Position" Visible="true">
									<ItemTemplate>
										<asp:Label ID="Position" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
							</Columns>
						</asp:GridView>
					</div>
					<a class="close" href="#close"></a>
				</div>
				<%-------------------------------------------------------------%>

				<%--------------------MODAL FILES LIST---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalFile"></a>
				<div class="popup">
					<h2>Download Payslip</h2>
					<asp:GridView ID="GridViewFiles" AutoGenerateColumns="false" EmptyDataText="No Records Found" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
						<Columns>
							<asp:TemplateField HeaderStyle-Width="100px">
								<ItemTemplate>
									<div class="btn-group" style="width: 90%">
										<a id="BtnDownload" class="btn btn-primary" runat="server" onserverclick="BtnDownload_ServerClick"><i class="icon-download-alt"></i>Download</a>
									</div>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Files">
								<ItemTemplate>
									<img src="images/briefcase_256x256.png" width="40" height="40" alt="Briefcase" /><asp:Label ID="TxtImageName" runat="server" Text='<%# Eval("ImageName") %>'></asp:Label>
									<asp:Label ID="lblExt" Visible="false" runat="server" Text='<%# Eval("extension") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
					<a class="close" href="#close"></a>
				</div>
				<%-------------------------------------------------------------%>


				<%--------------------MODAL APPROVERS LIST---------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="ModalApprovers"></a>
				<div class="popup">
					<h2>List Of Approvers</h2>
					<asp:GridView ID="GridViewApprovers" AutoGenerateColumns="false" EmptyDataText="No Records Found" CssClass="table table-striped table-bordered bootstrap-datatable datatable" OnRowDataBound="GridViewApprovers_RowDataBound" runat="server">
						<Columns>
							<asp:BoundField HeaderText="Event Date" DataField="Date" />
							<asp:BoundField HeaderText="Approved By" DataField="Approved By" />
							<asp:TemplateField HeaderText="Outcome">
								<ItemTemplate>
									<asp:Label ID="lblApproved" runat="server" Text=""></asp:Label>
									<asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Approved") %>'></asp:Label>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField HeaderText="Comments" DataField="Reason" />
						</Columns>
					</asp:GridView>
					<a class="close" href="#close"></a>
				</div>
				<%-------------------------------------------------------------%>
				<hr>
				<footer>
					<p class="pull-left">
						&copy; Powered by esnagen software 201
					  <asp:TextBox ID="txtstation" Visible="false" runat="server"></asp:TextBox>
						<asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
						<asp:TextBox ID="txtlevel" Text="0" Visible="false" runat="server"></asp:TextBox>
						<asp:TextBox ID="TxtDetails" Visible="false" runat="server"></asp:TextBox>
						<asp:TextBox ID="txtClickedOption" Text="0" Visible="false" runat="server"></asp:TextBox>
						<asp:TextBox ID="lblAssigned" runat="server" Visible="false"></asp:TextBox>
				</footer>
			</div>
		</div>
		<script src="js/charisma.js"></script>
		<script src="js/modernizr.custom.04022.js"></script>
		<script>
			window.onbeforeunload = function (evt) {
  var message = 'Are you sure you want to leave?';
  if (typeof evt == 'undefined') {
    evt = window.event;
  }
  if (evt) {
    evt.returnValue = message;
  }
  return message;
}
		</script>
		<%--	<script>
				$(document).ready(function () {
					var tbl = document.getElementById('<%=GridViewUsers.ClientID%>');
					for (var i = 0; i < tbl.rows; i++) {
						var btnid = tbl.root[i].cells[0].id
						$("#"+btnid).click(function () {
							$("#" + btnid).attr("disabled", true);
							$("#" + btnid).css('visibility:hidden;');
							$("#" + btnid).remove();
							$("#Loading").css('visibility:visible;');
							var newURLString = window.location.href + '#LoadinBar';
							window.location.href = newURLString.replace('#ModalLogin', '');
						});
					}
				});
		</script>--%>
		<script type="text/javascript"> 
			function load() {
				Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jsFunctions);
			}
			function jsFunctions() {
				$('.thumbnails').on('click', '.gallery-delete', function (e) {
					e.preventDefault();
					$(this).parents('.thumbnail').fadeOut();
				});
				//gallery edit
				$('.thumbnails').on('click', '.gallery-edit', function (e) {
					e.preventDefault();
					//get image id
					//alert($(this).parents('.thumbnail').attr('id'));
				});

				//gallery colorbox
				$('.thumbnail a').colorbox({ rel: 'thumbnail a', transition: "elastic", maxWidth: "95%", maxHeight: "95%" });

				//gallery fullscreen
				$('#toggle-fullscreen').button().click(function () {
					var button = $(this), root = document.documentElement;
					if (!button.hasClass('active')) {
						$('#thumbnails').addClass('modal-fullscreen');
						if (root.webkitRequestFullScreen) {
							root.webkitRequestFullScreen(
								window.Element.ALLOW_KEYBOARD_INPUT
							);
						} else if (root.mozRequestFullScreen) {
							root.mozRequestFullScreen();
						}
					} else {
						$('#thumbnails').removeClass('modal-fullscreen');
						(document.webkitCancelFullScreen ||
							document.mozCancelFullScreen ||
							$.noop).apply(document);
					}
				});
			}
		</script>
	</form>
</body>
</html>
