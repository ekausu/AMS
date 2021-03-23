using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AdvanceSystem.RequestDetails
{
	public partial class AdvanceDetails : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadGrid(DataTable dt)
		{
			GridViewAdvanceDetails.DataSource = dt;
			GridViewAdvanceDetails.DataBind();
		}
	}
}