using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.RequestDetails
{
	public partial class ImageAttachments : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		ImageGenerator img = new ImageGenerator();

		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadAttachements(string id)
		{
			LblImages.Text = img.GenerateImages(bl.DisplayImages(id));
		}
	}
}