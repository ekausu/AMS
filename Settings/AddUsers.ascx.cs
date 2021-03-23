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
	public partial class AddUsers : System.Web.UI.UserControl
	{
		Notifications N = new Notifications();
		BusinessLogic bl = new BusinessLogic();
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;


		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				if (Session["UserName"] != null)
				{
					bl.loadStationCodes(DropStation);
				}
				else
					Response.Redirect("Default.aspx");
		}

		protected void BtnSave_ServerClick(object sender, EventArgs e)
		{
			if (TxtEmail.Text != "" && TxtPName.Text != "" && TxtPosition.Value != "" && TxtPwrd.Value != "" && TxtSection.Text != "" && DropStation.Text != "" && TxtUserName.Value != "" && DropDownRole.Text != "")
				Save();
			else
				N.Notification("Missing entry", INotification.warning);
		}
		void Save()
		{
			ListUsers u = new ListUsers();
			u.Email = TxtEmail.Text;
			u.Name = TxtPName.Text;
			u.Position = TxtPosition.Value;
			u.Password = TxtPwrd.Value;
			u.Section = TxtSection.Text;
			u.Station = DropStation.Text;
			u.User = TxtUserName.Value;
			u.Role = int.Parse(DropDownRole.SelectedValue.ToString());
			bl.NewUsers(u);
			Clear();
			N.Notification("Saved successfully", INotification.info);
		}
		void Clear()
		{
			TxtEmail.Text = "";
			TxtPName.Text = "";
			TxtPosition.Value = "";
			TxtPwrd.Value = "";
			TxtSection.Text = "";
			DropStation.Text = "";
			TxtUserName.Value = "";

		}

		protected void BtnOpenSave_ServerClick(object sender, EventArgs e)
		{
			ScriptManager.RegisterClientScriptBlock(page, typeof(Page), "alertScript", "location.href='#" + ModalSave.ClientID + "';", true);

		}
	}
}