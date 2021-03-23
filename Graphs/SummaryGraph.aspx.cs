using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using AdvanceSystem.Wrapper;
using System.Web.UI.WebControls;

namespace AdvanceSystem.Graphs
{
	public partial class SummaryGraph : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadStationSummary("", "");
		}
		public void LoadStationSummary(string Datefrm, string DateTo)
		{
			GridViewStationFund.DataSource = bl.LoadStationSummary(Datefrm, DateTo);
			GridViewStationFund.DataBind();
		}
	}
}