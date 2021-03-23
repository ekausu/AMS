<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsSection.aspx.cs" Inherits="AdvanceSystem.AccountsSection" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/RequestDetails/VoucherDetails.ascx" TagPrefix="uc1" TagName="VoucherDetails" %>
<%@ Register Src="~/RequestDetails/Voucher.ascx" TagPrefix="uc1" TagName="Voucher" %>
<%@ Register Src="~/RequestDetails/History.ascx" TagPrefix="uc1" TagName="History" %>
<%@ Register Src="~/RequestDetails/AdvanceDetails.ascx" TagPrefix="uc1" TagName="AdvanceDetails" %>
<%@ Register Src="~/RequestDetails/OutstandingAdvance.ascx" TagPrefix="uc1" TagName="OutstandingAdvance" %>
<%@ Register Src="~/RequestDetails/ImageAttachments.ascx" TagPrefix="uc1" TagName="ImageAttachments" %>







<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
    <meta charset="utf-8">
    <title>AMS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <link rel="shortcut icon" href="img/Device-blockdevice-cubes.ico">
    <style>
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
            /*text-align:center;*/
            font-size: 24px;
            font-weight: bold;
            /*padding:10px;*/
            text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
            /*border: 1px solid rgba(0,0,0,0.5);
	border-bottom: 3px solid rgba(0,0,0,0.5);*/
            /*-webkit-border-radius: 3px;
	-moz-border-radius: 3px;*/
            /*border-radius: 3px;*/
            background: rgba(0,0,0,0.25);
            -o-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            -webkit-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            -moz-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            box-shadow: 0 2px 8px rgba(0,0,0,0.5), /* Exterior Shadow */
            inset 0 1px rgba(255,255,255,0.3), /* Top light Line */
            inset 0 10px rgba(255,255,255,0.2), /* Top Light Shadow */
            inset 0 10px 20px rgba(255,255,255,0.25), /* Sides Light Shadow */
            inset 0 -15px 30px rgba(0,0,0,0.3); /* Dark Background */
            /*margin: 40px;*/
            /*display: inline-block;*/
            text-decoration: none;
        }
    </style>

    </head>

<body onload="load()" >
    <form runat="server" id="form1" enctype="multipart/form-data" method = "post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <uc1:StyleBox runat="server" id="StyleBox" />
        <uc1:TopBar runat="server" id="TopBar" />
        <!-- topbar ends -->
        <div class="container-fluid">
                      
<%--------------------------------------------------------------------------------------------------------------------------------------%>
            <div class="row-fluid">
                <%--<asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>--%>

                <uc1:MainMenu runat="server" ID="MainMenu" />
                <!-- left menu ends -->

                <div id="content" class="span10">
					<uc1:BreadCrumb runat="server" ID="BreadCrumb" />
                    <!-- content starts -->
                       <div class="block-area shortcut-area" id="BtnMenu" runat="server">                      
               <div class="dock" style="margin-left:25%">
<ul style="background:none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
      <li><a id="BtnSearch" runat="server" href="#ModaleEmployeeNumber">
				 <img src="images/Loupe.png" /></a><span>Search</span></li>		 
	<li>
         <a id="BtnAwaitingVoucher" onserverclick="BtnUndergoingRecovery_ServerClick" runat="server">
       <img src="images/money_256x256.png" /></a><span>Running</span></li>
      <li><a id="BtnUndergoingRecovery" runat="server" onserverclick="BtnAwaitingVoucher_ServerClick">
         <img src="images/512Group.png" /></a><span>All_Tasks</span></li>
		<%--<li><a id="BtnDisplayAll" runat="server" onserverclick="BtnDisplayAll_ServerClick1">
									<img src="images/512Group.png" /></a><span>All</span></li>--%>
								<li><a id="BtnMyApproval" runat="server" onserverclick="BtnMyApproval_ServerClick">
									<img src="images/512User.png" /></a><span>My_Task</span></li>
     <li><a id="BtnCompleted" runat="server" onserverclick="BtnCompleted_ServerClick">
         <img src="images/512Documents.png" /></a><span>Completed</span></li>

 
</ul>
</div>       
 </div>
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>ACCOUNTS VOUCHER SECTION</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
<h1><asp:Label ID="lblTitle" runat="server" Text="Awaiting Vouchers"></asp:Label></h1>
                           <asp:GridView ID="GridviewVoucherRequest" PageSize="20" AllowPaging="true" OnPageIndexChanging="GridviewVoucherRequest_PageIndexChanging" ShowHeaderWhenEmpty="true" EmptyDataText="" OnRowDataBound="GridviewVoucherRequest_RowDataBound1" AutoGenerateColumns="false" OnDataBound="GridviewVoucherRequest_DataBound" OnRowCommand="GridviewVoucherRequest_RowCommand"  CssClass="table table-striped table-bordered bootstrap-datatable datatable"  runat="server">
                               <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>No Records</div>
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
                                        <asp:TemplateField Visible="false" HeaderText="Request id" >
              <ItemTemplate>
                <asp:Label ID="id" runat="server"  Text='<%# Eval("Reqid") %>'></asp:Label>
                </ItemTemplate>

             </asp:TemplateField> 
                                             <asp:TemplateField>
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-success dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list icon-white"></i>Options</button>
							<ul class="dropdown-menu">
                                <li><a id="BtnApprovers" runat="server" onserverclick="BtnApprovers_ServerClick"><i class="icon32 icon-color icon-clipboard"></i>View Approvers</a></li>
								<li><a id="BtnGenerateVoucher" runat="server" onserverclick="BtnGenerateVoucher_ServerClick"><i class="icon32 icon-color icon-doc"></i>New Voucher</a></li>
							    <li><a id="BtnPrintVoucher" runat="server" onserverclick="BtnPrintVoucher_ServerClick"><i class="icon32 icon-color icon-print"></i>Print Voucher</a></li>
						        <li><%--<a id="BtnCashReceipt" runat="server" onserverclick="BtnCashReceipt_ServerClick"><i class="icon32 icon-color icon-document"></i>View Client Payment Receipt</a>--%></li>
					          <li><a id="BtnPayslips" runat="server" onserverclick="BtnPayslips_ServerClick"><i class="icon32 icon-color icon-folder-open"></i>Download Payslip</a></li>
					
								</ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
                <asp:TemplateField HeaderText="Employee Number" >
                <ItemTemplate>
                    <asp:Label ID="lblEmployeeNumber" runat="server" Text='<%# Eval("Employee Number") %>'></asp:Label>
                     <asp:Label ID="lblReqid" Visible="false" runat="server" Text='<%# Eval("Reqid") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 

                   
								     <asp:TemplateField HeaderText="Name" >
                <ItemTemplate>
                       <asp:Label ID="lblfname" runat="server" Text='<%# Eval("First Name") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								     <asp:TemplateField HeaderText="Surname" >
                <ItemTemplate>
                       <asp:Label ID="lbllname" runat="server" Text='<%# Eval("Last Name") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								   	<asp:TemplateField HeaderText="Assigned TO">
											<ItemTemplate>
													<i class="icon32 icon-black icon-user"></i>
												<span class="label label-info" style="background:#000">
													<asp:Label ID="lblAssignedTO" runat="server" Text='<%# Eval("AssignedTo") %>'></asp:Label></span>
			
												</ItemTemplate>
										</asp:TemplateField>
                 <%--<asp:BoundField DataField="Employee Number" HeaderText="Employee Number" />--%>
             <%--    <asp:BoundField DataField="First Name" HeaderText="First Name" />
                <asp:BoundField DataField="Last Name" HeaderText="Last Name" />--%>
               <asp:BoundField DataField="Rank" HeaderText="Rank" />
      <asp:BoundField DataField="Section" HeaderText="Section" />
            <asp:TemplateField HeaderText="Status" >
                <ItemTemplate>
                    <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
                           <asp:Label ID="level" Visible="false" runat="server" Text='<%# Eval("level") %>'></asp:Label>
              
					<asp:Label ID="lblDisplayState" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
             </asp:TemplateField> 
     <%--<asp:BoundField DataField="Current Salary" HeaderText="Current Salary" />--%>
    <asp:TemplateField HeaderText="Advance Amount" >
                <ItemTemplate>
                       <asp:Label ID="lbladvanceamount" runat="server" Text='<%# Eval("Advance Amount") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
					 <asp:TemplateField HeaderText="Balance" Visible="false" >
                <ItemTemplate>
                       <asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
     <asp:BoundField DataField="Recovery Duration" HeaderText="Duration" />
               <asp:TemplateField>
               <ItemTemplate>
                 <tr>
                 <td colspan="12">
                <asp:Panel ID="Panel1" runat="server" Visible="false" Style=" box-shadow: 0 0 20px rgba(0,0,0,0.8);">
			
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
					  VOUCHER         
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:Voucher runat="server" ID="Voucher" />
			  </ContentTemplate>
				</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel2">
				<HeaderTemplate>
					  OUTSTANDING ADVANCE           
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:OutstandingAdvance runat="server" ID="OutstandingAdvance" />
			  </ContentTemplate>
				</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel3">
				<HeaderTemplate>
					 PAYSLIPS      
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:ImageAttachments runat="server" id="ImageAttachments" />
			  </ContentTemplate>
				</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel4">
				<HeaderTemplate>
					  HISTORY        
				</HeaderTemplate>
				<ContentTemplate>
					<uc1:History runat="server" ID="History" />
			  </ContentTemplate>
				</ajaxToolkit:TabPanel>
			</ajaxToolkit:TabContainer>
                               
                            
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
				</div><!--/span-->
                  
                        </div>
         
            </div>
                               <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <%--<a href="#x" class="overlay" runat="server" id="A1"></a>--%>
        <%--<div class="popup">
            <h2>List Of Approvers</h2>
            <asp:GridView ID="GridView1" AutoGenerateColumns="false" EmptyDataText="No Records Found" CssClass="table table-striped table-bordered bootstrap-datatable datatable" OnRowDataBound="GridView1_RowDataBound" runat="server">
                <Columns>
                     <asp:BoundField HeaderText="Event Date" DataField="Date" />
                    <asp:BoundField HeaderText="Approved By" DataField="Approved By" />
                      <asp:TemplateField HeaderText="Outcome" >

                <ItemTemplate>
                   <asp:Label ID="lblApproved" runat="server" Text=""></asp:Label>
                   <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Approved") %>'></asp:Label>
              
                </ItemTemplate>
             </asp:TemplateField>
                     <asp:BoundField HeaderText="Comments" DataField="Reason" />
                </Columns>
            </asp:GridView>
              <a class="close" href="#close"></a>
        </div>--%>
        <%-------------------------------------------------------------%>
			         <%--------------------MODAL ASSIGNED---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalDet"></a>
        <div class="popup">
            <h2>DETAILS</h2>
             <asp:GridView ID="GridViewDetails" EmptyDataText="NO Data found" Width="100%"  CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
                   </asp:GridView>
        
              <a class="close" href="#close"></a>
        </div>
				     <%--------------------MODAL FILES LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalFile"></a>
        <div class="popup">
            <h2>Download Payslip</h2>
           <asp:GridView ID="GridViewFiles" AutoGenerateColumns="false" EmptyDataText="No Records Found" CssClass="table table-striped table-bordered bootstrap-datatable datatable"  runat="server">
                <Columns>
                     <asp:TemplateField HeaderStyle-Width="100px">
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<%--<button class="btn btn-primary dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>--%>
						       <a id="BtnDownload" class="btn btn-primary" runat="server" onserverclick="BtnDownload_ServerClick"><i class="icon-download-alt"></i>Download</a>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
                       <asp:TemplateField HeaderText="Files" >
                <ItemTemplate>
                             <img src="images/briefcase_256x256.png" width="40" height="40" alt="Briefcase" /><asp:Label ID="TxtImageName" runat="server" Text='<%# Eval("ImageName") %>'></asp:Label>
                    <asp:Label ID="lblExt" Visible="false" runat="server" Text='<%# Eval("extension") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
                </Columns>
            </asp:GridView>
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
									<asp:TextBox ID="TxtEmployeeNumber" placeholder="Employee Number" runat="server"></asp:TextBox><button class="btn" id="BtnFilter" runat="server" onserverclick="BtnFilter_ServerClick" type="button">Search</button>
								  </div>
								</div>
							  </div>
              <a class="close" href="#close"></a>
        </div>
                      
           
                 
                <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalApprovers"></a>
        <div class="popup">
            <h2>List Of Approvers</h2>
            <asp:GridView ID="GridViewApprovers" AutoGenerateColumns="false" EmptyDataText="No Records Found" CssClass="table table-striped table-bordered bootstrap-datatable datatable" OnRowDataBound="GridViewApprovers_RowDataBound" runat="server">
                <Columns>
                     <asp:BoundField HeaderText="Approved Date" DataField="Date" />
                    <asp:BoundField HeaderText="Approved By" DataField="Approved By" />
                      <asp:TemplateField HeaderText="Outcome" >
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
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
					<asp:TextBox ID="txtClickedOption" Visible="false" runat="server"></asp:TextBox>
            
            </footer>
                
               <%--     </ContentTemplate>
                </asp:UpdatePanel>--%>
                </div>
        </div>
        
  <script src="js/Cha.js"></script>
 <%-- <script src="js/charisma.js"></script>--%>
        
        <script type="text/javascript" src="js/fileinput.min.js"></script>       
         
       
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
