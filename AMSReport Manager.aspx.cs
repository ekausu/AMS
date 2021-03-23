using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvanceSystem
{
    public partial class AMSReport_Manager : System.Web.UI.Page
    {
        //System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
        //public void PassPage(Page o)
        //{
        //    if (o is AMSReport_Manager)
        //        page = o as AMSReport_Manager;
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
				Funded.Visible = false;
        }
		public void LoadScripts(string codes)
		{
			ClientScriptManager script = this.Page.ClientScript;
			if (!script.IsClientScriptBlockRegistered(this.GetType(), "Var"))
			{
				script.RegisterClientScriptBlock(this.GetType(), "Var3", "<script type=\"text / javascript\">" + codes + "</script>");
			}
			ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:" + codes + "", true);
		}

		public void LoadFunded(int x)
		{
			IssuedFunding.Visible = false;
			Funded.Visible = true;
			if (x == 1)
				Funded.LoadFundingDetails(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
			if (x == 2)
				Funded.LoadFunded(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
			if (x == 3)
				Funded.LoadExpense(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
		}
        public void LoadTotalIssued(int x)
        {
			IssuedFunding.Visible = true;
			Funded.Visible = false;
			if (x==1)
            IssuedFunding.LoadReturns(TxtDateFrm.Text,TxtDateTo.Text,TxtSection.Text);
            if(x==2)
                IssuedFunding.LoadAdvanceRemainingReturns(TxtSection.Text);
            if (x == 3)
                IssuedFunding.ReportAutoDeductions(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
            if (x == 4)
                IssuedFunding.ReportAdvancePaidBack(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
            if (x == 5)
                IssuedFunding.ReportTotalCollected(TxtDateFrm.Text, TxtDateTo.Text, TxtSection.Text);
        }

		protected void TxtReportTitle_TextChanged(object sender, EventArgs e)
		{
			lblTitle.Text = TxtReportTitle.Text;
		}
	}
}