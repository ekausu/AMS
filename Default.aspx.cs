using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdvanceSystem.Wrapper;
using System.IO;
using System.Drawing;
using System.Diagnostics;

namespace AdvanceSystem
{
    public partial class Default : System.Web.UI.Page
    {
		BusinessLogic bl = new BusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				Session["Access"] = "Granted";
				RunUpdate();
			}
        }
		void RunUpdate()
		{
			try
			{
				int f = 0;
				using (DataTable dt = bl.GetUpdates())
				{
					if (dt.Rows.Count > 0)
						f++;
				}
				if (f > 0)
				{
					EmailTemplateCreator ec = new EmailTemplateCreator();
					ec.SendUpdateError();
				}
					
			}
			catch (Exception)
			{
				return;
			}
		}
    }
}