using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public partial class AdminSection : System.Web.UI.Page
    {
		Notifications N = new Notifications();
		BusinessLogic bl = new BusinessLogic();
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
		void Save()
		{
			ListUsers u = new ListUsers();
			u.Email=TxtEmail.Text;
			u.Name = TxtPName.Text;
			u.Position = TxtPosition.Value;
			u.Password = txtpassword.Text;
			u.Section = TxtSection.Text;
			u.Station = DropStation.Text;
			u.User = TxtUserName.Value;
			u.Role = int.Parse(DropDownRole.SelectedValue.ToString());
			bl.NewUsers(u);
			Clear();
			N.Notification("Saved successfully",INotification.info,this);
		}
		void Clear()
		{
			TxtEmail.Text = "";
			TxtPName.Text = "";
			TxtPosition.Value = "";
			txtpassword.Text = "";
			TxtSection.Text = "";
			DropStation.Text = "";
			TxtUserName.Value = "";
				
		}
		protected void BtnSave_ServerClick(object sender, EventArgs e)
		{


			if (TxtEmail.Text != "" && TxtPName.Text != "" && TxtPosition.Value != "" && txtpassword.Text != "" && TxtSection.Text != "" && DropStation.Text != "" && TxtUserName.Value != "" && DropDownRole.Text != "")
				if (txtpassword.Text.Length >= 8)
				{
					Save();
				}
				else
				{
					N.Notification("Password strenth requires atleast 8 characters", INotification.warning);
				}
			else
				N.Notification("Missing entry", INotification.warning, this);
			
		
		}
	}
}