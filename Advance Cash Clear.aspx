<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advance Cash Clear.aspx.cs" Inherits="AdvanceSystem.Advance_Cash_Clear" %>

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
              <%--          <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>--%>
<%--------------------------------------------------------------------------------------------------------------------------------------%>
            <div class="row-fluid">
              <%--  <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>--%>

                <uc1:MainMenu runat="server" ID="MainMenu" />
                <!-- left menu ends -->

                <div id="content" class="span10">
                    <!-- content starts -->
                    <uc1:BreadCrumb runat="server" ID="BreadCrumb" />
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>BASE FUNDING SECTION</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                          <%-- <asp:GridView ID="GridViewFund" OnRowDeleting="GridViewFund_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewFund_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">--%>
                       
 <div class="block-100" style="margin-bottom:150px">
     <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
     <h2>ADVANCE CASH CLEARING</h2>
    <br />
      <div class="top-row">
                                                    <div class="field-wrap">
                                                        <label>
                                                          Payment Date
                                                        </label>
                                                        <asp:TextBox Width="100%" ID="TxtDate" CssClass="input-xlarge datepicker" Visible="true" runat="server"></asp:TextBox>

                                                    </div>
                                                    <div class="field-wrap">
                                                        <label>
                                                           Entered by
                                                        </label>
                                                            <asp:TextBox ID="TxtEnteredby" Visible="true" runat="server"></asp:TextBox>
                                                    </div>
          </div>

                                    <div class="top-row" style="margin-bottom:10px !important">
                                                    <div class="field-wrap">
                                                        <label>
                                                          Payment for Employee Number
                                                        </label>
                                                            <asp:TextBox ID="TxtENumber" OnTextChanged="TxtENumber_TextChanged" AutoPostBack="true" Visible="true" runat="server"></asp:TextBox>
                                                       
                                                   
                                                    </div>
                                          <div class="field-wrap">
                                                        <label>
                                                          Amount Paid
                                                        </label>
                                                            <asp:TextBox ID="TxtAmount" Enabled="false" OnTextChanged="TxtAmount_TextChanged" AutoPostBack="true" Visible="true" runat="server"></asp:TextBox>
                                                   </div>
                                        </div>
	   <div class="top-row" style="margin-bottom:10px !important">
                                                        <label>
                                                          Paid By
                                                        </label>
                                                            <asp:TextBox ID="TxtPaidBy" Visible="true" runat="server"></asp:TextBox>
                                                       
                                                   
                                                   
                                        </div>
     <div id="Hide" runat="server" visible="false">
      <div class="top-row">
                                                    <div class="field-wrap">
                                                        <label>
                                                        First Name
                                                        </label>
                                                            <asp:TextBox ID="TxtFName"  Visible="true" runat="server"></asp:TextBox>
                                                       
                                                   
                                                    </div>
                                          <div class="field-wrap">
                                                        <label>
                                                         Last Name
                                                        </label>
                                                            <asp:TextBox ID="TxtLName" Visible="true" runat="server"></asp:TextBox>
                                                   </div>
                                        </div>
     <div class="top-row">
                                                    <div class="field-wrap">
                                                        <label>
                                                      Section
                                                        </label>
                                                            <asp:TextBox ID="TxtSection"  Visible="true" runat="server"></asp:TextBox>
                                                       
                                                   
                                                    </div>
                                          <div class="field-wrap">
                                                        <label>
                                                         Unit
                                                        </label>
                                                            <asp:TextBox ID="TxtUnit" Visible="true" runat="server"></asp:TextBox>
                                                   </div>
                                        </div>
         </div>
                           <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header well">
                                <h2>PENDING ADVANCES</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
                                    <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
                                    <a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content ">
<asp:GridView ID="GridViewAdvanceDetails" EmptyDataText="" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" ShowFooter="true" AutoGenerateColumns="false" OnRowDataBound="GridViewAdvanceDetails_RowDataBound" runat="server">
      <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-user"></span>
					<div>No data available yet,</div>
					<div>Please fill in all the required fields</div>
					<span class="notification green">AMS</span>
				</a>
        </EmptyDataTemplate> 
    <Columns>
        <asp:TemplateField Visible="false" HeaderText="Reqid" >
                <ItemTemplate>
                   <asp:Label ID="lblReqid" runat="server" Text='<%# Eval("Reqid") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
        
         <asp:TemplateField HeaderText="Net Pay" >
                <ItemTemplate>
                   K<asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Current Salary") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="Advance Amount" >
                <ItemTemplate>
                   K<asp:Label ID="lblAdvanceAm" runat="server" Text='<%# Eval("Advance Amount") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
          <asp:TemplateField HeaderText="Recovery (Months)" >
                <ItemTemplate>
                   <asp:Label ID="lblDur" runat="server" Text='<%# Eval("Recovery Duration") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
        <asp:TemplateField HeaderText="Deduction (Month)" >
                <ItemTemplate>
                  <asp:Label ID="lblPaymentPlan" runat="server" Text="0"></asp:Label>
                </ItemTemplate>
            <FooterTemplate>
                  TOTAL:<asp:Label ID="lblPaymentPlan" runat="server" Text="0"></asp:Label>
            </FooterTemplate>
             </asp:TemplateField>
         <asp:TemplateField HeaderText="Salary After Deduction" >
                <ItemTemplate>
                    K<asp:Label ID="lblSalaryAfter" runat="server" Text=""></asp:Label>
                </ItemTemplate>
               <FooterTemplate>
                TOTAL:<asp:Label ID="lblSalaryAfter" runat="server" Text="0"></asp:Label>
            </FooterTemplate>
             </asp:TemplateField>
        <asp:TemplateField Visible="true" HeaderText="start Date" >
                <ItemTemplate>
                      <asp:Label ID="lblStart" runat="server" Text='<%# Eval("start date") %>'></asp:Label>
                   <asp:Label ID="lblEndDate" Visible="false" runat="server" Text='<%# Eval("EndDate") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
         <asp:TemplateField HeaderText="Status" >
             <HeaderStyle Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
                    <asp:Label ID="lblShowState" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
          <asp:TemplateField Visible="true" HeaderText="Amount Remaining" >
                <ItemTemplate>
                   K <asp:Label ID="lblBalance" Visible="true" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                 </ItemTemplate>
                <FooterTemplate>
                TOTAL:<asp:Label ID="lblBalance" runat="server" Text="0"></asp:Label>
            </FooterTemplate>
             </asp:TemplateField>
        <%--<asp:BoundField HeaderText="State" DataField="Advance State" />--%>
    </Columns>
</asp:GridView>
                     </div>
                            </div>
         </div>
     <asp:TextBox ID="TxtTotalPaid" Visible="false" Enabled="false" Text="0" runat="server"></asp:TextBox>
     <asp:TextBox ID="TxtTotalBalance" Visible="false" Enabled="false" Text="0" runat="server"></asp:TextBox>
     <asp:TextBox ID="TxtSalary" Visible="false" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox>
     <asp:TextBox ID="TxtTotal" Visible="false" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox>
      
     <div style="text-align:center;">NEW BALANCE: <asp:TextBox ID="TxtBalanceAfterPayment" Visible="true" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox></div>
      <a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Save Record</a>   		
     </div>
				</div><!--/span-->
                  
                        </div>
         </div>
            </div>
                         <hr>
                <%--******************************MODALS SECTION*****************--%>
                  <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
            <h2>Are you sure you want to save?</h2>
                     <a class="btn btn-success" runat="server" onserverclick="BtnSave2_ServerClick"  id="BtnSave2">
                                <i class="icon-ok icon-white"></i>
                                Save                                           
									</a>
             <a class="btn btn-danger" runat="server" id="A3" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
                <%-------------------------------------------------------------%>
                  <a href="#x" class="overlay" runat="server" id="ModalWarning"></a>
        <div class="popup">
            <h2>Warning amount cannot be greater than the amount remaining</h2>
            <br />
            <h2>Balance: <asp:Label ID="LblBalanceRem" runat="server" Text=""></asp:Label></h2>
                           <a class="close" href="#close"></a>
        </div>
         
            <footer>
                <p class="pull-left">&copy; Powered by esnagen software</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            </footer>
                
                  <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
                </div>
                          
<%--                    </ContentTemplate>
                    </asp:UpdatePanel>--%>
        </div>
  <script src="js/charisma.js"></script>
        
  <%--<script src="js/Cha.js"></script>--%>
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


