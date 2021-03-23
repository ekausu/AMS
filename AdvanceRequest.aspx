<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceRequest.aspx.cs" Inherits="AdvanceSystem.AdvanceRequest" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/Advance Request/EmployeeDetails.ascx" TagPrefix="uc1" TagName="EmployeeDetails" %>
<%@ Register Src="~/Advance Request/SalaryDetails.ascx" TagPrefix="uc1" TagName="SalaryDetails" %>
<%@ Register Src="~/Advance Request/AdvanceDetails.ascx" TagPrefix="uc1" TagName="AdvanceDetails" %>
<%@ Register Src="~/Advance Request/Payslips.ascx" TagPrefix="uc1" TagName="Payslips" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="utf-8">
	<title>AMS</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="css/wizard.css" rel="stylesheet" />
	<link href="css/wizard.css" rel="stylesheet" />
	<style>
		/*.btn-warning {
  background-color: #fe970a;
  border-color: #fe970a;
}
.btn-warning:hover,
.btn-warning:focus,
.btn-warning:active,
.btn-warning.active,
.open > .dropdown-toggle.btn-warning {
  background-color: #fe970a;
  border-color: #fe970a;
}
.btn-warning[disabled],
.btn-warning.disabled {
  background: #feb756;
  border-color: #feb34c;
}
.btn-success {
  background-color: #95b75d;
  border-color: #95b75d;
}
.btn-success:hover,
.btn-success:focus,
.btn-success:active,
.btn-success.active,
.open > .dropdown-toggle.btn-success {
  background-color: #89ad4d;
  border-color: #89ad4d;
}
.btn-success[disabled],
.btn-success.disabled {
  background: #acc780;
  border-color: #a7c479;
}
.btn-primary {
  background-color: #1b1e24;
  border-color: #1b1e24;
}
.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.open > .dropdown-toggle.btn-primary {
  background-color: #101215;
  border-color: #101215;
}
.btn-primary[disabled],
.btn-primary.disabled {
  background: #313641;
  border-color: #2c313b;
}
.btn-info {
  background-color: #1caf9a;
  border-color: #1caf9a;
}
.btn-info:hover,
.btn-info:focus,
.btn-info:active,
.btn-info.active,
.open > .dropdown-toggle.btn-info {
  background-color: #29b2e1;
  border-color: #29b2e1;
}
.btn-info[disabled],
.btn-info.disabled {
  background: #6ccaea;
  border-color: #63c7e9;
}
.btn-link {
  font-weight: 600;
  color: #1b1e24;
}
.btn-link:hover,
.btn-link:focus,
.btn-link:active,
.btn-link.active {
  color: #1b1e24;
}
.btn .fa,
.btn .glyphicon {
  font-size: 14px;
  margin-right: 5px;
}
.btn.btn-rounded {
  background: transparent;
  color: #22262e;
  -moz-border-radius: 12px;
  -webkit-border-radius: 12px;
  border-radius: 12px;
  border-width: 2px;
  padding: 2px 10px;
  font-weight: 600;
}
.btn.btn-rounded.btn-default:hover,
.btn.btn-rounded.btn-default:focus,
.btn.btn-rounded.btn-default:active,
.btn.btn-rounded.btn-default.active {
  border-color: #CCC;
  color: #333;
}
.btn.btn-rounded.btn-success {
  color: #95b75d;
}
.btn.btn-rounded.btn-success:hover,
.btn.btn-rounded.btn-success:focus,
.btn.btn-rounded.btn-success:active,
.btn.btn-rounded.btn-success.active {
  border-color: #89ad4d;
  color: #89ad4d;
}
.btn.btn-rounded.btn-warning {
  color: #fe970a;
}
.btn.btn-rounded.btn-warning:hover,
.btn.btn-rounded.btn-warning:focus,
.btn.btn-rounded.btn-warning:active,
.btn.btn-rounded.btn-warning.active {
  border-color: #fe970a;
  color: #fe970a;
}
.btn.btn-rounded.btn-info {
  color: #1caf9a;
}
.btn.btn-rounded.btn-info:hover,
.btn.btn-rounded.btn-info:focus,
.btn.btn-rounded.btn-info:active,
.btn.btn-rounded.btn-info.active {
  border-color: #29b2e1;
  color: #29b2e1;
}
.btn.btn-rounded.btn-danger2 {
  color: #E04B4A;
}
.btn.btn-rounded.btn-danger2:hover,
.btn.btn-rounded.btn-danger2:focus,
.btn.btn-rounded.btn-danger2:active,
.btn.btn-rounded.btn-danger2.active {
  border-color: #a43f3e;
  color: #a43f3e;
}
.btn.btn-rounded.btn-primary {
  color: #1b1e24;
}
.btn.btn-rounded.btn-primary:hover,
.btn.btn-rounded.btn-primary:focus,
.btn.btn-rounded.btn-primary:active,
.btn.btn-rounded.btn-primary.active {
  border-color: #101215;
  color: #101215;
}
.btn:active,
.btn.active {
  -moz-box-shadow: none;
  -webkit-box-shadow: none;
  box-shadow: none;
}
.btn.btn-twitter {
  background: #1AB2E8;
  border-color: #1AB2E8;
}
.btn.btn-twitter:hover,
.btn.btn-twitter:focus,
.btn.btn-twitter:active,
.btn.btn-twitter.active {
  background: #15a1d3;
}
.btn.btn-facebook {
  background: #3C599B;
  border-color: #3C599B;
}
.btn.btn-facebook:hover,
.btn.btn-facebook:focus,
.btn.btn-facebook:active,
.btn.btn-facebook.active {
  background: #354e89;
}
.btn.btn-google {
  background: #E04A39;
  border-color: #E04A39;
}
.btn.btn-google:hover,
.btn.btn-google:focus,
.btn.btn-google:active,
.btn.btn-google.active {
  background: #dd3623;
}*/
	</style>
	<%-- <link href="css/custom.min.css" rel="stylesheet">x  --%>
	<link rel="shortcut icon" href="img/Device-blockdevice-cubes.ico">
	<style>
		.header-repeat {
			background: url(img/nav-repeat2.jpg) repeat-x !important;
		}

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


	<link rel="shortcut icon" href="img/Device-blockdevice-cubes.ico">
	<script src="Scripts/moment.js"></script>
	<script src="Scripts/jquery-1.10.2.js"></script>
	<script src="Scripts/bootstrap-datetimepicker.js"></script>
	<script src="Scripts/bootstrap-datetimepicker.min.js"></script>

	<link href="css/popup.css" rel="stylesheet" />
</head>

<body onload="load()">
	<form runat="server" id="form1" enctype="multipart/form-data" method="post">
		<asp:ScriptManager ID="ScriptManager1" runat="server" />
		<uc1:StyleBox runat="server" ID="StyleBox" />
		<!-- topbar starts -->
		<uc1:TopBar runat="server" ID="TopBar" />
		<!-- topbar ends -->
		<div class="container-fluid ">

			<%--------------------------------------------------------------------------------------------------------------------------------------%>
			<div class="row-fluid">
				<uc1:MainMenu runat="server" ID="MainMenu1" />
				<!-- left menu ends -->

				<div id="content" class="span10">
					<!-- content starts -->
					<uc1:BreadCrumb runat="server" ID="BreadCrumb" />
					<div class="row-fluid sortable">
						<div class="box span12">

							<div class="box-header well">
								<h2>New Advance 
								         	Request</h2 >
								         	<div class="box-icon" >
								         	<a href="#" class="btn btn-setting btn-round" > <i class="icon-cog" > </i > </a >
								         	<a href="#" class="btn btn-minimize btn-round" > <i class="icon-chevron-up" > </i > </a >
								         	<a href="#" class="btn btn-close btn-round" > <i class="icon-remove" > </i > </a >
								         	</div >
								         	</div >
								         	<div class="box-content " style="overflow: visible !important" >
								         	<div class="block-area shortcut-area" id="BtnMenu" runat="server" >
								         	<div class="dock" style="margin-left: 35%" >
								         	<ul style="background: none; text-align: center; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);" >
								         	<li > <a href="#ModalLogin" >
								         	<img src="images/Cadenas.png" / > </a > <span > Login</span > </li >
								         	<li > <a href="AMS.docx" >
								         	<img src="images/Information.png" / > </a > <span > Info</span > </li >
								         	<li > <a href="#ModalQuery" >
								         	<img src="images/Enveloppe.png" / > </a > <span > Mail</span > </li >
								         	</ul >
								         	</div >
								         	</div >
								         	<div id="wizard" class="form_wizard wizard_horizontal" >

								         	<ul class="wizard_steps" >
								         	<li >
								         	<a href="#step-1" >
								         	<span class="step_no" > 1</span >
								         	<span class="step_descr" > Step 1<br / >
								         	<small > Step 1: Employee Details</small >
								         	</span >
								         	</a >
								         	</li >
								         	<li >
								         	<a href="#step2" >
								         	<span class="step_no" > 2</span >
								         	<span class="step_descr" > Step 2<br / >
								         	<small > Step 2: Salary Details</small >
								         	</span >
								         	</a >
								         	</li >
								         	<li >
								         	<a href="#step-3" >
								         	<span class="step_no" > 3</span >
								         	<span class="step_descr" > Step 3<br / >
								         	<small > Step 3:Advance Details</small >
								         	</span >
								         	</a >
								         	</li >
								         	<li >
								         	<a href="#step-4" >
								         	<span class="step_no" > 4</span >
								         	<span class="step_descr" > Step 4<br / >
								         	<small > Step 4: Payslips</small >
								         	</span >
								         	</a >
								         	</li >
								         	</ul >
								        <div id="step-1" style="overflow: visible !important">
										<uc1:EmployeeDetails runat="server" ID="EmployeeDetails" />
									</div>
									<div id="step2" style="overflow: visible !important">
										<uc1:SalaryDetails runat="server" ID="SalaryDetails" />
										<%------------------------------------------------------------------------------------%>
									</div>
									<div id="step-3">
										<uc1:AdvanceDetails runat="server" ID="AdvanceDetails" />
									</div>
									<div id="step-4">
										<%--<uc1:Payslips runat="server" id="Payslips" />--%>
										<div class="block-100" style="width: 80%; margin-bottom: 400px">
											<div style="text-align: right">

												<img src="img/Roundel_of_Zambia.png" />
											</div>
											<h2>PAYSLIPS</h2>

											<h3>Please attach your pay slips by clicking the orange button, then by clicking the newly displayed button labeled as "Browse"</h3>
											<br />
											<%--    <asp:FileUpload ID="FileUpload1"  runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />--%>
											<br />
											<%--<asp:Label ID="lblMessage" runat="server" Text="" Font-Names = "Arial"></asp:Label>--%>
											<div class="container_16 clearfix">
												<ul id="FileUploadContainer" class='thumbnails gallery'>
												</ul>
												<div style="width: 100%; text-align: center">
													<input id="btnadd" class="btn btn-warning" type="button" value="Add File upload Button" onclick="AddFileUpload()" />
												</div>
											</div>
											<div runat="server" id="Above">
												<a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Send Request</a>
											</div>
											<div runat="server" id="Below" visible="false">
												<a class="btn btn-success" href="#ModalBelow"><i class="icon icon-white icon-save"></i>Send Request</a>
											</div>

										</div>

									</div>

								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<a href="#x" class="overlay" runat="server" id="ModalSave"></a>
		<div class="popup">
			<h2>Are you sure you want to save?</h2>
			<a class="btn btn-success" href="#" runat="server" onserverclick="BtnSaveRe_ServerClick4" id="BtnSaveRe">
				<i class="icon-ok icon-white"></i>
				Save                                           
									</a>
			<a class="btn btn-danger" runat="server" id="Btnscancel">
				<i class="icon-remove icon-white"></i>
				Cancel                                       
									</a>
			<a class="close" href="#close"></a>
		</div>
		<%--------------------MODAL ASSIGNED---------------------------------------%>
		<a href="#x" class="overlay" runat="server" id="ModalUsers"></a>
		<div class="popup">
			<h2>ASSIGNED TO</h2>
			<br />
			Please select who the form should be reassigned to
            <br />
			<asp:UpdatePanel runat="server" ID="UpdateGrid"><ContentTemplate>
			<asp:GridView ID="GridViewUsers" EmptyDataText="NO USER FOUND" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
				<Columns>
					<asp:TemplateField HeaderText="">
						<ItemTemplate>
							<asp:Button ID="BtnUser" OnClick="BtnUser_Click" Width="100%" CssClass="btn btn-success" Text="Select" runat="server"></asp:Button>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Active Directory" Visible="false">
						<ItemTemplate>
							<asp:Label ID="User" runat="server" Text='<%# Eval("User") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Name" Visible="True">
						<ItemTemplate>
							<asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Email" Visible="True">
						<ItemTemplate>
							<asp:Label ID="Email" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Section" Visible="True">
						<ItemTemplate>
							<asp:Label ID="Section" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Station" Visible="true">
						<ItemTemplate>
							<asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Role" Visible="true">
						<ItemTemplate>
							<asp:Label ID="Role" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="Position" Visible="true">
						<ItemTemplate>
							<asp:Label ID="Position" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
				</ContentTemplate></asp:UpdatePanel>

			<a class="close" href="#close"></a>
		</div>
		<%-------------------------------------------------------------%>

		<a href="#x" class="overlay" runat="server" id="ModalLogin"></a>
		<div class="popup">
			<table>
				<tr>
					<td>
						<img src="images/Cadenas.png" style="width: 100px; height: 100px" /></td>
					<td>
						<table>
							<tr>
								<td colspan="2">
									<h2>Login</h2>
								</td>
							</tr>
							<tr>
								<td>USER NAME:</td>
								<td>
									<asp:TextBox ID="TxtName" runat="server"></asp:TextBox></td>
							</tr>
							<tr>

								<td>PASSWORD:</td>
								<td>
									<input type="password" id="TxtPassword" runat="server" /></td>

							</tr>
							<tr>
								<td>

								</td>
								 <td> 
									 <ASP:CheckBox id="chkPersistCookie"  Checked="false" runat="server" autopostback="false" />
					<input data-no-uniform="true" type="checkbox" class="iphone-toggle">
								</td>
							</tr>

							<tr>
								<td><a class="btn btn-success" runat="server" onserverclick="BtnLogin_ServerClick" id="BtnLogin">
									<i class="icon-ok icon-white"></i>
									Login                                           
									</a>
									<a class="btn btn-danger" runat="server" onserverclick="A2_ServerClick" id="A2">
										<i class="icon-remove icon-white"></i>
										Cancel                                       
									</a></td>

							</tr>
						</table>

					</td>
				</tr>
			</table>

			<a class="close" href="#close"></a>
		</div>

		<%-------------------------------------------------------------%>

		<a href="#x" class="overlay" runat="server" id="ModalQuery"></a>
		<div class="popup">
			<h2>How can we help you?</h2>
			<div class="span3">
					<img src="images/Enveloppe.png" width="100" height="100" />
				</div>
			<div class="span8">
				<div class="span7">
					<table style="width:100%">
						<tr><td>Your Email:</td><td><asp:TextBox ID="txtYourEmail" Width="100%" placeholder="Email" runat="server"></asp:TextBox></td></tr>
						<tr><td>Your Name:</td><td><asp:TextBox ID="TxtCompName" Width="100%" placeholder="Name" runat="server"></asp:TextBox></td></tr>
					</table>
						Please state your complaint below
				
						<asp:TextBox ID="TxtQuery" placeholder="Contact details, Station and Complaint" TextMode="MultiLine" ForeColor="Black" BackColor="White" Width="100%" Height="250px" runat="server"></asp:TextBox>
				<div style="text-align: right">
				<a class="btn btn-info" runat="server" onserverclick="BtnEmailUs_ServerClick" id="BtnEmailUs">
					<i class="icon-ok icon-white"></i>
					Send Query                                           
					</a>
				</div>
					</div>
			</div>
		

			<a class="close" href="#close"></a>
		</div>

		<%-------------------------------------------------------------%>
		<a href="#x" class="overlay" runat="server" id="ModalWait"></a>
		<div class="popup">
			<h2>Sending Email Please wait?</h2>
			<img src="images/progress-bar-opt.gif" width="200" height="200" />
			<a class="close" href="#close"></a>
		</div>
		<a href="#x" class="overlay" runat="server" id="ModalBelow"></a>
		<div class="popup">
			<h2>Are you sure you want to save?</h2>
			<asp:TextBox ID="TxtReason" TextMode="MultiLine" Width="150px" Height="150px" runat="server"></asp:TextBox>
			<a class="btn btn-success" runat="server" onserverclick="tnSave2_ServerClick1" href="#" id="tnSave2">
				<i class="icon-ok icon-white"></i>
				Save                                           
									</a>
			<a class="btn btn-danger" runat="server" id="A3">
				<i class="icon-remove icon-white"></i>
				Cancel                                       
									</a>
			<a class="close" href="#close"></a>
		</div>
		<%-------------------------------------------VALIDATED--------------------------------------------------%>

		<a href="#x" class="overlay" runat="server" id="ModalValidate"></a>
		<div class="popup">
			<h2>SAVE FAILED</h2>

			<div class="box span6">
				<div class="box-header well">
					<h2><i class="icon-eye-open"></i>MISSING ENTRIES</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
						<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
					</div>
				</div>
				<div class="box-content">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>STEP</th>
								<th>NOTICE</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<a href="#" class="btn btn-large btn-round">1</a>
								</td>
								<td>
									<asp:Label ID="lblValidate1" runat="server" Text="Missing Entries"></asp:Label>

								</td>
							</tr>
							<tr>
								<td>
									<a href="#step2" class="btn btn-large btn-round">2</a>
								</td>
								<td>
									<asp:Label ID="lblValidate2" runat="server" Text="Missing Entries"></asp:Label>

								</td>
							</tr>
							<tr>
								<td>
									<a href="#" class="btn btn-large btn-round">3</a>
								</td>
								<td>
									<asp:Label ID="lblValidate3" runat="server" Text="Missing Entries"></asp:Label>

								</td>
							</tr>
							<tr>
								<td>
									<a href="#" class="btn btn-large btn-round">4</a>
								</td>
								<td>
									<asp:Label ID="lblVaildate4" runat="server" Text="Missing Entries"></asp:Label>

								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!--/span-->
			<a class="close" href="#close"></a>
		</div>
			<a href="#x" class="overlay" runat="server" id="LoadinBar"></a>
		<div class="popup" style="background: rgba(0,0,0,0.6);width:10px !important">
			<img id="Loading" style="visibility: visible" height="50" width="50" src='img/fluid-loader.gif' alt='loading' />
			Loading Please Wait
		</div>
		
		<script>
			$("#BtnSaveRe").click(function () {
				$("#BtnSaveRe").attr("disabled", true);
				$("#BtnSaveRe").css('visibility:hidden;');
				$("#BtnSaveRe").remove();
				$("#Loading").css('visibility:visible;');
				var newURLString = window.location.href + '#LoadinBar';
				window.location.href = newURLString.replace('#ModalSave', '');
			});
		</script>
		<script>
			$("#BtnLogin").click(function () {
				$("#BtnLogin").attr("disabled", true);
				$("#BtnLogin").css('visibility:hidden;');
				$("#BtnLogin").remove();
				$("#Loading").css('visibility:visible;');
				var newURLString = window.location.href + '#LoadinBar';
				window.location.href = newURLString.replace('#ModalLogin', '');
			});
		</script>
		<script>
            function GetWiz() {
                var target = $("#wizard").smartWizard();
                var steps = $(target).children("ul").children("li").children("a");
                for (var stepIdx = 1; stepIdx <= 4; stepIdx++) {
                    var step = steps.eq(stepIdx);
                    $(step, target).attr("isDone", 1);
                    $(step, target).removeClass("disabled").addClass("done");
                }
                var curStep = steps.eq(1);
                var selStep = steps.eq(4);
                $(curStep, target).removeClass("selected");
				$(selStep, target).addClass("selected");

                //var selStep = steps.eq(3);
                //var hasContent = selStep.data('hasContent');
                $($(selStep, target.target).attr("href").replace(/^.+#/, '#'), step.target).show();
            }
        </script>
		<footer>
			<p class="pull-left">&copy; Powered by esnagen 2018</p>
		</footer>
		<%--<script src="js/Cer2.js"></script>--%>

		<script src="js/Cha.js"></script>
		<script src="Scripts/jquery-1.10.2.min.js"></script>
		<script src="Scripts/bootstrap.min.js"></script>
		<script src="js/jquery.smartWizard.js"></script>
		<script src="js/wiz.js"></script>
		<script type="text/javascript" src="js/fileinput.min.js"></script>

		<script type="text/javascript">
			var counter = 0;
			function AddFileUpload() {
				var div = document.createElement('DIV');
				div.innerHTML = '<input id="file' + counter + '" name = "file' + counter + '" type="file" />';
				document.getElementById("FileUploadContainer").appendChild(div);


				$("#file" + counter).fileinput({
					showUpload: false,
					showCaption: false,
					browseClass: "btn btn-info",
					fileType: "any"
				});
				counter++;
			}
			function RemoveFileUpload(div) {
				document.getElementById("FileUploadContainer").removeChild(div.parentNode);
			}

		</script>
		<script>
			function load() {
				Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jsFunctions);
			}
			function jsFunctions() {
				function init_SmartWizard() {
					"undefined" !== typeof $.fn.smartWizard && (console.log("init_SmartWizard"), $("#wizard").smartWizard(), $("#wizard_verticle").smartWizard({
						transitionEffect: "slide"
					}), $(".buttonNext").addClass("btn btn-success"), $(".buttonPrevious").addClass("btn btn-primary"), $(".buttonFinish").addClass("btn btn-default"))
				}
				$(document).ready(function () {
					init_SmartWizard()
				});
			}
		</script>
		<script>
			function GoForwd() {
				//$(".saved").fadeIn(500).fadeOut(500);
				$this.goForward();
				//return false;
			}
		</script>
	</form>
</body>
</html>
