using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace AdvanceSystem.RequestDetails
{
	public partial class EmployeeDetails : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadGrid(DataTable dt)
		{
			GridViewEmployeeDetails.DataSource = dt;
			GridViewEmployeeDetails.DataBind();
		}
	}
}