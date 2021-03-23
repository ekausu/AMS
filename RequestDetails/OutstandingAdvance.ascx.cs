using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;


namespace AdvanceSystem.RequestDetails
{
	public partial class OutstandingAdvance : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadGrid(string id, GridViewRow row)
		{
			GridViewAdvanceDetails.DataSource = bl.LoadEmployeeDet(true, id, 1);
			GridViewAdvanceDetails.DataBind();
		}
		protected void GridViewAdvanceDetails_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				Label status = e.Row.FindControl("lblStatus") as Label;
				Label lblShowState = e.Row.FindControl("lblShowState") as Label;

				Label lblSalary = e.Row.FindControl("lblSalary") as Label;
				Label lblAdvanceAm = e.Row.FindControl("lblAdvanceAm") as Label;
				Label lblDur = e.Row.FindControl("lblDur") as Label;
				Label lblPaymentPlan = e.Row.FindControl("lblPaymentPlan") as Label;
				Label lblSalaryAfter = e.Row.FindControl("lblSalaryAfter") as Label;

				lblPaymentPlan.Text = (float.Parse(lblAdvanceAm.Text) / float.Parse(lblDur.Text)).ToString();
				lblSalaryAfter.Text = (float.Parse(lblSalary.Text) - float.Parse(lblPaymentPlan.Text)).ToString();

				if (status.Text != "Complete")
					lblShowState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Incomplete</span>";
				else
					lblShowState.Text = "<i class='icon32 icon-green icon-bullet-on'></i>Completed";
			}
		}
	}
}