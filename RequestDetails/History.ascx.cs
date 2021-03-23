using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.RequestDetails
{
	public partial class History : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadGrid(string id, GridViewRow row)
		{
			GridViewAdvHistory.DataSource = bl.LoadEmployeeDet(true, id, 2);
			GridViewAdvHistory.DataBind();
		}
		protected void GridViewAdvHistory_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}
	}
}