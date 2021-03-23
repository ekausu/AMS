using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Net;

namespace AdvanceSystem.Wrapper
{
    public class GmailMail
    {
        public void SendMail(EmailCredentials ec)
        {
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com",587);
            //smtp.EnableSsl = true;
            //smtp.UseDefaultCredentials = false;
            //smtp.Credentials = new NetworkCredential("esnagensoftware@gmail.com","esnagensoftware1989");
            //MailMessage message = new MailMessage("esnagensoftware@gmail.com", ec.SendToEmail);
            //message.Subject = "AMS Notification";
            //if (ec.CC != "" && ec.CC!=null)
            //    message.CC.Add(ec.CC);

            //message.IsBodyHtml = true;
            //smtp.Send(message);
            ////***********************
            //MailMessage mail = new MailMessage();
            //mail.To.Add(ec.SendToEmail);
            //mail.From = new MailAddress("esnagensoftware@gmail.com");
            //mail.Subject = "AMS";
            //mail.Body = ec.body;
            //mail.IsBodyHtml = true;
            //SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            //smtp.EnableSsl = true;
            //smtp.UseDefaultCredentials = false;
            //smtp.Credentials = new System.Net.NetworkCredential("esnagensoftware@gmail.com", "esnagensoftware1989");
            //smtp.Send(mail);
            SmtpClient smtp = new SmtpClient();
            try
            {
                MailMessage mm = new MailMessage();
                
                mm.From = new MailAddress("advance@airforce.mil.zm");
                mm.To.Add(ec.SendToEmail);
                mm.Subject = "AMS System";
                mm.Body = ec.body;
                mm.IsBodyHtml = true;

                smtp.Host = "172.21.0.2";
                smtp.EnableSsl = true; //Depending on server SSL Settings true/false
                System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
                NetworkCred.UserName = "advance";
                NetworkCred.Password = "P@$$w0rd";
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 25;//Specify your port No;
                smtp.Send(mm);
            }
            catch
            {
                // mm.Dispose();
                smtp = null;
            }
        }
    }
}