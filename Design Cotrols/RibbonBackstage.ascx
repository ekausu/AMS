<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RibbonBackstage.ascx.cs" Inherits="AdvanceSystem.Design_Cotrols.RibbonBackstage" %>
 <link href="../advcss/bootstrap.min.css" rel="stylesheet">
  <link href="../advfonts/font-awesome.min.css" rel="stylesheet">
    <link href="../advcss/custom.min.css" rel="stylesheet">

<script src="../HighChartsjs/highcharts.js"></script>
<script src="../HighChartsjs/data.js"></script>
<script src="../HighChartsjs/highcharts-3d.js"></script>
<script src="../HighChartsjs/exporting.js"></script>




<%--    <script src="js/highcharts.js"></script>
<script src="js/data.js"></script>
<script src="js/exporting.js"></script>
    
<script src="js/highcharts-3d.js"></script>--%>
<%------------------------STYLES---------------------------%>
<div style="overflow:visible; overflow-y:scroll">

<div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Total Balance</span>
              <div class="count green"><asp:Label Font-Size="Larger" ID="lblTotalBalance" runat="server" Text="0"></asp:Label></div>
              <span class="count_bottom"><i class="green">Balance</i>Current Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i>Estimated Monthly Erning</span>
              <div class="count"><asp:Label Font-Size="Larger" ID="lblMonthlyErning" runat="server" Text="0"></asp:Label></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>Earnings</i>Current Month</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top green"><i class="fa fa-user"></i>Total Earned</span>
              <div class="count green"><asp:Label Font-Size="Larger" ID="lblAutoDeduction" runat="server" Text="0"></asp:Label></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>System</i>Auto Deduction</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i>Advances Paid Back</span>
              <div class="count green"><asp:Label Font-Size="Larger" ID="lblPidBack" runat="server" Text="Label"></asp:Label></div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>Payments</i>Cash Clearance</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Approved Advances</span>
              <div class="count red">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Running Advances</span>
              <div class="count"><asp:Label Font-Size="Larger" ID="lblRunningAdvances" runat="server" Text="0"></asp:Label></div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>Running</i>Advances</span>
            </div>
          </div>
          <!-- /top tiles -->
 <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>Recent Activities <small>Sessions</small></h2>
                   <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <ul class="list-unstyled timeline">
                    <li>
                      <div class="block">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>Reports</span>
                          </a>
                        </div>
                        <div class="block_content">
                          <h2 class="title">
                                          <a>How to create Reports?</a>
                                      </h2>
                         <%-- <div class="byline">
                            <span>13 hours ago</span> by <a>Jane Smith</a>
                          </div>--%>
                          <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                          </p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="block">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>Entertainment</span>
                          </a>
                        </div>
                        <div class="block_content">
                          <h2 class="title">
                                          <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                      </h2>
                          <div class="byline">
                            <span>13 hours ago</span> by <a>Jane Smith</a>
                          </div>
                          <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                          </p>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="block">
                        <div class="tags">
                          <a href="" class="tag">
                            <span>Entertainment</span>
                          </a>
                        </div>
                        <div class="block_content">
                          <h2 class="title">
                                          <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                      </h2>
                          <div class="byline">
                            <span>13 hours ago</span> by <a>Jane Smith</a>
                          </div>
                          <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                          </p>
                        </div>
                      </div>
                    </li>
                  </ul>

                  </div>
                </div>
              </div>
         
     <div class="row">
                       
                <!-- Start to do list -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List <small>SUMMARY</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                          </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                         <div id="container" style="height: 400px"></div>
                        </div>
                  </div>
                </div>
         

                <!-- End to do list -->
                
                <!-- start of weather widget -->
                </div>
                <!-- end of weather widget -->
              </div>
        </div>
   
<%--<script type="text/javascript">

Highcharts.chart('container', {
    chart: {
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 15,
            beta: 15,
            viewDistance: 25,
            depth: 40
        }
    },

    title: {
        text: 'Total fruit consumption, grouped by gender'
    },

    xAxis: {
        categories: ['Current Month', 'Earned', 'Auto Deduction', 'Paid back']
    },

    yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Advance Summary'
        }
    },

    tooltip: {
        headerFormat: '<b>{point.key}</b><br>',
        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
    },

    plotOptions: {
        column: {
            stacking: 'normal',
            depth: 40
        }
    },

    series: [{
        name: 'Balance',
        data: [2736229],//, 3, 4, 7, 2],
        stack: 'ex'
    }, {
        name: 'Earned',
        data: [374106],//, 4, 4, 2, 5],
        stack: 'er'
    }, {
        name: 'Auto deduction',
        data: [0],// 5, 6, 2, 1],
        stack: 'Back'
    }, {
        name: 'Running Advances',
        data: [901],// 0, 4, 4, 3],
        stack: 'female'
		},
		 {
        name: 'Paid Back',
        data: [0],// 0, 4, 4, 3],
        stack: 'Back'
    }
	]
});


		</script>--%>