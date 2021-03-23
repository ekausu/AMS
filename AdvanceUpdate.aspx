<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceUpdate.aspx.cs" Inherits="AdvanceSystem.AdvanceUpdate" MaintainScrollPositionOnPostback="true" %>

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


					<div class="row-fluid sortable">
						<div class="box span12">
							<div class="box-header well">
								<h2><i class="icon-file"></i>UPDATE ADVANCE REQUEST</h2>
								<div class="box-icon">
									<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
									<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
									<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
								</div>
							</div>
							<div class="box-content">
								<%-- <asp:GridView ID="GridViewFund" OnRowDeleting="GridViewFund_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewFund_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">--%>

								<div class="block-100" style="margin-bottom: 150px">
									<div style="text-align: right">

										<img src="img/Roundel_of_Zambia.png" />
									</div>
									<h2>UPDATE ADVANCE REQUEST</h2>
									<br />
									<div class="top-row">
										<div class="field-wrap">
											<label>
												Employee Name
											</label>
											<asp:TextBox Width="100%" ID="txtEmployeeName" Visible="true" runat="server"></asp:TextBox>

										</div>
										<div class="field-wrap">
											<label>
												Rank
											</label>
											<asp:DropDownList ID="DropDownRank" Width="100%" data-rel="chosen" runat="server"></asp:DropDownList>
										</div>
									</div>
									<div class="top-row">
										<div class="field-wrap">
											<label>
												Employee Number
											</label>
											<asp:TextBox Width="100%" ID="txtEmployeeNumber"  Visible="true" runat="server"></asp:TextBox>

										</div>
										<div class="field-wrap">
											<label>
												Station Applied From
											</label>
											<asp:DropDownList data-rel="chosen" Width="100%" ID="DropDownStation" runat="server"></asp:DropDownList>
										</div>
									</div>
									<hr />
									<div class="top-row">
										<div class="field-wrap">
											<label>
												Section
											</label>
											<asp:TextBox ID="txtsection" Visible="true" runat="server"></asp:TextBox>
										</div>

										<div class="field-wrap">
											<label>
												Net Pay
											</label>
											<asp:TextBox ID="txtNetPay" Visible="true" runat="server"></asp:TextBox>
										</div>
									</div>
									<div class="top-row">
										<div class="field-wrap">
											<label>
												Advance Amount(K)
											</label>
											<asp:TextBox ID="TxtAdvance" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" OnTextChanged="TxtAdvance_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
											<%--<input type="number" class="inputz" id="TxtAmount" runat="server" placeholder="Salary" required="required" />--%>
										</div>
										<div class="field-wrap">
											<label>
												Recovery Period(Months)
											</label>
											<%--<asp:TextBox ID="TxtDuration" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" OnTextChanged="TxtDuration_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>--%>
											<asp:DropDownList ID="DropDownDuration" data-rel="chosen" OnSelectedIndexChanged="DropDownDuration_SelectedIndexChanged" AutoPostBack="true" Width="100%" runat="server">
											</asp:DropDownList>
										</div>
									</div>
									<div class="top-row">
										<div class="field-wrap">
											<label>
												New Net Pay
											</label>
											<input type="number" class="inputz" id="TxtNewNetPay" disabled="disabled" runat="server" />

										</div>
										<div class="field-wrap">
											<label>
												Status
											</label>
											<input type="text" class="inputz" id="TxtStatus" disabled="disabled" runat="server" />

										</div>
									</div>



									<asp:TextBox ID="TxtTotalPaid" Visible="false" Enabled="false" Text="0" runat="server"></asp:TextBox>
									<asp:TextBox ID="TxtTotalBalance" Visible="false" Enabled="false" Text="0" runat="server"></asp:TextBox>
									<%--<asp:TextBox ID="TxtSalary" Visible="false" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox>--%>
									<asp:TextBox ID="TxtTotal" Visible="false" Text="0" Width="200px" Enabled="false" runat="server"></asp:TextBox>

									<a class="btn btn-info" href="#ModalSave"><i class="icon icon-white icon-save"></i>Update Record</a>
								</div>
							</div>
							<!--/span-->

						</div>
					</div>
				</div>
				<hr>
				<%--******************************MODALS SECTION*****************--%>
				<a href="#x" class="overlay" runat="server" id="ModalSave"></a>
				<div class="popup">
					<h2>Are you sure you want to save?</h2>
					<a class="btn btn-success" runat="server" onserverclick="BtnSave2_ServerClick" id="BtnSave2">
						<i class="icon-ok icon-white"></i>
						Save                                           
									</a>
					<a class="btn btn-danger" runat="server" id="A3">
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
					<h2>Balance:
						<asp:Label ID="LblBalanceRem" runat="server" Text=""></asp:Label></h2>
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


		<script>
			function goBack() {
				window.history.go(-3);
			}
</script>
	</form>
</body>
</html>


