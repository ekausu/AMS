using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Net;
using System.Security;
using System.Security.Cryptography;
using System.IO;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;
using System.Web;
using System.Configuration;

namespace AdvanceSystem.Wrapper
{
	public class SMTPDetails
	{
		public string UserId { get; set; }
		public string UserPassword { get; set; }
		public string EmailAddress { get; set; }
		public string SMTPClientHost { get; set; }
		public int Active { get; set; }
	}
    public class Emails
    {
        static bool mailSent = false;
        static readonly string PasswordHash = "P@@Sw0rd";
        static readonly string SaltKey = "S@LT&KEY";
        static readonly string VIKey = "@1B2c3D4e5F6g7H8";
        SmtpClient client = new SmtpClient();
        private static void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
        {
            // Get the unique identifier for this asynchronous operation.
            String token = (string)e.UserState;

            if (e.Cancelled)
            {
                // Console.WriteLine("[{0}] Send canceled.", token);
            }
            if (e.Error != null)
            {
                //Console.WriteLine("[{0}] {1}", token, e.Error.ToString());
            }
            else
            {
                // Console.WriteLine("Message sent.");
            }
            mailSent = true;
        }
        public void MailMessage(EmailCredentials em, SMTPDetails smt)
        {
           // string UserId;
           // string UserPassword; string EmailAddress; string SMTPClientHost;
           // EmailDatabase.smtpSettings(out UserId, out UserPassword, out EmailAddress, out SMTPClientHost);
            MailAddress from = new MailAddress(smt.EmailAddress);//"jane@contoso.com",
            MailAddress to = new MailAddress(em.SendToEmail);
            MailMessage message = new MailMessage(from, to);
            System.Net.NetworkCredential basicCredential = new System.Net.NetworkCredential(smt.UserId, smt.UserPassword);
            client.Host = smt.SMTPClientHost;//"KANCAS.fqm.internal"
			client.UseDefaultCredentials = false;
            client.Credentials = basicCredential;
            message = EmailImages(em, message);
            // my logo is placed in images folder
            // message.IsBodyHtml = true;
            //  message.BodyEncoding = System.Text.Encoding.UTF8;
            message.Subject = em.MessageTitle;

            if (em.CC != "" && em.CC!=null)
                message.CC.Add(em.CC);

            message.SubjectEncoding = System.Text.Encoding.UTF8;
            client.Send(message);
            client.SendCompleted += new SendCompletedEventHandler(SendCompletedCallback);
            message.Dispose();
        }
        MailMessage EmailImages(EmailCredentials ec, MailMessage mailMessage)
        {
            AlternateView av1 = AlternateView.CreateAlternateViewFromString(ec.body, null, MediaTypeNames.Text.Html);
            if (ec.ImageList != null)
                if (ec.ImageList.Count > 0)
                    for (int i = 0; i < ec.ImageList.Count; i++)
                    {
                        av1.LinkedResources.Add(ec.ImageList[i]);
                    }
            mailMessage.AlternateViews.Add(av1);
            mailMessage.IsBodyHtml = true;
            return mailMessage;
        }
        public static string Decrypt(string encryptedText)
        {
            byte[] cipherTextBytes = Convert.FromBase64String(encryptedText);
            byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
            var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.None };

            var decryptor = symmetricKey.CreateDecryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));
            var memoryStream = new MemoryStream(cipherTextBytes);
            var cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];

            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount).TrimEnd("\0".ToCharArray());
        }
    }
}