using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;


namespace AdvanceSystem
{
	public partial class UpdateUsers : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				bl.loadStationCodes(DropStation);
		}
		public void GetUserDetails(ListUsers user)
		{
			TxtEmail.Text = user.Email;
			TxtPosition.Value = user.Position;
			TxtOLdEmail.Text = user.Email;
			TxtSection.Text = user.Section;
			DropStation.Text = user.Station;
			DropDownRole.SelectedValue = user.Role.ToString();
			TxtUserName.Value = user.Name;

			TxtUser.Text = user.User;
			TxtPassword.Text = user.Password;
			
		}
		public bool UpdateUserDetails()
		{
			ListUsers user = new ListUsers();
			 user.Email= TxtEmail.Text;
			 user.Position= TxtPosition.Value;
			user.OldEmail= TxtOLdEmail.Text;
			 user.Section= TxtSection.Text;
			user.Station= DropStation.Text;
			user.Role= int.Parse(DropDownRole.SelectedValue);
			user.Name= TxtUserName.Value;

			user.User= TxtUser.Text;
			 user.Password= TxtPassword.Text;
			bl.UpdateUser(user);
			return true;
		}
	}
}