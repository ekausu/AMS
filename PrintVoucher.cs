using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public class PrintVoucher
    {
        public string PrintEmployeeVoucher(ListVoucher v)
        {
            EmailTemplateCreator etc = new EmailTemplateCreator();
            string body = etc.MapPath(v); 

            //StringBuilder sb = new StringBuilder();
            //sb.Append("function PrintDiv() {");
            //sb.Append("printWindow.document.write('"+ body + "');");
            //sb.Append(" printWindow.document.close();");
            //sb.Append("printWindow.print();");
            //sb.Append("}");
           return body;
        }
    }
}