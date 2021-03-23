using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using AdvanceSystem.Reporting_Grid;

namespace AdvanceSystem.Wrapper
{
   public class DatabaseHelper
    {
		internal DataTable GetUpdates()
		{
			return Database.ExecuteSelectCommand("select * from [AdvanceRequest] where [Start Date]!='' and enddate!='' and DATEADD(month, cast([Recovery Duration] as int), [Start Date])>getdate() and Balance>0 AND month(cast(LastSystemUpdate as date))<month(GETDATE())", CommandType.Text);
		}
		internal DataTable GetEmployee(string EmployeeID)
		{
			SqlParameter[] parameter = new SqlParameter[]
			   {
			 new SqlParameter("@EmployeeID",EmployeeID)
		  };
			return Database.ExecuteParamerizedSelectCommand("spGetEmployee", CommandType.StoredProcedure, parameter);
		}
		internal DataTable GetLoggedInUser(string user)
		{
			SqlParameter[] parameter = new SqlParameter[]
			   {
			 new SqlParameter("@User",user)
		  };
			return Database.ExecuteParamerizedSelectCommand("SELECT * FROM [AMS].[dbo].[Users] where Name=@User", CommandType.Text,parameter);
		}
		//************************************LOGIN*****************************
		internal DataTable Login(string User,string Password)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@User",User)
            ,new SqlParameter("@Password",Password)
            };
            return Database.ExecuteParamerizedSelectCommand("spLogin", CommandType.StoredProcedure, parameter);
        }
		public bool NewUsers(ListUsers u)
		{
			SqlParameter[] parameter = new SqlParameter[]
				 {
			 new SqlParameter("@User",u.Name),
			new SqlParameter("@Position",u.Position),
			new SqlParameter("@Role",u.Role),
			new SqlParameter("@Email",u.Email),
			new SqlParameter("@Section",u.Section),
			new SqlParameter("@Station",u.Station),
			new SqlParameter("@Name",u.User),
			new SqlParameter("@Password",u.Password),
			};
			return Database.ExecuteNonQuery("spNewUser", CommandType.StoredProcedure, parameter);
		}
		public bool DeletUser(string user, string email)
		{
			SqlParameter[] parameter = new SqlParameter[]
			{
			new SqlParameter("@user",user)
		   ,new SqlParameter("@email",email)
			};
			return Database.ExecuteNonQuery("spDeleteUser", CommandType.StoredProcedure, parameter);
		}
		public bool UpdateUser(ListUsers u)
		{
			SqlParameter[] parameter = new SqlParameter[]
					 {
			 new SqlParameter("@User",u.User),
			new SqlParameter("@Position",u.Position),
			new SqlParameter("@Role",u.Role),
			new SqlParameter("@Email",u.Email),
			new SqlParameter("@OldEmail",u.OldEmail),
			new SqlParameter("@Section",u.Section),
			new SqlParameter("@Station",u.Station),
			new SqlParameter("@Name",u.Name),
			new SqlParameter("@Password",u.Password),
			};
			return Database.ExecuteNonQuery("spUpdateUser", CommandType.StoredProcedure, parameter);
		}
		//*****************************************STATIONS*********************************
		internal DataTable loadStationCodes(int Type)
		{
			SqlParameter[] parameter = new SqlParameter[]
			  {
			 new SqlParameter("@Type",Type)
		 };
			return Database.ExecuteParamerizedSelectCommand("spDisplayStationCode", CommandType.StoredProcedure, parameter);
		}
		internal bool NewStation(ListStations st)
		{
			SqlParameter[] parameter = new SqlParameter[]
			  {
			 new SqlParameter("@Description",st.Description)
			 , new SqlParameter("@Station",st.Station)
			 , new SqlParameter("@Code1",st.Code)
			};
			return Database.ExecuteNonQuery("spNewStation", CommandType.StoredProcedure, parameter);

		}
		internal DataTable LoadBarcode(string Reqid)
		{
			SqlParameter[] parameter = new SqlParameter[]
		  {
			 new SqlParameter("@Reqid",Reqid)
	 };
			return Database.ExecuteParamerizedSelectCommand("spDisplayBarcode", CommandType.StoredProcedure, parameter);
			
		}
		//******************************************IMAGES**************************************
		internal bool NewIncidentImages(FileUploader imag)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@Reqid",imag.Id)
            ,new SqlParameter("@ImageName",imag.FileName)
           ,new SqlParameter("@extension",imag.Extension)
            };
            return Database.ExecuteNonQuery("spNewImages", CommandType.StoredProcedure, parameter);
        }

        public DataTable Ranks()
        {
            SqlParameter[] parameter = new SqlParameter[] {

           //     new SqlParameter("@Excavator",truck.Excavator),
           //new SqlParameter("@DumpLocation",truck.DumpLocation),
           // new SqlParameter("@NumberOfLoads",truck.Loads),
           // new SqlParameter("@OperatorId",truck.TruckOperatorID),
           // new SqlParameter("@InfoId",truck.InfoId)

            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayRanks", CommandType.StoredProcedure, parameter);
        }
		public bool NewReport(string title,string link)
		{
			SqlParameter[] parameter = new SqlParameter[] {

				new SqlParameter("@Title",title),
		   new SqlParameter("@Link",link),
			
			};
			return Database.ExecuteNonQuery("spNewReports", CommandType.StoredProcedure, parameter);
		}
		public DataTable Reports()
		{
			return Database.ExecuteSelectCommand("spDisplayReports", CommandType.StoredProcedure);
		}
		public bool NewAdvanceDetails(ListAdvanceDetails det)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",det.Reqid)
           , new SqlParameter("@CurrentSalary",det.CurrentSalary)
           , new SqlParameter("@AdvanceAmount",det.AdvanceAmount)
           , new SqlParameter("@RecoveryDuration",det.RecoveryDuration)
           , new SqlParameter("@Reason ",det.Reason)
           , new SqlParameter("@Enteredby",det.Entered)
           , new SqlParameter("@AdvanceState ","Pending First Approval")
           ,new SqlParameter("@AssignedTo",det.AssignedTo)
           , new SqlParameter("@Below40",det.Below40.ToString())
           , new SqlParameter("@Reason40 ",det.Reason40)
          };
            return Database.ExecuteNonQuery("spAdvanceDetails", CommandType.StoredProcedure, parameter);

        }
        public DataTable NewEmployeeDetails(ListAdvanceDetails det)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@FirstName",det.FirstName)
           , new SqlParameter("@LastName ",det.LastName)
           , new SqlParameter("@Rank ",det.Rank)
           , new SqlParameter("@EmployeeNumber",det.EmployeeNumber)
           , new SqlParameter("@Trade ",det.Trade)
           , new SqlParameter("@Appointment",det.Appointment)
           , new SqlParameter("@Unit ",det.Unit)
           , new SqlParameter("@Section ",det.Section)
		   ,new SqlParameter("@Station",det.Station)
			, new SqlParameter("@Phone ",det.Phone)
		   ,new SqlParameter("@Email",det.Email)
			};
            return Database.ExecuteParamerizedSelectCommand("spEmployeeDetails", CommandType.StoredProcedure, parameter);

        }
        public DataTable DisplayRequest(string user,string status)
        {
            SqlParameter[] parameter = new SqlParameter[] {
             new SqlParameter("@User",user)
           , new SqlParameter("@Status",status)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayRequest", CommandType.StoredProcedure, parameter);
        }
		
		public DataTable LoadEmployeeDet(string Empl,string Reqid,int Pending)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",Reqid)
           , new SqlParameter("@EmployeeNumber ",Empl)
            , new SqlParameter("@Pending",Pending)

            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayAdvanceDet", CommandType.StoredProcedure, parameter);

        }
		public DataTable LoadPayments(string Empl)
		{
			SqlParameter[] parameter = new SqlParameter[] {

				new SqlParameter("@Empl",Empl)
			};
			return Database.ExecuteParamerizedSelectCommand("SELECT * FROM [AMS].[dbo].[Advance Clearance],EmployeeDetails where EmployeeDetails.[Employee Number]=@Empl and EmployeeDetails.Reqid=[Advance Clearance].Reqid", CommandType.Text, parameter);

		}
			public DataTable LoadEmpCashierRecs(string Empl)
		{
			SqlParameter[] parameter = new SqlParameter[] {

				new SqlParameter("@Empl",Empl)
			};
			return Database.ExecuteParamerizedSelectCommand("SELECT EmployeeDetails.*,AdvanceRequest.* from EmployeeDetails,AdvanceRequest where AdvanceRequest.Reqid=EmployeeDetails.Reqid and Level=3 and [Employee Number]=@Empl order by [Start Date] desc", CommandType.Text, parameter);

		}
		public DataTable LoadEmployeeDet(string Empl)
		{
			SqlParameter[] parameter = new SqlParameter[] {

				new SqlParameter("@Emp",Empl)
			};
			return Database.ExecuteParamerizedSelectCommand("SELECT * from AdvanceRequest,EmployeeDetails where [Employee Number]=@Emp and EmployeeDetails.Reqid=AdvanceRequest.Reqid ", CommandType.Text, parameter);

		}
		public DataTable DisplayVoucherTable(int id)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@id",id)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayVoucherTable", CommandType.StoredProcedure, parameter);


        }
        //**************************APPROVE SECTION
        public DataTable LoadApprover(string id)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",id)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayAdpprove", CommandType.StoredProcedure, parameter);

        }
        public bool DeleteRanks(int id)
        {
            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@id",id)
			};
            return Database.ExecuteNonQuery("spDeleteRank", CommandType.StoredProcedure, parameter);
        }
		public bool NewMonths(int start,int end)
		{
			SqlParameter[] parameter = new SqlParameter[] {
				new SqlParameter("@Start",start)
				,new SqlParameter("@End",end)
			};
			return Database.ExecuteNonQuery("spNewMonthsRange", CommandType.StoredProcedure, parameter);
		}
		public DataTable GetMonths()
		{
			
			return Database.ExecuteSelectCommand("spGetMonthsRange", CommandType.StoredProcedure);
		}
		public bool NewRanks(string Rank)
		{
			SqlParameter[] parameter = new SqlParameter[] {
				new SqlParameter("@Rank",Rank)
			};
			return Database.ExecuteNonQuery("spNewRank", CommandType.StoredProcedure, parameter);
		}
		public DataTable DisplayUsers(int Role, string Station)
		{
			SqlParameter[] parameter = new SqlParameter[] {
				new SqlParameter("@Role",Role)
				, new SqlParameter("@Station",Station)
			};
			return Database.ExecuteParamerizedSelectCommand("spDisplayUsers", CommandType.StoredProcedure, parameter);
		}
		public DataTable DisplayImages(string Reqid)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",Reqid)
       
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayImages", CommandType.StoredProcedure, parameter);
        }
        public bool Reassign(string Reqid,string Assigned,string ReassignedBy)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",Reqid)
                ,new SqlParameter("@AssignedTo",Assigned)
				,new SqlParameter("@ApprovedBy",ReassignedBy)
            };
            return Database.ExecuteNonQuery("spReassign", CommandType.StoredProcedure, parameter);

      
        }
        //*************************voucher******************************
        public DataTable DisplayVoucher(string Reqid)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",Reqid)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayVoucher", CommandType.StoredProcedure, parameter);

        }
        public DataTable DisplayVoucherTable(string vid)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@id",vid)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayVoucherTable", CommandType.StoredProcedure, parameter);

        }
        public bool Approvals(ListAdvanceDetails det)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@Reqid",det.Reqid),
                new SqlParameter("@ApprovedBy",det.ApprovedBy),
                new SqlParameter("@AssignedTo",det.AssignedTo),
                new SqlParameter("@Approved",det.Approved.ToString()),
                new SqlParameter("@Reason",det.Reason),
            };
            return Database.ExecuteNonQuery("spNewApproval", CommandType.StoredProcedure, parameter);

        }
        public DataTable SaveVoucherDet(ListVoucher v)
        {
            SqlParameter[] parameter = new SqlParameter[] {

            new SqlParameter("@Reqid",v.Reqid)
           , new SqlParameter("@AccountType",v.AccountType)
           , new SqlParameter("@Department",v.Department)
           , new SqlParameter("@Station",v.Station)
           , new SqlParameter("@Ministry",v.Ministry)
           , new SqlParameter("@Payee",v.Payee)
           , new SqlParameter("@Authorities",v.Authorities)
            ,new SqlParameter("@Name",v.Name)
           , new SqlParameter("@Address",v.Address)
           , new SqlParameter("@Description",v.Description)
           , new SqlParameter("@Date",v.Date)
           , new SqlParameter("@Enteredby", v.UserName)
           , new SqlParameter("@Status","Approved")
			, new SqlParameter("@Barcode",v.Code)

			};
            return Database.ExecuteParamerizedSelectCommand("spNewVoucher", CommandType.StoredProcedure, parameter);

        }
        public bool saveVoucherTable(ListVoucher v)
        {
            SqlParameter[] parameter = new SqlParameter[] {
           
            new SqlParameter("@vid",v.vid)
           , new SqlParameter("@ClassFunction",v.Function)
           , new SqlParameter("@Head",v.Head)
           , new SqlParameter("@Dept",v.Dept)
           , new SqlParameter("@Unit",v.Unit)
           , new SqlParameter("@AccountingOfficer",v.AccountingOfficer)
           , new SqlParameter("@Programme",v.Programme)
           ,new SqlParameter("@Activity",v.Activity)
           , new SqlParameter("@AccountCode",v.AccountCode)
           , new SqlParameter("@Subsidiary",v.Subsidiary)
           , new SqlParameter("@Amount",v.Amount)
		   , new SqlParameter("@Debit",v.Debit)
			};
            return Database.ExecuteNonQuery("spNewVoucherTable", CommandType.StoredProcedure, parameter);

        }
        //*************************ACCESS*******************
        public DataTable Access()
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@UserId",Environment.UserName),
            };
            return Database.ExecuteParamerizedSelectCommand("spAuthenticate", CommandType.StoredProcedure, parameter);

        }
        //**************************************************FUNDING RETURNS**************************
        public DataTable LoadReturns(int id)
        {
            SqlParameter[] parameter = new SqlParameter[] {

                new SqlParameter("@id",id)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayFundingReturns", CommandType.StoredProcedure, parameter);

        }
        public DataTable NewFundingReturns(ListFunding c)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
            new SqlParameter("@Enteredby",c.Enteredby)
           ,new SqlParameter("@Issuedby",Environment.UserName)
           ,new SqlParameter("@Date",c.Date)
           ,new SqlParameter("@sid ",c.sid)
             ,new SqlParameter("@Total",c.Total)
           ,new SqlParameter("@Balance ",c.Balance)
            };
            return Database.ExecuteParamerizedSelectCommand("spNewFundingReturns",CommandType.StoredProcedure,parameter);
        }
        public DataTable GetFundedAmount(ListFunding c)
        {
            SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@section",c.section)
           ,new SqlParameter("@station",c.station)
           ,new SqlParameter("@month",c.month)
           ,new SqlParameter("@period",c.period)
        };
            return Database.ExecuteParamerizedSelectCommand("spGetFundedAmount", CommandType.StoredProcedure, parameter);

        }
		int ExportAdvanceDet(ListExportToSQl ex, int row)
		{
			SqlParameter[] parameter = new SqlParameter[]
		  {
			 new SqlParameter("@Amount",ex.Amount)
			, new SqlParameter("@Period",ex.Period)
			, new SqlParameter("@startDate",ex.startDate)
			,new SqlParameter("@PaidAmount",ex.PaidAmount)
			,new SqlParameter("@Code",ex.Code)
			,new SqlParameter("@Reqid",ex.Reqid)
		   };
			Database.ExecuteNonQuery("spUpdateAdvanceRecords", CommandType.StoredProcedure, parameter);
			return 0;

		}
		public int ExportExcelToSql(ListExportToSQl ex,int row)
		{
			//try
			//{
				SqlParameter[] parameter = new SqlParameter[]
				  {
			new SqlParameter("@FirstName",ex.FirstName),
			new SqlParameter("@LastName ",ex.LastName)
			,new SqlParameter("@Rank",ex.Rank)
			, new SqlParameter("@EmployeeNumber",ex.EmployeeNumber)
			,new SqlParameter("@Code",ex.Code)
			,new SqlParameter("@Station",ex.Station)
				   };
			// Database.ExecuteParamerizedSelectCommand("spUpdateRecords", CommandType.StoredProcedure, parameter);
			//return 0;
			using (DataTable dt = Database.ExecuteParamerizedSelectCommand("spUpdateRecords", CommandType.StoredProcedure, parameter))
			{
				if (dt.Rows.Count == 1)
					foreach (DataRow r in dt.Rows)
						ex.Reqid = r["Reqid"].ToString();
			}
			return ExportAdvanceDet(ex, row);
			//}
			//catch (Exception)
			//{
			//	return row;
			//}
		}
        public bool NewMultiFundingReturns(ListFunding c)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
            new SqlParameter("@Description",c.Description)
           ,new SqlParameter("@Amount",c.Amount)
           ,new SqlParameter("@Date",c.Date)
           ,new SqlParameter("@pid ",c.pid)
            };
            return Database.ExecuteNonQuery("spNewMultiReturns", CommandType.StoredProcedure, parameter);
        }
        //*************************************************GROUP ID**********************************
        public DataTable GetBaalanceReturns(string section,string station)
        {
            SqlParameter[] parameter = new SqlParameter[]
       {
            new SqlParameter("@station",station)
           ,new SqlParameter("@section",section)
       };
            return Database.ExecuteParamerizedSelectCommand("spGetBaalanceReturns", CommandType.StoredProcedure, parameter);

        }
        public DataTable DisplayFundingReturns(int pid)
        {
            //spDisplayFundingReturns
            SqlParameter[] parameter = new SqlParameter[]
             {
            new SqlParameter("@id",pid)
             };
            return Database.ExecuteParamerizedSelectCommand("spDisplayFundingReturns", CommandType.StoredProcedure, parameter);

        }
        public DataTable LoadFunding(int Gid)
        {
            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@Gid",Gid)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayFunding", CommandType.StoredProcedure, parameter);

        }
        public DataTable LoadGroup()
        {
            SqlParameter[] parameter = new SqlParameter[] {
              //  new SqlParameter("@Gid",Gid)
            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayFundGroup", CommandType.StoredProcedure, parameter);

        }
        public bool NewFunding(ListFunding fd)
        {
            SqlParameter[] parameter = new SqlParameter[] {

            new SqlParameter("@Amount",fd.Amount)
           ,new SqlParameter("@Station",fd.Station)
           ,new SqlParameter("@Section",fd.Section)
           ,new SqlParameter("@Gid",fd.Gid)
            };
            return Database.ExecuteNonQuery("spNewFunding", CommandType.StoredProcedure, parameter);

        }
        public DataTable NewGroupFunding(ListFunding fd)
        {
            SqlParameter[] parameter = new SqlParameter[] {
               new SqlParameter("@Enteredby",fd.EnteredBy)
           ,new SqlParameter("@Total",fd.TotalAmount)
           ,new SqlParameter("@Date",fd.Date)
           ,new SqlParameter("@Period",fd.period)
           ,new SqlParameter("@Month",fd.month)
           ,new SqlParameter("@issuedby",Environment.UserName)
            };
            return Database.ExecuteParamerizedSelectCommand("spNewFundGroup",CommandType.StoredProcedure,parameter);
        }
        //***************************CLEARANCE******************
        public bool NewCashAdvanceClearance(ListAdvanceClear clear)
        {
            SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@Amount",clear.Amount)
           ,new SqlParameter("@id",clear.id)
           ,new SqlParameter("@Balance",clear.Balance)
           ,new SqlParameter("@Reqid",clear.Reqid)
            };
            return Database.ExecuteNonQuery("spNewAdvanceClearUpdate", CommandType.StoredProcedure, parameter);
        }
		public DataTable DisplayCashPayments(string EmployeeNumber)
		{
			SqlParameter[] parameter = new SqlParameter[] {
		      new SqlParameter("@EmployeeNumber",EmployeeNumber)
			};
			return Database.ExecuteParamerizedSelectCommand("spDisplayCashClearance", CommandType.StoredProcedure, parameter);
		}
		public DataTable DisplayAutoDeduction(int reqid, string EmployeeNumber)
		{
			SqlParameter[] parameter = new SqlParameter[] {
			new SqlParameter("@reqid",reqid)
		   ,new SqlParameter("@EmployeeNumber",EmployeeNumber)
		 	};
			return Database.ExecuteParamerizedSelectCommand("DisplayAutoDeduction", CommandType.StoredProcedure, parameter);
		}

		public DataTable NewClearanceId(ListAdvanceClear clear)
        {

             SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@Date",clear.Date)
           ,new SqlParameter("@EmployeeNumber",clear.EmployeeNumber)
           ,new SqlParameter("@Enteredby",clear.Enteredby)
           ,new SqlParameter("@Issuedby",Environment.UserName)
           ,new SqlParameter("@TotalAmount",clear.TotalAmount)
           ,new SqlParameter("@Balance",clear.Balance)
			,new SqlParameter("@NewBalance",clear.NewBalance)
		   ,new SqlParameter("@PaidBy",clear.PaidBy)

			};
            return Database.ExecuteParamerizedSelectCommand("spNewAdvanceClear", CommandType.StoredProcedure, parameter);
        }
		//********************************
		public DataTable DisplayVoucherRecs(string Datefrm, string Dateto, string EmployeeN)
		{
			SqlParameter[] parameter = new SqlParameter[] {
			new SqlParameter("@Datefrm",Datefrm)
		   ,new SqlParameter("@Dateto",Dateto)
		   ,new SqlParameter("@EmployeeNumber",EmployeeN)
			};
			return Database.ExecuteParamerizedSelectCommand("spDisplayVouchers", CommandType.StoredProcedure, parameter);
		}
		public DataTable DisplayAdvanceClearance(string Datefrm,string Dateto,string EmployeeN)
		{

			SqlParameter[] parameter = new SqlParameter[] {
			new SqlParameter("@Datefrm",Datefrm)
		   ,new SqlParameter("@DateTo",Dateto)
		   ,new SqlParameter("@EmployeeNumber",EmployeeN)
			};
			return Database.ExecuteParamerizedSelectCommand("spDisplayAdvanceCashPayments", CommandType.StoredProcedure, parameter);
		}
		//*****************************************REPORTS**************************************
		public DataTable LoadFundingReports(IReports ir)
        {
            string qry = "";
            if (ir == IReports.Funding)
                qry = "select * from vwNewFunding";
            if (ir == IReports.Returns)
                qry = "select * from vwReturns";

            return Database.ExecuteSelectCommand(qry,CommandType.Text);
        }
        public DataTable LoadRecordsToBalance()
        {
            return Database.ExecuteSelectCommand("select * from [AdvanceRequest] where [Start Date]!='' and enddate!='' and DATEADD(month, cast([Recovery Duration] as int), [Start Date])>getdate() and Balance>0 and month([LastSystemUpdate]) != month(getdate()) and day([Start Date])=day(getdate())", CommandType.Text);
        }
        //******************************CALENDAR**********************
        public DataTable LoadCalendar(int Type, string EmployeeNumber)
        {
            SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@Type",Type)
           ,new SqlParameter("@EmployeeNumber",EmployeeNumber)

            };
            return Database.ExecuteParamerizedSelectCommand("spDisplayCalendar", CommandType.StoredProcedure, parameter);

        }
		//*****************************SEND EMAIL*******************
		internal DataTable GetEmailSettings()
		{
			return Database.ExecuteSelectCommand("spGetEmailSettings", CommandType.StoredProcedure);
		}
		public bool NewEmailSettings(SMTPDetails smtp)
		{
			SqlParameter[] parameter = new SqlParameter[]
				{
			 new SqlParameter("@UserId",smtp.UserId),
			new SqlParameter("@UserPassword",smtp.UserPassword),
			new SqlParameter("@EmailAddress",smtp.EmailAddress),
			new SqlParameter("@SMTPClientHost",smtp.SMTPClientHost),
			new SqlParameter("@Active",smtp.Active)
		   };	
		 return Database.ExecuteNonQuery("spNewSMTPSettings", CommandType.StoredProcedure, parameter);
		}

		internal bool SendMail(EmailCredentials ec)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@MailBody",ec.body)
            ,new SqlParameter("@SendTo",ec.SendToEmail)
            };
            return Database.ExecuteNonQuery("spSendMail", CommandType.StoredProcedure, parameter);
        }
		internal DataTable MailingList(string Reqid)
		{
			SqlParameter[] parameter = new SqlParameter[]
			   {
			 new SqlParameter("@Reqid",Reqid)
		     };
			return Database.ExecuteParamerizedSelectCommand("spEmailUsersList", CommandType.StoredProcedure, parameter);
		}
		//****************************REPORTS********************************
		internal DataTable ReportTotalIssued(string datefrm,string dateto, string Station)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@Datefrm",datefrm)
            ,new SqlParameter("@DateTo",dateto)
            ,new SqlParameter("@Station",Station)
            };
            return Database.ExecuteParamerizedSelectCommand("Reports_TotalIssued", CommandType.StoredProcedure, parameter);
        }
        internal DataTable ReportsAdvanceRemaining(string Station)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@Station",Station)
            };
            return Database.ExecuteParamerizedSelectCommand("ReportsAdvanceRemaining", CommandType.StoredProcedure, parameter);
        }
        internal DataTable ReportAutoDeductions(string datefrm, string dateto,string Station)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@Datefrm",datefrm)
            ,new SqlParameter("@DateTo",dateto)
            ,new SqlParameter("@Station",Station)
            };
            return Database.ExecuteParamerizedSelectCommand("ReportAutoDeductions", CommandType.StoredProcedure, parameter);
        }
        internal DataTable ReportsAdvancePaidBack(string datefrm, string dateto,string Station)
        {
            SqlParameter[] parameter = new SqlParameter[]
                 {
             new SqlParameter("@Datefrm",datefrm)
            ,new SqlParameter("@DateTo",dateto)
            ,new SqlParameter("@Station",Station)
            };
            return Database.ExecuteParamerizedSelectCommand("ReportsAdvancePaidBack", CommandType.StoredProcedure, parameter);
        }
        internal DataTable ReportsSummary()
        {
            SqlParameter[] parameter = new SqlParameter[]
              {
                };
            return Database.ExecuteParamerizedSelectCommand("ReportsSummary", CommandType.StoredProcedure, parameter);
        }
		//*********GROUP FUNDING***********
		internal DataTable FundedDetails(string datefrm, string dateto, string Station)
		{
			SqlParameter[] parameter = new SqlParameter[]
				{
			 new SqlParameter("@Datefrm",datefrm)
			,new SqlParameter("@DateTo",dateto)
			,new SqlParameter("@Station",Station)
		   };
			return Database.ExecuteParamerizedSelectCommand("ReportFundedDetails", CommandType.StoredProcedure,parameter);
		}
		internal DataTable Funded(string datefrm, string dateto, string Station)
		{
			SqlParameter[] parameter = new SqlParameter[]
				{
			 new SqlParameter("@Datefrm",datefrm)
			,new SqlParameter("@DateTo",dateto)
			//,new SqlParameter("@Station",Station)
		   };
			return Database.ExecuteParamerizedSelectCommand("ReportFunded", CommandType.StoredProcedure, parameter);
		}
		internal DataTable FundedExpenses(string datefrm, string dateto, string Station)
		{
			SqlParameter[] parameter = new SqlParameter[]
				{
			 new SqlParameter("@Datefrm",datefrm)
			,new SqlParameter("@DateTo",dateto)
			 ,new SqlParameter("@Station",Station)
		   };
			return Database.ExecuteParamerizedSelectCommand("ReportFundingExpense", CommandType.StoredProcedure, parameter);
		}
		//**********************8CHART********************************
		public DataTable LoadStationSummary(string Datefrm, string DateTo)
		{
			SqlParameter[] parameter = new SqlParameter[]
			{
			 new SqlParameter("@Datefrm",Datefrm)
			,new SqlParameter("@Dateto",DateTo)
	   };
			return Database.ExecuteParamerizedSelectCommand("ReportStationsSummary", CommandType.StoredProcedure, parameter);

		}
		//*******************ADVANCE UPDATE*******************
		public bool AdvanceUpdate(ListAdvanceDetails det)
		{
			SqlParameter[] parameter = new SqlParameter[] {
				new SqlParameter("@CurrentSalary",det.CurrentSalary)
			  ,new SqlParameter("@AdvanceAmount",det.AdvanceAmount)
			  ,new SqlParameter("@RecoveryDuration",det.RecoveryDuration)
			 ,new SqlParameter("@Below",det.Below40)
			 ,new SqlParameter("@reqid",det.Reqid)
	         ,new SqlParameter("@ModifiedBy",det.Entered)
			};
			return Database.ExecuteNonQuery("spUpdateAdvanceRequest", CommandType.StoredProcedure, parameter);
		}

	}
}
