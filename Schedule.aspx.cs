using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public partial class Schedule : System.Web.UI.Page
    {
        CalendarTables cal = new CalendarTables();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
				//RenderCalander(cal.CashClearance(TxtEmployeeNumber.Text));
				RenderCalander(cal.SystemEvents(TxtEmployeeNumber.Text));
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModaleEmployeeNumber';", true);
               // BtnPlan_ServerClick(sender,e);
                //  RenderCalander(cal.AdvanceClearance(TxtEmployeeNumber.Text));
            }
            //  RenderCalander(EnteredDate());
        }
        //string PaymentHistory(DataTable dt)
        //{
        //    int scheduleRows = dt.Rows.Count;
        //    if (scheduleRows > 0)
        //    {
        //        StringBuilder sb = new StringBuilder();
        //        foreach (DataRow row in dt.Rows)
        //        {
        //            sb.Append("{title:'" + row["Date"].ToString().Replace("'", "") + "',");
        //            sb.Append("id: '");
        //            sb.Append(row["id"].ToString());
        //            sb.Append("',");
        //            sb.Append("url:'#ModalAdmission',");
        //            sb.Append("start:'");
        //            sb.Append(row["Date"].ToString() + "',");
        //            sb.Append("end:'");
        //            sb.Append(row["Date"].ToString() + "',");
        //            sb.Append("constraint:'availableForMeeting',");
        //            sb.Append("color:'#b200ff'}");
        //            scheduleRows--;
        //            if (scheduleRows < 1)
        //            {
        //                sb.Append("");
        //            }
        //            else
        //            {
        //                sb.Append(",");
        //            }
        //        }
        //        return sb.ToString();
        //    }
        //    return "";
        //}
        void RenderCalander(string query)
        {
            //  string query = "";

            try
            {
                //  query = EnteredDate();
                //if (query!="")
                //{
                    StringBuilder strScript = new StringBuilder();
                    strScript.Append("<script type=\"text/javascript\">");
                    strScript.Append("function Load(){$('#calendars').fullCalendar({");
                    strScript.Append("theme: false,header:{");
                    strScript.Append("left:'prev,next today',");
                    strScript.Append("center:'title',right:'month,agendaDay,agendaWeek,listDay,listWeek,listMonth,listYear'},");//listDay,listWeek,month

                    strScript.Append("views:{  listDay: { buttonText: 'list day' },listWeek: { buttonText: 'list week' },listMonth: { buttonText: 'list Month' },listYear: { buttonText: 'list Year' }},defaultView: 'listYear',defaultDate:'" + DateTime.Now.ToString("yyyy/MM/dd") + "',");
                    strScript.Append("navLinks:true,editable: true,editable:true,");
                    strScript.Append("eventLimit: true,events: [");
                    strScript.Append(query);
                    strScript.Append("]});};");
                    strScript.Append("</script>");
                    ClientScriptManager script = this.Page.ClientScript;

                    if (!script.IsClientScriptBlockRegistered(this.GetType(), "Var"))
                    {
                        script.RegisterClientScriptBlock(this.GetType(), "Var", strScript.ToString());
                    }
                    ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:Load(); ", true);
                //}
            }
            catch (Exception ex)
            {
                return;
            }
        }
        string EnteredDate()
        {
            BusinessLogic bl = new BusinessLogic();
            StringBuilder sb = new StringBuilder();
            // dt = bl.SheduleList(thk, useuserMine);
            using (DataTable dt = bl.LoadEmployeeDet(true, TxtEmployeeNumber.Text, 2))
            {
                //if (dt.Rows.Count > 0)
                //{
                    int schcount = dt.Rows.Count;

                    foreach (DataRow row in dt.Rows)
                    {
                        
                        //if (row["Entered Date"].ToString() != "")
                        //{
                            sb.Append("{title:'" + row["First Name"].ToString().Replace("'", "") + " " + row["Last Name"].ToString().Replace("'", "") + "/" + row["Rank"].ToString() + "',");
                            sb.Append("id: '");
                            sb.Append(row["Employee Number"].ToString());
                            sb.Append("',");
                            // sb.Append("url:'#ModalAdmission',");
                            sb.Append("start:'");
                            sb.Append(row["Entered Date"].ToString());
                            sb.Append("',end:'" + row["Entered Date"].ToString() + "'");
                            sb.Append(",constraint:'availableForMeeting',");
                            sb.Append("color:'#ff6a00'}");//#257e4a #5a53b0   #b200ff   #6caee0   #ff6a00    #ff0000 
                            schcount--;
                            if (schcount <= 0)
                                sb.Append("");
                            else
                                sb.Append(",");
                        //}
                        //else
                        //{
                        //    sb.Append("");
                        //}

                //    }
                }
            }
            return sb.ToString();
        }

        protected void BtnLoadPayments_ServerClick(object sender, EventArgs e)
        {
            //RenderCalander();
            RenderCalander(cal.CashClearance(TxtEmployeeNumber.Text));
        }

        protected void BtnSystemDeductions_ServerClick(object sender, EventArgs e)
        {
            // RenderCalander();
            RenderCalander(cal.SystemEvents(TxtEmployeeNumber.Text));
        }

        protected void BtnApprovers_ServerClick(object sender, EventArgs e)
        {
            RenderCalander(cal.Approvers(TxtEmployeeNumber.Text));
        }

        protected void BtnSearch_ServerClick(object sender, EventArgs e)
        {
			// RenderCalander(EnteredDate());
			RenderCalander(cal.CashClearance(TxtEmployeeNumber.Text));
			// RenderCalander(cal.(TxtEmployeeNumber.Text));
		}

        protected void BtnPlan_ServerClick(object sender, EventArgs e)
        {
            RenderCalander(cal.AdvanceClearance(TxtEmployeeNumber.Text));
        }
    }
}