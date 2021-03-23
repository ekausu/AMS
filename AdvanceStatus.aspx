<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvanceStatus.aspx.cs" Inherits="AdvanceSystem.AdvanceStatus" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
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
                    <!-- content starts -->
                    <uc1:BreadCrumb runat="server" ID="BreadCrumb" />
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>My Advance Records</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                        <div class="block-area shortcut-area" id="BtnMenu" runat="server">                      
               <div class="dock" style="margin-left:35%">
<ul style="background:none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
     <li><a href="#ModaleEmployeeNumber">
       <img src="images/Loupe.png" /></a><span>Search</span></li>
    <%--<li><a id="BtnLoadPayments" runat="server" onserverclick=>
        <img src="images/planner.png" /></a><span>Payments</span></li>--%>
      <%--<li><a id="BtnSystemDeductions" runat="server" onserverclick="BtnSystemDeductions_ServerClick">
        <img src="images/korgac.png" /></a><span>Deductions</span></li>--%>
    <%--<li><a id="BtnApprovers" runat="server" onserverclick="BtnApprovers_ServerClick">
        <img src="images/clock.png" /></a><span>Monthly</span></li>--%>
    <%--<li><a id="BtnPlan" runat="server" onserverclick="BtnPlan_ServerClick"><img src="images/calendar_256x256.png" /></a><span>Plan</span></li>--%>
 
</ul>
</div>       
 </div>
                <div class="panel panel-default tabs">
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li><a href="#tab-first" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-doc"></i>RUNNING ADVANCE</a></li>
                                        <li><a href="#tab-second" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-briefcase"></i>ADVANCE HISTORY</a></li>
                                         <li><a href="#tab-third" role="tab" data-toggle="tab"><i class="icon32 icon-blue icon-user"></i>PAYMENTS</a></li>
                                     </ul>
                                    <div class="panel-body tab-content">
                                        
                                        <div class="tab-pane active" id="tab-first">
                                            <%------------------------------------------------------FIRST TAB---------------------------------------------------------------------------------------------------%>
 <asp:GridView ID="GridViewAdvanceDetails" EmptyDataText="No Previous Advance Records Available" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" OnRowDataBound="GridViewAdvanceDetails_RowDataBound" runat="server">
    <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>NO RECORDS DISPLAYED</div>
					<div>Please use the search buton above to load your results</div>
					<span class="notification green">Running Advances</span>
				</a>
                               </EmptyDataTemplate>
	 <Columns>
         <asp:TemplateField HeaderText="Net Pay" Visible="false" >
                <ItemTemplate>
                   K<asp:Label ID="lblSalary"  runat="server" Text='<%# Eval("Current Salary") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
                 <asp:TemplateField HeaderText="Advance Amount" >
                <ItemTemplate>
                   K<asp:Label ID="lblAdvanceAm" runat="server" Text='<%# Eval("Advance Amount") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
          <asp:TemplateField HeaderText="Recovery(Months)" >
                <ItemTemplate>
                   <asp:Label ID="lblDur" runat="server" Text='<%# Eval("Recovery Duration") %>'></asp:Label>
                 </ItemTemplate>
             </asp:TemplateField>
        <%--<asp:BoundField HeaderText="Advance Amount" DataField="Advance Amount" />--%>
        <%--<asp:BoundField HeaderText="Recovery Duration(Months)" DataField="Recovery Duration" />--%>
        <asp:TemplateField HeaderText="Deduction (Month)" >
                <ItemTemplate>
                    K<asp:Label ID="lblPaymentPlan" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
         <asp:TemplateField HeaderText="Salary After Deduction" Visible="false" >
                <ItemTemplate>
                    K<asp:Label ID="lblSalaryAfter" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField>
        <asp:BoundField HeaderText="End Date" DataField="EndDate" />
         <asp:TemplateField HeaderText="Status" >
             <HeaderStyle Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="lblStatus" Visible="false" runat="server" Text='<%# Eval("Advance State") %>'></asp:Label>
                    <asp:Label ID="lblShowState" runat="server" Text=""></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
        <%--<asp:BoundField HeaderText="State" DataField="Advance State" />--%>
    </Columns>
</asp:GridView>
											<%--*************************--%>
                                        </div>
								
										       <div class="tab-pane" id="tab-second">
                                            <%------------------------------------------------------SECOND TAB---------------------------------------------------------------------------------------------------%>
                              		<asp:GridView ID="GridViewHistory" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
										    <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>NO ADVANCE HISTORY FOUND</div>
					<div>There are no historical records displayed</div>
					<span class="notification green">History</span>
				</a>
                               </EmptyDataTemplate>
                              	   <Columns>
                                 <asp:BoundField HeaderText="Start Date" DataField="Start Date" />
                                 <asp:BoundField HeaderText="End Date" DataField="EndDate" />
                                 <%--<asp:BoundField HeaderText="Net Salary" DataField="Current Salary" />--%>
                                 <asp:BoundField HeaderText="Advance Amount" DataField="Advance Amount" />
                                 <asp:BoundField HeaderText="Recovery(Months)" DataField="Recovery Duration" />
                                 <%--<asp:BoundField HeaderText="Reason" DataField="Reason" />--%>
                                   <asp:BoundField HeaderText="Unit" DataField="Unit" />
                                 <asp:BoundField HeaderText="Section" DataField="Section" />
                                 <%--<asp:BoundField HeaderText="Entered By" DataField="Entered by" />--%>
                                 <asp:BoundField HeaderText="Entered Date" DataField="Entered Date" />

                             </Columns>
                             </asp:GridView>
											<%--*************************--%>
                                        </div>
										       <div class="tab-pane" id="tab-third">
                                            <%------------------------------------------------------FIRST TAB---------------------------------------------------------------------------------------------------%>
                              		<asp:GridView ID="GridViewDeductions"
										  ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
										    <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>NO ADVANCE HISTORY FOUND</div>
					<div>There are no historical records displayed</div>
					<span class="notification green">History</span>
				</a>
                               </EmptyDataTemplate>
										  <Columns>
											    <asp:BoundField DataField="Date" HeaderText="Payment Date" />
											  <asp:BoundField DataField="Employee Number" HeaderText="Employee Number" />
											   <asp:BoundField DataField="Entry Date" HeaderText="Entry Date" />
											   <asp:BoundField DataField="TotalAmount" HeaderText="Amount Paid" />
											   <asp:BoundField DataField="New Balance" HeaderText="New Balance" />
										  </Columns>
                              		</asp:GridView>
							
											<%--*************************--%>
                                        </div>
                                
					</div>
				</div><!--/span-->
                  
                        </div>
         
            </div>
           <%-------------------------------------------------------------%>
           
           <a href="#x" class="overlay" runat="server" id="ModaleEmployeeNumber"></a>
        <div class="popup">
                        
           <div class="control-group">
								<label class="control-label" for="appendedInputButton">Employee Number</label>
								<div class="controls">
								  <div class="input-append">
									<asp:TextBox ID="TxtEmployeeNumber" runat="server"></asp:TextBox><button class="btn" id="BtnSearch" runat="server" onserverclick="BtnSearch_ServerClick" type="button">Search</button>
								  </div>
								</div>
							  </div>
              <a class="close" href="#close"></a>
        </div>
         
            <hr>

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            </footer>
                </div>
        </div>
      
  <script src="js/Cha.js"></script>
        
        
   <link href='caljs/fullcalendar.min.css' rel='stylesheet' />
<link href='caljs/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='caljs/moment.min.js'></script>
<script src='caljs/jquery.min.js'></script>
<script src='caljs/fullcalendar.min.js'></script>

<%--<link href='css/fullcalendar.min.css' rel='stylesheet' />
<link href='css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>--%>
        <%--<script>

            $(document).ready(function () {

                $('#calendars').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay,listWeek,listMonth,listYear'
                    },

                    // customize the button names,
                    // otherwise they'd all just say "list"
                    views: {
                        listDay: { buttonText: 'list day' },
                        listWeek: { buttonText: 'list week' }
                    },

                    defaultView: 'listWeek',
                    defaultDate: '2017-05-12',
                    navLinks: true, // can click day/week names to navigate views
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: [
                        {
                            title: 'All Day Event',
                            start: '2017-05-01'
                        },
                        {
                            title: 'Long Event',
                            start: '2017-05-07',
                            end: '2017-05-10'
                        },
                        {
                            id: 999,
                            title: 'Repeating Event',
                            start: '2017-05-09T16:00:00'
                        },
                        {
                            id: 999,
                            title: 'Repeating Event',
                            start: '2017-05-16T16:00:00'
                        },
                        {
                            title: 'Conference',
                            start: '2017-05-11',
                            end: '2017-05-13'
                        },
                        {
                            title: 'Meeting',
                            start: '2017-05-12T10:30:00',
                            end: '2017-05-12T12:30:00'
                        },
                        {
                            title: 'Lunch',
                            start: '2017-05-12T12:00:00'
                        },
                        {
                            title: 'Meeting',
                            start: '2017-05-12T14:30:00'
                        },
                        {
                            title: 'Happy Hour',
                            start: '2017-05-12T17:30:00'
                        },
                        {
                            title: 'Dinner',
                            start: '2017-05-12T20:00:00'
                        },
                        {
                            title: 'Birthday Party',
                            start: '2017-05-13T07:00:00'
                        },
                        {
                            title: 'Click for Google',
                            url: 'http://google.com/',
                            start: '2017-05-28'
                        }
                    ]
                });

            });

</script>--%>

    </form>
</body>
</html>
