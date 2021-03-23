using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.Reporting_Grid
{
	public partial class Funded : System.Web.UI.UserControl
	{
		System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
		BusinessLogic bl = new BusinessLogic();
		public void PassPage(Page o)
		{
			if (o is AMSReport_Manager)
				page = o as AMSReport_Manager;
		}
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadFundingDetails(string Datefrm,string DateTo,string Station)
		{
			Reset();
			GridViewFunded.DataSource = bl.FundedDetails(Datefrm,DateTo,Station);
			GridViewFunded.DataBind();
		}
		public void LoadFunded(string Datefrm, string DateTo, string Station)
		{
			Reset();
			GridViewFunded.DataSource = bl.Funded(Datefrm, DateTo, Station);
			GridViewFunded.DataBind();
		}
		//void GenerateTemplate()
		//{
		//	TemplateField customField1 = new TemplateField();
		//	customField1.ShowHeader = true;
		//	customField1.HeaderTemplate = new GridViewTemplate(DataControlRowType.Header, "Name", "", "");
		//	customField1.ItemTemplate = new GridViewTemplate(DataControlRowType.DataRow, "", "Name", "TextBox");
		//	GridView1.Columns.Add(customField1);

		//	TemplateField customField2 = new TemplateField();
		//	customField2.ShowHeader = true;
		//	customField2.HeaderTemplate = new GridViewTemplate(DataControlRowType.Header, "Age", "", "");
		//	customField2.ItemTemplate = new GridViewTemplate(DataControlRowType.DataRow, "", "Age", "TextBox");
		//	GridView1.Columns.Add(customField2);
		//}
		void Reset()
		{
			lblTotal.Text = "0";
			//lblBalance.Text = "0";
			//lblFunded.Text = "0";
			
		}
		public void LoadExpense(string Datefrm, string DateTo, string Station)
		{
			Reset();
			GridViewFunded.DataSource = bl.FundedExpenses(Datefrm, DateTo, Station);
			GridViewFunded.DataBind();
		}
		protected void GridViewFunded_DataBound(object sender, EventArgs e)
		{
		
			for (int i = GridViewFunded.Rows.Count - 1; i > 0; i--)
			{
				GridViewRow row = GridViewFunded.Rows[i];
				GridViewRow previousRow = GridViewFunded.Rows[i - 1];
				for (int j = 0; j < row.Cells.Count; j++)
				{
					if (row.Cells[j].Text == previousRow.Cells[j].Text)
					{
						//if (row.Cells[j].Text.ToUpper() == "NO")
						row.Cells[j].BackColor = System.Drawing.Color.Red;
						if (previousRow.Cells[j].RowSpan == 0)
						{
							if (row.Cells[j].RowSpan == 0)
							{
								previousRow.Cells[j].RowSpan += 2;
							}
							else
							{
								previousRow.Cells[j].RowSpan = row.Cells[j].RowSpan + 1;
							}
							row.Cells[j].Visible = false;
						}
					}
				}
			}
		}
		void GetSum(GridView gvLista, GridViewRowEventArgs e)
		{
			
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
			Label x=e.Row.FindControl("TxtTotal") as Label;
				//Label f = e.Row.FindControl("TxtFunded") as Label;
				//Label b = e.Row.FindControl("TxtBalance") as Label;
				//	string x = e.Row.Cells[gvLista.Columns.Count].Text;
				if (x.Text != "")
					lblTotal.Text = (float.Parse(lblTotal.Text) + float.Parse(x.Text)).ToString();
				//if (f.Text!= "" && f!=null)
				//	lblFunded.Text = (float.Parse(lblFunded.Text) + float.Parse(f.Text)).ToString();
				//if (b.Text != "" && b != null)
				//	lblBalance.Text = (float.Parse(lblBalance.Text) + float.Parse(b.Text)).ToString();
			}
			//for (int i = 0; i < gvLista.HeaderRow.Cells.Count; i++)
			//{
			//	string cabecera = gvLista.HeaderRow.Cells[i].Text;
			//	if (cabecera.Equals("Total"))
			//	{
			//		int activo = int.Parse(e.Row.Cells[i].Text);
			//		if (activo != 1)
			//		{
			//			e.Row.BackColor = System.Drawing.Color.SandyBrown;
			//		}
			//		break;
			//	}
			//}
		}
		protected void GridViewFunded_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			GetSum(GridViewFunded,e);
			//e.Row.
			//if (e.FieldName == "Total")
			//{
			//	decimal risk = Convert.ToDecimal(e.GetListSourceFieldValue("RISK"));
			//	decimal mv = Convert.ToDecimal(e.GetListSourceFieldValue("MV_BERND"));
			//	decimal ipotek = Convert.ToDecimal(e.GetListSourceFieldValue("IPOTEK"));


			//	e.Value = risk - mv - ipotek;
			//}

		}
	}
}