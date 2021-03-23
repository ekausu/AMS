<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceVoucherRecs.aspx.cs" Inherits="AdvanceSystem.AdvanceVoucherRecs" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>

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
               <div class="dock" style="margin-left:35%">
<ul style="background:none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
     <li>
         <a id="BtnFind" href="#ModalSearch">
       <img src="images/Loupe.png" /></a><span>Search</span>
     </li>
      <li><a id="BtnDates" href="#ModaDate">
         <img src="images/korgac.png" /></a><span>Dates</span>
      </li>
     <li><a id="BtnRepeat" runat="server" onserverclick="BtnRepeat_ServerClick">
         <img src="images/repeat.png" /></a><span>Reload</span>
      </li>
</ul>
</div>       
 </div>
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>VOUCHER RECEIPTS RECORDS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">

<img src="images/briefcase_256x256.png" width="100" height="100"/>
<h2 style="margin-left:30%">VOUCHER RECEIPT RECORDS</h2>
                           <asp:GridView ID="GridviewVoucherReceipts" PageSize="50" AllowPaging="true" OnPageIndexChanging="GridviewVoucherReceipts_PageIndexChanging" ShowHeaderWhenEmpty="true" EmptyDataText="" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered bootstrap-datatable datatable"  runat="server">
                               <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>No RECEIPT RECORDS</div>
					<div>Use Options above</div>
					<span class="notification green">RECEIPTS</span>
				</a>
                               </EmptyDataTemplate>
                               <Columns>
                                         
                    
                                        <asp:TemplateField Visible="false" HeaderText="Request id" >
              <ItemTemplate>
                <asp:Label ID="id" runat="server"  Text='<%# Eval("Reqid") %>'></asp:Label>
                </ItemTemplate>

             </asp:TemplateField> 
             <asp:TemplateField>
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-info dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list icon-white"></i>Options</button>
							<ul class="dropdown-menu">
                                <li><a id="BtnGenerate" runat="server" onserverclick="BtnGenerate_ServerClick"><img src="images/invoice_256x256.png" width="30" height="30" />View Voucher</a></li>
							 </ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
								   	<asp:TemplateField HeaderText="Date">
														<ItemTemplate>
															<asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date", "{0:dd/MMM/yyyy}") %>'></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
					 <%--<asp:TemplateField HeaderText="Date" >
                <ItemTemplate>
                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>--%> 
                <asp:TemplateField HeaderText="Employee Number" >
                <ItemTemplate>
                    <asp:Label ID="lblEmployeeNumber" runat="server" Text='<%# Eval("Employee Number") %>'></asp:Label>
                     <asp:Label ID="lblReqid" Visible="false" runat="server" Text='<%# Eval("Reqid") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								   <asp:BoundField DataField="First Name" HeaderText="First Name" />
								    <asp:BoundField DataField="Last Name" HeaderText="Last Name" />
	<asp:BoundField DataField="Rank" HeaderText="Rank" />
      <asp:BoundField DataField="Section" HeaderText="Section" />
 
								    <%--<asp:BoundField DataField="Entered by" HeaderText="Section" />--%>
								    <asp:BoundField DataField="Advance Amount" HeaderText="Advance Amount" />
								    <asp:BoundField DataField="Recovery Duration" HeaderText="Duration" />
								    <asp:BoundField DataField="Current Salary" Visible="false" HeaderText="Salary" />
								    <asp:BoundField DataField="Reason" HeaderText="Reason" />
								    <%-- <asp:TemplateField HeaderText="Entered By" >
                <ItemTemplate>
                       <asp:Label ID="lblEnteredBy" runat="server" Text='<%# Eval("Entered By") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								        <asp:TemplateField HeaderText="Paid By" >
                <ItemTemplate>
                       <asp:Label ID="lblPaidBy" runat="server" Text='<%# Eval("PaidBy") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								     <asp:TemplateField HeaderText="Balance" >
                <ItemTemplate>
                       <asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								    <asp:TemplateField HeaderText="Amount Paid" >
                <ItemTemplate>
                       <asp:Label ID="lblAmountPaid" runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
	          <asp:TemplateField HeaderText="New Balance" >
                <ItemTemplate>
                       <asp:Label ID="lblNewBalance" runat="server" Text='<%# Eval("New Balance") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
								    <asp:TemplateField HeaderText="Entered Date" >
                <ItemTemplate>
                    <asp:Label ID="lblEntryDate" runat="server" Text='<%# Eval("Entry Date") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> --%>

                                     </Columns>
                               </asp:GridView>
                  
					</div>
				</div><!--/span-->
                  
                        </div>
         
            </div>
                      <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalSearch"></a>
        <div class="popup">
            <h2>Search</h2>
			<h4>Search by employee number?</h4>
			 <div class="control-group">
								<div class="controls">
								  <div class="input-append">
									  <asp:TextBox ID="TxtEmployeeNo" runat="server"></asp:TextBox>
									      <a id="BtnSearch" class="btn btn-primary" runat="server" onserverclick="BtnSearch_ServerClick"><i class="icon-search"></i>Search</a>
								  </div>
								</div>
							  </div>

			
							   
              <a class="close" href="#close"></a>
        </div>
				                <%--------------------MODAL SEARCH DATE---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModaDate"></a>
        <div class="popup">
            <h2>Search</h2>
			<h4>Search by date?</h4>
			 <div class="control-group">
								<div class="controls">
								  <div class="input-append">
									  <asp:TextBox ID="TxtDatefrm" placeholder="Date from" runat="server"></asp:TextBox>
									           <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="TxtDatefrm" TodaysDateFormat="MM-dd-yyyy:HH:mm:ss" />
					  
									  <asp:TextBox ID="TxtDateTo" placeholder="Date To" runat="server"></asp:TextBox>
								         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="TxtDateTo" TodaysDateFormat="MM-dd-yyyy:HH:mm:ss" />
				
									      <a id="BtnSearch2" class="btn btn-primary" runat="server" onserverclick="BtnSearch2_ServerClick"><i class="icon-search"></i>Search</a>
								  </div>
								</div>
							  </div>

			
							   
              <a class="close" href="#close"></a>
        </div>
        <%-------------------------------------------------------------%>
           
   
        <%-------------------------------------------------------------%>
           
            <hr>

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
				  <asp:TextBox ID="TxtButtonEvent" Visible="false" runat="server"></asp:TextBox>
									
            </footer>
                </div>
        </div>
        
  <script src="js/Cha.js"></script>        
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
