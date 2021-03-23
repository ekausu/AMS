using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using AdvanceSystem.Wrapper;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Web.Security;

namespace AdvanceSystem
{
    public partial class AdvanceRequest : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        Notifications n = new Notifications();
		EmailCredentials ec = new EmailCredentials();
		EmailTemplateCreator etc = new EmailTemplateCreator();
		DataTable DTApp = new DataTable();

		protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              //  Payslips.PassPage(this);
               // LoadUsers(1);
				SalaryDetails.PassPage(this);
			//	SetupLoginLoader();
				//ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "GoForwd();", true);
			}
		}
		//void SetupLoginLoader()
		//{
		
		//	LoadingModal l = new LoadingModal();
		//	StringBuilder strScript = new StringBuilder();
		//	strScript.Append("<script type=\"text/javascript\">");
		//	strScript.Append(l.Loader("BtnLogin", "ModalLogin"));
		//	strScript.Append("</script>");
		//	ClientScriptManager script = this.Page.ClientScript;

		//	if (!script.IsClientScriptBlockRegistered(this.GetType(), "Var"))
		//	{
		//		script.RegisterClientScriptBlock(this.GetType(), "Var", strScript.ToString());
		//	}
		//	ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:Load(); ", true);
		//}
        public void HideControls(bool above)
        {
           // Payslips.Hide(above);
        }
        protected void BtnSaveRe_ServerClick(object sender, EventArgs e)
        {

        }
		public void SetEmployeeDetails(string EmployeeID)
		{
			ListAdvanceDetails det = bl.GetEmployee(EmployeeID);
			EmployeeDetails.AutoFill(det);
			SalaryDetails.AutoFill(det);
			//ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "script", "GoForwd();", true);
		}
		//void CheckSpecialAdvance(int running, string Station,int amount)
		//{
		//	if(running>1)

		//	using (DataTable dt = bl.loadStationCodes(1))
		//	{
		//		foreach (DataRow row in dt.Rows)
		//		{
		//			DropDownStation.Items.Add(new ListItem(row["Station"].ToString(), row["Code1"].ToString()));//row["Equipment"].ToString(),);
		//		}
		//	}
		//}
		public bool HasRows()
		{
			return EmployeeDetails.HasRows();
		}
		//public void ReasonBox(bool Show)
		//{
		//	TxtReason.Visible = Show;
		//}
		void ClearAll()
		{
			AdvanceDetails.ClearAll();
			EmployeeDetails.ClearAll();
			SalaryDetails.ClearAll();
		}
		public void SaveRequest(bool below,string email, ListAdvanceDetails det)
        {
          //  det.Reason40 = TxtReason.Text;
            if (below)
            {
				if (det.Reason40 != "")
				{
					det.Below40 = Below40.Yes;
					det = SalaryDetails.NewSalaryDetails(det);
					det = AdvanceDetails.NewAdvanceDetails(det);
					if (HasRows())
					{
						det.Station = SalaryDetails.Code(det.Station);
					}
					det = EmployeeDetails.SaveEmployeeDetails(det);
					//********************************************
					UploadFiles(det);
					ec.SendToEmail = email;
					etc.SendEmail(det, ec, false);
					n.Notification("Saved Successfully", INotification.success, this);
					ClearAll();

				}
				else
				{
					n.Notification("Please put your reason for the advance", INotification.warning, this);
					SetupWizard();
				}
            }
            else
            {
                det.Below40 = Below40.No;
                det = SalaryDetails.NewSalaryDetails(det);
                det = AdvanceDetails.NewAdvanceDetails(det);
				if (HasRows())
				{
					det.Station = SalaryDetails.Code(det.Station);
				}
				det = EmployeeDetails.SaveEmployeeDetails(det);
                UploadFiles(det);
                ec.SendToEmail = email;
                etc.SendEmail(det, ec, false);
                n.Notification("Saved Successfully", INotification.success, this);
				ClearAll();
			   // Response.Redirect("AdvanceRequest.aspx");
			}
        }
		void SetupWizard()
        {
			string script = "var target = $(\"#wizard\").smartWizard();"+
              "var steps = $(target).children(\"ul\").children(\"li\").children(\"a\");"+
			"for (var stepIdx = 1; stepIdx <= 4; stepIdx++)" +
			"{" +
				"var step = steps.eq(stepIdx);" +
				"$(step, target).attr(\"isDone\", 1);"+
				 "$(step, target).removeClass(\"disabled\").addClass(\"done\");"+
			"}" +
			"var curStep = steps.eq(1);"+
			"var selStep = steps.eq(4);"+
			"$(curStep, target).removeClass(\"selected\");"+
		    "$(selStep, target).addClass(\"selected\");";
			ScriptManager.RegisterStartupScript(this,GetType(), "Javascript", script, true);
		}
        string Message(int x)
        {
            string notif="",mssg="";
            if (x == 0)
            {
                notif = "alert-success";
                mssg = "All inputs are correct";
            }
            else
            {
                notif = "alert-error";
                mssg = "Missing Entries";
				EmployeeDetails.EmptyControls();
				AdvanceDetails.EmptyControls();
				SalaryDetails.EmptyControls();
            }
            StringBuilder sb = new StringBuilder();
            sb.Append("<div class='alert "+notif+"'>");
          //  sb.Append("<button type = 'button' class='close' data-dismiss='alert'>×</button>");
            sb.Append("<strong>Alert!</strong> "+mssg+".");
            sb.Append("</div>");
			SetupWizard();

			return sb.ToString();
        }
        protected void BtnSaveRe_ServerClick1(object sender, EventArgs e)
        {
           // SaveRequest(false);
        }
        protected void Btnscancel_ServerClick(object sender, EventArgs e)
        {
			ClearAll();

		}
        protected void BtnSaveRe_ServerClick2(object sender, EventArgs e)
        {
		    AdvanceDetails.SETBOOL("true");
			string station = SalaryDetails.Station_Applied_From;
			DTApp = new DataTable();
			DTApp=LoadUsers(1,station); 
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
        }

        int Validated()
        {
            int employee, payslips, advance,salary;
            payslips = ValidatePayslip();
            employee = EmployeeDetails.Vaidated();
            advance= AdvanceDetails.Validated();
            salary = SalaryDetails.Validated();

            lblValidate1.Text = Message(employee);
            lblValidate2.Text = Message(salary);
            lblValidate3.Text = Message(advance);
            lblVaildate4.Text = Message(payslips);

            int total = employee + payslips + advance + salary;
            // if (total>0)
            // ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);
            return total;
        }
        public DataTable LoadUsers(int role,string Station)
        {
			DataTable dt=bl.DisplayUsers(0, "");
			DataTable dtx = new DataTable();
			try
			{
				 dtx = dt.AsEnumerable().Where(x => x.Field<int>("Role") == role).Where(x => x.Field<string>("Station") == Station).CopyToDataTable();
				if(dtx==null)
					dtx = dt.AsEnumerable().Where(x => x.Field<int>("Role") == role).CopyToDataTable();

				if (dtx != null)
				{
					return dtx;
				}
				return null;
			}
			catch (Exception)
			{
				return null;
			}
		
		}
        protected void tnSave2_ServerClick(object sender, EventArgs e)
        {
			AdvanceDetails.SETBOOL("false");
			string station = SalaryDetails.Station_Applied_From;
			DTApp = new DataTable();
			DTApp=LoadUsers(1, station);
           // ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
			if (AdvanceDetails.BOOL() != "")
			{
				Button txt = (Button)sender;
				GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

				ListAdvanceDetails det = new ListAdvanceDetails();
				

				det.AssignedTo = ((Label)gvrow.FindControl("Name")).Text;
				string email = ((Label)gvrow.FindControl("Email")).Text;
				//ModalWait
				//  ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalWait';", true);

				if (Validated() == 0)
				{
					if (AdvanceDetails.BOOL().ToUpper() == "TRUE")
						SaveRequest(true, email, det);
					else
						SaveRequest(false, email, det);
				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);
					EmployeeDetails.EmptyControls();
					AdvanceDetails.EmptyControls();
					SalaryDetails.EmptyControls();
				}
			}
			else
			{
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);
				EmployeeDetails.EmptyControls();
				AdvanceDetails.EmptyControls();
				SalaryDetails.EmptyControls();
			}
        }
		public void LoadCheif(int user)
		{
			string station = SalaryDetails.Station_Applied_From;
			DTApp = new DataTable();
			DTApp=LoadUsers(user,station);
		}
        protected void BtnLogin_ServerClick(object sender, EventArgs e)
        {
			ValidateLogin();
			//if(TxtPassword.Value!="" && TxtName.Text!="")
			//{
			//    using (DataTable dt = bl.Login(TxtName.Text, TxtPassword.Value))
			//    {
			//        if (dt.Rows.Count == 1)
			//        {
			//            foreach (DataRow row in dt.Rows)
			//            {
			//                Session["Role"] = row["Role"].ToString();
			//                Session["UserName"] = row["Name"].ToString();
			//            }
			//            n.Notification("User Access has been granted", INotification.success, this);
			//            MainMenu1.EnableButtons();
			//        }
			//        else
			//            n.Notification("Incorrect user name or password", INotification.warning, this);
			//    }
			//}
			//else
			//    n.Notification("Incorrect user name or password", INotification.warning, this);
		}
		private bool ValidateUser(string userName, string passWord)
		{
			string lookupPassword = null;
			bool Correct = false;
			string role="";
			string user="";


			// Check for invalid userName.
			// userName must not be null and must be between 1 and 15 characters.
			if ((null == userName) || (0 == userName.Length) || (userName.Length > 15))
			{
				//System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of userName failed.");
				n.Notification("Invalide user name or password", INotification.warning);
				return false;
			}

			// Check for invalid passWord.
			// passWord must not be null and must be between 1 and 25 characters.
			if ((null == passWord) || (0 == passWord.Length) || (passWord.Length > 25))
			{
				//System.Diagnostics.Trace.WriteLine("[ValidateUser] Input validation of passWord failed.");
				n.Notification("Invalide user name or password", INotification.warning);
				return false;
			}

			//try
			//{
			using (DataTable dt = bl.Login(userName, passWord))
			{
				if (dt.Rows.Count == 1)
				{
					foreach (DataRow row in dt.Rows)
					{
						//Session["Name"] = row["UserName"].ToString();
						//Session["AccessType"] = row["AccessType"].ToString();
						role = row["Role"].ToString();
						user = row["Name"].ToString();
						lookupPassword = row["Password"].ToString();
					}
				}
			}

			//}
			//catch (Exception ex)
			//{
			//	//n.Notification("Invalide user name or password", Notifications.INotification.warning, this);
			//	//return false;
			//}

			// If no password found, return false.
			if (null == lookupPassword)
			{
				// You could write failed login attempts here to event log for additional security.
				n.Notification("Invalide user name or password", INotification.warning);
				
				return false;
			}
			Correct = (0 == string.Compare(lookupPassword, passWord, false));
			if (Correct && role!="" && user!="")
			{
				Session["Role"] =role;
				Session["UserName"] = user;
			}
			// Compare lookupPassword and input passWord, using a case-sensitive comparison.
			return Correct;//(0 == string.Compare(lookupPassword, passWord, false));

		}
		void ValidateLogin()
		{
			if (ValidateUser(TxtName.Text, TxtPassword.Value))
			{
				FormsAuthenticationTicket tkt;
				string cookiestr;
				HttpCookie ck;
				tkt = new FormsAuthenticationTicket(1, TxtName.Text, DateTime.Now,
				 DateTime.Now.AddMinutes(30), true, TxtName.Text);
				cookiestr = FormsAuthentication.Encrypt(tkt);
				ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
				//if (true)
				ck.Expires = tkt.Expiration;
				ck.Path = FormsAuthentication.FormsCookiePath;
				Response.Cookies.Add(ck);

				string strRedirect;
				strRedirect = Request["ReturnUrl"];
				if (strRedirect == null)
					strRedirect = "Default.aspx";
				Response.Redirect(strRedirect, true);

			}
			else
			{
				n.Notification("Incorrect user name or password", INotification.warning, this);
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "script", "location.href='#ModalLogin'", true);

			}
			//Response.Redirect("AdvanceRequest.aspx", true);
		}

		System.Drawing.Imaging.ImageFormat Extensions(string exe)
        {
            if (exe == "png")
                return System.Drawing.Imaging.ImageFormat.Png;
            if (exe == "gif")
                return System.Drawing.Imaging.ImageFormat.Gif;
            if (exe == "bmp")
                return System.Drawing.Imaging.ImageFormat.Bmp;
            if (exe == "ico")
                return System.Drawing.Imaging.ImageFormat.Icon;
            if (exe == "jpeg")
                return System.Drawing.Imaging.ImageFormat.Jpeg;
            else
                return System.Drawing.Imaging.ImageFormat.Tiff;
        }
        int ValidatePayslip()
        {

            int j = 0;
            for (int i = 0; i < Request.Files.Count; i++)
            {
                FileUploader f = new FileUploader();
                HttpPostedFile PostedFile = Request.Files[i];
                if (PostedFile.ContentLength > 0 && PostedFile.ContentLength < 20728650)
                {
                    j++;
                }
            }
            if (j == 0)
                return 1;
            else
                return 0;
        }
        public List<LinkedResource> UploadFiles(ListAdvanceDetails det)
        {
            List<LinkedResource> ImgList = new List<LinkedResource>();
            if (det.Reqid > 0)
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    FileUploader f = new FileUploader();
                    HttpPostedFile PostedFile = Request.Files[i];
                    if (PostedFile.ContentLength > 0 && PostedFile.ContentLength < 20728650)
                    {
                        string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                        string filename2 = (DateTime.Now.ToString()+ FileName).Replace("/","").Replace(":","").Replace(" ","");
                        string Ext = System.IO.Path.GetExtension(PostedFile.FileName);
                        string path = "";
                        path = Server.MapPath("~/Payslips/" + filename2);
                        PostedFile.SaveAs(path);

                        FileStream fs = new FileStream(Server.MapPath("~/Payslips/" + filename2), FileMode.Open, FileAccess.Read);
                        BinaryReader br = new BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        br.Close();
                        fs.Close();


                        // f.Image= bytes;

                        f.Image = bytes;
                        f.ContentType = PostedFile.ContentType;
                        f.FileName = filename2;
                        f.Extension = Ext;
                        f.Id = det.Reqid;
                        if (filename2 != "" && Ext != "" && path != "")
                        {
                            bl.NewIncidentImages(f);
                            LinkedResource rs = new LinkedResource(path);
                            rs.ContentId = filename2;
                            ImgList.Add(rs);
                        }
                    }
                }
            return ImgList;
        }
		public RequestData DedSalary()
		{
			RequestData d = new RequestData();
			d.Deductions=EmployeeDetails.Deductions();
			d.Salary = SalaryDetails.Salary();
			return d;
		}
		protected void BtnEmailUs_ServerClick(object sender, EventArgs e)
        {
			if (TxtCompName.Text != "" && TxtQuery.Text != "")
			{
				if (etc.SendComplaint(TxtCompName.Text, txtYourEmail.Text, TxtQuery.Text))
				{
					TxtCompName.Text = "";
					txtYourEmail.Text = "";
					TxtQuery.Text = "";
					n.Notification("Ticket has been sent successfuly", INotification.success);
				}
			}
			else
			{
				n.Notification("Missing Name and Message", INotification.warning);
				ScriptManager.RegisterClientScriptBlock(this,typeof(Page),"script", "location.href='#ModalQuery'",true);
			}

		}

		protected void btnUpload_Click(object sender, EventArgs e)
		{

		}

		protected void BtnSaveRe_ServerClick3(object sender, EventArgs e)
		{
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
		}

		public void A2_ServerClick(object sender, EventArgs e)
		{

		}
		public void Message()
		{
			n.Notification("Loading list of users", INotification.info, this);
		}
		void AutoAssign()
		{
			
			if (AdvanceDetails.BOOL() != "" && DTApp.Rows.Count>0)
			{
				//Button txt = (Button)sender;
				//GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

				ListAdvanceDetails det = new ListAdvanceDetails();
				det.AssignedTo = DTApp.Rows[0]["Name"].ToString();
				string email = DTApp.Rows[0]["Email"].ToString();
				
				if (Validated() == 0)
				{
					if (AdvanceDetails.BOOL().ToUpper() == "TRUE")
						SaveRequest(true, email, det);
					else
						SaveRequest(false, email, det);
				}
				else
				{
					ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);
					EmployeeDetails.EmptyControls();
					AdvanceDetails.EmptyControls();
					SalaryDetails.EmptyControls();
					SetupWizard();
				}
			}
			else
			{
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);
				EmployeeDetails.EmptyControls();
				AdvanceDetails.EmptyControls();
				SalaryDetails.EmptyControls();
				if (GridViewUsers.Rows.Count <= 0)
					n.Notification("There is no approver role setup. Please notify the system Adminitrator",INotification.warning);
				SetupWizard();
			}
		}
		protected void tnSave2_ServerClick1(object sender, EventArgs e)
		{
			AutoAssign();
		}
		public void CalculateDuration()
		{
			AdvanceDetails.DurationCal();
		}
		protected void BtnSaveRe_ServerClick4(object sender, EventArgs e)
		{
			AutoAssign();
		}
	}

	public class RequestData
	{
		public string Deductions { get; set; }
		public string Salary { get; set; }
	}
}