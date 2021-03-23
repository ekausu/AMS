using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.RequestDetails
{
	public partial class CashPayments : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadCashPayments(string EmployeeNumber)
		{
			GridViewCashClearance.DataSource = bl.DisplayCashPayments(EmployeeNumber);
			GridViewCashClearance.DataBind();
		}
	}
}