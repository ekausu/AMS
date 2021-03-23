using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Settings
{
	public partial class Reports : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadReports();
		}
		void LoadReports()
		{
			GridViewReports.DataSource = bl.Reports();
			GridViewReports.DataBind();
		}
		protected void BtnAdd_ServerClick(object sender, EventArgs e)
		{
			string link = txtLink.Value;
			string title = txtTitle.Value;
			if (link != "" && title != "")
			{
				bl.NewReport(title,link);
				LoadReports();
				n.Notification("Saved successfully",INotification.success);
			}
			else
				n.Notification("Missing Entires", INotification.warning);
		}

		protected void GridViewReports_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void BtnDelete2_ServerClick(object sender, EventArgs e)
		{

		}
	}
}