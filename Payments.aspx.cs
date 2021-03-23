using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;
using System.IO;
using System.Drawing;
using System.Diagnostics;

namespace AdvanceSystem
{
    public partial class Payments : System.Web.UI.Page
    {
        Notifications n = new Notifications();
		BusinessLogic bl = new BusinessLogic();
		PDF_Filler fi = new PDF_Filler();
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				if (Session["UserName"] != null)
				{
					FirstLoad(GridViewVoucher, "GridViewVoucher");
					FirstLoad(GridViewVoucherTableCredit, "GridViewVoucherTableCredit");
					if (Session["Names"] != null && Session["Amount"] != null)
					{
						TxtPayee.Value = Session["Names"].ToString();
						TxtAdvance.Text = Session["Amount"].ToString();
						TxtName.Value = Session["UserName"].ToString();
					}
					else
						Response.Redirect("AccountsSection.aspx");
					//					GenerateBarcode(Session["Reqid"].ToString());

				}
				else
					Response.Redirect("Default.aspx");
				LoadGridRecs();

			}
		
		}
		void LoadGridRecs()
		{
			//int id2 = 0;
			string id = Request.QueryString["Reqid"];
			if (id != null && id != "")
				idholder.Text = id;
		}
		
		protected void BtnSaveRe_ServerClick(object sender, EventArgs e)
        {
			Save();
		}


		string GenerateBarcode(string id)
		{
			string station = "", empl = "";
			string code = "";
			string year = DateTime.Now.Year.ToString();
			using (DataTable dt = bl.LoadEmployeeDet(false, id, 0))
			{
				if (dt.Rows.Count > 0)
				{
					foreach (DataRow row in dt.Rows)
					{
						station = row["Station"].ToString();
					}
					if (station != "")
						code = id + "0" + station;
					else
						code = id;
				}
			}
			
		//	if (File.Exists(Server.MapPath("Barcode.txt")))
		//	{
		//		File.Delete(Server.MapPath("BarCode.txt"));
		//	}
		////	if (double.Parse(code) > 9999999999999)
		//	//	code = code.Substring(0, 11);

		//	if (File.Exists(Server.MapPath("BarCodeGenerate.exe")))
		//	{
		//		File.WriteAllText(Server.MapPath("BarCode.txt"), code);
		//		Process.Start(Server.MapPath("BarCodeGenerate.exe"));
		//	}


			return code;
		}
		//public void RunUpdate()
		//{
		//	Process.Start(Server.MapPath("AMS Monitor.exe"));
		//}
		void FirstLoad(GridView gv,string GridName)
		{
			List<string> val = new List<string>() { "", "", "", "", "", "", "", "", "", "" };
			List<string> Col = new List<string>() { "Class/Function", "Head", "Dept", "Unit", "Accounting Officer", "Programme", "Activity", "Account Code", "Subsidiary", "Amount" };
			MasterInitializer(gv, GridName, Col, val);
			//Session["Reqid"] = "5";
		}
		public void ClearAll()
		{
			FirstLoad(GridViewVoucher, "GridViewVoucher");
			FirstLoad(GridViewVoucherTableCredit, "GridViewVoucherTableCredit");
			TxtAccountType.Value = "";
			TxtAddress.Value = "";
			TxtAuthorit.Value = "";
			TxtDate.Value = "";
			TxtDepts.Text = "";
			TxtDescription.Text = "";
			TxtMinistry.Text = "";
			TxtName.Value = "";
			TxtPayee.Value = "";
			TxtStation.Text = "";
			TxtTotal.Text = "0";
			TxtSumTotal.Text = "0";
			TxtTotalCredit.Text = "0";
			TxtAdvance.Text = "0";
			TxtTotal.BackColor = Color.SkyBlue;
		}
		void TextChanged(object sender,string ViewName,int max)
		{
			TextBox txt = (TextBox)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			GridView gv = (GridView)gvrow.NamingContainer;
			if (gv.Rows.Count < max)
				if (txt.Text != "")
				{
				
					List<string> Col = new List<string>() { "Class/Function", "Head", "Dept", "Unit", "Accounting Officer", "Programme", "Activity", "Account Code", "Subsidiary", "Amount" };
					// SetGridViewRows(GridViewVoucher, "GridViewVoucher", Col, false,"Txt");
					List<string> val = new List<string>();

					val.Add(((TextBox)gv.FooterRow.FindControl("TxtClass")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtHead")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtDept")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtUnit")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtOfficer")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtProg")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtActivity")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtAccountCode")).Text);
					val.Add(((TextBox)gv.FooterRow.FindControl("TxtSubsidiary")).Text);
					TextBox AMNT = (TextBox)(gv.FooterRow.FindControl("TxtAmount"));
					val.Add(AMNT.Text);
					if (max > 3)
						TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(AMNT.Text)).ToString();
					else
						TxtTotalCredit.Text= (int.Parse(TxtTotalCredit.Text) + int.Parse(AMNT.Text)).ToString();

					TxtSumTotal.Text = (int.Parse(TxtTotal.Text) - int.Parse(TxtTotalCredit.Text)).ToString();

					gv.DataSource = AddNewRow(ViewName, Col, val);//.SubstandardDetails);
					gv.DataBind();

				}
		}
		protected void TxtAmount_TextChanged(object sender, EventArgs e)
		{
			TextChanged(sender, "GridViewVoucher",5);
		}
		void MasterInitializer(GridView gv, string table, List<string> Col, List<string> Val)
		{
			string incidentId = "";
			//  if (Session["Incidentid"] != null)
			//  incidentId = Session["Incidentid"].ToString();
			using (DataTable dt = bl.DisplayVoucherTable(0))
			{
				DataTable dt2 = new DataTable();
				ViewState[table.ToString()] = dt;
				if (dt.Rows.Count == 0)
				{

					dt2 = AddNewRow(table, Col, Val);
				}
				else
					dt2 = dt;

				gv.DataSource = dt2;
				gv.DataBind();
			}
		}
		DataTable AddNewRow(string vw, List<string> Col, List<string> Value)
		{
			DataTable dt = new DataTable();
			if (ViewState[vw.ToString()] != null)
			{
				dt = (DataTable)ViewState[vw.ToString()];
				DataRow workRow = null;
				workRow = dt.NewRow();
				if ((Col.Count > 0))
					for (int i = 0; i < Col.Count; i++)
					{
						string v = "";
						if (Value == null)
							v = "";
						else
							if (Value[i] == null)
							v = "";
						else
							v = Value[i];
						workRow[Col[i]] = v;
					}
				dt.Rows.Add(workRow);
				ViewState[vw.ToString()] = dt;
			}

			return dt;
		}
		void SetGridViewRows(GridView gv, string vw, List<string> Col, bool dropdown, string Control)
		{
			List<string> Val = new List<string>();
			if (Col.Count > 0)
				for (int i = 0; i < Col.Count; i++)
				{
					if (dropdown)
						Val.Add(((DropDownList)gv.FooterRow.FindControl(Control + i)).Text);
					else
						Val.Add(((TextBox)gv.FooterRow.FindControl(Control + i)).Text);
				}
			if (Val.Count > 0)
			{
				gv.DataSource = AddNewRow(vw, Col, Val);//.SubstandardDetails);
				gv.DataBind();
			}
		}
		//public void Clear()
		//{
		//	TxtAuthorit.Value = "";
		//	TxtDate.Value = "";
		//	TxtAdvance.BackColor = Color.SkyBlue;
		//	TxtTotal.BackColor = Color.SkyBlue;

		//	TxtAddress.Value = "";
		//	TxtDescription.Text = "";
		//	TxtDept.Value = "";
		//	TxtAccountType.Value = "";
		//	TxtMinistry.Text = "";
		//	TxtName.Value = "";
		//	TxtPayee.Value = "";
		//	TxtStation.Text = "";
		//	TxtTotal.Text = "0";
		//	FirstLoad();
		//}
		public ListVoucher SaveVoucherDet(ListVoucher v)
		{

			if (TxtTotal.Text == "0" && TxtSumTotal.Text == "0" )//&& TxtTotalCredit.Text == "0")
			{
				TxtTotal.BackColor = Color.Red;
				TxtAdvance.BackColor = Color.Red;
				return v;
			}
			else
			if (v.Reqid != null)
			{

				v.Authorities = TxtAuthorit.Value;
				v.Date = TxtDate.Value;
				//v.Reqid = Session["Reqid"].ToString();
				v.Address = TxtAddress.Value;
				v.Description = TxtDescription.Text;
				v.Department = TxtDepts.Text;
				v.AccountType = TxtAccountType.Value;
				v.Ministry = TxtMinistry.Text;
				v.Name = TxtName.Value;
				v.Payee = TxtPayee.Value;
				v.Station = TxtStation.Text;
				v.Total = TxtSumTotal.Text;
				v.Code = GenerateBarcode(v.Reqid);
				v.UserName = Session["UserName"].ToString();
				DataTable dt = new DataTable();
				dt = bl.SaveVoucherDet(v);

				return SaveVoucherTable(dt, v);
			}
			else
				return v;
			//else

		}
		bool CheckVoucher()
		{
			int x = 0;
			if (GridViewVoucher.Rows.Count > 0)
			{
				foreach (GridViewRow row in GridViewVoucher.Rows)
				{
					//VoucherTable vt = new VoucherTable();
					string Amount = ((Label)(row.FindControl("TxtAmount"))).Text;
					if (Amount != "" && Amount != null)
						x++;
				}
			}
			if (x > 0)
				return true;
			return false;
		}
		public ListVoucher SaveVoucherTable(DataTable dt, ListVoucher v)
		{
			// List<ListVoucher> Voucher = new List<ListVoucher>();

			string vid = "";

			if (dt.Rows.Count == 1)
				foreach (DataRow row in dt.Rows)
					vid = row["vid"].ToString();

			v.vid = vid;
			if (GridViewVoucher.Rows.Count > 0 && vid != "")
			{
				List<VoucherTable> tab = new List<VoucherTable>();
				tab=SaveGrids(GridViewVoucher,tab,v,1);
				tab = SaveGrids(GridViewVoucherTableCredit, tab, v, 2);
				//foreach (GridViewRow row in GridViewVoucher.Rows)
				//{
				//	VoucherTable vt = new VoucherTable();
				//	vt.Amount = ((Label)(row.FindControl("TxtAmount"))).Text;
				//	vt.AccountingOfficer = ((Label)(row.FindControl("TxtOfficer"))).Text;
				//	vt.Dept = ((Label)(row.FindControl("TxtDept"))).Text;
				//	vt.Function = ((Label)(row.FindControl("TxtClass"))).Text;
				//	vt.Head = ((Label)(row.FindControl("TxtHead"))).Text;
				//	vt.Programme = ((Label)(row.FindControl("TxtProg"))).Text;
				//	vt.Subsidiary = ((Label)(row.FindControl("TxtSubsidiary"))).Text;
				//	vt.Unit = ((Label)(row.FindControl("TxtUnit"))).Text;

				//	vt.Activity = ((Label)(row.FindControl("TxtActivity"))).Text;
				//	vt.AccountCode = ((Label)(row.FindControl("TxtAccountCode"))).Text;
				//	//***************************SAVE SECTION***********************
				//	v.Function = ((Label)(row.FindControl("TxtClass"))).Text;
				//	v.Head = ((Label)(row.FindControl("TxtHead"))).Text;
				//	v.Dept = ((Label)(row.FindControl("TxtDept"))).Text;
				//	v.Unit = ((Label)(row.FindControl("TxtUnit"))).Text;
				//	v.AccountingOfficer = ((Label)(row.FindControl("TxtOfficer"))).Text;
				//	v.Programme = ((Label)(row.FindControl("TxtProg"))).Text;
				//	v.Subsidiary = ((Label)(row.FindControl("TxtSubsidiary"))).Text;
				//	v.Amount = ((Label)(row.FindControl("TxtAmount"))).Text;

				//	v.Activity = ((Label)(row.FindControl("TxtActivity"))).Text;
				//	v.AccountCode = ((Label)(row.FindControl("TxtAccountCode"))).Text;
				//	v.Debit =1;
				//	if (vt.Amount != "")
				//	{
				//		bl.saveVoucherTable(v);
				//		tab.Add(vt);
				//	}
				//}
				v.VTable = tab;
				// n.Notification("Saved Successfully",INotification.success,this);
				//   return Voucher;
			}
			return v;
		}
		List<VoucherTable> SaveGrids(GridView gv, List<VoucherTable> tab, ListVoucher v, int Debit)
		{
			if (gv.Rows.Count > 0)
			{
				foreach (GridViewRow row in gv.Rows)
				{
					VoucherTable vt = new VoucherTable();
					vt.Amount = ((Label)(row.FindControl("TxtAmount"))).Text;
					vt.AccountingOfficer = ((Label)(row.FindControl("TxtOfficer"))).Text;
					vt.Dept = ((Label)(row.FindControl("TxtDept"))).Text;
					vt.Function = ((Label)(row.FindControl("TxtClass"))).Text;
					vt.Head = ((Label)(row.FindControl("TxtHead"))).Text;
					vt.Programme = ((Label)(row.FindControl("TxtProg"))).Text;
					vt.Subsidiary = ((Label)(row.FindControl("TxtSubsidiary"))).Text;
					vt.Unit = ((Label)(row.FindControl("TxtUnit"))).Text;

					vt.Activity = ((Label)(row.FindControl("TxtActivity"))).Text;
					vt.AccountCode = ((Label)(row.FindControl("TxtAccountCode"))).Text;
					//***************************SAVE SECTION***********************
					v.Function = ((Label)(row.FindControl("TxtClass"))).Text;
					v.Head = ((Label)(row.FindControl("TxtHead"))).Text;
					v.Dept = ((Label)(row.FindControl("TxtDept"))).Text;
					v.Unit = ((Label)(row.FindControl("TxtUnit"))).Text;
					v.AccountingOfficer = ((Label)(row.FindControl("TxtOfficer"))).Text;
					v.Programme = ((Label)(row.FindControl("TxtProg"))).Text;
					v.Subsidiary = ((Label)(row.FindControl("TxtSubsidiary"))).Text;
					v.Amount = ((Label)(row.FindControl("TxtAmount"))).Text;

					v.Activity = ((Label)(row.FindControl("TxtActivity"))).Text;
					v.AccountCode = ((Label)(row.FindControl("TxtAccountCode"))).Text;
					v.Debit = Debit;
					if (vt.Amount != "")
					{
						bl.saveVoucherTable(v);
						tab.Add(vt);
					}
				}
				//v.VTable = tab;
			}
			return tab;
		}

		protected void GridViewVoucher_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			DeleteGridRow(sender, e, (DataTable)ViewState["GridViewVoucher"]);
		}

		protected void GridViewVoucher_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			HideEmptyRows(e, "TxtAmount");
		}
		void HideEmptyRows(GridViewRowEventArgs e, string Controls)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				Label Label1 = (Label)e.Row.FindControl(Controls);
				if (Label1.Text == "")
					e.Row.Visible = false;
			}
		}
		public void DeleteGridRow(object sender, GridViewDeleteEventArgs e, DataTable dt)
		{
			GridView gridView = (GridView)sender;
			int index = Convert.ToInt32(e.RowIndex);
			DeleteFromGrid(index,gridView);
			// string amnt = dt.Rows[index][8].ToString();
			dt.Rows[index].Delete();
			gridView.DataSource = dt;
			gridView.DataBind();
		}
		void DeleteFromGrid(int i,GridView gv)
		{
			Label Amn = gv.Rows[i].FindControl("TxtAmount") as Label;
			if (Amn.Text != "")
				if (gv==GridViewVoucherTableCredit)
					TxtTotalCredit.Text = (int.Parse(TxtTotalCredit.Text) - int.Parse(Amn.Text)).ToString();
			    else
					TxtTotal.Text = (int.Parse(TxtTotal.Text) - int.Parse(Amn.Text)).ToString();

			TxtSumTotal.Text = (int.Parse(TxtTotal.Text) - int.Parse(TxtTotalCredit.Text)).ToString();
		}
		bool Save()
		{
			if (CheckVoucher())
			{
				PrintVoucher vc = new PrintVoucher();
				List<ListVoucher> Lis = new List<ListVoucher>();
				ListVoucher v = new ListVoucher();
				v.Reqid = idholder.Text;
				v = SaveVoucherDet(v);
				if (idholder.Text != "" && v.vid != "" && v.vid != null)
				{
					n.Notification("Saved Successfully", INotification.success, this);
					ClearAll();
					BtnLoadVocher.Visible = true;
					//

					//fi.Create(v);
					fi.PrintVoucher(v.Reqid);
					string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", "invoice" + v.Reqid + ".pdf"));
					ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);
					return true;
				}
				else
				{
					n.Notification("Voucher amount is not equal to advance requested", INotification.warning, this);
					return false;
				}
			}
			else
			{
				n.Notification("Missing Entries", INotification.warning);
				return false;
			}
		}

		protected void BtnSaveRe_ServerClick1(object sender, EventArgs e)
		{
			EmailCredentials ec = new EmailCredentials();
			EmailTemplateCreator etc = new EmailTemplateCreator();
			ListAdvanceDetails det = new ListAdvanceDetails();
			det.Reqid = int.Parse(idholder.Text);
			det.ApprovedBy = Session["UserName"].ToString();
			det.AssignedTo = TxtUser.Text;
			det.Approved = ApproveType.Reassigned;
			det.Reason = "Reassigned";
			if (Session["Users"] != null)
			{
				if (Session["Users"].ToString() == "true")
				{
					Approvals(TxtUser.Text, ApproveType.Approved);
					Session["Users"] = null;
				}
			}
			else
			{
				if (Session["Reassignid"] != null)
					bl.Reassign(Session["Reassignid"].ToString(), TxtUser.Text, Session["UserName"].ToString());
			}
			ec.SendToEmail = TxtEmail.Text;
			etc.SendEmail(det, ec, false);

		}
		void LoadReasignList(int role)
		{
			GridViewUsers.DataSource = bl.DisplayUsers(role,"");
			GridViewUsers.DataBind();
		}
		void Approvals(string AssignedTo, ApproveType app)
		{
			ListAdvanceDetails det = new ListAdvanceDetails();
			det.Reqid = int.Parse(idholder.Text);
			det.ApprovedBy = Session["UserName"].ToString();
			det.AssignedTo = AssignedTo;
			det.Approved = app;
			det.Reason = "Payment voucher has been created";

			if (Save())
			{
				bl.Approvals(det);
				Notifications n = new Notifications();
				n.Notification("Response sent Successfully", INotification.success, this);
				Session["Reassignid"] = null;
			}
			else
				n.Notification("Missing Entries", INotification.warning);
		}
		protected void BtnUser_Click(object sender, EventArgs e)
		{
			
			Button txt = (Button)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			TxtUser.Text = ((Label)gvrow.FindControl("Name")).Text;
			TxtEmail.Text = ((Label)gvrow.FindControl("Email")).Text;
			if (TxtSumTotal.Text != TxtAdvance.Text)
			{
				n.Notification("Warning advance is not matching with voucher values", INotification.info);
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalWarning';", true);

				
			}
			else
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalSave';", true);
		}

		protected void GridViewVoucherTableCredit_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			DeleteGridRow(sender, e, (DataTable)ViewState["GridViewVoucherTableCredit"]);
		}

		protected void GridViewVoucherTableCredit_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			HideEmptyRows(e, "TxtAmount");
		}

		protected void TxtAmount_TextChanged1(object sender, EventArgs e)
		{		
			TextChanged(sender, "GridViewVoucherTableCredit", 3);
		}

		protected void BeginSave_ServerClick(object sender, EventArgs e)
		{
			if (TxtAdvance.Text != "")
			{
				Session["Users"] = "true";
				LoadReasignList(4);
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
			}
			else
				n.Notification("Please go back to requests and vouchers section, you cannot save any more", INotification.info, this);
		}

		protected void BtnLoadVocher_ServerClick(object sender, EventArgs e)
		{
			fi.PrintVoucher(idholder.Text);
			string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", "invoice" + idholder.Text + ".pdf"));
			ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);
		}
	}
}