using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

using System.Web.UI.HtmlControls;
using System.Globalization;
using System.Text;

namespace AdvanceSystem.Design_Cotrols
{
	public partial class RibbonBackstage : System.Web.UI.UserControl
	{
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
		BusinessLogic bl = new BusinessLogic();
		public void PassPage(Page o)
		{
			if (o is AMSReport_Manager)
				page = o as AMSReport_Manager;
		}
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadSummary();
			}
		}
		public void LoadSummary()
		{
			using (DataTable dt = bl.ReportsSummary())
			{
				foreach (DataRow row in dt.Rows)
				{
					lblAutoDeduction.Text = row["Auto Deduction"].ToString();
					lblMonthlyErning.Text = row["Earned"].ToString();
					lblPidBack.Text = row["Paid Back"].ToString();
					lblRunningAdvances.Text = row["Running Advances"].ToString();
					lblTotalBalance.Text = row["Balance"].ToString();
				}

			}
			((AMSReport_Manager)page).LoadScripts(Graph());
		}
		//void LoadA()
		//{
		//	ClientScriptManager script = this.Page.ClientScript;
		//	//object o= this.GetType();
		//	if (!script.IsClientScriptBlockRegistered(this.GetType(), "Var"))
		//		script.RegisterClientScriptBlock(this.GetType(), "Var", "<script type=\"text / javascript\">" + Graph() + "</script>");
		//       ClientScript.RegisterStartupScript(GetType(), "Javascript3", "javascript:" + Graph() + "", true);
		//}
	string Graph()
	{
		StringBuilder sb = new StringBuilder();
		sb.Append("Highcharts.chart('container', {");
		sb.Append("chart:");
		sb.Append("{");
		sb.Append("type: 'column',");
		sb.Append("options3d:");
		sb.Append("{");
		sb.Append("enabled: true,");
		sb.Append("alpha: 15,");
		sb.Append("beta: 15,");
		sb.Append("viewDistance: 25,");
		sb.Append("depth: 40");
		sb.Append("}");
		sb.Append("},");
		sb.Append("title:");
		sb.Append("{");
		sb.Append("text: 'Total fruit consumption, grouped by gender'");
		sb.Append("},");
		sb.Append("xAxis:");
		sb.Append("{");
		sb.Append("categories: ['Current Month', 'Earned', 'Auto Deduction', 'Paid back']");
		sb.Append("},");
		sb.Append("yAxis:");
		sb.Append("{");
		sb.Append("allowDecimals: false,");
		sb.Append("min: 0,");
		sb.Append("title:");
		sb.Append("{");
		sb.Append("text: 'Advance Summary'");
		sb.Append("}");
		sb.Append("},");
		sb.Append("tooltip:");
		sb.Append("{");
		sb.Append("headerFormat: '<b>{point.key}</b><br>',");
		sb.Append("pointFormat: '<span style=\"color:{series.color}\">u25CF</span> {series.name}: {point.y} / {point.stackTotal}'");
		sb.Append("},");
		sb.Append("plotOptions:");
		sb.Append("{");
		sb.Append("column:");
		sb.Append("{");
		sb.Append("stacking: 'normal',");
		sb.Append("depth: 40");
		sb.Append("}");
		sb.Append("},");
		sb.Append("series: [{");
		sb.Append("name: 'Balance',");
		sb.Append("data: [" + lblTotalBalance.Text + "],");
		sb.Append("stack: 'ex'");
		sb.Append("}, {");
		sb.Append("name: 'Earned',");
		sb.Append("data: [" + lblMonthlyErning.Text + "],");

		sb.Append("stack: 'er'");
		sb.Append("}, {");
		sb.Append("name: 'Auto deduction',");
		sb.Append("data: [" + lblAutoDeduction.Text + "],");
		sb.Append("stack: 'Back'");
		sb.Append("}, {");
		sb.Append("name: 'Running Advances',");
		sb.Append("data: [" + lblRunningAdvances.Text + "],");
		sb.Append("stack: 'female'");
		sb.Append("},");
		sb.Append("{");
		sb.Append("name: 'Paid Back',");
		sb.Append("data: [" + lblPidBack.Text + "],");
		sb.Append("stack: 'Back'");
		sb.Append("}");
		sb.Append("]");
		sb.Append("});");
	  //  sb.Append("}");
			return sb.ToString();
	}

			}
	}