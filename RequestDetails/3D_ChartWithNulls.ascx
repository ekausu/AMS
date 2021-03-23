<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="3D_ChartWithNulls.ascx.cs" Inherits="AdvanceSystem.RequestDetails._3D_ChartWithNulls" %>
	<div class="box span8">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-th"></i> Grid 6</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
<div id="container1" style="height: 600px;width:100%"></div>
						</div>
		</div>
<script type="text/javascript">

	Highcharts.chart('container1', {
    chart: {
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 10,
            beta: 25,
            depth: 70
        }
    },
    title: {
        text: '3D chart with null values'
    },
    subtitle: {
        text: 'Notice the difference between a 0 value and a null point'
    },
    plotOptions: {
        column: {
            depth: 25
        }
    },
    xAxis: {
        categories: Highcharts.getOptions().lang.shortMonths
    },
    yAxis: {
        title: {
            text: null
        }
    },
    series: [{
        name: 'Sales',
        data: [2, 3, null, 4, 0, 5, 1, 4, 6, 3,9,10]
    }]
});
		</script>