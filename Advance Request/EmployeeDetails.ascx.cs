using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem.Advance_Request
{
    public partial class EmployeeDetails : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
		 Notifications n = new Notifications();
          
		protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bl.LoadRanks(DropDownRank);
                GridViewAdvanceDetails.DataSource = bl.LoadEmployeeDet(true, "0",0);
                GridViewAdvanceDetails.DataBind();
            }
        }
    //    void LoadRanks()
    //    {
    //        using (DataTable dt= bl.DisplayRanks())
    //        {
    //            int i = 0;
				//DropDownRank.Items.Clear();
				//DropDownRank.Items.Add(new ListItem("", ""));
				//foreach (DataRow row in dt.Rows)
    //            {
    //                DropDownRank.Items.Add(row["Rank"].ToString());
    //                i++;
    //            }
    //        }
    //      }
        public int Vaidated()
        {
            if (TxtEmploNumber.Text == "" || TxtFName.Value == "" || txtLName.Text == "" || DropDownRank.Text == "")
            {
                return 1;
            }
            else
                return 0;
        }
        public ListAdvanceDetails SaveEmployeeDetails(ListAdvanceDetails ad)
        {
            bool Saved = false;
            if (TxtEmploNumber.Text != "" && TxtFName.Value != "" && txtLName.Text != "")
            {
                string id = "";
                ad.EmployeeNumber = TxtEmploNumber.Text;
                ad.FirstName = TxtFName.Value;
                ad.LastName = txtLName.Text;
                ad.Rank = DropDownRank.Text;
				ad.Email = txtEmail.Value;
				ad.Phone = txtPhone.Value;
				ad.Entered = Environment.UserName;
                id = bl.NewEmployeeDetails(ad);
                if (id != "")
                {
                    ad.Reqid = int.Parse(id);
                    Saved= bl.NewAdvanceDetails(ad);
                }
            }
            return ad;
           // return ad;
        }
        void LoadGrid()
        {
			DataTable dt= bl.LoadEmployeeDet(true,TxtEmploNumber.Text, 1);
			GridViewAdvanceDetails.DataSource = dt;
            GridViewAdvanceDetails.DataBind();
			((AdvanceRequest)page).SetEmployeeDetails(TxtEmploNumber.Text);
		}
		public void AutoFill(ListAdvanceDetails det)
		{
			txtEmail.Value = det.Email;
			TxtFName.Value = det.FirstName;
			txtLName.Text = det.LastName;
			txtPhone.Value = det.Phone;
			txtEmail.Value = det.Email;
			DropDownRank.Text = det.Rank;
		}
		public bool HasRows()
		{
			if (GridViewAdvanceDetails.Rows.Count > 0)
				return true;
			else
				return false;
		}
		public string Deductions()
		{
			if (TxtTotal.Text == "")
				return "0";
			else
			return TxtTotal.Text;
		}
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            LoadGrid();
            EmptyControls();
            if (GridViewAdvanceDetails.Rows.Count==0)
                Session["Deduction"] = "0";
        }
      public void EmptyControls()
        {
            n.VALIDATE(TxtEmploNumber);
            n.VALIDATE(TxtFName);
            n.VALIDATE(txtLName);
            n.VALIDATE(TxtTotal);
            n.VALIDATE(DropDownRank);

        }
		public void ClearAll()
		{
			n.VALCLEAR(TxtEmploNumber);
			n.VALCLEAR(TxtFName);
			n.VALCLEAR(txtLName);
			n.VALCLEAR(TxtTotal);
			n.VALCLEAR(DropDownRank);
		}
        protected void GridViewAdvanceDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
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

                    //TextBox AMNT = (TextBox)(gv.FooterRow.FindControl("lblPaymentPlan"));
                    // val.Add(lblPaymentPlan.Text);
                    TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(lblPaymentPlan.Text)).ToString();
                    Session["Deduction"] = TxtTotal.Text;

                    if (status.Text != "Complete")
                        lblShowState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Incomplete</span>";
                    else
                        lblShowState.Text = "<i class='icon32 icon-green icon-bullet-on'></i>Completed";

                }
            }
            catch(Exception)
            {
                return;
            }
        }

		protected void txtLName_TextChanged(object sender, EventArgs e)
		{
			EmptyControls();

		}
	}
}