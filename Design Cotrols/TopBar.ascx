<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopBar.ascx.cs" Inherits="AdvanceSystem.Design_Cotrols.TopBar" %>
<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<%--<a class="brand" href="Default.aspx"><span>ZAF</span></a>--%>
				<a class="brand" href="Default.aspx"> <img alt="Charisma Logo" src="img/Roundel_of_Zambia.png" /> <span style="font-family:'Times New Roman' !important">ZAF</span></a>
				
				<!-- theme selector starts -->
				<div class="btn-group pull-right theme-container" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-tint"></i><span class="hidden-phone"> Change Theme / Skin</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" id="themes">
						<li><a data-value="classic" href="#"><i class="icon-blank"></i> Classic</a></li>
						<li><a data-value="cerulean" href="#"><i class="icon-blank"></i> Cerulean</a></li>
						<li><a data-value="cyborg" href="#"><i class="icon-blank"></i> Cyborg</a></li>
						<li><a data-value="redy" href="#"><i class="icon-blank"></i> Redy</a></li>
						<li><a data-value="journal" href="#"><i class="icon-blank"></i> Journal</a></li>
						<li><a data-value="simplex" href="#"><i class="icon-blank"></i> Simplex</a></li>
						<li><a data-value="slate" href="#"><i class="icon-blank"></i> Slate</a></li>
						<li><a data-value="spacelab" href="#"><i class="icon-blank"></i> Spacelab</a></li>
						<li><a data-value="united" href="#"><i class="icon-blank"></i> United</a></li>
						 <li><a data-value="sketchy" href="#"><i class="icon-blank"></i>sketchy</a></li>
                      <li><a data-value="blue" href="#"><i class="icon-blank"></i> Blue</a></li>
                        <li><a data-value="trans" href="#"><i class="icon-blank"></i> Transparent</a></li>
					</ul>
				</div>
				<!-- theme selector ends -->
				
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone">
	<asp:Label ID="lblUser" runat="server" Text="User Name"></asp:Label></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a class="btn" style="margin-left:5px" id="ChangePassword" runat="server" onserverclick="ChangePassword_ServerClick"><i class="icon-briefcase"></i>Change Password</a></li>
						<li class="divider"></li> 
						<li><a class="btn" style="margin-left:5px" id="Logout" runat="server" onserverclick="Logout_ServerClick"><i class="icon-lock"></i>Logout</a></li>
                        	<li class="divider"></li>
						<li><a><i class="icon-eye-open"></i><asp:Label ID="lblUserRole" runat="server" Text="Role"></asp:Label></a></li>
                        <%--<li><a href="#"><asp:Label ID="LblMineNo" runat="server" Text="Label"></asp:Label></a></li>--%>
						<%--<li><a href="#">Logout</a></li>--%>
					</ul>
				</div>
				<!-- user dropdown ends -->
				
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a class="brand" style="font-family:'Times New Roman';font-size:small" href="#"><span>Advance Management Sys (AMS)</span></a></li>
						<%--<li>
							<div class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2" name="query" type="text">
							</div>
						</li>--%>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>