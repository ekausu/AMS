<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.ascx.cs" Inherits="AdvanceSystem.Advance_Request.EmployeeDetails" %>
<style>
	.block-100:after {
		content: '';
		position: absolute;
		top: 2px;
		left: 2px;
		width: calc(100%-4px);
		height: 50%;
		background: linear-gradient(rgba(255,255,255,0.8),rgba(255,255,255,0.2));
	}

	.modal {
		position: fixed;
		z-index: 999;
		height: 100%;
		width: 100%;
		top: 0;
		background-color: Black;
		filter: alpha(opacity=60);
		opacity: 0.6;
		-moz-opacity: 0.8;
	}

	.center {
		z-index: 1000;
		margin: 300px auto;
		padding: 10px;
		width: 130px;
		background-color: White;
		border-radius: 10px;
		filter: alpha(opacity=100);
		opacity: 1;
		-moz-opacity: 1;
	}

		.center img {
			height: 128px;
			width: 128px;
		}
</style>
<div class="block-100" style="margin-bottom: 150px;margin-left:50px">
	<div style="text-align: right">

		<img src="img/Roundel_of_Zambia.png" />
	</div>
	<asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="Emp">
		<%--    <ProgressTemplate>
            <div class="modal">
                <div class="center">
                    <img alt="" src="../images/loader.gif" />
                </div>
            </div>
        </ProgressTemplate>--%>
	</asp:UpdateProgress>
	<asp:UpdatePanel runat="server" ID="Emp">

		<ContentTemplate>+
			<h2>EMPLOYEE DETAILS</h2>
			<%--<button id="wd" onclick="GetWiz()">Wizard</button>--%>
			<br />
				<div class="top-row">
				<div class="field-wrap">
					<label>
						Employee Number
					</label>
					<asp:TextBox ID="TxtEmploNumber" CssClass="inputz" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"  runat="server"></asp:TextBox>
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
						First Name
					</label>
					<input type="text" class="inputz" id="TxtFName" runat="server"  />
				</div>
				<div class="field-wrap">
					<label>
						Last Name
					</label>
					<asp:TextBox ID="txtLName" runat="server" OnTextChanged="txtLName_TextChanged" AutoPostBack="true"></asp:TextBox>
					<%--<input type="text" class="inputz" id="TxtLName" runat="server" placeholder="Last Name" />--%>
				</div>
			</div>
				<div class="top-row">
				<div class="field-wrap">
					<label>
						Email
					</label>
					<input type="email" class="inputz" id="txtEmail" placeholder="example@gmail.com" runat="server"  />
				</div>
				<div class="field-wrap">
					<label>
						Phone
					</label>
					<input type="tel" class="inputz" id="txtPhone" runat="server" placeholder="+2609xxxxxx" />
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
						<asp:GridView ID="GridViewAdvanceDetails" EmptyDataText="" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridViewAdvanceDetails_RowDataBound" runat="server">
							<EmptyDataTemplate>
								<a style="width: 100%; text-align: center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
									<span class="icon32 icon-color icon-info"></span>
									<div>No Incomplete Advance Found</div>
									<div>Please ensure that all fields are completed</div>
									<span class="notification green">AMS</span>
								</a>
							</EmptyDataTemplate>
							<Columns>
								<%--<asp:BoundField HeaderText="Salary" DataField="Current Salary" />--%>
								<asp:TemplateField HeaderText="Net Pay">
									<ItemTemplate>
										K<asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Current Salary") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Advance Amount">
									<ItemTemplate>
										K<asp:Label ID="lblAdvanceAm" runat="server" Text='<%# Eval("Advance Amount") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Recovery(Months)">
									<ItemTemplate>
										<asp:Label ID="lblDur" runat="server" Text='<%# Eval("Recovery Duration") %>'></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<%--<asp:BoundField HeaderText="Advance Amount" DataField="Advance Amount" />--%>
								<%--<asp:BoundField HeaderText="Recovery Duration(Months)" DataField="Recovery Duration" />--%>
								<asp:TemplateField HeaderText="Deduction (Month)">
									<ItemTemplate>
										K<asp:Label ID="lblPaymentPlan" runat="server" Text=""></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:TemplateField HeaderText="Salary After Deduction">
									<ItemTemplate>
										K<asp:Label ID="lblSalaryAfter" runat="server" Text=""></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<asp:BoundField HeaderText="Balance" DataField="Balance" />
								<asp:TemplateField HeaderText="Status">
									<HeaderStyle Width="100px" />
									<ItemTemplate>
										<asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
										<asp:Label ID="lblShowState" runat="server" Text=""></asp:Label>
									</ItemTemplate>
								</asp:TemplateField>
								<%--<asp:BoundField HeaderText="State" DataField="Advance State" />--%>
							</Columns>
						</asp:GridView>
					</div>
				</div>
			</div>
			<asp:TextBox ID="TxtTotal" Visible="false" Text="0" runat="server"></asp:TextBox>
		</ContentTemplate>
		<%--     <Triggers>
               <asp:AsyncPostBackTrigger ControlID="TxtEmploNumber" />
              
           </Triggers>--%>
		<%--<Triggers>
               <asp:AsyncPostBackTrigger />
           </Triggers>--%>
	</asp:UpdatePanel>

</div>
<%--<script>
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
	}
</script>--%>
<%--<script type="text/javascript">
        window.onsubmit = function () {
            if (Page_IsValid) {
                var updateProgress = $find("<%= Emp.ClientID %>");
                window.setTimeout(function () {
                    updateProgress.set_visible(true);
                }, 100);
            }
        }
    </script>--%>
    