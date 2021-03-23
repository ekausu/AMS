using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.IO;
using System.Data;
using System.Text;
using System.Threading;
using System.Web.UI.HtmlControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public partial class EmailTemplateCreator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string GenerateHtmlImages(EmailCredentials ec)
        {
            string body = ec.body;
            StringBuilder sb = new StringBuilder();
            if(ec.ImageList!=null)
            if (ec.ImageList.Count > 0)
            {
                sb.Append("<br>");
                for (int i = 0; i < ec.ImageList.Count; i++)
                {
                    string id = ec.ImageList[i].ContentId;
                    sb.Append(" <img width='400' height='300' id='" + id + "' src='cid:" + id + "' alt='logo' />");
                    sb.Append("<br>");
                }
            }
            else
            {
                sb.Append("<br />");
                sb.Append("<img width = '100%' height = '300' src = 'http://s7d2.scene7.com/is/image/Caterpillar/CM20150622-40624-04679' />");
                sb.Append("<br/>");
                sb.Append("<img width='100%' height = '300' src = 'http://www.mining.com/wp-content/uploads/2016/09/Caterpillar.jpg' />");
                sb.Append("<br/>");
                sb.Append("<img width = '100%' height='300' src='http://resources.supplychaindigital.com/styles/slider_detail/s3fs/topic/image/be6182d8_6695_646f_1f28_63a3662414c5.jpg?itok=qjM1yy5V' />");
                sb.Append("<br/>");
            }
            body = body.Replace("{IMAGES}", sb.ToString());
            return body;
        }
		public void SendUpdateError()
		{
			try
			{
				EmailCredentials ec = new EmailCredentials();
				ec.SendToEmail = "esnagensoftware@gmail.com";//"tmuyumba2002@yahoo.com";
				ec.ImageList = null;
				ec.body = ErrorBody();
				BusinessLogic bl = new BusinessLogic();
				bl.SendMail(ec);
			}
			catch (Exception)
			{
				return;
			}
		}
		public string ErrorBody()
		{
			string body = string.Empty;
			using (StreamReader reader = new StreamReader(Server.MapPath("~/ERROR.Html")))
			{
				body = reader.ReadToEnd();
			}
			body = body.Replace("{DATE}", DateTime.Now.ToString());
			return body;
		}
		public bool SendComplaint(string Name,string cc,string Message)
		{
			try
			{
				EmailCredentials ec = new EmailCredentials();
				BusinessLogic bl = new BusinessLogic();
				Emails email = new Emails();
				GmailMail g = new GmailMail();
				if (cc != "")
					ec.CC = cc;
				ec.SendToEmail = "esnagensoftware@gmail.com";
				ec.body = PopulateBody(Name, Message);
				return bl.SendMail(ec);
			}
			catch (Exception)
			{
				return false;
			}

		}
		public bool SendEmail(ListAdvanceDetails det, EmailCredentials ec,bool Completed)
        {
            // EmailCredentials ec = new EmailCredentials();
            // Email em = new Email();
            GmailMail g = new GmailMail();
			ListCCListItems cc = new ListCCListItems();

            try
            {
                Emails email = new Emails();
			
				// ec.CC = "erickausu_1989@yahoo.com";
				ec.ImageList = null;
				cc = CCList(det);
				if (cc.CC != "")
					ec.CC = cc.CC;
				if (ec.SendToEmail == "")
				{
					ec.SendToEmail = cc.CC;
					ec.CC = "";
				}

				ec.body = PopulateBody(det, Completed,cc.ApprovedUsers);
				ec.body = GenerateHtmlImages(ec);

				// ec.SendToEmail = "erickausu_1989@yahoo.com";//ec.SendToEmail;
				// ec.Path = Server.MapPath(@"img/fqmlogo2.png");


				// email.MailMessage(ec);
				BusinessLogic bl = new BusinessLogic();
                bl.SendMail(ec);
              //  g.SendMail(ec);
                return true;
            }
            catch(Exception)
            {
             //   g.SendMail(ec);
                return false;
            }
            //em.MailMessage(ec);
        }
		ListCCListItems CCList(ListAdvanceDetails det)
		{
			ListCCListItems c = new ListCCListItems();
			//string CC;
			StringBuilder sb = new StringBuilder();
			StringBuilder sb2 = new StringBuilder();
			BusinessLogic bl = new BusinessLogic();
			if (det.Reqid >= 0)
			{
				using (DataTable dt=bl.MailingList(det.Reqid.ToString()))
				{
					if (dt.Rows.Count > 0)
						foreach (DataRow row in dt.Rows)
						{
							sb.Append(row["Email"].ToString());
							sb.Append(";");
							///*********************USERS*****************
							sb2.Append(" <table border='0' cellspacing='0' cellpadding='10' width='100%' style='margin-bottom:10px; '>");
							sb2.Append("<tr>");
							sb2.Append(" <td width='100%' align='left' valign='top' style='color:#ffffff; font-family:Arial, Helvetica, sans-serif; font-size:13px;'>");
							sb2.Append("<img src='http://icons.iconarchive.com/icons/artua/dragon-soft/512/User-icon.png' width='50' height='50' align='left' style='margin-right:15px;'>");
							sb2.Append("<div><b>APPROVED BY: </b><br></div>");
							sb2.Append("<div style='font-size:18px;'>"+row["Approved By"].ToString()+"<br></div>");
							sb2.Append(" </td >");
							sb2.Append("</tr>");
							sb2.Append("</table>");
						}
				}
			}
			c.CC = sb.ToString();
			c.ApprovedUsers = sb2.ToString();
			return c;
		}
        public string MapPath(ListVoucher vc)
        {
           
            string body = string.Empty;
			List<string> Function = new List<string>();
			List<string> Head = new List<string>();
			List<string> Dept = new List<string>();
			List<string> Unit = new List<string>();
			List<string> Accounting = new List<string>();
			List<string> Programme = new List<string>();

			List<string> Subsidiary = new List<string>();
			List<string> Amount = new List<string>();

			using (StreamReader reader = new StreamReader(Server.MapPath("~/Voucher.Html")))
            {
                body = reader.ReadToEnd();
            }
            var Items = vc;
            if (vc.VTable.Count > 0)
            {
				foreach (VoucherTable vx in vc.VTable)
				{
					Function.Add(vx.Function);
					Head.Add(vx.Head);
					Dept.Add(vx.Dept);
					Unit.Add(vx.Unit);
					Accounting.Add(vx.AccountingOfficer);
					Programme.Add(vx.Programme);
					Subsidiary.Add(vx.Subsidiary);
					Amount.Add(vx.Amount);
				}
				body = body.Replace("{Account Type}", vc.AccountType);
                body = body.Replace("{Department}", vc.Department);
                body = body.Replace("{Ministry}", vc.Ministry);
                body = body.Replace("{Station}", vc.Station);
                body = body.Replace("{Date}", vc.Date);
                body = body.Replace("{PAYEE}", vc.Payee);
                body = body.Replace("{EMPLOYEE NUMBER}", vc.EmployeeNumber);
                body = body.Replace("{NAME}",vc.Name);
				body = body.Replace("{CODE}","Barcode Images/"+vc.Code+".png");

					body = body.Replace("{ADDRESS}", vc.Address);
                    body = body.Replace("{DESCRIPTION}", vc.Description);
                    body = body.Replace("{AUTHORITIES}", vc.Authorities);

                    body = body.Replace("{TOTAL}", vc.Total);
                    body = body.Replace("{SIGNATURE}", DateTime.Now.ToString("yyyy/MM/dd").Replace("/",""));
                    body = body.Replace("{TITLE}", vc.Title);

                
                body = body.Replace("{FUNCTION}", RenderRows(Function));
                body = body.Replace("{HEAD}", RenderRows(Head,Dept,Unit));
                //body = body.Replace("{DEPT}", RenderRows(Dept));
                //body = body.Replace("{UNIT}", RenderRows(Unit));
                body = body.Replace("{ACCOUNTING}", RenderRows(Accounting));
                body = body.Replace("{PROGRAMME}", RenderRows(Programme));
                body = body.Replace("{SUBSIDIARY}", RenderRow(Subsidiary));
                body = body.Replace("{AMOUNT}", RenderRows(Amount));

            }
            return body;
        }
		string RenderRow(List<string> h)
		{
			int itemsH = h.Count;
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < 8; i++)
			{
				string valuH = "";
				if (i < itemsH)
					valuH = h[i].ToString();
				

				sb.Append("<tr>");
				sb.Append("<td></td >");
				sb.Append("<td>" + valuH + "</td >");
				sb.Append("</tr>");
			}
			return sb.ToString();

		}
		string RenderRows(List<string> h, List<string> d, List<string> u)
		{
			int itemsH = h.Count;
			int itemsD = d.Count;
			int itemsU = u.Count;
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < 8; i++)
			{
				string valuH = "", valuD = "", valuU = "";
				if (i < itemsH)
					valuH = h[i].ToString();
				if (i < itemsD)
					valuD = d[i].ToString();
				if (i < itemsU)
					valuU = u[i].ToString();

				sb.Append("<tr>");
				sb.Append("<td>" + valuH + "</td >");
				sb.Append("<td>" + valuD + "</td >");
				sb.Append("<td>" + valuU + "</td >");
				sb.Append("</tr>");
			}
			return sb.ToString();

		}
		string RenderRows(List<string> v)
        {
            int items = v.Count;
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 8; i++)
            {
                string valu = "";
               if(i<items)
                    valu = v[i].ToString();

                sb.Append("<tr>");
                sb.Append("<td>"+valu+"</td >");
                sb.Append("</tr>");
            }
            return sb.ToString();
            
        }
        public string ConvertDataTableToHTML(DataTable dt)
        {
            if (dt.Rows.Count > 0)
            {
                string html = "<table id='datatable-buttons' class='table table-striped table-bordered'>";
                //add header row
                html += "<tr>";
                for (int i = 0; i < dt.Columns.Count; i++)
                    html += "<th>" + dt.Columns[i].ColumnName + "</th>";
                html += "</tr>";
                //add rows
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    html += "<tr>";
                    for (int j = 0; j < dt.Columns.Count; j++)
                        html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                    html += "</tr>";
                }
                html += "</table>";
                return html;
            }
            else
                return "";
        }
		public string PopulateBody(string Name,string Message)
		{
			string File = "AdvanceQuery.Html";
			string body = string.Empty;

			using (StreamReader reader = new StreamReader(Server.MapPath("~/" + File)))
			{
				body = reader.ReadToEnd();
			}

			body = body.Replace("{NAME}", Name);
			body = body.Replace("{MESSAGE}", Message);
			body = body.Replace("{DATE}", DateTime.Now.ToString());


			return body;
		}

		public string PopulateBody(ListAdvanceDetails det,bool completed,string Users)
        {
            //ListAdvanceDetails det = new ListAdvanceDetails();
            //foreach (object o in em)
            //{
            //    if (o is ListAdvanceDetails)
            //        det = (ListAdvanceDetails)o;
            //}
            string body = string.Empty;
			string File = "";
			if (completed)
				File = "AdvanceCashierEmail.Html";
			else
				File = "AdvanceEmail.Html";

            using (StreamReader reader = new StreamReader(Server.MapPath("~/"+File)))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{NAME}", det.FirstName+" "+det.LastName);
            body = body.Replace("{ID}", det.EmployeeNumber);
			body = body.Replace("{USERS}", Users);
			body = body.Replace("{SECTION}", det.Section);
            body = body.Replace("{UNIT}", det.Unit);
            body = body.Replace("{NET PAY}", det.CurrentSalary);
            body = body.Replace("{DURATION}", det.RecoveryDuration);
            body = body.Replace("{AMOUNT}", det.AdvanceAmount);
            body = body.Replace("{DATE}", DateTime.Now.ToString());

            return body;
        }
        
    }
	public class ListCCListItems
	{
		public string CC { get; set; }
		public string ApprovedUsers { get; set; }
	}
}