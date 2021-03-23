using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;
using System.Text;
using System.Net;
using System.Web.UI.HtmlControls;
using AdvanceSystem.RequestDetails;
using AjaxControlToolkit.Design;
using AjaxControlToolkit;

namespace AdvanceSystem
{
    public partial class AdvanceApproval : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        ImageGenerator img = new ImageGenerator();
		Notifications n = new Notifications();
		URLEncrypt enc = new URLEncrypt();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null)
                {
                    LoadRequests(Session["UserName"].ToString(),"");
                    LoadReasignList(1);
                }
                else
                    Response.Redirect("Default.aspx");
            }

        }
        void LoadReasignList(int role)
        {
			DataTable table = new DataTable();
			DataTable dt = bl.DisplayUsers(role, txtstation.Text);
			if (dt.Rows.Count > 0)
				table = dt;
			else if (table.Rows.Count > 0)
				table = bl.DisplayUsers(role, "");

			GridViewUsers.DataSource = table;
			GridViewUsers.DataBind();
        }
        void LoadRequests(string user,string status)
        {
			DataTable dt= bl.DisplayRequest(user, status);
			DataTable dtx = new DataTable();
			try
			{
				if (user == "" && status == "")
					dtx = dt.AsEnumerable().Where(x => x.Field<int>("level") < 3).Where(x => !x.Field<string>("Advance State").Contains("Rejected"))
				.Where(x => !x.Field<string>("Advance State").Contains("Running Recovery"))
				.Where(x => !x.Field<string>("Advance State").Contains("Terminated"))
				.Where(x => !x.Field<string>("Advance State").Contains("Completed")).CopyToDataTable();
				else
					dtx = dt;

				GridviewAdvanceReq.DataSource = dtx;
				GridviewAdvanceReq.DataBind();

			}
			catch (Exception)
			{
				//dtx = dt;
			}
			    
        }
        protected void GridviewAdvanceReq_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label status = e.Row.FindControl("lblStatus") as Label;
                Label lblDisplayState = e.Row.FindControl("lblDisplayState") as Label;
                Label lblBalance = e.Row.FindControl("lblBalance") as Label;
                Label lblBelow = e.Row.FindControl("lblBelow") as Label;
                Label lblBelow40 = e.Row.FindControl("lblBelow40") as Label;
                Label lblDetails = e.Row.FindControl("lblDetails") as Label;
				Label lbllv = e.Row.FindControl("level") as Label;
				
				System.Web.UI.HtmlControls.HtmlAnchor BtnApp = e.Row.FindControl("BtnApprove") as System.Web.UI.HtmlControls.HtmlAnchor;
                System.Web.UI.HtmlControls.HtmlAnchor BtnReas = e.Row.FindControl("BtnReassign") as System.Web.UI.HtmlControls.HtmlAnchor;
				System.Web.UI.HtmlControls.HtmlAnchor BtnAdvReassign = e.Row.FindControl("BtnAdvReassign") as System.Web.UI.HtmlControls.HtmlAnchor;
				System.Web.UI.HtmlControls.HtmlAnchor BtnUpdateRequest = e.Row.FindControl("BtnUpdateRequest") as System.Web.UI.HtmlControls.HtmlAnchor;

				BtnApp.Visible = true;
                BtnReas.Visible = true;
				BtnAdvReassign.Visible = true;
				BtnUpdateRequest.Visible = true;

				if (lblBelow40.Text.ToUpper() == Below40.Yes.ToString().ToUpper())
                    lblBelow.Text = "<a href='#' data-rel='popover' data-content='" + lblDetails.Text + "' title='Reason for below 40%'><span class='label label-important'>Advance below 40%</span></a>";
                else
                    lblBelow.Text = "<span class='label'>Above 40%</span>";

				if (lbllv.Text=="2")
                    lblDisplayState.Text = "<i class='icon32 icon-blue icon-bullet-on'></i><span class='label label-info'>2nd Approval</span>";
                if (lbllv.Text == "1")
                    lblDisplayState.Text = "<i class='icon32 icon-blue icon-bullet-on'></i><span class='label label-info' style='background-color:blue'>1st Approval</span>";
                if (status.Text.ToUpper() == "REJECTED")
                    lblDisplayState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Rejected</span>";
				if (lbllv.Text == "3")
				{
					BtnApp.Visible = false;
					lblDisplayState.Text = "<i class='icon32 icon-gray icon-bullet-on'></i><span class='label'>Voucher Handler</span>";
				}
				if (lbllv.Text == "4")
				{
					BtnApp.Visible = false;
					lblDisplayState.Text = "<i class='icon32 icon-darkgray icon-bullet-off'></i><span class='label' style='background:black'>Cashier</span>";
				}
				if (lblBalance.Text != "")
                {
                    float bal = float.Parse(lblBalance.Text);
                    if (bal > 0)
                    {
                        lblDisplayState.Text = "<i class='icon32 icon-orange icon-bullet-on'></i><span class='label label-warning'>Running Recovery</span>";
                        BtnApprove.Visible = true;
                        BtnReqReject.Visible = true;
                        BtnApp.Visible = false;
                        BtnReas.Visible = false;
						BtnUpdateRequest.Visible = false;
						BtnAdvReassign.Visible = false;
					}
                    else
                    {
                        lblDisplayState.Text = "<i class='icon32 icon-green icon-bullet-on'></i><span class='label label-success'>Completed</span>";
                     //   BtnApprove.Visible = false;
                        BtnReqReject.Visible = false;
                        BtnReas.Visible = false;
						BtnUpdateRequest.Visible = false;
						BtnApp.Visible = false;
						BtnAdvReassign.Visible = false;
					}
                }
                else
                {
                    BtnApprove.Visible = true;
                    BtnReqReject.Visible = true;
                    BtnApp.Visible = true;
                    BtnReas.Visible = true;
					BtnUpdateRequest.Visible = true;

				}
            }
    
        }

        protected void GridviewAdvanceReq_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridviewAdvanceReq_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void BtnViewDet_ServerClick(object sender, EventArgs e)
        {
            string id = GenerateId(sender);
            GridViewDetails.DataSource = bl.LoadEmployeeDet(false,"5",1);
            GridViewDetails.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalDet';", true);

        }

        protected void BtnReassign_ServerClick(object sender, EventArgs e)
        {

        }

        protected void BtnApprove_ServerClick(object sender, EventArgs e)
        {
            string id= idholder.Text = GenerateId(sender);
			if (lblAssigned.Text == Session["UserName"].ToString() || Session["Role"].ToString() == "0")
				BtnApprove.Visible = true;
			else
				BtnApprove.Visible = false;

			StringBuilder sb = new StringBuilder();
			using (DataTable dt = bl.LoadApprover(id))
			{
				if (dt.Rows.Count > 0)
				{
					if (TxtDetails.Text != "")
					{
						sb.Append("<div class='alert alert-warning'>");
						sb.Append("<button type='button' class='close' data-dismiss='alert'>×</button>");
						sb.Append("<h4 class='alert-heading'>Below 40% Reason!</h4>");
						sb.Append("<p>"+ TxtDetails .Text+ "</p>");
						sb.Append("</div>");
					}
					foreach (DataRow row in dt.Rows)
					{
						sb.Append("<div class='alert alert-info'>");
						sb.Append("<button type='button' class='close' data-dismiss='alert'>×</button>");
						sb.Append("<h4 class='alert-heading'>Approved by <br>" + row["Approved By"].ToString() + "!</h4>");
						sb.Append("<p><br>Date:<br>" + row["Date"].ToString() + "  <br>Type:<br>" + row["Approved"].ToString() + " <br>Comments:" + row["Reason"].ToString() + "  </p>");
						sb.Append("</div>");
					}
				}
				else
				{
					if (TxtDetails.Text != "")
					{
						sb.Append("<div class='alert alert-warning'>");
						sb.Append("<button type='button' class='close' data-dismiss='alert'>×</button>");
						sb.Append("<h4 class='alert-heading'>Below 40% Reason!</h4>");
						sb.Append("<br><p>" + TxtDetails.Text + "</p>");
						sb.Append("</div>");
					}
					else
					{
						sb.Append("<div class='alert alert-success'>");
						sb.Append("<button type='button' class='close' data-dismiss='alert'>×</button>");
						sb.Append("<h4 class='alert-heading'>comments!</h4>");
						sb.Append("<p>No user comments have been found</p>");
						sb.Append("</div>");
					}
				}

				lblComments.Text = sb.ToString();
			}
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalApprove';", true);
        }

        protected void imgGrid2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            // GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
			TabContainer tab = row.FindControl("TabContainer1") as TabContainer;
			TabPanel p3 = tab.FindControl("TabPanel3") as TabPanel;

			if (imgShowHide.CommandArgument == "Show")
            {
                row.FindControl("Panel1").Visible = true;
               Label lblid = row.FindControl("lblReqid") as Label;
                Label Htmlimages = p3.FindControl("LblImages") as Label;
                Label lblEmployeeNumber = row.FindControl("lblEmployeeNumber") as Label;
               // string id = ((Label)row.FindControl("lblReqid")).Text;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/minus.ico";
                LoadGrid(lblid.Text,lblEmployeeNumber.Text, row);
              
				Htmlimages.Text = img.GenerateImages(bl.DisplayImages(lblid.Text));
             }
            else
            {
                row.FindControl("Panel1").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/plus.ico";
            }
        }

		void LoadAdvanceDetails(string EmployeeNumber)
		{
			GridviewAdvanceReq.DataSource = bl.LoadEmployeeDet(EmployeeNumber);//dt;// (true, "2323");//bl.LoadEmployeeDet(true, "2323"); ;
			GridviewAdvanceReq.DataBind();
		}
		void LoadGrid(string reqid,string id,GridViewRow row)
        {

			TabContainer tab = row.FindControl("TabContainer1") as TabContainer;
			TabPanel p1 = tab.FindControl("TabPanel1") as TabPanel;
			TabPanel p2 = tab.FindControl("TabPanel2") as TabPanel;
			TabPanel p3 = tab.FindControl("TabPanel4") as TabPanel;
			TabPanel p5 = tab.FindControl("TabPanel5") as TabPanel;

			OutstandingAdvance outstandingadvance = p2.FindControl("OutstandingAdvance") as OutstandingAdvance;
			outstandingadvance.LoadGrid(id,row);
			
			History history = p3.FindControl("History") as History;
			history.LoadGrid(id,row);
			DataTable dt = bl.LoadEmployeeDet(false, reqid, 0);

			AdvanceDetails advancedetails = p1.FindControl("AdvanceDetails") as AdvanceDetails;
			advancedetails.LoadGrid(dt);
			EmployeeDetails employeedetails = p1.FindControl("EmployeeDetails") as EmployeeDetails;
			employeedetails.LoadGrid(dt);
			SalaryDetails salarydetails = p1.FindControl("SalaryDetails") as SalaryDetails;
			salarydetails.LoadGrid(dt);

			Deductions deductions = p5.FindControl("Deductions") as Deductions;
			deductions.LoadDeductions(int.Parse(reqid), id);
			CashPayments cashpayments = p5.FindControl("CashPayments") as CashPayments;
			cashpayments.LoadCashPayments(id);
		}
		protected void GridViewAdvanceDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void GridViewAdvHistory_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridViewApprovers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType==DataControlRowType.DataRow)
            {
                Label status = e.Row.FindControl("lblStatus") as Label;
                Label ApproveState = e.Row.FindControl("lblApproved") as Label;
                if (status.Text.ToUpper()=="APPROVED")
                    ApproveState.Text = "<span class='label label-success'>Approved</span>";
                if(status.Text.ToUpper()=="REJECTED")
                    ApproveState.Text = "<span class='label label-danger'>Rejected</span>";
            }
        }
        string GenerateId(object sender)
        {
            System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
            Label lblid = (Label)gvrow.FindControl("lblReqid");
            Label lbllv = gvrow.FindControl("level") as Label;
			Label lblDetails = gvrow.FindControl("lblDetails") as Label;
			Label lblAssignedTO = gvrow.FindControl("lblAssignedTO") as Label;
			Label lblStation = gvrow.FindControl("lblStation") as Label;

			if (lbllv.Text!="")
            txtlevel.Text = (int.Parse(lbllv.Text)+1).ToString();
			txtstation.Text = lblStation.Text;
			TxtDetails.Text = lblDetails.Text;
			lblAssigned.Text = lblAssignedTO.Text;

			TxtStatus.Text= ((Label)gvrow.FindControl("lblStatus")).Text;
            return idholder.Text = lblid.Text;

        }

        protected void BtnApprovers_ServerClick(object sender, EventArgs e)
        {
            string id=  GenerateId(sender);
		

		 GridViewApprovers.DataSource=   bl.LoadApprover(id);
         GridViewApprovers.DataBind();

       ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalApprovers';", true);

        }
      
        protected void BtnApprove_ServerClick1(object sender, EventArgs e)
        {
            Session["Users"] = "true";
			//string id = GenerateId(sender);

			if (lblAssigned.Text == Session["UserName"].ToString())
				BtnApprove.Disabled = false;
			else
				BtnApprove.Disabled = true;

			LoadReasignList(int.Parse(txtlevel.Text));
			//         if(lbl.Text.ToUpper().Contains("SECOND"))
			//         {
			//             GridViewUsers.DataSource = bl.DisplayUsers(3);
			//             GridViewUsers.DataBind();
			//         }
			//if (TxtStatus.Text.ToUpper().Contains("FIRST"))
			//{
			//	DataTable dt = new DataTable();
			//	dt= bl.DisplayUsers(2);
			//	if (dt.Rows.Count == 0)
			//	dt = bl.DisplayUsers(0);
			//	GridViewUsers.DataSource = dt;
			//	GridViewUsers.DataBind();
			//}

			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
            Button txt = (Button)sender;
            GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
            string User = ((Label)gvrow.FindControl("Name")).Text;
            string email = ((Label)gvrow.FindControl("Email")).Text;
            EmailCredentials ec = new EmailCredentials();
            EmailTemplateCreator etc = new EmailTemplateCreator();
            ListAdvanceDetails det = new ListAdvanceDetails();
            det.Reqid = int.Parse(idholder.Text);
            det.ApprovedBy = Session["UserName"].ToString();
            det.AssignedTo = User;
            det.Approved = ApproveType.Reassigned;
            det.Reason = "Reassigned";
            if (Session["Users"] != null)
            {
                if (Session["Users"].ToString() == "true")
                {
                   Approvals(User, ApproveType.Approved);
                   Session["Users"] = null;
                }
            }
                else
                {
                    if (Session["Reassignid"] != null)
                        bl.Reassign(Session["Reassignid"].ToString(), User, Session["UserName"].ToString());
                }
                ec.SendToEmail = email;
                etc.SendEmail(det, ec,false); 
            // ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
        }
        void Sender(object sender)
        {
            Button txt = (Button)sender;
            GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

            //f.Location = ((Label)gvrow.FindControl("Location")).Text;
            string User = ((Label)gvrow.FindControl("User")).Text;
            string Email = ((Label)gvrow.FindControl("Email")).Text;

         
        }
        void Approvals(string AssignedTo,ApproveType app)
        {
            ListAdvanceDetails det = new ListAdvanceDetails();
            det.Reqid = int.Parse(idholder.Text);
            det.ApprovedBy = Session["UserName"].ToString();
		    det.AssignedTo = AssignedTo;
            det.Approved = app;
		    det.Reason = TxtReject.Text;
            bl.Approvals(det);
            Notifications n = new Notifications();
            n.Notification("Response sent Successfully",INotification.success,this);
            LoadRequests(Session["UserName"].ToString(), "");
            Session["Reassignid"] = null;
			txtComments.Text = "";
			TxtReject.Text = "";

		}
        public void Calendar()
        {
            string url = "Document.aspx";
            string s = "window.open('" + url + "', 'popup_window', 'toolbar = yes,scrollbars = yes,resizable = yes,top = 50,left = 200,width = 1300,height = 800');";// 'width=800,height=800,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
        }
        protected void BtnReqReject_ServerClick(object sender, EventArgs e)
        {
			TxtReject.Text = txtComments.Text;
			Approvals("",ApproveType.Rejected);
        }

        protected void BtnCalendar_ServerClick(object sender, EventArgs e)
        {
            string url = "Calendar.aspx";
            string s = "window.open('" + url + "', 'popup_window', 'toolbar = no,scrollbars = yes,resizable = no,top = 200,left = 200,width = 750,height = 530');";// 'width=800,height=800,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);

        }

        protected void BtnDisplayAll_ServerClick(object sender, EventArgs e)
        {
            txtClickedOption.Text = "BtnDisplayAll";
            LoadRequests("", "");
        }

        protected void BtnMyApproval_ServerClick(object sender, EventArgs e)
        {
            txtClickedOption.Text = "BtnMyApproval";
            if (Session["UserName"] != null)
                LoadRequests(Session["UserName"].ToString(), "");
            else
                Response.Redirect("Default.aspx");
        }

        protected void BtnRejected_ServerClick(object sender, EventArgs e)
        {
            txtClickedOption.Text = "BtnRejected";
            LoadRequests("", "Rejected");
        }
        void DownloadFiles(string filename,string ext)
        {
			string url = "Payslips/"+filename;
			string s = "window.open('" + url + "', 'popup_window', 'toolbar = yes,scrollbars = yes,resizable = yes,top = 200,left = 200,width = 900,height = 900');";// 'width=800,height=800,left=100,top=100,resizable=yes');";
			ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);

			// string strURL = filename;
			//WebClient req = new WebClient();
   //         HttpResponse response = HttpContext.Current.Response;
   //         response.Clear();
   //         response.ClearContent();
   //         response.ClearHeaders();
   //         response.Buffer = true;
   //         string path = Server.MapPath("~/Payslips/" + filename);
   //         response.ContentType = ext;
   //         response.AddHeader("Content-Disposition", "attachment;Payslips=\"" + path + "\"");
        
   //         byte[] data = req.DownloadData(path);
   //         response.BinaryWrite(data);
   //         response.End();
        }

        protected void BtnDownload_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
            GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
            Label lblfilenam = (Label)gvrow.FindControl("TxtImageName");
            Label lblExt = (Label)gvrow.FindControl("lblExt");
            if (lblfilenam.Text!="" && lblExt.Text!="")
            DownloadFiles(lblfilenam.Text, lblExt.Text);
          
        }

        protected void BtnPayslips_ServerClick(object sender, EventArgs e)
        {
            string id = GenerateId(sender);
            GridViewFiles.DataSource = bl.DisplayImages(id);
            GridViewFiles.DataBind();
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalFile';", true);

        }

        protected void BtnReassign_ServerClick1(object sender, EventArgs e)
        {
            string id = GenerateId(sender);
            Session["Reassignid"] = id;
            LoadReasignList(int.Parse(txtlevel.Text)-1);
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);
        }

        protected void BtnRunning_ServerClick(object sender, EventArgs e)
        {
            txtClickedOption.Text = "BtnRunning";
            LoadRequests("", "Running");
        }

        protected void BtnCompleted_ServerClick(object sender, EventArgs e)
        {
            txtClickedOption.Text = "BtnCompleted";
            LoadRequests("", "Completed");
        }

        protected void GridviewAdvanceReq_SelectedIndexChanged(object sender, EventArgs e)
        {
           

        }

        protected void GridviewAdvanceReq_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridviewAdvanceReq.PageIndex = e.NewPageIndex;
            if (txtClickedOption.Text== "BtnRejected")
            BtnRejected_ServerClick(sender,e);
            if (txtClickedOption.Text == "BtnDisplayAll")
                BtnDisplayAll_ServerClick(sender, e);
            if (txtClickedOption.Text == "BtnCompleted")
                BtnCompleted_ServerClick(sender, e);
            if (txtClickedOption.Text == "BtnRunning")
                BtnRunning_ServerClick(sender,e);
            if (txtClickedOption.Text == "BtnMyApproval")
                BtnMyApproval_ServerClick(sender, e);
            //LoadRequests(Session["UserName"].ToString(), "");
        }

		protected void BtnSearch_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnFilter_ServerClick(object sender, EventArgs e)
		{
			if (TxtEmployeeNumber.Text != "")
				LoadAdvanceDetails(TxtEmployeeNumber.Text);
			else
				n.Notification("Please enter the emloyee number",INotification.info,this);
		}

		protected void BtnAdvReassign_ServerClick(object sender, EventArgs e)
		{
			string id = GenerateId(sender);
			Session["Reassignid"] = id;
			LoadReasignList(0);
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);

		}

		protected void BtnCashier_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnReassign_ServerClick2(object sender, EventArgs e)
		{

		}

		protected void BtnReassign_ServerClick3(object sender, EventArgs e)
		{
			Session["Reassignid"] = idholder.Text;
			LoadReasignList(int.Parse(txtlevel.Text) - 1);
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUsers';", true);

		}

		protected void BtnUpdateRequest_ServerClick(object sender, EventArgs e)
		{
			
			enc.GetEncrypted = GenerateId(sender);
			Response.Redirect("AdvanceUpdate.aspx?reqid=" + enc.GetEncrypted);
		}

		protected void tab1_ServerClick(object sender, EventArgs e)
		{
			//System.Web.UI.HtmlControls.HtmlAnchor tab = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			//GridViewRow gvrow = (GridViewRow)tab.Parent.Parent;
			//System.Web.UI.HtmlControls.HtmlGenericControl tabSel = (System.Web.UI.HtmlControls.HtmlGenericControl)gvrow.FindControl("first");
			//tab.HRef = tabSel.ClientID;

		}

		protected void BtnTerminate_ServerClick(object sender, EventArgs e)
		{
			TxtReject.Text = txtTerminateComments.Text;
			Approvals("", ApproveType.Terminated);
			TxtReject.Text = "";
			txtTerminateComments.Text="";
		}

		//protected void GridViewUsers_RowDataBound(object sender, GridViewRowEventArgs e)
		//{
  // //      	if (e.Row.RowType == DataControlRowType.DataRow)
		//	//{
		//	//	e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridViewUsers, "Select$" + e.Row.RowIndex);
		//	//	e.Row.Attributes["style"] = "cursor:pointer";
		//	//}
		//}
	}
}