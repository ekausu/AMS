using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Reporting_Grid
{
	public partial class StationsGraph : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (!IsPostBack)
				//LoadStationSummary("","");
		}
		public void LoadStationSummary(string Datefrm,string DateTo)
		{
			GridViewStationFund.DataSource = bl.LoadStationSummary(Datefrm, DateTo);
			GridViewStationFund.DataBind();
		}
	}
}