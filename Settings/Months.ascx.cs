using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Settings
{
	public partial class Months : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadMonths();
		}
		void LoadMonths()
		{
			GridViewMonths.DataSource = bl.GetMonths();
			GridViewMonths.DataBind();
		}
		protected void BtnAdd_ServerClick(object sender, EventArgs e)
		{
			if (txtStartRange.Value != "" && txtEndRange.Value != "")
			{
				int start = int.Parse(txtStartRange.Value);
				int end = int.Parse(txtEndRange.Value);
				if (start < end)
				{
					bl.NewMonths(start, end);
					LoadMonths();
				}
			}
		}
	}
}