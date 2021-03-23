using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class AdvanceStatus : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadAdvanceDetails("0");
		}

		protected void BtnSearch_ServerClick(object sender, EventArgs e)
		{
			LoadAdvanceDetails(TxtEmployeeNumber.Text);
		}
		void LoadAdvanceDetails(string EmployeeNumber)
		{
			GridViewAdvanceDetails.DataSource = bl.LoadEmployeeDet(true, EmployeeNumber, 1);//dt;// (true, "2323");//bl.LoadEmployeeDet(true, "2323"); ;
			GridViewAdvanceDetails.DataBind();

			GridViewHistory.DataSource = bl.LoadEmployeeDet(true, EmployeeNumber, 2);
			GridViewHistory.DataBind();

			GridViewDeductions.DataSource = bl.LoadPayments(EmployeeNumber);
			GridViewDeductions.DataBind();
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

				lblPaymentPlan.Text = (int.Parse(lblAdvanceAm.Text) / int.Parse(lblDur.Text)).ToString();
				lblSalaryAfter.Text = (int.Parse(lblSalary.Text) - int.Parse(lblPaymentPlan.Text)).ToString();

				if (status.Text != "Complete")
					lblShowState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Incomplete</span>";
				else
					lblShowState.Text = "<i class='icon32 icon-green icon-bullet-on'></i>Completed";
			}

		}
	}
}