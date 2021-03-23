using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using AdvanceSystem.Wrapper;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace AdvanceSystem
{
	public partial class AdvanceCashier : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		ImageGenerator img = new ImageGenerator();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{

				if (Session["UserName"] != null)
				{
					LoadRequests(Session["UserName"].ToString(), "");
				}
				else
					Response.Redirect("Default.aspx");
			}
		}
		string GenerateId(object sender)
		{
			System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			Label lblid = (Label)gvrow.FindControl("lblReqid");
			Label lbladvanceamount = (Label)gvrow.FindControl("lbladvanceamount");
			Label lblfname = (Label)gvrow.FindControl("lblfname");
			Label lbllname = (Label)gvrow.FindControl("lbllname");
			Session["Names"] = lblfname.Text + " " + lbllname.Text;
			Session["Amount"] = lbladvanceamount.Text;
			// TxtStatus.Text = ((Label)gvrow.FindControl("lblStatus")).Text;
			return idholder.Text = lblid.Text;

		}
		void LoadGrid(string Reqid, string Empid, GridViewRow row)
		{
			//DataTable dt = new DataTable();
			// dt = bl.LoadEmployeeDet(true, Empid);

			GridView GVPendingAd = row.FindControl("GridViewAdvanceDetails") as GridView;
			GridView GVHistory = row.FindControl("GridViewAdvHistory") as GridView;
			GridView GVVoucher = row.FindControl("GridViewVoucher") as GridView;

			GVHistory.DataSource = bl.LoadEmployeeDet(true, Empid, 0);
			GVHistory.DataBind();

			GVPendingAd.DataSource = bl.LoadEmployeeDet(true, Empid, 1);// dt;// (true, "2323");//bl.LoadEmployeeDet(true, "2323"); ;
			GVPendingAd.DataBind();

			GVVoucher.DataSource = bl.DisplayVoucher(Reqid);
			GVVoucher.DataBind();
		}
		void LoadRequests(string User, string Status)
		{
			GridviewVoucherApproval.DataSource = bl.DisplayRequest(User, Status);
			GridviewVoucherApproval.DataBind();
		}
		protected void GridviewVoucherApproval_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			GridviewVoucherApproval.PageIndex = e.NewPageIndex;
			if (txtClickedOption.Text == "BtnMyApproval")
				BtnMyApproval_ServerClick(sender,e);
			if (txtClickedOption.Text == "BtnDisplayAll")
				BtnDisplayAll_ServerClick(sender, e);
		}

		protected void GridviewVoucherApproval_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				Label status = e.Row.FindControl("lblStatus") as Label;
				Label lblDisplayState = e.Row.FindControl("lblDisplayState") as Label;
				Label lblBalance = e.Row.FindControl("lblBalance") as Label;
				Label lbllv = e.Row.FindControl("level") as Label;


				//System.Web.UI.HtmlControls.HtmlAnchor BtnGenerateVoucher = e.Row.FindControl("BtnGenerateVoucher") as System.Web.UI.HtmlControls.HtmlAnchor;
				//System.Web.UI.HtmlControls.HtmlAnchor BtnPrintVoucher = e.Row.FindControl("BtnPrintVoucher") as System.Web.UI.HtmlControls.HtmlAnchor;
				//BtnGenerateVoucher.Visible = false;
				//BtnPrintVoucher.Visible = false;


				if (lbllv.Text == "2")
					lblDisplayState.Text = "<i class='icon32 icon-blue icon-bullet-on'></i><span class='label label-info'>2nd Approval</span>";
				if (lbllv.Text == "2")
					lblDisplayState.Text = "<i class='icon32 icon-blue icon-bullet-on'></i><span class='label label-info' style='background-color:blue'>1st Approval</span>";
				if (status.Text.ToUpper() == "REJECTED")
					lblDisplayState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Rejected</span>";
				if (lbllv.Text == "3")
				{
					lblDisplayState.Text = "<i class='icon32 icon-gray icon-bullet-on'></i><span class='label'>Voucher Handler</span>";
				}
				if (lbllv.Text == "4")
				{
					lblDisplayState.Text = "<i class='icon32 icon-darkgray icon-bullet-off'></i><span class='label' style='background:black'>Cashier</span>";
				}
				if (lblBalance.Text != "")
				{
					float bal = float.Parse(lblBalance.Text);
					if (bal > 0)
					{
						lblDisplayState.Text = "<i class='icon32 icon-orange icon-bullet-on'></i><span class='label label-warning'>Running Recovery</span>";
					}
					else
					{
						lblDisplayState.Text = "<i class='icon32 icon-green icon-bullet-on'></i><span class='label label-success'>Completed</span>";
					}
					//BtnPrintVoucher.Visible = true;

				}
				else
				{
					//BtnGenerateVoucher.Visible = true;
				}
			}
		}

		protected void GridviewVoucherApproval_DataBound(object sender, EventArgs e)
		{

		}

		protected void GridviewVoucherApproval_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			
		}

		protected void imgGrid2_Click(object sender, ImageClickEventArgs e)
		{
			ImageButton imgShowHide = (sender as ImageButton);
			// GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

			GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
			if (imgShowHide.CommandArgument == "Show")
			{
				row.FindControl("Panel1").Visible = true;
				Label lblid = row.FindControl("lblReqid") as Label;
				Label Htmlimages = row.FindControl("LblImages") as Label;
				Label lblEmployeeNumber = row.FindControl("lblEmployeeNumber") as Label;
				// string id = ((Label)row.FindControl("lblReqid")).Text;
				imgShowHide.CommandArgument = "Hide";
				imgShowHide.ImageUrl = "~/minus.ico";
				LoadGrid(lblid.Text, lblEmployeeNumber.Text, row);
				Htmlimages.Text = img.GenerateImages(bl.DisplayImages(lblid.Text));
			}
			else
			{
				row.FindControl("Panel1").Visible = false;
				imgShowHide.CommandArgument = "Show";
				imgShowHide.ImageUrl = "~/plus.ico";
			}
		}

		protected void BtnApprovers_ServerClick(object sender, EventArgs e)
		{
			string id = GenerateId(sender);
			GridViewApprovers.DataSource = bl.LoadApprover(id);
			GridViewApprovers.DataBind();

			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalApprovers';", true);

		}

		protected void BtnViewVoucher_ServerClick(object sender, EventArgs e)
		{
			string id = GenerateId(sender);
			PrintVoucher(id);
		}

		protected void BtnApproveVoucher_ServerClick(object sender, EventArgs e)
		{
			Session["Users"] = "true";
			//LoadReasignList(int.Parse(txtlevel.Text));
			///////
			StringBuilder sb = new StringBuilder();
			string id = GenerateId(sender);
			using (DataTable dt = bl.LoadApprover(id))
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						sb.Append("<div class='alert alert-info'>");
						sb.Append("<button type='button' class='close' data-dismiss='alert'>×</button>");
						sb.Append("<h4 class='alert-heading'>Approved by"+row["Approved By"].ToString()+"!</h4>");
						sb.Append("<p>Date:" + row["Date"].ToString() + "  Approved:" + row["Approved"].ToString()+ " Comments:" + row["Reason"].ToString() + "  </p>");
						sb.Append("</div>");
					}
				lblComments.Text = sb.ToString();
			}
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalApprove';", true);

		}
		void Approvals(string AssignedTo, ApproveType app)
		{
			EmailCredentials ec = new EmailCredentials();
			EmailTemplateCreator etc = new EmailTemplateCreator();
			ListAdvanceDetails det = new ListAdvanceDetails();
			det.Reqid = int.Parse(idholder.Text);
			det.ApprovedBy = Session["UserName"].ToString();
			det.AssignedTo = AssignedTo;
			det.Approved = app;
			det.Reason = TxtComments.Text;
			bl.Approvals(det);
			ec.SendToEmail = "";
			etc.SendEmail(det, ec, true);
			
			n.Notification("Response sent Successfully", INotification.success, this);
			LoadRequests("", "4");
			Session["Reassignid"] = null;
		}
		protected void BtnCashReceipt_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnPayslips_ServerClick(object sender, EventArgs e)
		{
			string id = GenerateId(sender);
			GridViewFiles.DataSource = bl.DisplayImages(id);
			GridViewFiles.DataBind();
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalFile';", true);

		}

		protected void GridViewAdvHistory_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void GridViewVoucher_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void GridViewVoucherTable_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void BtnDownload_ServerClick(object sender, EventArgs e)
		{
			System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			Label lblfilenam = (Label)gvrow.FindControl("TxtImageName");
			Label lblExt = (Label)gvrow.FindControl("lblExt");
			if (lblfilenam.Text != "" && lblExt.Text != "")
				DownloadFiles(lblfilenam.Text, lblExt.Text);

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
						string x = "";
						x = row["Debit"].ToString();
						if (x != "")
							vt.Debit = int.Parse(x);
						else
							vt.Debit = 1;

						vt.Amount = row["Amount"].ToString();
						if (vt.Amount != "")
						{
							if (vt.Debit.ToString() == "1")
								amount = int.Parse(vt.Amount) + amount;
							else
								amount = amount - int.Parse(vt.Amount);
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
		void DownloadFiles(string filename, string ext)
		{
			string url = "Payslips/" + filename;
			string s = "window.open('" + url + "', 'popup_window', 'toolbar = yes,scrollbars = yes,resizable = yes,top = 200,left = 200,width = 900,height = 900');";// 'width=800,height=800,left=100,top=100,resizable=yes');";
			ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
		}
			protected void BtnFilter_ServerClick(object sender, EventArgs e)
		{

		}

		protected void GridViewApprovers_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void GridViewAdvanceDetails_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}
		void LoadExtraGrid(string id, GridViewRow row)
		{
			DataTable dt = new DataTable();
			dt = bl.DisplayVoucherTable(id);

			GridView GV = row.FindControl("GridViewVoucherTable") as GridView;

			GV.DataSource = dt;
			GV.DataBind();
		}
		protected void imgVoucher_Click(object sender, ImageClickEventArgs e)
		{
			ImageButton imgShowHide = (sender as ImageButton);
			// GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

			GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
			if (imgShowHide.CommandArgument == "Show")
			{
				row.FindControl("Panel1").Visible = true;
				Label lblid = row.FindControl("vid") as Label;
				// Label Htmlimages = row.FindControl("LblImages") as Label;
				// Label lblEmployeeNumber = row.FindControl("lblEmployeeNumber") as Label;
				// string id = ((Label)row.FindControl("lblReqid")).Text;
				imgShowHide.CommandArgument = "Hide";
				imgShowHide.ImageUrl = "~/minus.ico";
				LoadExtraGrid(lblid.Text, row);
				//  Htmlimages.Text = img.GenerateImages(bl.DisplayImages(lblid.Text));
			}
			else
			{
				row.FindControl("Panel1").Visible = false;
				imgShowHide.CommandArgument = "Show";
				imgShowHide.ImageUrl = "~/plus.ico";
			}
		}

		protected void BtnCompleted_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnRunning_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnDisplayAll_ServerClick(object sender, EventArgs e)
		{
			LoadRequests("", "4");
			txtClickedOption.Text = "BtnDisplayAll";
		}

		protected void BtnMyApproval_ServerClick(object sender, EventArgs e)
		{
			LoadRequests(Session["UserName"].ToString(), "");
			txtClickedOption.Text = "BtnMyApproval";
		}

		protected void BtnApprove_ServerClick(object sender, EventArgs e)
		{
			Approvals("",ApproveType.Approved);
			//EmailCredentials ec = new EmailCredentials();
			//EmailTemplateCreator etc = new EmailTemplateCreator();
		}

		protected void BtnReject_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnReassign_ServerClick(object sender, EventArgs e)
		{

		}

		protected void A1_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnReqReject_ServerClick(object sender, EventArgs e)
		{
			Approvals("", ApproveType.Rejected);
		}
	}
}