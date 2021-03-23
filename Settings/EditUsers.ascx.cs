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
	public partial class EditUsers : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		//System.Web.UI.UserControl pages = System.Web.HttpContext.Current.Handler as System.Web.UI.UserControl;
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadReasignList(0);
		}

		protected void GridViewUsers_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				Label r = e.Row.FindControl("Role") as Label;
				Label role = e.Row.FindControl("lblRole") as Label;
				if (r.Text == "4")
					role.Text = "<i class='icon32 icon-darkgray icon-key'></i><span class='label label-success' style='background:black'>Cashier</span>";

				if (r.Text == "3")
					role.Text = "<i class='icon32 icon-green icon-key'></i><span class='label label-success'>Voucher Handler</span>";
				if (r.Text == "2")
					role.Text = "<i class='icon32 icon-orange icon-key'></i><span class='label label-warning'>Second Approver</span>";
				if (r.Text == "1")
					role.Text = "<i class='icon32 icon-black icon-key'></i><span class='label'>First Approver</span>";
				if (r.Text == "0")
					role.Text = "<i class='icon32 icon-red icon-key'></i><span class='label label-important'>Administrator</span>";
			}
		}

		protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			Label User = (Label)GridViewUsers.Rows[e.RowIndex].FindControl("User");

			User.Text = "";
		}

		protected void GridViewUsers_RowUpdated(object sender, GridViewUpdatedEventArgs e)
		{

		}

		protected void GridViewUsers_RowCommand(object sender, GridViewCommandEventArgs e)
		{

		}

		protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
		{

		}
		ListUsers GenerateId(object sender)
		{
			ListUsers u = new ListUsers();
			System.Web.UI.HtmlControls.HtmlAnchor txt = (System.Web.UI.HtmlControls.HtmlAnchor)sender;
			GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
			Label Email = (Label)gvrow.FindControl("Email");
			Label User = gvrow.FindControl("User") as Label;

			Label Name = (Label)gvrow.FindControl("Name");
			Label Role = gvrow.FindControl("Role") as Label;
			Label Section = (Label)gvrow.FindControl("Section");
			Label Station = gvrow.FindControl("Station") as Label;
			Label Position = gvrow.FindControl("Position") as Label;
			Label Password = gvrow.FindControl("Password") as Label;


			u.Email = Email.Text;
			u.Name = Name.Text;
			u.Password = Password.Text;
			u.Position = Position.Text;
			if (Role.Text != "")
				u.Role = int.Parse(Role.Text);
			u.Section = Section.Text;
			u.Station = Station.Text;
			u.User = User.Text;


			email.Text = Email.Text;
			user.Text = User.Text;
			return u;
		}
		protected void BtnUpdate_ServerClick1(object sender, EventArgs e)
		{
			if (UpdateUsers.UpdateUserDetails())
			{
				n.Notification("user has been updated successfully", INotification.success);
				LoadReasignList(0);
			}
			else
			{
				n.Notification("Save failed", INotification.warning);
				ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalUpdateUsers.ClientID + "';", true);

				//ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUpdateUsers';", true);
			}

		}
		protected void BtnSave_ServerClick(object sender, EventArgs e)
		{
			if (txtClickedOption.Text == "DELETE")
			{
				bl.DeletUser(user.Text, email.Text);
			}
			if (txtClickedOption.Text == "UPDATE")
			{
				bl.DeletUser(user.Text, email.Text);
			}
			LoadReasignList(0);
		}
		protected void BtnUpdate_ServerClick(object sender, EventArgs e)
		{
			UpdateUsers.GetUserDetails(GenerateId(sender));
			ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalUpdateUsers.ClientID + "';", true);
			((ApplicationSettings)page).SetTab();
			//if (UpdateUsers.UpdateUserDetails())
			//{
			//	n.Notification("user has been updated successfully", INotification.success);
			//	LoadReasignList(0);
			//}
			//else
			//{
			//	n.Notification("Save failed", INotification.warning);
			//	ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUpdateUsers';", true);
			//}
		}

		protected void BtnChangePassword_ServerClick(object sender, EventArgs e)
		{
			if (UpdatePassword.UpdateUserDetails())
			{

				n.Notification("Password has been changed successfully", INotification.success);
				LoadReasignList(0);
			}
			else
			{
				n.Notification("Save failed", INotification.warning);
				ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalUpdatePassword.ClientID + "';", true);

				//ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#ModalUpdatePassword';", true);
			}
		}

		protected void BtnPassword_ServerClick(object sender, EventArgs e)
		{
			UpdatePassword.GetUserDetails(GenerateId(sender));
			ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalUpdatePassword.ClientID + "';", true);

		//	ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalUpdatePassword';", true);

		}
		void LoadReasignList(int role)
		{
			DataTable dt = new DataTable();

			GridViewUsers.DataSource = dt = bl.DisplayUsers(role, "");
			GridViewUsers.DataBind();
			//ExportToExcel(dt,IDelete.Delete);


		}

		protected void BtnDelete2_ServerClick(object sender, EventArgs e)
		{
			GenerateId(sender);
			txtClickedOption.Text = "DELETE";
			lblmessage.Text = "Are you sure you want to delete this user?";
			ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalSave.ClientID + "';", true);

			//ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalSave';", true);

		}

		protected void A2_ServerClick(object sender, EventArgs e)
		{

		}
	}
}