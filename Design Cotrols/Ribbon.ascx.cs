using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvanceSystem.Design_Cotrols
{
    public partial class Ribbon : System.Web.UI.UserControl
    {
        System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
        public void PassPage(Page o)
        {
            if (o is AMSReport_Manager)
                page = o as AMSReport_Manager;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnTotalIssued_ServerClick(object sender, EventArgs e)
        {
            ((AMSReport_Manager)(page)).LoadTotalIssued(1);
        }

        protected void BtnAdvanceRemaining_ServerClick(object sender, EventArgs e)
        {
            ((AMSReport_Manager)(page)).LoadTotalIssued(2);
        }

        protected void BtnAdvanceCollected_ServerClick(object sender, EventArgs e)
        {
            ((AMSReport_Manager)(page)).LoadTotalIssued(3);
        }

        protected void BtnPaidBack_ServerClick(object sender, EventArgs e)
        {
            ((AMSReport_Manager)(page)).LoadTotalIssued(4);
        }

        protected void BtnAdvanceCollect_ServerClick(object sender, EventArgs e)
        {
            ((AMSReport_Manager)(page)).LoadTotalIssued(5);
        }

		protected void BtnFundingDetails_ServerClick(object sender, EventArgs e)
		{
			((AMSReport_Manager)(page)).LoadFunded(1);
		}

		protected void BtnFundedOnly_ServerClick(object sender, EventArgs e)
		{
			((AMSReport_Manager)(page)).LoadFunded(2);
		}

		protected void BtnExpenses_ServerClick(object sender, EventArgs e)
		{
			((AMSReport_Manager)(page)).LoadFunded(3);
		}

		protected void BtnSummarygRAPH_ServerClick(object sender, EventArgs e)
		{
			Response.Redirect("~/Graphs/SummaryGraph.aspx");
		}
	}
}