using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Net;
using System.Data;

namespace AdvanceSystem.Wrapper
{
    public class EmailCredentials
    {
        public List<LinkedResource> ImageList { get; set; }
        public string body { get; set; }
        public List<DataTable> Table { get; set; }
        public string Path
        {
            get; set;
        }
        public string Logo { get; set; }
        public string FileName
        {
            get; set;
        }
        public string MessageTitle
        {
            get; set;
        }
        public string EmailLink
        {
            get; set;
        }
        //public string Table { get; set; }
        //public string Table2 { get; set; }
        //public string Table3 { get; set; }
        public string CC { get; set; }
        public string SendToEmail
        {
            get; set;
        }
        public string AssignedToName
        {
            get; set;
        }
        public string NotificationID
        {
            get; set;
        }
        public string Description { get; set; }

    }
}