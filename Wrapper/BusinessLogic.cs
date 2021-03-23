using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using AdvanceSystem.Reporting_Grid;
using System.Web.UI.WebControls;

namespace AdvanceSystem.Wrapper
{
	public class BusinessLogic
	{
		DatabaseHelper db = new DatabaseHelper();
		Emails em = new Emails();
		public DataTable GetUpdates()
		{
			return db.GetUpdates();
		}
		public void LoadRanks(DropDownList DropDownRank)
		{
			using (DataTable dt = DisplayRanks())
			{
				int i = 0;
				DropDownRank.Items.Clear();
				DropDownRank.Items.Add(new ListItem("", ""));
				foreach (DataRow row in dt.Rows)
				{
					DropDownRank.Items.Add(row["Rank"].ToString());
					i++;
				}
			}
		}
		public void LoadRanks(DropDownList DropDownRank, string rank)
		{
			using (DataTable dt = DisplayRanks())
			{
				int i = 0;
				DropDownRank.Items.Clear();
				DropDownRank.Items.Add(new ListItem(""));

				var c = dt.AsEnumerable().Where(x => x.Field<string>("Rank") == rank);

				if (c.Count() > 0)
				{ }
				else
					DropDownRank.Items.Add(new ListItem(rank));

				foreach (DataRow row in dt.Rows)
				{
					DropDownRank.Items.Add(row["Rank"].ToString());
					i++;
				}
			}
		}
		public void loadStationCodes(DropDownList dropStation)
		{
			using (DataTable dt = loadStationCodes(1))
			{
				dropStation.Items.Clear();
				dropStation.Items.Add(new ListItem("", ""));
				foreach (DataRow row in dt.Rows)
				{
					dropStation.Items.Add(new ListItem(row["Station"].ToString(), row["Code1"].ToString()));
				}
			}
		}
		public ListAdvanceDetails GetEmployee(string EmployeeNumber)
		{
			DataTable dt = db.GetEmployee(EmployeeNumber);
			ListAdvanceDetails ed = new ListAdvanceDetails();
			if (dt.Rows.Count > 0)
				foreach (DataRow row in dt.Rows)
				{
					ed.FirstName = row["First Name"].ToString();
					ed.LastName = row["Last Name"].ToString();
					ed.Rank = row["Rank"].ToString();
					ed.EmployeeNumber = row["Employee Number"].ToString();
					ed.Trade = row["Trade"].ToString();
					ed.Appointment = row["Appointment"].ToString();
					ed.Unit = row["Unit"].ToString();
					ed.Section = row["Section"].ToString();
					ed.Station = row["Station"].ToString();

					ed.Email = row["Email"].ToString();
					ed.Phone = row["Phone"].ToString();
				}
			return ed;
		}
		//*****************STATIONS****************
		public DataTable loadStationCodes(int Type)
		{
			return db.loadStationCodes(Type);
		}
		public DataTable LoadBarcodes(string Reqid)
		{
			return db.LoadBarcode(Reqid);
		}
		public bool NewStation(ListStations st)
		{
			return db.NewStation(st);
		}
		//***********************USERS*********
		public DataTable Login(string user, string pwrd)
		{
			return db.Login(user, pwrd);
		}
		public bool NewUsers(ListUsers u)
		{
			return db.NewUsers(u);
		}
		public ListUsers GetLoggedInUser(string User)
		{
			ListUsers u = new ListUsers();
			using (DataTable dt = db.GetLoggedInUser(User))
			{
				if (dt.Rows.Count == 1)
					foreach (DataRow row in dt.Rows)
					{
						u.Email = row["Email"].ToString();
						u.Name = row["Name"].ToString();
						u.OldEmail = row["Email"].ToString();
						u.Password = row["Password"].ToString();
						u.Position = row["Position"].ToString();
						u.Role = int.Parse(row["Role"].ToString());
						u.Section = row["Section"].ToString();
						u.Station = row["Station"].ToString();
						u.User = row["User"].ToString();
					}
			}
			return u;
		}

		public bool DeletUser(string user, string email)
		{
			return db.DeletUser(user, email);
		}
		public bool UpdateUser(ListUsers u)
		{
			return db.UpdateUser(u);
		}
		//******************************
		public bool NewIncidentImages(FileUploader f)
		{
			return db.NewIncidentImages(f);
		}
		public DataTable DisplayRanks()
		{
			return db.Ranks();
		}
		public bool NewReport(string title, string link)
		{
			return db.NewReport(title, link);
		}
		public DataTable Reports()
		{
			return db.Reports();
		}

		public string NewEmployeeDetails(ListAdvanceDetails det)
		{
			string id = "";
			using (DataTable dt = db.NewEmployeeDetails(det))
			{
				if (dt.Rows.Count == 1)
					foreach (DataRow row in dt.Rows)
						id = row["Reqid"].ToString();
			}
			return id;
		}
		public bool NewAdvanceDetails(ListAdvanceDetails det)
		{
			return db.NewAdvanceDetails(det);
		}
		public DataTable DisplayRequest(string user, string status)
		{
			return db.DisplayRequest(user, status);
		}
		public DataTable LoadEmployeeDet(bool EmployeeNumber, string Val, int p)
		{
			string Empl = "";
			string Reqid = "";
			if (EmployeeNumber)
			{
				Empl = Val;
				Reqid = "0";
			}
			else
			{
				Empl = "0";
				Reqid = Val;
			}
			return db.LoadEmployeeDet(Empl, Reqid, p);
		}
		public DataTable LoadEmpCashierRecs(string Emp)
		{
			return db.LoadEmpCashierRecs(Emp);
		}
		public DataTable LoadEmployeeDet(string Val)
		{

			return db.LoadEmployeeDet(Val);
		}
		public DataTable LoadPayments(string val)
		{
			return db.LoadPayments(val);
		}
		public DataTable LoadStationSummary(string Datefrm, string DateTo)
		{
			return db.LoadStationSummary(Datefrm, DateTo);
		}
		public DataTable DisplayVoucherTable(int id)
		{
			return db.DisplayVoucherTable(id);
		}
		public DataTable DisplayImages(string Reqid)
		{
			return db.DisplayImages(Reqid);
		}
		public int ExportExcelToSql(ListExportToSQl s, int row)
		{
			if (s.Error != "" || s.EmployeeNumber == "" || s.FirstName == "" || s.LastName == "" || s.Rank == "" || s.Station == "")
				return row;
			else
				return db.ExportExcelToSql(s, row);
		}

		public DataTable SaveVoucherDet(ListVoucher v)
		{
			return db.SaveVoucherDet(v);
		}
		public bool saveVoucherTable(ListVoucher v)
		{
			return db.saveVoucherTable(v);
		}
		public bool DeleteRanks(int id)
		{
			return db.DeleteRanks(id);
		}
		public void SetMonths(DropDownList ddList)
		{
			int start = 1;
			int end = 12;
			using (DataTable dt = db.GetMonths())
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						start = int.Parse(row["Start"].ToString());
						end = int.Parse(row["End"].ToString());
					}
			}
			ddList.Items.Clear();
			ddList.Items.Add(new ListItem(""));
			for (int i = start; i <= end; i++)
				ddList.Items.Add(new ListItem(i.ToString()));
		}
		public void SetMonths(DropDownList ddList, int dur)
		{
			int start = 1;
			int end = 12;
			using (DataTable dt = db.GetMonths())
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						start = int.Parse(row["Start"].ToString());
						end = int.Parse(row["End"].ToString());
					}
			}
			ddList.Items.Clear();
			ddList.Items.Add(new ListItem(""));
			if (dur >= start && dur <= end)
			{

			}
			else
				ddList.Items.Add(new ListItem(dur.ToString()));

			for (int i = start; i <= end; i++)
				ddList.Items.Add(new ListItem(i.ToString()));
		}
		public DataTable GetMonths()
		{
			return db.GetMonths();
		}
		public bool NewMonths(int start, int end)
		{
			return db.NewMonths(start, end);
		}
		public bool NewRanks(string Rank)
		{
			return db.NewRanks(Rank);
		}
		public DataTable DisplayUsers(int Role, string Station)
		{
			return db.DisplayUsers(Role, Station);
		}
		public DataTable LoadApprover(string id)
		{
			return db.LoadApprover(id);
		}
		//**************************ACCOUNTS*********************
		public DataTable DisplayVoucher(string Reqid)
		{
			return db.DisplayVoucher(Reqid);
		}
		public DataTable DisplayVoucherTable(string vid)
		{
			return db.DisplayVoucherTable(vid);
		}
		public bool Approvals(ListAdvanceDetails det)
		{
			return db.Approvals(det);
		}

		public DataTable Access()
		{
			return db.Access();
		}
		//*************************************GROUP ENTRIES*************************
		public DataTable LoadFunding(int Gid)
		{
			return db.LoadFunding(Gid);
		}
		//public DataTable LoadFunding(int Gid)
		//{
		//    return db.LoadFunding(Gid);
		//}
		public DataTable LoadGroup()
		{
			return db.LoadGroup();
		}
		public DataTable DisplayFundingReturns(int pid)
		{
			return db.DisplayFundingReturns(pid);
		}
		public bool NewFunding(ListFunding fd)
		{
			return db.NewFunding(fd);
		}
		public DataTable NewFundGroup(ListFunding fd)
		{
			return db.NewGroupFunding(fd);
		}
		public DataTable GetBaalanceReturns(string section, string station)
		{
			return db.GetBaalanceReturns(section, station);
		}
		//*******************************FUNDING RETURNS*******************
		public DataTable LoadReturns(int id)
		{
			return db.LoadReturns(id);
		}
		public DataTable NewFundingReturns(ListFunding c)
		{
			return db.NewFundingReturns(c);
		}
		public DataTable GetFundedAmount(ListFunding c)
		{
			return db.GetFundedAmount(c);
		}
		public bool NewMultiFundingReturns(ListFunding f)
		{
			return db.NewMultiFundingReturns(f);
		}
		//********************************ADVANCE CLEARANCE********************
		public DataTable NewAdvanceId(ListAdvanceClear c)
		{
			return db.NewClearanceId(c);
		}
		public bool NewCashAdvanceClearance(ListAdvanceClear c)
		{
			return db.NewCashAdvanceClearance(c);
		}
		public DataTable DisplayCashPayments(string EmployeeNumber)
		{
			return db.DisplayCashPayments(EmployeeNumber);
		}
		public DataTable DisplayAutoDeduction(int reqid, string EmployeeNumber)
		{
			return db.DisplayAutoDeduction(reqid,EmployeeNumber);
		}
		//*********************************LIBRARY*******************************
		public DataTable DisplayVoucherRecs(string Datefrm, string Dateto, string EmployeeNo)
		{
			return db.DisplayVoucherRecs(Datefrm, Dateto, EmployeeNo);
		}
		public DataTable DisplayAdvanceClearance(string Datefrm,string Dateto,string EmployeeNo)
		{
			return db.DisplayAdvanceClearance(Datefrm,Dateto,EmployeeNo);
		}
		//*************************REPORTS*****************************************************
		//-------------FUNDING REPORTS---------
		public DataTable LoadFundingReports(IReports r)
        {
            return db.LoadFundingReports(r);
        }
        //*****************************RECORDS TO BALANCE********************************
        public DataTable LoadRecordsToBalance()
        {
            return db.LoadRecordsToBalance();
        }
        //**************************CALENDAR OPTIONS*****************************
        public DataTable LoadCalendar(int Type, string EmployeeNumber)
        {
            return db.LoadCalendar(Type,EmployeeNumber);
        }
		public DataTable GetEmailSettings()
		{
			return db.GetEmailSettings();
		}
		public bool NewEmailSettings(SMTPDetails smtp)
		{
			return db.NewEmailSettings(smtp);
		}
		//*************************SEND MAIL*******************
		SMTPDetails Active()
		{
			SMTPDetails smtp = new SMTPDetails();
			string active = "0";
			using (DataTable dt = db.GetEmailSettings())
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						active = row["Active"].ToString();
						if (active == "1")
						{
							smtp.EmailAddress = row["EmailAddress"].ToString();
							smtp.SMTPClientHost = row["SMTPClientHost"].ToString();
							smtp.UserId = row["UserId"].ToString();
							smtp.UserPassword = row["UserPassword"].ToString();
						}
					}			
			}
			return smtp;
		}
       public bool SendMail(EmailCredentials ec)
        {
			try
			{
				SMTPDetails SMTP = Active();
				if (SMTP.UserId != null && SMTP.UserId != "")
					em.MailMessage(ec, SMTP);
				else
					 db.SendMail(ec);

				return true;
			}
			catch (Exception)
			{
				return false;
			}
        }
		public DataTable MailingList(string Reqid)
		{
			return db.MailingList(Reqid);
		}
		//************************REPORTS SECTION*****************
		public DataTable ReportsTotalIssued(string Datefrm,string DateTo,string Sect)
        {
            return db.ReportTotalIssued(Datefrm, DateTo,Sect);
        }
		public DataTable FundedDetails(string Datefrm, string DateTo, string Station)
		{
			return db.FundedDetails(Datefrm, DateTo, Station);
		}
		public DataTable ReportAdvanceRem(string Section)
        {
            return db.ReportsAdvanceRemaining(Section);
        }
        public DataTable ReportAutoDeductions(string Datefrm, string DateTo,string sect)
        {
            return db.ReportAutoDeductions(Datefrm, DateTo,sect);
        }
        public DataTable ReportsAdvancePaidBack(string Datefrm, string DateTo, string sect)
        {
            return db.ReportsAdvancePaidBack(Datefrm, DateTo, sect);
        }
        public bool Reassign(string id,string Assigned, string ReassignedBy)
        {
            return db.Reassign(id, Assigned, ReassignedBy);
        }
		public DataTable Funded(string Datefrm, string DateTo, string Station)
		{
			return db.Funded(Datefrm, DateTo, Station);
		}
		internal DataTable FundedExpenses(string datefrm, string dateto, string Station)
		{
			return db.FundedExpenses(datefrm, dateto, Station);
		}
		//****************SUMMARY************
		public DataTable ReportsSummary()
        {
            return db.ReportsSummary();
        }
		//********************8ADVANCE UPDATE****************
		public bool AdvanceUpdate(ListAdvanceDetails det)
		{
			return db.AdvanceUpdate(det);
		}
    }
}
