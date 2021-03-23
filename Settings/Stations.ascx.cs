using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Settings
{
	public partial class Stations : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadStations();
		}
		void LoadStations()
		{
			GridViewStations.DataSource = bl.loadStationCodes(1);
			GridViewStations.DataBind();
		}
		protected void GridViewStations_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void GridViewStations_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}

		protected void GridViewStations_RowUpdated(object sender, GridViewUpdatedEventArgs e)
		{

		}

		protected void GridViewStations_RowCommand(object sender, GridViewCommandEventArgs e)
		{

		}

		protected void GridViewStations_RowEditing(object sender, GridViewEditEventArgs e)
		{

		}

		protected void BtnDelete2_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnAdd_ServerClick(object sender, EventArgs e)
		{
			if (txtCode.Text != "" && txtDesc.Text != "" && txtStation.Text != "")
			{
				ListStations st = new ListStations();
				st.Code = txtCode.Text;
				st.Description = txtDesc.Text;
				st.Station = txtStation.Text;
				bl.NewStation(st);
				n.Notification("Added Successfully", INotification.success);
				LoadStations();
			}
		}
	}
}