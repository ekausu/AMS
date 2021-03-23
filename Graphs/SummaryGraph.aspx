<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryGraph.aspx.cs" Inherits="AdvanceSystem.Graphs.SummaryGraph" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<%--<script src="../js/bootstrap-tooltip.js"></script>--%>
	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/highcharts.js"></script>
	
<script src="../js/highcharts-3d.js"></script>
<script src="../js/data.js"></script>
<script src="../js/exporting.js"></script>
	<style>
		table,.container2 {
			width:90%;
			margin-left:10px;
			margin-right:10px;
		}
		/*.container2 {
			width:
		}*/
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			
<div id="container2" style="height: 800px;"></div>
<br />
			<%--<div id="sliders">
    <table>
        <tr>
        	<td>Alpha Angle</td>
        	<td><input id="alpha" type="range" min="0" max="45" value="15"/> <span id="alpha-value" class="value"></span></td>
        </tr>
        <tr>
        	<td>Beta Angle</td>
        	<td><input id="beta" type="range" min="-45" max="45" value="15"/> <span id="beta-value" class="value"></span></td>
        </tr>
        <tr>
        	<td>Depth</td>
        	<td><input id="depth" type="range" min="20" max="100" value="50"/> <span id="depth-value" class="value"></span></td>
        </tr>
    </table>
</div>--%>
<br />
<asp:GridView ID="GridViewStationFund"  CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
    <Columns>
    
    </Columns>
</asp:GridView>

        </div>
		<script type="text/javascript">

Highcharts.chart('container2', {
    data: {
        table: 'GridViewStationFund'
    },
                chart: {
					type: 'column',
					options3d: {
						enabled: true,
						alpha: 0,
						beta: 0,
						depth: 31
					}
                },
    title: {
        text: 'Station Summary'
	},
	 subtitle: {
        text: 'Notice the difference between a 0 value and a null point'
    },
    plotOptions: {
        column: {
            depth: 25
        }
	},
	 legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'top',
        x: -40,
        y: 80,
        floating: true,
        borderWidth: 1,
        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
        shadow: true
    },
    yAxis: {
        allowDecimals: false,
        title: {
            text: 'Units'
        }
    },
    tooltip: {
        formatter: function () {
            return '<b>' + this.series.name + '</b><br/>' +
                this.point.y + ' ' + this.point.name.toLowerCase();
        }
    }
});
			
//function showValues() {
//    $('#alpha-value').html(Highcharts.chart('container2').options.chart.options3d.alpha);
//    $('#beta-value').html(Highcharts.chart('container2').options.chart.options3d.beta);
//    $('#depth-value').html(Highcharts.chart('container2').options.chart.options3d.depth);
//}

//// Activate the sliders
//$('#sliders input').on('input change', function () {
//    chart.options.chart.options3d[this.id] = parseFloat(this.value);
//    showValues();
//    chart.redraw(false);
//});

//showValues();

		</script>
    </form>
</body>
</html>
