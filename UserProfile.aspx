<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="AdvanceSystem.UserProfile" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/RequestDetails/ProfileControl.ascx" TagPrefix="uc1" TagName="ProfileControl" %>


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
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
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

<body onload="load()">
	<form runat="server" id="form1" enctype="multipart/form-data" method="post">
		<asp:ScriptManager ID="ScriptManager1" runat="server" />
		<uc1:StyleBox runat="server" ID="StyleBox" />
		<uc1:TopBar runat="server" ID="TopBar" />
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
					<div class="block-area shortcut-area" id="BtnMenu" runat="server">
						<div class="dock" style="margin-left: 35%">
							<ul style="background: none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
								<li><a id="BtnSearch" runat="server" href="#ModaleEmployeeNumber">
									<img src="images/Loupe.png" /></a><span>Search</span></li>
									<li><a id="BtnBack" runat="server" onclick="goBack()" href="#" >
								<img src="images/blog_post_accept.png" /></a><span>Back</span></li>
							</ul>
						</div>
					</div>
					<div  Style="box-shadow: 0 0 10px rgba(0,0,0,0.8);padding:10px 10px 10px 10px;margin-top:50px">
						
					<uc1:ProfileControl runat="server" ID="ProfileControl" />
					</div>


				
				</div>
				<hr>
			
			
				<footer>
					<p class="pull-left">&copy; Powered by esnagen software</p>
					<asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
				</footer>
	</div>

		</div>
		<script src="js/charisma.js"></script>


		<script>
			function goBack() {
				window.history.go(-3);
			}
</script>
		
	</form>
</body>
</html>


