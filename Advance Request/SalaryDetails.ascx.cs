using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.IO;
using System.Data;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;
namespace AdvanceSystem.Advance_Request
{
    public partial class SalaryDetails : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
		Notifications n = new Notifications();
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
				loadStationCodes();

		}
		public void PassPage(Page o)
		{
			if (o is AdvanceRequest)
				page = o as AdvanceRequest;
		}
		void loadStationCodes()
		{
			bl.loadStationCodes(DropDownStation);
			//using (DataTable dt=bl.loadStationCodes(1))
			//{
			//	foreach (DataRow row in dt.Rows)
			//	{
			//		DropDownStation.Items.Add(new ListItem(row["Station"].ToString(), row["Code1"].ToString()));
			//	}
			//}
		}
        public int Validated()
        {
            if (TxtAppointment.Value == "" || DropDownStation.Text=="" || Txtnit.Value == "" || TxtSalry.Text == "" || TxtSection.Text == "" || TxtTrade.Value == "")
                return 1;
            else
                return 0;
        }
		public string Code(string code1)
		{
			string code = "";
			using (DataTable dt = bl.loadStationCodes(1))
			{
				foreach (DataRow row in dt.Rows)
				{
					if (row["Code1"].ToString().ToUpper() == code1.ToUpper())
						code= row["Code2"].ToString();
					//DropDownStation.Items.Add(new ListItem(row["Station"].ToString(), row["Code1"].ToString()));//row["Equipment"].ToString(),);
				}
			}
			return code;
		}
		public string Station_Applied_From { get { return DropDownStation.SelectedValue; } }
		public void AutoFill(ListAdvanceDetails det)
		{
			TxtAppointment.Value = det.Appointment;
			Txtnit.Value = det.Unit;
			TxtSalry.Text = det.CurrentSalary;
			TxtSection.Text = det.Section;
			TxtTrade.Value = det.Trade;
			DropDownStation.Text = det.Station;
		}
		public ListAdvanceDetails NewSalaryDetails(ListAdvanceDetails det)
        {
           det.Appointment= TxtAppointment.Value;
            det.Unit=  Txtnit.Value;
            det.CurrentSalary = TxtSalry.Text;
            det.Section = TxtSection.Text;
            det.Trade = TxtTrade.Value;
			det.Station = DropDownStation.SelectedValue;
			//det.NetPay=

			return det;
            
        }
		public void ClearAll()
		{
			n.VALCLEAR(TxtAppointment);
			n.VALCLEAR(Txtnit);
			n.VALCLEAR(TxtSalry);
			n.VALCLEAR(TxtSection);
			n.VALCLEAR(TxtTrade);
			n.VALCLEAR(DropDownStation);
		}
       public void EmptyControls()
        {
            Notifications n = new Notifications();
            n.VALIDATE(TxtAppointment);
            n.VALIDATE(Txtnit);
            n.VALIDATE(TxtSalry);
            n.VALIDATE(TxtSection);
            n.VALIDATE(TxtTrade);
			n.VALIDATE(DropDownStation);
		}
		public string Salary()
		{
			return TxtSalry.Text;
		}
        protected void TxtSalry_TextChanged(object sender, EventArgs e)
        {
          Session["Salary"]= TxtSalry.Text;
		  ((AdvanceRequest)(page)).CalculateDuration();
        }

        protected void TxtSection_TextChanged(object sender, EventArgs e)
        {
            EmptyControls();
        }
    }
}