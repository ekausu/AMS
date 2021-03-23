using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem
{
	public partial class ChangePassword : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
		{
				if (!IsPostBack)
					if (Session["UserName"] != null)
					{
						ListUsers u = bl.GetLoggedInUser(Session["UserName"].ToString());
						UpdateEmail.GetUserDetails(u);
						UpdatePassword.GetUserDetails(u);
					}
					else
						Response.Redirect("Default.aspx");
		}
	
		protected void BtnSave_ServerClick(object sender, EventArgs e)
		{
	
	
		}

		protected void BtnPassword_ServerClick(object sender, EventArgs e)
		{
			if (UpdatePassword.UpdateUserDetails())
			{
				n.Notification("Password has been changed", INotification.success, this);
				ListUsers u = bl.GetLoggedInUser(Session["UserName"].ToString());
				UpdateEmail.GetUserDetails(u);
				UpdatePassword.GetUserDetails(u);
			}
			else
				n.Notification("Save failed", INotification.warning, this);
			}

		protected void BtnEmail_ServerClick(object sender, EventArgs e)
		{
			if (UpdateEmail.UpdateUserDetails())
			{
				n.Notification("Email has been changed", INotification.success, this);
				ListUsers u = bl.GetLoggedInUser(Session["UserName"].ToString());
				UpdateEmail.GetUserDetails(u);
				UpdatePassword.GetUserDetails(u);

			}
			else
				n.Notification("Save failed", INotification.warning, this);

			//Response.Redirect("ChangePassword.aspx");
			//txtButtonClicked.Text = "EMAIL";
			//ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalSave';", true);
		}
	}
}