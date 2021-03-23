<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pie_Balance.ascx.cs" Inherits="AdvanceSystem.RequestDetails.Pie_Balance" %>

<script src="../HighChartsjs/highcharts.js"></script>
<script src="../HighChartsjs/highcharts-3d.js"></script>
<script src="../HighChartsjs/exporting.js"></script>

<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 4</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                  	<div class="row-fluid" style="height:100%">
                        <div class="span12"><div id="container2" style="height: 100%"></div></div>
                       
                    </div>                   
                  </div>
				</div>

		<script type="text/javascript">

	Highcharts.chart('container2', {
    chart: {
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45,
            beta: 0
        }
    },
   
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            depth: 35,
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }
    },
    series: [{
        type: 'pie',
        name: 'Browser share',
        data: [
            ['Firefox', 45.0],
            ['IE', 26.8],
            {
                name: 'Chrome',
                y: 12.8,
                sliced: true,
                selected: true
            },
            ['Safari', 8.5],
            ['Opera', 6.2],
            ['Others', 0.7]
        ]
    }]
});
		</script>