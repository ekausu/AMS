<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="System Users.aspx.cs" Inherits="AdvanceSystem.System_Users" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/UpdateUsers.ascx" TagPrefix="uc1" TagName="UpdateUsers" %>
<%@ Register Src="~/UpdatePassword.ascx" TagPrefix="uc1" TagName="UpdatePassword" %>



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

		.DropDown{
			width:71%;
			 /*border-radius: 25px;*/
			 margin-bottom:13px;
			 /*height:25px !important;*/
			font-size:10px;
		border:1px solid #999999; -webkit-border-radius: 42px; -moz-border-radius: 42px;border-radius: 42px;font-size:10px;font-family:arial, helvetica, sans-serif; padding: 5px 15px 5px 15px; text-decoration:none; display:inline-block;text-shadow: 1px 1px 0 rgba(255,255,255,0.3);font-weight:bold; color: #000000;
 background-color: #FFFFFF; background-image: -webkit-gradient(linear, left top, left bottom, from(#FFFFFF), to(#CFCFCF));
 background-image: -webkit-linear-gradient(top, #FFFFFF, #CFCFCF);
 background-image: -moz-linear-gradient(top, #FFFFFF, #CFCFCF);
 background-image: -ms-linear-gradient(top, #FFFFFF, #CFCFCF);
 background-image: -o-linear-gradient(top, #FFFFFF, #CFCFCF);
 background-image: linear-gradient(to bottom, #FFFFFF, #CFCFCF);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#FFFFFF, endColorstr=#CFCFCF);
			 /*moz-box-shadow:    inset 0 8px 6px -6px #000000;
   -webkit-box-shadow: inset 0 8px 2px -6px #000000;
   box-shadow:         inset 0 8px 2px -6px #000000;*/
		}
		input {
			    border-radius: 25px !important;
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
						<h2><i class="icon-file"></i>USER CREDENTIALS</h2>
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
      <h2>SYSTEM USERS</h2> 
     <br />
     <asp:GridView ID="GridViewUsers" EmptyDataText="NO USER FOUND" ShowFooter="true" ShowHeaderWhenEmpty="true" OnRowDataBound="GridViewUsers_RowDataBound" OnRowUpdating="GridViewUsers_RowUpdating" OnRowUpdated="GridViewUsers_RowUpdated" OnRowCommand="GridViewUsers_RowCommand" OnRowEditing="GridViewUsers_RowEditing" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
                    <Columns>
                               <asp:TemplateField HeaderStyle-Width="100px">
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-primary dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
							<ul class="dropdown-menu">
							    <li><a id="BtnUpdate" runat="server" onserverclick="BtnUpdate_ServerClick"><i class="icon32 icon-blue icon-edit"></i>Update User Information</a></li>					
							    <li><a id="BtnPassword" runat="server" onserverclick="BtnPassword_ServerClick"><i class="icon32 icon-blue icon-edit"></i>Change Password</a></li>					
							<%--	<li class="divider"></li>
								<li><a id="BtnLoginHistory" runat="server" onserverclick="BtnLoginHistory_ServerClick"><i class="icon32 icon-color icon-unlocked"></i>Login HISTORY</a></li>
                      			<li><a id="BtnApprovalHis" runat="server" onserverclick="BtnApprovalHis_ServerClick"><i class="icon32 icon-orange icon-clipboard"></i>Approving HISTORY</a></li>
						--%>	<li class="divider"></li>
						     <li><a id="BtnDelete2" runat="server" onserverclick="BtnDelete_ServerClick"><i class="icon32 icon-color icon-trash"></i>Delete User</a></li>			
                                </ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>
						    <%--<asp:CommandField HeaderText="Edit" HeaderStyle-Width="150px" ControlStyle-CssClass="btn" ShowEditButton="True" />--%> 
        
                        <asp:TemplateField HeaderText="Active Directory" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="User" runat="server" Text='<%# Eval("User") %>'></asp:Label>
								    <asp:Label ID="Password" Visible="false" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                            </ItemTemplate>
							<EditItemTemplate>
						    <asp:Label ID="TxtUser" runat="server" Text='<%# Eval("User") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						    <asp:Label ID="TxtName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Email" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Email" Visible="true" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
							  	<EditItemTemplate>
						    <asp:Label ID="TxtEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Section" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						    <asp:Label ID="TxtSection" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Station" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
                            </ItemTemplate>
							   	<EditItemTemplate>
						    <asp:Label ID="TxtStation" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role" Visible="true">
                            <ItemTemplate>
								         <asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Role" runat="server" Visible="false" Text='<%# Eval("Role") %>'></asp:Label>
                            </ItemTemplate>
								<EditItemTemplate>
						   <asp:DropDownList ID="DropRole" SelectedValue='<%# Eval("Role") %>' CssClass="select" runat="server">
                    <asp:ListItem></asp:ListItem>
							    <asp:ListItem Value="0">Administrator</asp:ListItem>
             <asp:ListItem Value="1">First Approver</asp:ListItem>
                 <asp:ListItem Value="2">Second Approver</asp:ListItem>
                 <asp:ListItem Value="3">Voucher Handler</asp:ListItem>
          <asp:ListItem Value="4">Accounts (Cashier)</asp:ListItem>
            </asp:DropDownList>
							</EditItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Position" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Position" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
                            </ItemTemplate>
							     	<EditItemTemplate>
						    <asp:Label ID="TxtPosition" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
							</EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        
      </div>
				</div><!--/span-->
                  
                        </div>
         </div>
            </div>
                         <hr>
                  <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
			<h2>Message</h2>
            <h3>
			<asp:Label ID="lblmessage" runat="server" Text=""></asp:Label></h3>
                     <a class="btn btn-success" runat="server" onserverclick="BtnSave_ServerClick"  id="BtnSave">
                                <i class="icon-ok icon-white"></i>
                                Save                                           
									</a>
             <a class="btn btn-danger" runat="server" id="A3" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
<%------------------------------------------------------------------------------------------------------------------------------------%>
                 <a href="#x" class="overlay" runat="server" id="ModalUpdateUsers"></a>
        <div class="popup" style="width:60%">
            <h2>Update Section</h2>
			<div style="max-height:90%;">
			<uc1:UpdateUsers runat="server" ID="UpdateUsers" />
			</div>
				   <a class="btn" runat="server" onserverclick="BtnUpdate_ServerClick1" id="BtnUpdate">
                                <i class="icon-ok icon-blue"></i>
                                Update User                                           
									</a>
            
             <a class="btn btn-danger" runat="server" id="A4" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                      
									</a>
              <a class="close" href="#close"></a>
        </div>
				<%------------------------------------------------------------------------------------------------------------------------------------%>
                 <a href="#x" class="overlay" runat="server" id="ModalUpdatePassword"></a>
        <div class="popup" style="width:600px">
            <h2>Change User Password</h2>
			<div style="max-height:90%">
				<uc1:UpdatePassword runat="server" id="UpdatePassword" />
				   <a class="btn" runat="server" onserverclick="BtnChangePassword_ServerClick" id="BtnChangePassword">
                                <i class="icon-ok icon-blue"></i>
                                Change Password                                           
									</a>
            
             <a class="btn btn-danger" runat="server" onserverclick="A2_ServerClick" id="A2" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                      
									</a>
			</div>
              <a class="close" href="#close"></a>
        </div>
<%----------------------------------------------------------------------------------------------------------------------------------------------%>
         
            <footer>
                <p class="pull-left">&copy; Powered by esnagen software</p>
				 <asp:TextBox ID="txtClickedOption" Visible="false" runat="server"></asp:TextBox>
                <asp:TextBox ID="email" Visible="false" runat="server"></asp:TextBox>
				       <asp:TextBox ID="user" Visible="false" runat="server"></asp:TextBox>
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


