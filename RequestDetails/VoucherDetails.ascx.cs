using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.RequestDetails
{
	public partial class VoucherDetails : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadVoucherDetails(int id)
		{
			GridViewVoucherTable.DataSource=bl.DisplayVoucherTable(id);
			GridViewVoucherTable.DataBind();
		}
		protected void GridViewVoucherTable_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}
	}
}