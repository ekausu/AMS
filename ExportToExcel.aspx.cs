using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using AdvanceSystem.Wrapper;

using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Text;

namespace AdvanceSystem
{
	public partial class ExportToExcel : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				BindGrid();
			}
				
		}

		private void BindGrid()// GridView GridView1, DataTable dt)
		{
			if (Session["IDelete"] != null && Session["Excel"] != null)
			{
				GridView1.DataSource = ((DataTable)Session["Excel"]); //bl.DisplayUsers(0);
				GridView1.DataBind();
			}
		}
		public void ExportGridToExcel(IDelete d,bool CheckBoxes)// GridView GridView1,DataTable dt)
		{
			//BindGrid();
			Response.Clear();
			Response.Buffer = true;
			Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
			Response.Charset = "";
			Response.ContentType = "application/vnd.ms-excel";
			using (StringWriter sw = new StringWriter())
			{
				HtmlTextWriter hw = new HtmlTextWriter(sw);

				//To Export all pages
				GridView1.AllowPaging = false;
				//this.BindGrid();

				//GridView1.HeaderRow.BackColor = Color.White;
				//foreach (TableCell cell in GridView1.HeaderRow.Cells)
				//{
				//	cell.BackColor = GridView1.HeaderStyle.BackColor;
				//}
				foreach (GridViewRow row in GridView1.Rows)
				{
					row.BackColor = Color.White;
					foreach (TableCell cell in row.Cells)
					{
						if (row.RowIndex % 2 == 0)
						{
							cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
						}
						else
						{
							cell.BackColor = GridView1.RowStyle.BackColor;
						}
						cell.CssClass = "textmode";
					}
				}
				if(Session["chk"]!=null)
					if (CheckBoxes)
				{
					if (ViewState["CheckBoxArray"] != null)
					{
						ArrayList CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
						string checkAllIndex = "chkAll-" + GridView1.PageIndex;
						int rowIdx = 0;
						for (int i = 0; i < GridView1.Rows.Count; i++)
						{
							GridViewRow row = GridView1.Rows[i];
							row.Visible = false;

							if (row.RowType == DataControlRowType.DataRow)
							{
								if (CheckBoxArray.IndexOf(i + 1) != -1)
								{
									row.Visible = true;
								}
							}
						}
					}
				}
				/////////////////////////
				GridView1.RenderControl(hw);

				//style to format numbers to string
				string style = @"<style> .textmode { mso-number-format:\@; } </style>";
				Response.Write(style);
				//Response.Output.Write(sw.ToString());
				//Response.Flush();
				//Response.End();
				string strPath;
				if (d==IDelete.Delete)
				 strPath = Server.MapPath("~/Deleted Records/");
				else
					strPath = Server.MapPath("~/Barcode Images/");
				//Application HostingEnvironment.ApplicationPhysicalPath + @"TempFiles/";
				string fileName = DateTime.Now.ToLongDateString().ToString()+DateTime.Now.ToShortTimeString().Replace(":","_")+".xls";
				File.WriteAllText(strPath + fileName.Replace("/","_"), sw.ToString());
				Response.Clear();
				Response.Write("{\"success\":true,\"isSuccess\":true,\"fileName\":\"" + fileName + "\"}");

			}
		}
		public void btnExportAll_Click(IDelete d)
		{
			Response.Clear();
			Response.Buffer = true;

			Response.AddHeader("content-disposition",
			 "attachment;filename=GridViewExport.xls");
			Response.Charset = "";
			Response.ContentType = "application/vnd.ms-excel";
			StringWriter sw = new StringWriter();
			HtmlTextWriter hw = new HtmlTextWriter(sw);

			GridView1.AllowPaging = false;
			GridView1.DataBind();

			GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");
			GridView1.HeaderRow.Cells[0].Visible = false;
			GridView1.HeaderRow.Cells[1].Style.Add("background-color", "green");
			GridView1.HeaderRow.Cells[2].Style.Add("background-color", "green");
			GridView1.HeaderRow.Cells[3].Style.Add("background-color", "green");
			GridView1.HeaderRow.Cells[4].Style.Add("background-color", "green");

			for (int i = 0; i < GridView1.Rows.Count; i++)
			{
				GridViewRow row = GridView1.Rows[i];
				row.BackColor = System.Drawing.Color.White;
				row.Cells[0].Visible = false;
				row.Attributes.Add("class", "textmode");
				if (i % 2 != 0)
				{
					row.Cells[1].Style.Add("background-color", "#C2D69B");
					row.Cells[2].Style.Add("background-color", "#C2D69B");
					row.Cells[3].Style.Add("background-color", "#C2D69B");
					row.Cells[4].Style.Add("background-color", "#C2D69B");
				}
			}
			GridView1.RenderControl(hw);
			string style = @"<style> .textmode { mso-number-format:\@; } </style>";
			Response.Write(style);
			//Response.Output.Write(sw.ToString());
			//Response.Flush();
			//Response.End();
			string strPath;
			if (d == IDelete.Delete)
				strPath = Server.MapPath("~/Deleted Records/");
			else
				strPath = Server.MapPath("~/Barcode Images/");
			string fileName = DateTime.Now.ToLongDateString().ToString() + DateTime.Now.ToShortTimeString().Replace(":", "_") + ".xls";
			File.WriteAllText(strPath + fileName.Replace("/", "_"), sw.ToString());
			Response.Clear();
			Response.Write("{\"success\":true,\"isSuccess\":true,\"fileName\":\"" + fileName + "\"}");

		}
		public override void VerifyRenderingInServerForm(Control control)
		{
			//
		}

		protected void btnExport_Click(object sender, EventArgs e)
		{
			ExportGridToExcel((IDelete)Session["IDelete"],false);
		}

		protected void GridView1_DataBound(object sender, EventArgs e)
		{
		}
	}
	public enum IDelete
	{
		Delete,
	    Export
	}
}