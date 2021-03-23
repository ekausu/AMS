<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="AdvanceSystem.ChangePassword" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/UpdateEmail.ascx" TagPrefix="uc1" TagName="UpdateEmail" %>
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
    </style>

    </head>

<body>
    <form runat="server" id="form1" enctype="multipart/form-data" method = "post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <uc1:StyleBox runat="server" id="StyleBox" />
        <uc1:TopBar runat="server" id="TopBar" />
        <!-- topbar ends -->
        <div class="container-fluid">
                      
<%--------------------------------------------------------------------------------------------------------------------------------------%>
            <div class="row-fluid">
    
                <uc1:MainMenu runat="server" ID="MainMenu" />
                <!-- left menu ends -->

                <div id="content" class="span10">
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>CHANGE CREDENTIALS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">

						 <div class="panel panel-default tabs">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li><a href="#tab-first" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-key"></i>CHANGE PASSWORD</a></li>
                                        <li><a href="#tab-second" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-mail-closed"></i>CHANGE EMAIL</a></li>
                                     </ul>
                                    <div class="panel-body tab-content">
                                         <div class="tab-pane active" id="tab-first">
										
    
											   <div class="block-100" style="width:80%;margin-bottom:150px">
												   <%----------------------------------------------------------------------------------------------------%>
	  <div style="text-align:right">
      <img src="img/Roundel_of_Zambia.png" />
     </div>
					      <h2>CHANGE PASSWORD</h2>
				<asp:TextBox ID="txtButtonClicked" Visible="false" runat="server"></asp:TextBox>
               <uc1:UpdatePassword runat="server" id="UpdatePassword" />
        <a class="btn btn-succcess" id="BtnPassword" runat="server" onserverclick="BtnPassword_ServerClick" >
                                <i class="icon icon-color icon-save"></i>
                               Save Password                                       
									</a>
												   <%------------------------------------------------------------------------------------------------------------%>
												   </div>
											 </div>
										 <div class="tab-pane" id="tab-second">
											 
    
											    <div class="block-100" style="width:80%;margin-bottom:150px">
												   <%----------------------------------------------------------------------------------------------------%>
	<div style="text-align:right">     
      <img src="img/Roundel_of_Zambia.png" />
     </div>
													  <h2>CHANGE EMAIL</h2>
													<uc1:UpdateEmail runat="server" id="UpdateEmail" />
												      <a class="btn btn-succcess" id="BtnEmail" runat="server" onserverclick="BtnEmail_ServerClick" >
                                <i class="icon icon-color icon-save"></i>
                               Save Email                                       
									</a>
                          
												   <%------------------------------------------------------------------------------------------------------------%>
												   </div>
						 
											 </div>
					
										</div>
                                       
   
                  
</div>
    
	</div><!--/span-->
                  
                        </div>
         
            </div>
               
                          <%--------------------MODAL Save---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
			<h2>Change Password</h2>
          Are you sure you want save?
			<br />
			  <a class="btn btn-succcess" runat="server" onserverclick="BtnSave_ServerClick" id="BtnSave" >
                                <i class="icon icon-white icon-tick"></i>
                               Save                                       
									</a>
         <a class="btn btn-danger" runat="server" id="BtnCancel" >
                                <i class="icon icon-white icon-cross"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
           <%---------------------------------------------------------------------------------------------%>             
                   

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            </footer>
                
            
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
