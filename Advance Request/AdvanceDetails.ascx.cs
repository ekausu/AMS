using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Advance_Request
{
    public partial class AdvanceDetails : System.Web.UI.UserControl
    {
        System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
		Notifications n = new Notifications();
		BusinessLogic bl = new BusinessLogic();
		public void PassPage(Page o)
        {
            if (o is AdvanceRequest)
                page = o as AdvanceRequest;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
				LoadDuration();

		}
		void LoadDuration()
		{
			bl.SetMonths(DropDownDuration);
		}

        public int Validated()
        {
            if (TxtAdvance.Text == "" || TxtGeneralOrder.Text == "" || TxtNewNetPay.Value == "" || DropDownDuration.Text=="")
                return 1;
            else
                return 0;
        }

        public ListAdvanceDetails NewAdvanceDetails(ListAdvanceDetails det)
        {
            det.AdvanceAmount=  TxtAdvance.Text;
            det.RecoveryDuration = DropDownDuration.Text;
            det.Reason = TxtGeneralOrder.Text;
			det.Reason40 = TxtReason.Text;	
			return det;
        }
		public void ClearAll()
		{
			n.VALCLEAR(TxtAdvance);
			n.VALCLEAR(TxtGeneralOrder);
			n.VALCLEAR(DropDownDuration);
			n.VALCLEAR(TxtReason);
			n.VALCLEAR(TxtNewNetPay);
			Reason.Visible = false;
		}
		protected void TxtAdvance_TextChanged(object sender, EventArgs e)
        {
			DurationCal();
		}
       public void EmptyControls()
        {
           
            n.VALIDATE(TxtAdvance);
            n.VALIDATE(TxtGeneralOrder);
			n.VALIDATE(DropDownDuration);
			n.VALIDATE(TxtReason);
		}
        protected void DropDownDuration_SelectedIndexChanged(object sender, EventArgs e)
        {
			DurationCal(); 
			//EmptyControls();
			//if (DropDownDuration.Text!="")
			//{
			//    int ded = 0;
			//    int totalBef = 0;
			//    int totaldeduction = 0;
			//    int Sal = 0;
			//    if (Session["Deduction"] != null && Session["Salary"] != null)
			//    {
			//        ded = int.Parse(Session["Deduction"].ToString());
			//        Sal = int.Parse(Session["Salary"].ToString());
			//    }

			//    if(TxtAdvance.Text!="")
			//    {
			//        if (int.Parse(TxtAdvance.Text) >= 5000)
			//        {
			//            Session["Cheif"] = "true";
			//            Session["bool"] = true;
			//            ((AdvanceRequest)page).LoadUsers(2);
			//        }
			//        else
			//        {
			//            Session["Cheif"] = null;
			//            Session["bool"] = false;
			//            ((AdvanceRequest)page).LoadUsers(1);
			//        }

			//       totalBef = int.Parse(TxtAdvance.Text) / int.Parse(DropDownDuration.Text);
			//       totaldeduction = totalBef + ded;

			//        if((Sal*40/100)> totaldeduction)
			//        {
			//            TxtStatus.Value = "APPROVED";
			//            TxtStatus.Style.Add("background", "green");
			//            TxtStatus.Style.Add("color", "white");

			//            //Above.Visible = true;
			//            //Below.Visible = false;
			//            ((AdvanceRequest)(page)).HideControls(true);
			//        }
			//        else
			//        {
			//            TxtStatus.Value = "BELOW 40%";
			//            TxtStatus.Style.Add("background","red");
			//            TxtStatus.Style.Add("color", "white");
			//            //Above.Visible = false;
			//            //Below.Visible = true;
			//            ((AdvanceRequest)(page)).HideControls(false);
			//        }
			//        TxtNewNetPay.Value = (Sal - totaldeduction).ToString();
			//    }
			//}
		}
		public void DurationCal()
		{
			
			if (DropDownDuration.Text != "")
			{
				RequestData d = new RequestData();
				float ded = 0;
				float totalBef = 0;
				float totaldeduction = 0;
				float Sal = 0;
				d=((AdvanceRequest)page).DedSalary();
				if (d.Deductions != "" && d.Salary != "")
				{
					ded = float.Parse(d.Deductions);
					Sal = float.Parse(d.Salary);
				}

				if (TxtAdvance.Text != "")
				{
					float big = 0;
					if (float.Parse(TxtAdvance.Text) >= 5000)
					{
						txtCheif.Text = "true";
						txtBool.Text = "true";
						big = 2;
						//((AdvanceRequest)page).LoadUsers(2);
					}
					else
					{
						txtCheif.Text = "";
						txtBool.Text = "false";
						big = 1;
						//((AdvanceRequest)page).LoadUsers(1);
					}

					totalBef = float.Parse(TxtAdvance.Text) / float.Parse(DropDownDuration.Text);
					totaldeduction = totalBef + ded;

					if (totaldeduction<(Sal * 40 / 100))
					{
						TxtStatus.Value = "APPROVED";
						TxtStatus.Style.Add("background", "green");
						TxtStatus.Style.Add("color", "white");

						//Above.Visible = true;
						//Below.Visible = false;
						Reason.Visible = false;

						//TxtReason.Style.Add("border", "solid 1px black");
						if (big == 2)
						{
							txtCheif.Text = "true";
							txtBool.Text = "true";
							((AdvanceRequest)(page)).LoadCheif(2);
						}
						else
							((AdvanceRequest)(page)).LoadCheif(1);
                        ((AdvanceRequest)(page)).HideControls(true);
					}
					else
					{
						TxtStatus.Value = "BELOW 40%";
						TxtStatus.Style.Add("background", "red");
						TxtStatus.Style.Add("color", "white");
						txtCheif.Text = "true";
						txtBool.Text = "true";

						Reason.Visible = true;
						n.VALIDATE(TxtReason);
						//((AdvanceRequest)(page)).ReasonBox(true);
						//if(big==2)
							((AdvanceRequest)(page)).LoadCheif(2);
						//else
						//((AdvanceRequest)(page)).LoadCheif(1);

						((AdvanceRequest)(page)).HideControls(false);
					}
					TxtNewNetPay.Value = (Sal - totaldeduction).ToString();
				}
			}
		}
		public string Cheif()
		{
			return txtCheif.Text;
		}
		public void SETBOOL(string set)
		{
			 txtBool.Text=set;
		}
		public string BOOL()
		{
			return txtBool.Text;
		}
		protected void TxtDuration_TextChanged(object sender, EventArgs e)
		{
			
			
		}

		protected void TxtGeneralOrder_TextChanged(object sender, EventArgs e)
		{
			//EmptyControls();
			((AdvanceRequest)page).Message();
		}
	}
	
}