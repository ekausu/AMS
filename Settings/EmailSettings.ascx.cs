using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem.Settings
{
	public partial class EmailSettings : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadSettings();
		}
		void LoadSettings()
		{
			GridViewEmailSettings.DataSource = bl.GetEmailSettings();
			GridViewEmailSettings.DataBind();
		}
		void AddNewSMTPSettins()
		{
			SMTPDetails smtp = new SMTPDetails();
			smtp.Active = int.Parse(DropActive.SelectedValue);
			smtp.EmailAddress = txtEmailAddress.Text;
			smtp.SMTPClientHost = txtSMTPClientHost.Text;
			smtp.UserId = txtUserId.Text;
			smtp.UserPassword = txtUserPassword.Text;
			if (txtEmailAddress.Text != "" && txtSMTPClientHost.Text != "" && txtUserId.Text != "" && txtUserPassword.Text != "")
			{
				bl.NewEmailSettings(smtp);
				LoadSettings();
				n.Notification("Email Setup is complete",INotification.success);
			}
			else
				n.Notification("Missing Entries", INotification.warning);

		}
		protected void BtnSendEmail_ServerClick(object sender, EventArgs e)
		{

		}

		protected void GridViewEmailSettings_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				Label lblicon = e.Row.FindControl("lblicon") as Label;
				Label lblActive = e.Row.FindControl("lblActive") as Label;
				if (lblActive.Text == "0")
					lblicon.Text = "<a class='icon32 icon-red icon-bullet-on'></a>";
				else if(lblActive.Text == "1")
					lblicon.Text = "<a class='icon32 icon-green icon-bullet-on'></a>";
			}
		}

		protected void GridViewEmailSettings_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{

		}

		protected void GridViewEmailSettings_RowUpdated(object sender, GridViewUpdatedEventArgs e)
		{

		}

		protected void GridViewEmailSettings_DataBinding(object sender, EventArgs e)
		{
			
		}

		protected void BtnDelete2_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnAdd_ServerClick(object sender, EventArgs e)
		{
			AddNewSMTPSettins();
		}
	}
}