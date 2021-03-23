using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Wrapper
{
    public class CalendarTables
    {
        BusinessLogic bl = new BusinessLogic();
        public string Approvers(string EmployeeNumber)
        {

            using (DataTable dt = bl.LoadCalendar(1, EmployeeNumber))
            {
                int scheduleRows = dt.Rows.Count;
                if (dt.Rows.Count > 0)
                {
                    StringBuilder sb = new StringBuilder();
					string status = "";
					foreach (DataRow row in dt.Rows)
					{
						status = row["Approved"].ToString();

						sb.Append("{title:'" + status + "',");
						sb.Append("id: '");
						sb.Append(row["Reqid"].ToString());
						sb.Append("',");
						sb.Append("url:'#ModalAdmission',");
						sb.Append("start:'");
						sb.Append(row["Date"].ToString() + "',");
						sb.Append("end:'");
						sb.Append(row["Date"].ToString() + "',");
						sb.Append("constraint:'availableForMeeting',");

						if (status.ToUpper() == "APPROVED")
							sb.Append("color:'#18ad40'}");
						if (status.ToUpper() == "REJECTED")
							sb.Append("color:'#ff2f00'}");
						if (status.ToUpper() == "REASSIGNED")
							sb.Append("color:'#000dff'}");
						if (status.ToUpper() == "")
							sb.Append("color:'#0c0c0d'}");
						else if (status.ToUpper() == "CANCELLED")
							sb.Append("color:'#b200ff'}");

						scheduleRows--;
                        if (scheduleRows < 1)
                        {
                            sb.Append("");
                        }
                        else
                        {
                            sb.Append(",");
                        }
                    }
                    return sb.ToString();
                }
                return "";
            }
        }
            //************************SYSTEM EVENTS****************************************
            public string SystemEvents(string EmployeeNumber)
            {

                using (DataTable dt = bl.LoadCalendar(2, EmployeeNumber))
                {
                    int scheduleRows = dt.Rows.Count;
                    if (dt.Rows.Count > 0)
                    {
                        StringBuilder sb = new StringBuilder();
                        foreach (DataRow row in dt.Rows)
                        {
                            sb.Append("{title:'Deducted: " + row["Amount"].ToString() + "',");
                            sb.Append("id: '");
                            sb.Append(row["Reqid"].ToString());
                            sb.Append("',");
                            sb.Append("url:'#ModalAdmission',");
                            sb.Append("start:'");
                            sb.Append(row["Date"].ToString() + "',");
                            sb.Append("end:'");
                            sb.Append(row["Date"].ToString() + "',");
                            sb.Append("constraint:'availableForMeeting',");
                            sb.Append("color:'#b200ff'}");
                            scheduleRows--;
                            if (scheduleRows < 1)
                            {
                                sb.Append("");
                            }
                            else
                            {
                                sb.Append(",");
                            }
                        }
                        return sb.ToString();
                    }
                    return "";
                }

            }
        //**************CASH CLEARANCE
        public string CashClearance(string EmployeeNumber)
        {

            using (DataTable dt = bl.LoadCalendar(3, EmployeeNumber))
            {
                int scheduleRows = dt.Rows.Count;
                if (dt.Rows.Count > 0)
                {
                    StringBuilder sb = new StringBuilder();
                    foreach (DataRow row in dt.Rows)
                    {
                        sb.Append("{title:'Paid back: " + row["TotalAmount"].ToString() + "',");
                        sb.Append("id: '");
                        sb.Append(row["id"].ToString());
                        sb.Append("',");
                        sb.Append("url:'#ModalAdmission',");
                        sb.Append("start:'");
                        sb.Append(row["Date"].ToString() + "',");
                        sb.Append("end:'");
                        sb.Append(row["Date"].ToString() + "',");
                        sb.Append("constraint:'availableForMeeting',");
                        sb.Append("color:'#18ad40'}");
                        scheduleRows--;
                        if (scheduleRows < 1)
                        {
                            sb.Append("");
                        }
                        else
                        {
                            sb.Append(",");
                        }
                    }
                    return sb.ToString();
                }
                return "";
            }
        }
        //**************ADVANCE REQUEST CLEARANCE
        string GetMonths(StringBuilder sb,string title,string date,string id,bool end)
        {
            sb.Append("{title:'" + title+ "',");
            sb.Append("id: '");
            sb.Append(id);
            sb.Append("',");
            sb.Append("url:'#ModalAdmission',");
            sb.Append("start:'");
            sb.Append(date + "',");
            sb.Append("end:'");
            sb.Append(date + "',");
            sb.Append("constraint:'availableForMeeting',");
            sb.Append("color:'#b200ff'}");
            if (end)
            {
                sb.Append("");
            }
            else
            {
                sb.Append(",");
            }
            return sb.ToString();
        }
        public string AdvanceClearance(string EmployeeNumber)
        {

            using (DataTable dt = bl.LoadCalendar(4, EmployeeNumber))
            {
                DateTime start = new DateTime();
                StringBuilder sb = new StringBuilder();
                string startdate = "";
                string Dur = "";
                string Adv = "";

                if (dt.Rows.Count > 0)
                    foreach (DataRow row in dt.Rows)
                    {
                         startdate = row["Start Date"].ToString();
                         Dur = row["Recovery Duration"].ToString();
                         Adv = row["Advance Amount"].ToString();
                    }
                        if (startdate!="" && Dur !="" && Adv!="")
                        {
                            start = Convert.ToDateTime(startdate);
                            bool end = false;
                            float Deduction= int.Parse(Adv) / int.Parse(Dur);
                            int x = int.Parse(Dur);
                            for(int i=0;i<int.Parse(Dur);i++)
                            {
                                if (x<1)
                                    end = true;

                                sb.Append(GetMonths(sb, "Advance stage:" + i, start.AddMonths(i).ToString(),i.ToString(),end));
                               // start.AddMonths(i+1);
                                x--;
                            }               
                    }
                return sb.ToString();
            }  
        }
    }
}