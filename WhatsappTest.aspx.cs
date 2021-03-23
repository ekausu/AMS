using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WhatsAppApi;

namespace AdvanceSystem
{
	public partial class WhatsappTest : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		void Mess(WhatsApp wa)
		{
		
		}
		protected void BtnSendMessage_Click(object sender, EventArgs e)
		{
			string status = "";
			string To = "0974510548";
			string message = "Hello";
			WhatsApp wa = new WhatsApp("0969469039","353114087748358/17","Engineer Eric",false,false);
			wa.OnConnectSuccess += () =>
			 {
				 //wa.OnLoginSuccess() += (phoneNumber, date) =>
				   //{
					 wa.SendMessage(To, message);
				 //  };
				 wa.Login();
			 };
			wa.Connect();
		}
	}
}