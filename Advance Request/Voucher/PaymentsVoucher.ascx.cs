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

namespace AdvanceSystem.Advance_Request.Voucher
{
    public partial class PaymentsVoucher : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
        Notifications n = new Notifications();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    FirstLoad();
					if (Session["Names"] != null && Session["Amount"] != null)
					{
						TxtPayee.Value = Session["Names"].ToString();
						TxtAdvance.Text = Session["Amount"].ToString();
					}
					else
						Response.Redirect("AccountsSection.aspx");
					//					GenerateBarcode(Session["Reqid"].ToString());

				}
                else
                    Response.Redirect("Default.aspx");
                
            }
        }
		
			string GenerateBarcode(string id)
		   {
			string station = "",empl="";
			string code = "";
			string year = DateTime.Now.Year.ToString();
			using (DataTable dt=bl.LoadEmployeeDet(false,id,0))
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						station = row["Station"].ToString();
						//empl = row["Employee Number"].ToString();
					}
			
				code = id + "0" + station;// + "0" + empl;
			}

				//id0station0emp0year
				
			if (File.Exists(Server.MapPath("Barcode.txt")))
			{
				File.Delete(Server.MapPath("BarCode.txt"));
			}
			if (double.Parse(code) > 9999999999999)
				code = code.Substring(0, 11);


			//File.Create(Server.MapPath("BarCode.txt"));
			File.WriteAllText(Server.MapPath("BarCode.txt"), code);
	        Process.Start(Server.MapPath("BarCodeGenerate.exe"));

		
			return code;
		}
		//public void RunUpdate()
		//{
		//	Process.Start(Server.MapPath("AMS Monitor.exe"));
		//}
        void FirstLoad()
        {
            List<string> val = new List<string>() { "", "", "", "", "", "", "", "", "", "" };
            List<string> Col = new List<string>() { "Class/Function", "Head", "Dept", "Unit", "Accounting Officer", "Programme", "Activity", "Account Code", "Subsidiary", "Amount" };
            MasterInitializer(GridViewVoucher, "GridViewVoucher", Col, val);
            //Session["Reqid"] = "5";
        }
	public void ClearAll()
		{
			FirstLoad();
			TxtAccountType.Value = "";
			TxtAddress.Value = "";
			TxtAuthorit.Value = "";
			TxtDate.Value = "";
			TxtDept.Value = "";
			TxtDescription.Text = "";
			TxtMinistry.Text = "";
			TxtName.Value = "";
			TxtPayee.Value = "";
			TxtStation.Text = "";
			TxtTotal.Text = "0";
			TxtTotal.BackColor = Color.SkyBlue;
		}
        protected void TxtAmount_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
			if(GridViewVoucher.Rows.Count<5)
            if (txt.Text != "")
            {
                GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
                GridView gv = (GridView)gvrow.NamingContainer;
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
                TextBox AMNT=(TextBox)(gv.FooterRow.FindControl("TxtAmount"));
                val.Add(AMNT.Text);
                TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(AMNT.Text)).ToString();

                gv.DataSource = AddNewRow("GridViewVoucher",Col, val);//.SubstandardDetails);
                gv.DataBind();
             
            }
        }
        void MasterInitializer(GridView gv, string table, List<string> Col, List<string> Val)
        {
            //string incidentId = "";
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
                            if(Value[i]==null)
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
        void SetGridViewRows(GridView gv, string vw, List<string> Col, bool dropdown,string Control)
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
        public void Clear()
        {
           TxtAuthorit.Value = "";
           TxtDate.Value = "";
			TxtAdvance.BackColor = Color.SkyBlue;
			TxtTotal.BackColor = Color.SkyBlue;

		   TxtAddress.Value = "";
           TxtDescription.Text = "";
           TxtDept.Value = "";
           TxtAccountType.Value = "";
           TxtMinistry.Text = "";
           TxtName.Value = "";
           TxtPayee.Value = "";
           TxtStation.Text = "";
            TxtTotal.Text = "0";
            FirstLoad();
        }
        public ListVoucher SaveVoucherDet(ListVoucher v)
        {

			if (TxtTotal.Text != TxtAdvance.Text)
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
				v.Department = TxtDept.Value;
				v.AccountType = TxtAccountType.Value;
				v.Ministry = TxtMinistry.Text;
				v.Name = TxtName.Value;
				v.Payee = TxtPayee.Value;
				v.Station = TxtStation.Text;
				v.Total = TxtTotal.Text;
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
       public ListVoucher SaveVoucherTable(DataTable dt,ListVoucher v)
        {
			// List<ListVoucher> Voucher = new List<ListVoucher>();
			
            string vid = "";

            if (dt.Rows.Count==1)
            foreach (DataRow row in dt.Rows)
                vid = row["vid"].ToString();

            v.vid = vid;
            if (GridViewVoucher.Rows.Count>0 && vid!="")
            {
				List<VoucherTable> tab = new List<VoucherTable>();
                foreach(GridViewRow row in GridViewVoucher.Rows)
                {
					VoucherTable vt = new VoucherTable();
					vt.Amount= ((Label)(row.FindControl("TxtAmount"))).Text;
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
					v.Debit = 1;
					if (vt.Amount != "")
                    {
                        bl.saveVoucherTable(v);
                        tab.Add(vt);
                    }
                }
				v.VTable = tab;
                // n.Notification("Saved Successfully",INotification.success,this);
             //   return Voucher;
            }
            return v;
        }
        protected void GridViewVoucher_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridRow(sender, e, (DataTable)ViewState["GridViewVoucher"]);
        }

        protected void GridViewVoucher_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            HideEmptyRows(e, "TxtAmount");
        }
        void HideEmptyRows(GridViewRowEventArgs e,string Controls)
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
            DeleteFromGrid(index);
           // string amnt = dt.Rows[index][8].ToString();
            dt.Rows[index].Delete();
            gridView.DataSource = dt;
            gridView.DataBind();
        }
        void DeleteFromGrid(int i)
        {
            Label Amn=GridViewVoucher.Rows[i].FindControl("TxtAmount") as Label;
            if(Amn.Text!="")
            TxtTotal.Text=(int.Parse(TxtTotal.Text)- int.Parse(Amn.Text)).ToString();
        }


    }
}