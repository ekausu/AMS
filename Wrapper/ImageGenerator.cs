using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Web;

namespace AdvanceSystem.Wrapper
{
    public class ImageGenerator
    {
        public string GenerateImages(DataTable dt)
        {
            StringBuilder sb = new StringBuilder();
            string imagename = "";
            int i = 0;
            sb.Append("<ul class='thumbnails gallery'>");
            foreach (DataRow row in dt.Rows)
            {
                imagename = row["ImageName"].ToString();
                sb.Append("<li id='image-" + i + "' class='thumbnail'>");
                sb.Append("<a style='background: url(Payslips/" + imagename + ")' title='" + imagename + "' href='Payslips/" + imagename + "'><img class='grayscale' src='Payslips/" + imagename + "' alt ='" + imagename + "'></a>");
                sb.Append("</li>");

                i++;
            }
            sb.Append("</ul>");
            return sb.ToString();
        }

    }
}