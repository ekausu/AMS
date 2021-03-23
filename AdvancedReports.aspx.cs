using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;


namespace AdvanceSystem
{
    public partial class AdvancedReports : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        EmailTemplateCreator etc = new EmailTemplateCreator();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
              //  LoadTable();
        }
        void LoadTable()
        {
          //  lblTable.Text= etc.ConvertDataTableToHTML(bl.DisplayRequest());
            /// TbReports.DataBind();
            // TbReports.Rows.Add();
            //DataTable dt = new DataTable();
            //DataRow dr = null;
            //dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            //dt.Columns.Add(new DataColumn("Date", typeof(string)));
            //dt.Columns.Add(new DataColumn("Description", typeof(string)));
            //dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            //dr = dt.NewRow();
            //dr["RowNumber"] = 1;

            //dr["Date"] = string.Empty;
            //dr["Description"] = string.Empty;
            //dr["Amount"] = string.Empty;
            //dt.Rows.Add(dr);
            //TableRow rw = new TableRow();
            //TableCell cell = new TableCell();
            //TableRow rw = new TableRow(cell);
            //rw.Cells.Add(cell);
            //TbReports.Rows.Add(rw);
            //using (DataTable dt = bl.DisplayRequest())
            //{
            //    TableRow r = new TableRow();
            //    int numbcells = 11;
            //    if (dt.Rows.Count > 0)
            //        foreach (DataRow row in dt.Rows)
            //        {
            //            for (int i=0;i<numbcells;i++)
            //            {
            //                TableCell c = new TableCell();
            //                c.Controls.Add(new LiteralControl(row["First Name"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Last Name"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Rank"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Employee Number"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Section"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Unit"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Current Salary"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Advance Amount"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Recovery Duration"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["EndDate"].ToString()));
            //                c.Controls.Add(new LiteralControl(row["Balance"].ToString()));
            //                r.Cells.Add(c);
            //            }
            //            //TbReports.Rows.Add((TableRow)(row[0]));
            //            //TbReports.Rows.Add((TableRow)row[1]);
            //            //TbReports.Rows.Add((TableRow)row[2]);
            //            //TbReports.Rows.Add((TableRow)row[3]);
            //            //TbReports.Rows.Add((TableRow)row[4]);
            //           // TbReports.Rows.Add(r);
            //        }
            //}

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //LoadTable();
            // GridView1.DataSource = bl.DisplayRequest();
            // GridView1.DataBind();
            // HtmlTableCell cell1=
            //List<HtmlTableCell> ce = new List<HtmlTableCell>();
            //HtmlTableRow rw = new HtmlTableRow();
            //DataTable dt = bl.DisplayRequest();
            //foreach (DataRow row in dt.Rows)
            //{
            //    for (int i = 0; i < 6; i++)
            //    {
            //        HtmlTableCell cl = new HtmlTableCell();
            //        cl.InnerText = row[i].ToString();
            //        ce.Add(cl);
            //    }
            //}
            //tbhtml.Rows.Add(ce);
        }
    }
}