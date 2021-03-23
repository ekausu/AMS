using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class AdvanceUpdate : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		URLEncrypt enc = new URLEncrypt();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["UserName"] != null)
					GetQueryString();
				else
					Response.Redirect("Default.aspx");
			}
		}
		void LoadDuration(string dur)
		{
			if(dur!="" && dur!=null)
			bl.SetMonths(DropDownDuration, int.Parse(dur));
			DropDownDuration.Text = dur;
		}
		void LoadRank(string rank)
		{
			if (rank != "" && rank != null)
				bl.LoadRanks(DropDownRank, rank);
			DropDownRank.Text = rank;
		}

		void GetQueryString()
		{
			string pd = Request.QueryString["reqid"];
			if (pd != null && pd != "")
			{
				enc.GetDecrypted = pd;
				idholder.Text = enc.GetDecrypted;
				GetAdvanceDetails(int.Parse(enc.GetDecrypted));
			}
			else
				Response.Redirect("AdvanceApproval.aspx");
		}
		void GetAdvanceDetails(int reqid)
		{
			bl.LoadRanks(DropDownRank);
			bl.loadStationCodes(DropDownStation);
			//var Y = bl.DisplayRequest("", "").AsEnumerable().Where(x => x.Field<int>("Reqid")==reqid).FirstOrDefault();
			var x = from DataRow rows in bl.DisplayRequest("", "").Rows where rows.Field<int>("reqid") == reqid select rows;
			foreach (DataRow row in x)
			{
				txtNetPay.Text = row["Current Salary"].ToString();
			    TxtAdvance.Text = row["Advance Amount"].ToString();
				string rank = row["Rank"].ToString();
				LoadRank(rank);

				string dur= row["Recovery Duration"].ToString();
				LoadDuration(dur);
				//TxtStatus.Text = row["Advance State"].ToString();
				TxtStatus.Value = row["Below 40%"].ToString();
				string fname = row["First Name"].ToString();
				string lname = row["Last Name"].ToString();
				DropDownRank.Text = row["Rank"].ToString();
				txtEmployeeNumber.Text = row["Employee Number"].ToString();
				txtEmployeeName.Text = fname + " " + lname;
				//txtap.Text = row["Appointment"].ToString();
				//txtun.Text = row["Unit"].ToString();
				txtsection.Text = row["Section"].ToString();
				DropDownStation.Text = row["Station"].ToString();
				
			}
			
			DurationCal();
		}
		public string Deductions()
		{
			if (TxtTotal.Text == "")
				return "0";
			else
				return TxtTotal.Text;
		}
		void DurationCal()
		{

			if (DropDownDuration.Text != "")
			{
				RequestData d = new RequestData();
				float ded = 0;
				float totalBef = 0;
				float totaldeduction = 0;
				float Sal = 0;

				d.Deductions = Deductions();
				d.Salary = txtNetPay.Text;
				// ((AdvanceRequest)this.Page).DedSalary();
				if (d.Deductions != "" && d.Salary != "")
				{
					ded = float.Parse(d.Deductions);
					Sal = float.Parse(d.Salary);
				}

				if (TxtAdvance.Text != "")
				{
					float big = 0;
					if (float.Parse(TxtAdvance.Text) >= 5000)
					{
						//txtCheif.Text = "true";
						//txtBool.Text = "true";
						big = 2;
						//((AdvanceRequest)page).LoadUsers(2);
					}
					else
					{
						//txtCheif.Text = "";
						//txtBool.Text = "false";
						big = 1;
						//((AdvanceRequest)page).LoadUsers(1);
					}

					totalBef = float.Parse(TxtAdvance.Text) / float.Parse(DropDownDuration.Text);
					totaldeduction = totalBef + ded;

					if (totaldeduction < (Sal * 40 / 100))
					{
						TxtStatus.Value = "APPROVED";
						TxtStatus.Style.Add("background", "green");
						TxtStatus.Style.Add("color", "white");

						//Above.Visible = true;
						//Below.Visible = false;
						//Reason.Visible = false;

						//TxtReason.Style.Add("border", "solid 1px black");
						//if (big == 2)
						//	((AdvanceRequest)(page)).LoadCheif(2);
						//else
						//	((AdvanceRequest)(page)).LoadCheif(1);
						//((AdvanceRequest)(page)).HideControls(true);
					}
					else
					{
						TxtStatus.Value = "BELOW 40%";
						TxtStatus.Style.Add("background", "red");
						TxtStatus.Style.Add("color", "white");
					//	Reason.Visible = true;
						//n.VALIDATE(TxtReason);
						//((AdvanceRequest)(page)).ReasonBox(true);
						//if(big==2)
						//((AdvanceRequest)(page)).LoadCheif(2);
						//else
						//((AdvanceRequest)(page)).LoadCheif(1);

						//((AdvanceRequest)(this.Page)).HideControls(false);
					}//
					TxtNewNetPay.Value = (Sal - totaldeduction).ToString();
				}
			}
		}
		public void UpdateAdvanceRequest()
		{
			ListAdvanceDetails det = new ListAdvanceDetails();
			det.AdvanceAmount = TxtAdvance.Text;
			det.EmployeeNumber=txtEmployeeNumber.Text;
			det.CurrentSalary = txtNetPay.Text;
			det.Section = txtsection.Text;
			det.RecoveryDuration = DropDownDuration.Text;
			det.Below40 = Below();
			det.Reqid = int.Parse(idholder.Text);
			det.Entered = Session["UserName"].ToString();
			bl.AdvanceUpdate(det);
			n.Notification("Updated successfully",INotification.success);

			//new SqlParameter("@CurrentSalary", det.CurrentSalary)
			//  ,new SqlParameter("@AdvanceAmount", det.AdvanceAmount)
			//  ,new SqlParameter("@RecoveryDuration", det.RecoveryDuration)
			// ,new SqlParameter("@Below", det.Below40)
			// ,new SqlParameter("@reqid", det.Reqid)
			//       ,new SqlParameter("@ModifiedBy", det.Enteredby)
		}
		Below40 Below()
		{
			if (TxtStatus.Value == "Below 40")
				return Below40.Yes;
			return Below40.No;
		}
		protected void TxtAdvance_TextChanged(object sender, EventArgs e)
		{
			DurationCal();
		}

		protected void DropDownDuration_SelectedIndexChanged(object sender, EventArgs e)
		{
			DurationCal();
		}

		protected void BtnSave2_ServerClick(object sender, EventArgs e)
		{
			UpdateAdvanceRequest();
		}
	}
}