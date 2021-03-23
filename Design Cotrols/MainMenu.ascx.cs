using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;
using System.Text;

namespace AdvanceSystem.Design_Cotrols
{
    public partial class MainMenu : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            
                EnableButtons();
                //if (Session["Access"] != null)
                //    UserAccess();
                //else
                //    Response.Redirect("Default.aspx");
            }
        }
        void UserAccess()
        {
            string Access = "";
            using (DataTable dt = bl.Access())
            {
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        Session["Role"]=Access = row["Role"].ToString();
                    }
                }
            }
           // HideControls(Access);
        }
   //     void HideControls(string Access)
   //     {
   //         if (Access == "1" || Access == "2")
   //         {
   //             BtnApproval.Visible = true;
   //           //  BtnPayments.Visible = false;
   //             BtnVRecs.Visible = false;
   //             BtnClearance.Visible = false;
   //             BtnFundingDetails.Visible = false;
			//	BtnAdmin.Visible = false;
			//	BtnEditUser.Visible = false;
			//	BtnImportData.Visible = false;

			//}
			//if (Access == "4")
			//{
			//	BtnApproval.Visible = false;
			//	//    BtnPayments.Visible = false;
			//	BtnVRecs.Visible = false;
			//	BtnVouchers.Visible = true;
			//	BtnClearance.Visible = true;
			//	BtnBalanceFund.Visible = true;
			//	BtnNewFund.Visible = false;
			//	BtnReports.Visible = false;
			//	BtnFundingDetails.Visible = true;
			//	BtnAdmin.Visible = false;
			//	BtnEditUser.Visible = false;
			//	BtnImportData.Visible = false;

			//}
			//if (Access == "3")
   //         {
   //             BtnApproval.Visible = false;
   //           //  BtnPayments.Visible = false;
   //             BtnVRecs.Visible = true;
   //             BtnClearance.Visible = false;
   //             BtnFundingDetails.Visible = true;
			//	BtnAdmin.Visible = false;
			//	BtnEditUser.Visible = false;
			//	BtnImportData.Visible = false;
			//}
   //         if (Access == "0")
   //         {
   //             BtnApproval.Visible = true;
   //         //    BtnPayments.Visible = true;
   //             BtnVRecs.Visible = true;
   //             BtnClearance.Visible = true;
   //             BtnFundingDetails.Visible = true;
			//	BtnAdmin.Visible = true;
			//	BtnEditUser.Visible = true;
			//	BtnImportData.Visible = true;


			//}
   //         if (Access == "")
   //         {
   //             BtnApproval.Visible = false;
   //          //   BtnPayments.Visible = false;
   //             BtnVRecs.Visible = false;
   //             BtnClearance.Visible = false;
   //             BtnFundingDetails.Visible = false;
			//	BtnAdmin.Visible = false;
			//	BtnEditUser.Visible = false;
			//	BtnImportData.Visible = false;
			//}
   //     }
        protected void BtnApproval_ServerClick(object sender, EventArgs e)
        {
            //if (Session["Role"] != null)
            //{
             //   if (Session["Role"].ToString() == "1" || Session["Role"].ToString() == "2" || Session["Role"].ToString() == "0")
                    Response.Redirect("AdvanceApproval.aspx");
            //}
        }
		void ShowReports()
		{
			StringBuilder sb = new StringBuilder();
			int x = 1;
			sb.Append("<div class='well nav-collapse sidebar-nav '>");
			sb.Append("<ul class='nav nav-tabs nav-stacked main-menu'  id='ul14'>");
			sb.Append(" <li class='nav-header hidden-tablet'>REPORTS LIBRARY</li>");

			using (DataTable dt = bl.Reports())
			{
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						string link = row["link"].ToString();
						string title = row["title"].ToString();
						//sb.Append("../images/bar-chart_256x256.png");
						//sb.Append("<li><a class='ajax-link' href='#" + link + "' height='20' width='20'><img src='../images/money_256x256.png' height='20' width='20' /><span class='hidden-tablet'>" + title + "</span></a></li>");
						sb.Append("<li><a class='ajax-link' id='BtnReports"+x+"' href='"+link+ "'> <img src='../images/bar-chart_256x256.png' height='20' width='20' /><span class='hidden-tablet'>" + title + "</span></a></li>");
						x++;
	                }
			}
			sb.Append("</ul>");
			sb.Append("</div>");
			//ulNav.InnerText.Replace("<li><a></a></li>", sb.ToString());
			lblLibrary.Text = sb.ToString();
		}
        protected void BtnPayments_ServerClick(object sender, EventArgs e)
        {
           // if (Session["Role"].ToString() == "3" ||  Session["Role"].ToString() == "0")
                Response.Redirect("Payments.aspx");
        }
        public void EnableButtons()
        {
            if(Session["Role"]!=null && Session["UserName"]!=null)
            {
                string Role = Session["Role"].ToString();
               if(Role=="1" || Role == "2")
                {
                    BtnApproval.Visible = true;
                    //BtnBalanceFund.Visible = true;
                    //BtnNewFund.Visible = true;
                  //  BtnReports.Visible = true;
					ShowReports();
					//BtnFundingDetails.Visible = true;
				}
                if (Role=="3")
                {
                    BtnVRecs.Visible = true;
                	BtnVouchers.Visible = true;
					ShowReports();
				}
				if (Role == "4")
				{
					BtnVouchers.Visible = true;
					BtnClearance.Visible = true;
					BtnVoucherApproval.Visible = true;
					ShowReports();
					//BtnBalanceFund.Visible = true;
					//BtnFundingDetails.Visible = true;

				}
					if (Role=="0")
                {
                    BtnApproval.Visible = true;
					BtnVouchers.Visible = true;
					BtnVRecs.Visible = true;
                    BtnClearance.Visible = true;
					BtnVoucherApproval.Visible = true;
					BtnSettings.Visible = true;
					ShowReports();
					//BtnBalanceFund.Visible = true;
					//               BtnNewFund.Visible = true;
					// BtnReports.Visible = true;
					//BtnFundingDetails.Visible = true;
					BtnAdmin.Visible = true;
					BtnCashClearance.Visible = true;
					BtnEditUser.Visible = true;
					BtnImportData.Visible = true;
				}
            }
            else
            {
                //BtnBalanceFund.Visible = false;
                //BtnNewFund.Visible = false;
                BtnApproval.Visible = false;
                //BtnPayments.Visible = false;
                BtnVRecs.Visible = false;
                BtnClearance.Visible = false;
				BtnCashClearance.Visible = false;
				//BtnReports.Visible = false;
				BtnAdmin.Visible = false;
				BtnEditUser.Visible = false;
				BtnImportData.Visible = false;
				BtnVouchers.Visible = false;
			}
        }
        protected void BtnVRecs_ServerClick(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");
            if (Session["Role"].ToString() == "3" || Session["Role"].ToString() == "0")
                Response.Redirect("AccountsSection.aspx");
        }

        protected void BtnNewFund_ServerClick(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");
            if (Session["Role"].ToString() == "3" || Session["Role"].ToString() == "0" || Session["Role"].ToString() == "2")
                Response.Redirect("NewFunding.aspx");
        }

        protected void BtnBalanceFund_ServerClick(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");
            if (Session["Role"].ToString() == "3" || Session["Role"].ToString() == "0" || Session["Role"].ToString() == "2")
                Response.Redirect("FundigReturns.aspx");
        }

        protected void BtnClearance_ServerClick(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");
            if (Session["Role"].ToString() == "4" || Session["Role"].ToString() == "0")
                Response.Redirect("Advance Cash Clear.aspx");
        }

        protected void BtnReports_ServerClick(object sender, EventArgs e)
        {
            // if (Session["Role"].ToString() == "3" || Session["Role"].ToString() == "0")
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");

            Response.Redirect("AMSReport Manager.aspx");

        }

        protected void BtnFundingDetails_ServerClick(object sender, EventArgs e)
        {
            if (Session["Role"] == null)
                Response.Redirect("Default.aspx");
            if (Session["Role"].ToString() == "3" || Session["Role"].ToString() == "2" || Session["Role"].ToString() == "1" || Session["Role"].ToString() == "0")
                Response.Redirect("FundingDetails.aspx");
        }

		protected void BtnAdmin_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "0")
				Response.Redirect("AdminSection.aspx");
		}

		protected void BtnCashClearance_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"].ToString() == "4" || Session["Role"].ToString() == "0")
				Response.Redirect("AdvanceCashClearanceRecords.aspx");

		}

		protected void BtnEditUser_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "0")
				Response.Redirect("System Users.aspx");

		}

		protected void BtnImportData_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "0")
				Response.Redirect("ImportFromExcel.aspx");

		}

		protected void BtnVouchers_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "4" || Session["Role"].ToString() == "0" || Session["Role"].ToString() == "3")
				Response.Redirect("AdvanceVoucherRecs.aspx");
		}

		protected void BtnVoucherApproval_ServerClick(object sender, EventArgs e)
		{
			
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "4" || Session["Role"].ToString() == "0" )
				Response.Redirect("AdvanceCashier.aspx");
		}

		protected void BtnSettings_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] == null)
				Response.Redirect("Default.aspx");
			if (Session["Role"].ToString() == "0")
				Response.Redirect("ApplicationSettings.aspx");
		}
	}
}