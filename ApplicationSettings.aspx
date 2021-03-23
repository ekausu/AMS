<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplicationSettings.aspx.cs" Inherits="AdvanceSystem.ApplicationSettings" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/Settings/EditUsers.ascx" TagPrefix="uc1" TagName="EditUsers" %>
<%@ Register Src="~/Settings/AddUsers.ascx" TagPrefix="uc1" TagName="AddUsers" %>
<%@ Register Src="~/Settings/Stations.ascx" TagPrefix="uc1" TagName="Stations" %>
<%@ Register Src="~/Settings/Months.ascx" TagPrefix="uc1" TagName="Months" %>
<%@ Register Src="~/Settings/Ranks.ascx" TagPrefix="uc1" TagName="Ranks" %>
<%@ Register Src="~/Settings/EmailSettings.ascx" TagPrefix="uc1" TagName="EmailSettings" %>
<%@ Register Src="~/Settings/Reports.ascx" TagPrefix="uc1" TagName="Reports" %>










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
	<link href="css/Tab.css" rel="stylesheet" />
	<style>
		input {
			height:30px !important;
		}
	</style>
    </head>

<body onload="load()">
    <form runat="server" id="form1" enctype="multipart/form-data" method = "post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
		<uc1:StyleBox runat="server" ID="StyleBox" />
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
<div class="box-content">
		<ajaxToolkit:TabContainer ID="TabContainer1"  ForeColor="Black" runat="server" ActiveTabIndex="4" VerticalStripWidth="200px" UseVerticalStripPlacement="true" Width="100%">
			<ajaxToolkit:TabPanel runat="server" ID="TabPanel1">
				<HeaderTemplate>	
					 Email Settings       					 
				</HeaderTemplate>
				<ContentTemplate>
				    <uc1:EmailSettings runat="server" ID="EmailSettings" />	
				</ContentTemplate>			
			</ajaxToolkit:TabPanel>
			<%--<ajaxToolkit:TabPanel runat="server" ID="TabPanel2">
				<HeaderTemplate>
					  
					Edit Users   
			
				</HeaderTemplate>
				<ContentTemplate>
							     	  <uc1:EditUsers runat="server" id="EditUsers" />
											</ContentTemplate>						
			</ajaxToolkit:TabPanel>--%>
					<ajaxToolkit:TabPanel ID="TabPanel3" runat="server">
						<HeaderTemplate>
				Add Stations       
				</HeaderTemplate>
				<ContentTemplate>
					 <uc1:Stations runat="server" ID="Stations" />											
				</ContentTemplate>
			</ajaxToolkit:TabPanel>
							<ajaxToolkit:TabPanel runat="server" ID="TabPanel4">
					<HeaderTemplate>
				Ranks
				       
				</HeaderTemplate>
				<ContentTemplate>
					   <uc1:Ranks runat="server" ID="Ranks" />
					</ContentTemplate>						
			</ajaxToolkit:TabPanel>
				<ajaxToolkit:TabPanel ID="TabPanel5" runat="server">
						<HeaderTemplate>
				Add Months       
				</HeaderTemplate>
				<ContentTemplate>
					   <uc1:Months runat="server" ID="Months" />									
				</ContentTemplate>
			</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel ID="TabPanel6" runat="server">
						<HeaderTemplate>
				Add Reports       
				</HeaderTemplate>
				<ContentTemplate>
					 	  <uc1:Reports runat="server" id="Reports" />
										
				</ContentTemplate>
			</ajaxToolkit:TabPanel>
		</ajaxToolkit:TabContainer>
<%--<section>
    <div class="rt-container">
          <div class="col-rt-12">
              
             <div class="conveytabs">
              <input id="tab1" type="radio" name="tabs" checked>
              <label for="tab1"><i class="icon32 icon-blue icon-envelope-open"></i>Email Settings</label>                
             
				 <input id="tab2" onserverchange="tab2_ServerChange" runat="server" type="radio" name="tabs">
              <label for="tab2"><i class="icon32 icon-blue icon-user"></i>Edit User</label>
                
              <input id="tab3" type="radio" runat="server" onserverchange="tab3_ServerChange" name="tabs">
              <label for="tab3"><i class="icon32 icon-blue icon-book"></i>Add Stations</label>
                
              <input id="tab4" type="radio" name="tabs">
              <label for="tab4"><i class="icon32 icon-blue icon-wrench"></i>Setup</label>
              <section id="content1">
				
			  </section>
                
              <section id="content2">
              </section>
                
              <section id="content3">
				  </section>
                
              <section id="content4">
				 
		
              </section>
              <section id="content5">
                <p>
                  Bacon ipsum dolor sit amet landjaeger sausage brisket, jerky drumstick fatback boudin ball tip turducken. Pork belly meatball t-bone bresaola tail filet mignon kevin turkey ribeye shank flank doner cow kielbasa shankle. Pig swine chicken hamburger, tenderloin turkey rump ball tip sirloin frankfurter meatloaf boudin brisket ham hock. Hamburger venison brisket tri-tip andouille pork belly ball tip short ribs biltong meatball chuck. Pork chop ribeye tail short ribs, beef hamburger meatball kielbasa rump corned beef porchetta landjaeger flank. Doner rump frankfurter meatball meatloaf, cow kevin pork pork loin venison fatback spare ribs salami beef ribs.
                </p>
                <p>
                  Jerky jowl pork chop tongue, kielbasa shank venison. Capicola shank pig ribeye leberkas filet mignon brisket beef kevin tenderloin porchetta. Capicola fatback venison shank kielbasa, drumstick ribeye landjaeger beef kevin tail meatball pastrami prosciutto pancetta. Tail kevin spare ribs ground round ham ham hock brisket shoulder. Corned beef tri-tip leberkas flank sausage ham hock filet mignon beef ribs pancetta turkey.
                </p>
              </section>          
            </div> 
		</div>
    </div>
</section>--%>
   </div>
					</div>
						</div>
            </div>
                         <hr>
          
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


