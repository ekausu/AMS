using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class UpdateEmail : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public bool UpdateUserDetails()
		{
			if (TxtNewEmail.Value != "" && TxtEmail.Text!="")
			{
				ListUsers user = new ListUsers();
				user.Email = TxtNewEmail.Value;
				user.Position = TxtPosition.Value;
				user.OldEmail = TxtOLdEmail.Text;
				user.Section = TxtSection.Text;
				user.Station = TxtStation.Text;
				user.Role = int.Parse(txtRole.Text);
				user.Name = TxtUserName.Value;

				user.User = TxtUser.Text;
				user.Password = TxtPassword.Text;

				bl.UpdateUser(user);
				Clear();

				return true;
			}
			else
			{
				return false;
			}
		}
		void Clear()
		{
			TxtEmail.Text = "";
			TxtNewEmail.Value = "";
			lblcheck.Text = "";
		}
		public void GetUserDetails(ListUsers user)
		{
			TxtEmail.Text = user.Email;
			TxtPosition.Value = user.Position;
			TxtOLdEmail.Text = user.Email;
			TxtSection.Text = user.Section;
			TxtStation.Text = user.Station;
			txtRole.Text = user.Role.ToString();
			TxtUserName.Value = user.Name;

			TxtUser.Text = user.User;
			TxtPassword.Text = user.Password;
		}
	}
}