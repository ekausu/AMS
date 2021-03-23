<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProfileControl.ascx.cs" Inherits="AdvanceSystem.RequestDetails.ProfileControl" %>
<%@ Register Src="~/RequestDetails/UserSummary.ascx" TagPrefix="uc1" TagName="UserSummary" %>
<%@ Register Src="~/RequestDetails/Pie_Balance.ascx" TagPrefix="uc1" TagName="Pie_Balance" %>
<%@ Register Src="~/RequestDetails/CompletionSummary.ascx" TagPrefix="uc1" TagName="CompletionSummary" %>
<%@ Register Src="~/RequestDetails/3D_ChartWithNulls.ascx" TagPrefix="uc1" TagName="D_ChartWithNulls" %>
<%@ Register Src="~/RequestDetails/OutstandingAdvance.ascx" TagPrefix="uc1" TagName="OutstandingAdvance" %>
<%@ Register Src="~/RequestDetails/History.ascx" TagPrefix="uc1" TagName="History" %>







<div class="row-fluid sortable">
				<div class="span12">
					<div class="span4 sortable">
			<uc1:UserSummary runat="server" id="UserSummary" />
					<uc1:Pie_Balance runat="server" id="Pie_Balance" />
				</div>
					<uc1:D_ChartWithNulls runat="server" id="D_ChartWithNulls" />
<uc1:CompletionSummary runat="server" id="CompletionSummary" />
					<div class="box span8">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 12</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content" style="height:500px">
						<uc1:OutstandingAdvance runat="server" ID="OutstandingAdvance" />
						<uc1:History runat="server" ID="History" />
              		<%--<ajaxToolkit:TabContainer ID="TabContainer1"  ForeColor="Black" runat="server" ActiveTabIndex="0" VerticalStripWidth="200px" UseVerticalStripPlacement="true" Width="100%">
			
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel2">
				<HeaderTemplate>
					  
					 OUTSTANDING ADVANCES      
					<i class="icon icon-blue icon-briefcase"></i>
				</HeaderTemplate>
				<ContentTemplate>
								
											</ContentTemplate>						
			</ajaxToolkit:TabPanel>			
					<ajaxToolkit:TabPanel runat="server" ID="TabPanel4">
					<HeaderTemplate>
					ADVANCE HISTORY    	  
						<i class="icon icon-blue icon-briefcase"></i>	       
				</HeaderTemplate>
				<ContentTemplate>
					
				</ContentTemplate>						
			</ajaxToolkit:TabPanel>
		</ajaxToolkit:TabContainer>--%>                 
                  </div>
						</div>
				</div>
			
			</div>
		<%--	
			<div class="row-fluid sortable">
			
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 3</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 3</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h2>Plain</h2>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span6">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 6</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span6">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 6</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div>
			<div class="row-fluid sortable">
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
				
				<div class="box span4">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid">
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                        <div class="span4"><h6>span 4</h6></div>
                    </div>                   
                  </div>
				</div><!--/span-->
			</div>--%>
			