using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;
using AdvanceSystem;

namespace AdvanceSystem
{
    public partial class Advance_Cash_Clear : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();

      static  List<int> LReqid = new List<int>();
      static  List<float> LAmount = new List<float>();
       static List<float> LBalance = new List<float>();
		Notifications n = new Notifications();
		
        bool locked =false;
       static string sal = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                advanceTable();
        }
        void advanceTable()
        {
			TxtTotal.Text = "0";

			GridViewAdvanceDetails.DataSource = bl.LoadEmployeeDet(true, "0", 0);
            GridViewAdvanceDetails.DataBind();
        }
        protected void BtnSave2_ServerClick(object sender, EventArgs e)
        {
            SaveClearance();
        }

        protected void TxtENumber_TextChanged(object sender, EventArgs e)
        {
			DataTable dt = new DataTable();
			dt=bl.LoadEmployeeDet(true, TxtENumber.Text, 1);
			if (dt.Rows.Count > 0)
			{
				TxtAmount.Enabled = true;
				TxtAmount.Focus();
			}

		}
		void GenerateGrid()
		{
			GridViewAdvanceDetails.DataSource = bl.LoadEmployeeDet(true, TxtENumber.Text, 1);
			GridViewAdvanceDetails.DataBind();
			//if (GridViewAdvanceDetails.Rows.Count > 0)
			//{
			//	TxtAmount.Enabled = true;
			//	TxtAmount.Focus();
			//}
		}
        protected void TxtAmount_TextChanged(object sender, EventArgs e)
        {
			Clear();
			GenerateGrid();

			if (TxtAmount.Text!="" && TxtTotalBalance.Text!="")
            {
                if (float.Parse(TxtAmount.Text) > (float.Parse(TxtTotalBalance.Text)))
                {
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalWarning';", true);
                    BtnSave2.Visible = false;
                }
                else
                {
                    TxtTotalPaid.Text = TxtAmount.Text;
                    BtnSave2.Visible = true;
                    TxtBalanceAfterPayment.Text = (float.Parse(TxtTotalBalance.Text) - float.Parse(TxtAmount.Text)).ToString();
                    //ReloadGrid();
                }
            }
        }
        void ReloadGrid()
        {
            if(GridViewAdvanceDetails.Rows.Count>0)
            foreach(GridViewRow Row in GridViewAdvanceDetails.Rows)
            {
                    //-----------------GET ROW CONTROLS-----------------
                    Label lblStart = Row.FindControl("lblStart") as Label;
                    Label status = Row.FindControl("lblStatus") as Label;
                    Label lblShowState = Row.FindControl("lblShowState") as Label;
                    Label lblEndDate = Row.FindControl("lblEndDate") as Label;
                    Label lblSalary = Row.FindControl("lblSalary") as Label;
                    Label lblAdvanceAm = Row.FindControl("lblAdvanceAm") as Label;
                    Label lblDur = Row.FindControl("lblDur") as Label;
                    Label lblPaymentPlan = Row.FindControl("lblPaymentPlan") as Label;
                    Label lblSalaryAfter = Row.FindControl("lblSalaryAfter") as Label;
                    Label lblReqid = Row.FindControl("lblReqid") as Label;
                    Label lblBalance = Row.FindControl("lblBalance") as Label;

                    //////////////////////////////////////
                    //lblPaymentPlan.Text = (float.Parse(lblAdvanceAm.Text) / int.Parse(lblDur.Text)).ToString();
                    //lblSalaryAfter.Text = (float.Parse(lblSalary.Text) - float.Parse(lblPaymentPlan.Text)).ToString();

                    //TxtSalary.Text = lblSalary.Text;
                    //TxtTotal.Text = (float.Parse(TxtTotal.Text) + float.Parse(lblPaymentPlan.Text)).ToString();
                    // Session["Deduction"] = TxtTotal.Text;
                    //-----------------------CALCULATE NEW BALANCE---------------
                    //DateTime EndDate = new DateTime();
                    //EndDate = Convert.ToDateTime(lblEndDate.Text);
                    //int diff = EndDate.Month - DateTime.Now.Month;
                    //lblBalance.Text = (diff * float.Parse(lblPaymentPlan.Text)).ToString();

                    // GenrateDeductions(float.Parse(lblBalance.Text), int.Parse(lblReqid.Text));
                    //LblBalanceRem.Text = TxtTotalBalance.Text = (float.Parse(TxtTotalBalance.Text) + float.Parse(lblBalance.Text)).ToString();
                    int Balance = 0;
                    int PaidAmount = 0;
                   

                    if (lblDur.Text != "" && lblStart .Text!= "" && lblAdvanceAm.Text != "")
                    {
                        if (TxtAmount.Text != "")
                            PaidAmount = int.Parse(TxtAmount.Text);
                        if (lblBalance.Text == "")
                            Balance = int.Parse(lblAdvanceAm.Text);
                        else
                            Balance = (int)Math.Round(float.Parse(lblBalance.Text));
                        //Dur = int.Parse(lblDur.Text);

                        //start = Convert.ToDateTime(lblStart.Text);
                        //AdvanceAmount = int.Parse(lblAdvanceAm.Text);
                        //deductions = AdvanceAmount / Dur;

                        //int NewDur = MonthDifference(start, DateTime.Now);
                        GenrateDeductions(Balance, int.Parse(lblReqid.Text));
                    }
                }
            TxtBalanceAfterPayment.Text = TxtTotalPaid.Text;
        }
        public static int MonthDifference(DateTime lValue, DateTime rValue)
        {
            return Math.Abs((lValue.Month - rValue.Month) + 12 * (lValue.Year - rValue.Year));
        }

        protected void GridViewAdvanceDetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
			//try
			//{
			TxtTotalPaid.Text = TxtAmount.Text;
			if (e.Row.RowType == DataControlRowType.DataRow)
                {
                //-----------------GET ROW CONTROLS-----------------
                    Label status = e.Row.FindControl("lblStatus") as Label;
                    Label lblShowState = e.Row.FindControl("lblShowState") as Label;
                    Label lblStart = e.Row.FindControl("lblStart") as Label;
                    Label lblSalary = e.Row.FindControl("lblSalary") as Label;
                    Label lblAdvanceAm = e.Row.FindControl("lblAdvanceAm") as Label;
                    Label lblDur = e.Row.FindControl("lblDur") as Label;
                    Label lblPaymentPlan = e.Row.FindControl("lblPaymentPlan") as Label;
                    Label lblSalaryAfter = e.Row.FindControl("lblSalaryAfter") as Label;
                    Label lblReqid = e.Row.FindControl("lblReqid") as Label; 
                    Label lblBalance = e.Row.FindControl("lblBalance") as Label;
                ////---------------------ADD ADVANCE AMNTS AND REQID ID TO LIS-------
                //LReqid.Add(int.Parse(lblReqid.Text));
                //LAmount.Add(int.Parse(lblAdvanceAm.Text));
                ////-----------------CALCULATE DEDUCTIONS-----------------

                lblPaymentPlan.Text = (float.Parse(lblAdvanceAm.Text) / int.Parse(lblDur.Text)).ToString();
                 lblSalaryAfter.Text = (float.Parse(lblSalary.Text) - float.Parse(lblPaymentPlan.Text)).ToString();

                   TxtSalary.Text = lblSalary.Text;
                    TxtTotal.Text = (float.Parse(TxtTotal.Text) + float.Parse(lblPaymentPlan.Text)).ToString();
                    Session["Deduction"] = TxtTotal.Text;
                   //-----------------------CALCULATE NEW BALANCE---------------
                //DateTime EndDate = new DateTime();
                //EndDate = Convert.ToDateTime(lblEndDate.Text);
                //int diff = EndDate.Month- DateTime.Now.Month;
                //lblBalance.Text = (diff * float.Parse(lblPaymentPlan.Text)).ToString();
                GenrateDeductions(float.Parse(lblBalance.Text),int.Parse(lblReqid.Text));
                LblBalanceRem.Text= TxtTotalBalance.Text = (float.Parse(TxtTotalBalance.Text) + float.Parse(lblBalance.Text)).ToString();
                //--------------------
                if (lblBalance.Text != "")
                {
                    if (int.Parse(lblBalance.Text) > 0)
                        lblShowState.Text = "<i class='icon32 icon-red icon-bullet-on'></i><span class='label label-important'>Incomplete</span>";
                }
                else
                    lblShowState.Text = "<i class='icon32 icon-green icon-bullet-on'></i>Completed";

                    //if (!locked)
                    //{
                    //   sal =lblSalary.Text;
                    //   locked = true;
                    //}

                    
                  

                }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label deduction = (Label)(e.Row.FindControl("lblPaymentPlan"));
                Label SalaryAfter = (Label)(e.Row.FindControl("lblSalaryAfter"));
                Label lblBalance = (Label)(e.Row.FindControl("lblBalance"));

                deduction.Text = TxtTotal.Text;
                lblBalance.Text = TxtTotalBalance.Text;
                SalaryAfter.Text = (float.Parse(TxtSalary.Text)- float.Parse(TxtTotal.Text)).ToString();
                
            }
            //}
            //catch (Exception)
            //{
            //    return;
            //}

        }
        void GenrateDeductions(float totalRem,int Reqid)
        {
            if(float.Parse(TxtTotalPaid.Text)>0)
            {
                float Total = float.Parse(TxtTotalPaid.Text);
                float bal;
               
                if (Total < totalRem)
                {
                    LAmount.Add(Total);
                    LReqid.Add(Reqid);
                    bal = totalRem - Total;
                    LBalance.Add(bal);
                    TxtTotalPaid.Text = (float.Parse(TxtTotalPaid.Text) - Total).ToString();
                }
                if (Total > totalRem)
                {
                    LAmount.Add(totalRem);
                    LReqid.Add(Reqid);
                    LBalance.Add(0);
                    TxtTotalPaid.Text = (float.Parse(TxtTotalPaid.Text) - totalRem).ToString();
                }
       //         TxtBalanceAfterPayment.Text = TxtTotalPaid.Text;// (int.Parse(LblBalanceRem.Text) - (Total + totalRem)).ToString();
            }
        }
		void ClearAll()
		{
			TxtAmount.Text = "0";
			TxtDate.Text = "";
			TxtEnteredby.Text = "";
			TxtENumber.Text = "";
			TxtFName.Text = "";
			TxtLName.Text = "";
			TxtPaidBy.Text = "";
			TxtSalary.Text = "0";
			TxtSection.Text = "";
			TxtTotal.Text = "0";
			TxtTotalBalance.Text = "0";
			TxtTotalPaid.Text = "0";
			TxtUnit.Text = "";
			advanceTable();
		}
		void Clear()
		{
			TxtSalary.Text = "0";
			TxtTotal.Text = "0";
			TxtTotalBalance.Text = "0";
			TxtTotalPaid.Text = "0";
		}
		
		public void SaveClearance()
        {
            ListAdvanceClear c = new ListAdvanceClear();
            if(LAmount.Count>0 && LReqid.Count>0 && LBalance.Count>0)
            {
                c.TotalAmount=int.Parse(TxtAmount.Text);
                c.Date=TxtDate.Text;
                c.EmployeeNumber=TxtENumber.Text;
                c.Enteredby=TxtEnteredby.Text;
				c.NewBalance = TxtBalanceAfterPayment.Text;
				c.PaidBy = TxtPaidBy.Text;
				using (DataTable dt = bl.NewAdvanceId(c))
                {
                    if(dt.Rows.Count==1)
                    foreach (DataRow row in dt.Rows)
                        c.id = int.Parse(row["id"].ToString());

                    for (int i = 0; i < LAmount.Count; i++)
                    {
                        c.Reqid = LReqid[i].ToString();
                        c.Amount =(int)Math.Round(LAmount[i]);
                        c.Balance = LBalance[i];
                        bl.NewCashAdvanceClearance(c);
                    }
                }
				PDF_Filler pdf = new PDF_Filler();
				pdf.CreateCashReceipt(c);
				string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", "cash receipt"+c.Reqid+".pdf"));
				ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);

				n.Notification("Saved Successfully",INotification.success,this);
				ClearAll();
			   // Response.Redirect("Advance Cash Clear.aspx");

			}
			else
				n.Notification("Save failed", INotification.warning, this);
		}
    }
}