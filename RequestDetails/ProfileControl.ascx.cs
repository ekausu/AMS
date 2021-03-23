using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvanceSystem.RequestDetails
{
	public partial class ProfileControl : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
				LoadControls();
		}
		void LoadControls()
		{
			//OutstandingAdvance os = new OutstandingAdvance();
			OutstandingAdvance.LoadGrid("13434", null);
			//	History hs = new History();
			History.LoadGrid("13434", null);
		}
	}
}