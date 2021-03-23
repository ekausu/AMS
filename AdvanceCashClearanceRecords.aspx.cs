using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class AdvanceCashClearanceRecords : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["UserName"] != null)
					LoadRecords("", "", "");
			     else
					Response.Redirect("Default.aspx");
			}
		}
		void LoadRecords(string Datefrm,string Dateto,string EmplNo)
		{
			GridviewCashReceipts.DataSource = bl.DisplayAdvanceClearance(Datefrm,Dateto,EmplNo);
			GridviewCashReceipts.DataBind();
		}
		protected void GridviewCashReceipts_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{

		}

		protected void GridviewCashReceipts_RowCommand(object sender, GridViewCommandEventArgs e)
		{

		}

		protected void BtnGenerate_ServerClick(object sender, EventArgs e)
		{
			GenerateReceipt(sender);
		}

		protected void BtnFind_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnDates_ServerClick(object sender, EventArgs e)
		{

		}
		void CreatePDF(ListAdvanceClear c)
		{
				//c.TotalAmount = int.Parse(TxtAmount.Text);
				//c.Date = TxtDate.Text;
				//c.EmployeeNumber = TxtENumber.Text;
				//c.Enteredby = TxtEnteredby.Text;
				//c.NewBalance = TxtBalanceAfterPayment.Text;
				//c.PaidBy = TxtPaidBy.Text;
				//			c.id = int.Parse(row["id"].ToString());

				//		c.Reqid = LReqid[i].ToString();
				//		c.Amount = (int)Math.Round(LAmount[i]);
				//		c.Balance = LBalance[i];
			   bl.NewCashAdvanceClearance(c);
				PDF_Filler pdf = new PDF_Filler();
				pdf.CreateCashReceipt(c);
				string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", "cash receipt" + c.Reqid + ".pdf"));
				ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);
            	n.Notification("Saved Successfully", INotification.success, this);

			}
			void GenerateReceipt(object sender)
		{

			ListAdvanceClear c = new ListAdvanceClear();
			System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			Label lblid = (Label)gvrow.FindControl("lblReqid");
			Label lblDate = gvrow.FindControl("lblDate") as Label;
			Label lblEmployeeNumber = (Label)gvrow.FindControl("lblEmployeeNumber");
			Label lblEnteredBy = gvrow.FindControl("lblEnteredBy") as Label;
			Label lblPaidBy = (Label)gvrow.FindControl("lblPaidBy");
			Label lblBalance = gvrow.FindControl("lblBalance") as Label;
			Label lblAmountPaid = (Label)gvrow.FindControl("lblAmountPaid");
			Label lblNewBalance = gvrow.FindControl("lblNewBalance") as Label;
			Label lblEntryDate = gvrow.FindControl("lblEntryDate") as Label;

			if (lblBalance.Text!="" && lblAmountPaid.Text!="" && lblNewBalance.Text!="")
			{
				c.TotalAmount = int.Parse(lblAmountPaid.Text);
				c.Date = lblDate.Text;
				c.EmployeeNumber = lblEmployeeNumber.Text;
				c.Enteredby = lblEnteredBy.Text;
				c.NewBalance = lblNewBalance.Text;
				c.PaidBy = lblPaidBy.Text;

				c.Reqid = lblid.Text;
				//c.Amount = int.Parse(lblAmountPaid.Text);
				c.Balance = float.Parse(lblBalance.Text);
				//return idholder.Text = lblid.Text;
				CreatePDF(c);
			}
		}

		protected void BtnSearch_ServerClick(object sender, EventArgs e)
		{
			LoadRecords("", "", TxtEmployeeNo.Text);
		}

		protected void BtnSearch2_ServerClick(object sender, EventArgs e)
		{
			LoadRecords(TxtDatefrm.Text, TxtDateTo.Text, "");
		}

		protected void BtnRepeat_ServerClick(object sender, EventArgs e)
		{
			LoadRecords("", "", "");
		}
	}
}