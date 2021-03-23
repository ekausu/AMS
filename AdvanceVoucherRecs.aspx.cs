using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem
{
	public partial class AdvanceVoucherRecs : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["UserName"] != null)
				{
					DisplayVoucherRecs("", "", "");
				}
				else
					Response.Redirect("Default.aspx");
			}
				
		}
		void DisplayVoucherRecs(string DateFrm,string Dateto, string EmployeeNumber)
		{
		    GridviewVoucherReceipts.DataSource=	bl.DisplayVoucherRecs(DateFrm,Dateto, EmployeeNumber);
			GridviewVoucherReceipts.DataBind();
			TxtButtonEvent.Text = "DATE";
		}
		protected void BtnRepeat_ServerClick(object sender, EventArgs e)
		{
			DisplayVoucherRecs("", "", "");
		}

		protected void GridviewVoucherReceipts_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			GridviewVoucherReceipts.PageIndex = e.NewPageIndex;
			if (TxtButtonEvent.Text == "DATE")
				BtnSearch2_ServerClick(sender, e);
			else
				BtnSearch_ServerClick(sender,e);

		}
		string GenerateId(object sender)
		{
			System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			Label lblid = (Label)gvrow.FindControl("lblReqid");
			//Label lbladvanceamount = (Label)gvrow.FindControl("lbladvanceamount");
			//Label lblfname = (Label)gvrow.FindControl("lblfname");
			//Label lbllname = (Label)gvrow.FindControl("lbllname");
			//Session["Names"] = lblfname.Text + " " + lbllname.Text;
			//Session["Amount"] = lbladvanceamount.Text;
			// TxtStatus.Text = ((Label)gvrow.FindControl("lblStatus")).Text;
			return idholder.Text = lblid.Text;

		}
		protected void BtnGenerate_ServerClick(object sender, EventArgs e)
		{
			string id = GenerateId(sender);
			PrintVoucher(id);
		}
		private void PrintVoucher(string Reqid)
		{
			ListVoucher v = new ListVoucher();

			string vid = "";
			using (DataTable dt = bl.DisplayVoucher(Reqid))
			{
				if (dt.Rows.Count > 0)
				{
					foreach (DataRow row in dt.Rows)
					{
						v.Authorities = row["Authorities"].ToString();
						v.Date = row["Date"].ToString();
						v.Reqid = Reqid;//row["Authorities"].ToString();
						v.Address = row["Address"].ToString();
						v.Description = row["Description"].ToString();
						v.Department = row["Department"].ToString();
						v.AccountType = row["Account Type"].ToString();
						v.Ministry = row["Ministry"].ToString();
						v.Name = row["Name"].ToString();
						v.Payee = row["Payee"].ToString();
						v.Station = row["Station"].ToString();
						// v.Total = row["Total"].ToString();
						v.UserName = row["Entered by"].ToString();
						vid = row["vid"].ToString();


					}
					LoadVoucherTable(v, vid);
				}
			}
		}
		void LoadVoucherTable(ListVoucher v, string vid)
		{
			//  ListVoucher Lis = new ListVoucher();
			int amount = 0;
			using (DataTable dt = bl.DisplayVoucherTable(vid))
			{
				string x = "";
				List<VoucherTable> Lis = new List<VoucherTable>();
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						VoucherTable vt = new VoucherTable();
						vt.Function = row["Class/Function"].ToString();
						vt.Head = row["Head"].ToString();
						vt.Dept = row["Dept"].ToString();
						vt.Unit = row["Unit"].ToString();
						vt.AccountingOfficer = row["Accounting Officer"].ToString();
						vt.Programme = row["Programme"].ToString();
						vt.Subsidiary = row["Subsidiary"].ToString();

						vt.AccountCode = row["Account Code"].ToString();
						vt.Activity = row["Activity"].ToString();
						x = row["Debit"].ToString();
						if (x != "")
							vt.Debit = int.Parse(x);
						else
							vt.Debit = 1;

						vt.Amount = row["Amount"].ToString();
						if (vt.Amount != "")
						{
							if(vt.Debit.ToString()=="1")
							amount = int.Parse(vt.Amount) + amount;
							else
							amount = amount-int.Parse(vt.Amount);
						}

						Lis.Add(vt);
					}
				v.VTable = Lis;
				v.Total = amount.ToString();
			}
			v.Code = GetBarCode(v.Reqid);
			PDF_Filler fi = new PDF_Filler();
			fi.Create(v);
			string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", "invoice" + v.Reqid + ".pdf"));
			ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);

			if (Session["Voucher"] == null)
				n.Notification("Please check popup blocker located in your browsers search section", INotification.info, this);

		}
		string GetBarCode(string Reqid)
		{
			string Code = "";
			using (DataTable dt = bl.LoadBarcodes(Reqid))
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						Code = row["Barcode"].ToString();
					}
			}
			return Code;
		}

		protected void BtnSearch_ServerClick(object sender, EventArgs e)
		{
			DisplayVoucherRecs("","", TxtEmployeeNo.Text);
			TxtButtonEvent.Text = "EMPLOYEENUMBER";
		}

		protected void BtnSearch2_ServerClick(object sender, EventArgs e)
		{
			DisplayVoucherRecs(TxtDatefrm.Text,TxtDateTo.Text, "");
			TxtButtonEvent.Text = "DATE";
		}
	}
}