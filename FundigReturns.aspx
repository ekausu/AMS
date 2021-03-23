<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FundigReturns.aspx.cs" Inherits="AdvanceSystem.FundigReturns" %>

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
      <h2>FUNDING RETURNS</h2> 
     <br />
      <div class="top-row">
         
            <div class="field-wrap">
                                                        <label>
                                                           Station
                                                        </label>
                                                                   <asp:TextBox ID="TxtGid" Visible="false" runat="server"></asp:TextBox>
                                                 
                                                            <asp:TextBox ID="TxtStation" Visible="true" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="field-wrap">
                                                        <label>
                                                           Section
                                                        </label>
                                                        <asp:TextBox ID="TxtSection" Visible="true" runat="server"></asp:TextBox>

                                                    </div>
                                                  
          </div>

    
                                    <div class="top-row" style="margin-bottom:10px !important">
                                         <div class="field-wrap">
                                                     <label>
                                                           Date
                                                        </label>
                                                        <asp:TextBox ID="TxtDate" Width="100%" CssClass="input-xlarge datepicker" Visible="true" runat="server"></asp:TextBox>
                                              <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="TxtDate" TodaysDateFormat="MM-dd-yyyy:HH:mm:ss" />
				        
                                                 </div>
                                                    <div class="field-wrap">
                                                        <label>
                                                           Period
                                                        </label>
                                                        <asp:DropDownList data-rel="chosen" ID="DropDownPeriod" Width="100%" CssClass="width" runat="server">
                                                            <asp:ListItem></asp:ListItem>
                                                            <asp:ListItem Value="1">January</asp:ListItem>
                                                            <asp:ListItem Value="2">February</asp:ListItem>
                                                            <asp:ListItem Value="3">March</asp:ListItem>
                                                            <asp:ListItem Value="4">April</asp:ListItem>
                                                            <asp:ListItem Value="5">May</asp:ListItem>
                                                            <asp:ListItem Value="6">June</asp:ListItem>
                                                              <asp:ListItem Value="7">July</asp:ListItem>
                                                            <asp:ListItem Value="8">August</asp:ListItem>
                                                            <asp:ListItem Value="9">September</asp:ListItem>
                                                            <asp:ListItem Value="10">October</asp:ListItem>
                                                            <asp:ListItem Value="11">November</asp:ListItem>
                                                            <asp:ListItem Value="12">December</asp:ListItem>
                                                        </asp:DropDownList>
                                                   
                                                    </div>
                                          
                                                   </div>
       <div class="top-row">
                                                    <div class="field-wrap">
                                                        <label>
                                                           Entered by
                                                        </label>
                                                            <asp:TextBox ID="TxtEnteredby" OnTextChanged="TxtEnteredby_TextChanged" AutoPostBack="true" Visible="true" runat="server"></asp:TextBox>
                                                    </div>
           
                                                    <div class="field-wrap">
                                                        <label>
                                                           Amount Funded
                                                        </label>
                                                        <asp:TextBox Width="100%" ReadOnly="true" ID="TxtAmount" Visible="true" runat="server"></asp:TextBox>

                                                    </div>
          </div>
                          <hr />
                        <asp:GridView ID="GridViewFund" Enabled="false" OnRowDeleting="GridViewFund_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewFund_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-bordered" AutoGenerateColumns="false" runat="server">
                               <Columns>
                                          <asp:BoundField DataField="RowNumber" HeaderText="No." />
                                 <asp:TemplateField HeaderText="Description" Visible="true">
                                   <ControlStyle Width="80%" />
                                 <ItemTemplate>
                                      <div class="input-prepend">
								     <span class="add-on"><i class=" icon-pencil"></i></span> <asp:TextBox Width="100%" ID="TxtDescription" Visible="true" runat="server"></asp:TextBox>
                                          </div>
                                      <%--<asp:Label ID="TxtDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>--%>
                                     </ItemTemplate>
                                    <FooterTemplate>

                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Date" ItemStyle-Width="30%" Visible="true">
                                   <ControlStyle Width="80%" />
                                 <ItemTemplate>
                                     <div class="input-prepend" style="width:100%">
								     <span class="add-on"><i class="icon-calendar"></i></span> 
                                      <asp:TextBox Width="80%" ID="TxtDate" CssClass="input-xlarge datepicker" Visible="true" runat="server"></asp:TextBox>
                                         </div>
                                     </ItemTemplate>
                                    <FooterTemplate>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                                    <asp:TemplateField HeaderText="Amount" HeaderStyle-Width="70px" Visible="true">
                                   <ControlStyle Width="80%" />
                                 <ItemTemplate>
                                      <asp:TextBox Width="100%" OnTextChanged="TxtAmount_TextChanged1" AutoPostBack="true" placeholder="K...." ID="TxtAmount" Visible="true" runat="server"></asp:TextBox>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                </FooterTemplate>
                                 </asp:TemplateField> 
                                     <asp:TemplateField HeaderStyle-Width="90px">
                                                <ItemTemplate>
                                                          <asp:LinkButton ID="LinkButton1" Width="100%" CommandName="Delete" Text="<div class='btn btn-danger'><i class='icon-trash icon-white'></i>Delete</div>" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                         <FooterTemplate>
											 <a class='btn btn-success' id="BtnAddRow" runat="server" onserverclick="BtnAddRow_ServerClick"><i class='icon icon-white icon-add '></i>Add</a>
											<%--                                 <asp:LinkButton ID="LinkButton2" Width="100%" OnClick="LinkButton1_Click" Text="<div class='btn btn-success'><i class='icon-add icon-white'></i>Add Row</div>" runat="server"></asp:LinkButton>
                               
                                                                 <asp:LinkButton ID="Lin" Width="100%" OnClick="LinkButton1_Click1" Text="<div class='btn btn-success'><i class='icon-add icon-white'></i>Add Row</div>" runat="server"></asp:LinkButton>
                        --%>                 </FooterTemplate>
                                            </asp:TemplateField>
                      
        </Columns>
    </asp:GridView>
                        <div style="text-align:left">TOTAL EXPENSE<asp:TextBox ID="TxtTotal" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox>TOTAL BALANCE<asp:TextBox ID="TxtBalance" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox></div>
      <a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Save Records</a>   		
     </div>
				</div><!--/span-->
                  
                        </div>
         </div>
            </div>
                         <hr>
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
       <%--          <a href="#x" class="overlay" runat="server" id="ModalWarn"></a>
        <div class="popup">
            <h2>Warning Expense cannot exceed fub=nded amount?</h2>
              <a class="close" href="#close"></a>
        </div>--%>
         
            <footer>
                <p class="pull-left">&copy; Powered by esnagen software</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            </footer>
                </div>
        </div>
  <%--<script src="js/charisma.js"></script>--%>
        
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


