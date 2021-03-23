using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Web.UI.HtmlControls;

namespace AdvanceSystem.Settings
{
	public partial class Ranks : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadRanks();
		}
		void LoadRanks()
		{
			GridViewRanks.DataSource = bl.DisplayRanks();
			GridViewRanks.DataBind();
		}
		protected void GridViewEmailSettings_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void GridViewRanks_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void BtnDelete2_ServerClick(object sender, EventArgs e)
		{
			HtmlAnchor anc = sender as HtmlAnchor;
			GridViewRow gvrow = (GridViewRow)anc.Parent.Parent;
			Label lblid = (Label)gvrow.FindControl("lblid");
			if (lblid.Text != "")
			{
				bl.DeleteRanks(int.Parse(lblid.Text));
				LoadRanks();
				n.Notification("Saved scuccessfully",INotification.success);
			}

		}

		protected void BtnAdd_ServerClick(object sender, EventArgs e)
		{
			if (txtAddRank.Value != "")
			{
				bl.NewRanks(txtAddRank.Value);
				LoadRanks();
				txtAddRank.Value = "";
				n.Notification("Added successfully",INotification.success);

			}
		}
	}
}