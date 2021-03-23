using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvanceSystem.Design_Cotrols
{
    public partial class TopBar : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
				if (Session["Role"] != null && Session["UserName"] != null)
				{
					
					UserType();
					//lblUserRole.Text = Session["Role"].ToString();
				}

		}
		void UserType()
		{
			lblUser.Text = Session["UserName"].ToString();
			string typ = "";
			if (Session["Role"].ToString() == "0")
				typ = "Administrator";
			if (Session["Role"].ToString() == "1")
				typ = "First Approver";
			if (Session["Role"].ToString() == "2")
				typ = "Second Approver";
			if (Session["Role"].ToString() == "3")
				typ = "Cashier";
			lblUserRole.Text = typ;
		}
		protected void ChangePassword_ServerClick(object sender, EventArgs e)
		{
			if (Session["Role"] != null && Session["UserName"] != null)
				Response.Redirect("ChangePassword.aspx");
			else
			{
				lblUser.Text = "Login in First";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalLogin';", true);
			}
		}

		protected void Logout_ServerClick(object sender, EventArgs e)
		{
			Session["UserName"] = null;
			Session["Role"] = null;
			Response.Redirect("Default.aspx");
		}
	}
}