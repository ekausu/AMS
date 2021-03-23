using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class Delete_Records : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				//PopulateCheckBoxArray();
				LoadRequests("", "");
			}
		}
		void LoadRequests(string user, string status)
		{
			DataTable dt = new DataTable();
			GridviewRecords.DataSource =dt= bl.DisplayRequest(user, status);
			GridviewRecords.DataBind();
			Session["Excel"] = dt;
			//ExportToExcel(IDelete.Delete);
		}
		
		void ExportToExcel(IDelete d,bool chk)
		{
			//Session["Excel"] = dt;
			Session["IDelete"] = d;
			Session["chk"] = chk;
			string url = "ExportToExcel.aspx";
			string s = "window.open('" + url + "', 'popup_window', 'toolbar = yes,scrollbars = yes,resizable = yes,top = 200,left = 200,width = 200,height = 10');";// 'width=800,height=800,left=100,top=100,resizable=yes');";
			ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
		}

		private void ResetCheckBoxes()
		{
			if (ViewState["CheckBoxArray"] != null)
			{
				ArrayList CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
				string checkAllIndex = "chkAll-" + GridviewRecords.PageIndex;

				if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
				{
					CheckBox chkAll = (CheckBox)GridviewRecords.HeaderRow.Cells[0].FindControl("chkAll");
					chkAll.Checked = true;
				}
				for (int i = 0; i < GridviewRecords.Rows.Count; i++)
				{

					if (GridviewRecords.Rows[i].RowType == DataControlRowType.DataRow)
					{
						if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
						{
							CheckBox chk = (CheckBox)GridviewRecords.Rows[i].Cells[0].FindControl("CheckBox1");
							chk.Checked = true;
						}
						else
						{
							int CheckBoxIndex = GridviewRecords.PageSize * (GridviewRecords.PageIndex) + (i + 1);
							if (CheckBoxArray.IndexOf(CheckBoxIndex) != -1)
							{
								CheckBox chk = (CheckBox)GridviewRecords.Rows[i].Cells[0].FindControl("CheckBox1");
								chk.Checked = true;
							}
						}
					}
				}
			}
		}
		private void PopulateCheckBoxArray()
		{
			ArrayList CheckBoxArray;
			if (ViewState["CheckBoxArray"] != null)
			{
				CheckBoxArray = (ArrayList)ViewState["CheckBoxArray"];
			}
			else
			{
				CheckBoxArray = new ArrayList();
			}

			int CheckBoxIndex;
			bool CheckAllWasChecked = false;
			CheckBox chkAll = (CheckBox)GridviewRecords.HeaderRow.Cells[0].FindControl("chkAll");
			string checkAllIndex = "chkAll-" + GridviewRecords.PageIndex;
			if (chkAll.Checked)
			{
				if (CheckBoxArray.IndexOf(checkAllIndex) == -1)
				{
					CheckBoxArray.Add(checkAllIndex);
				}
			}
			else
			{
				if (CheckBoxArray.IndexOf(checkAllIndex) != -1)
				{
					CheckBoxArray.Remove(checkAllIndex);
					CheckAllWasChecked = true;
				}
			}
			for (int i = 0; i < GridviewRecords.Rows.Count; i++)
			{
				if (GridviewRecords.Rows[i].RowType == DataControlRowType.DataRow)
				{
					CheckBox chk = (CheckBox)GridviewRecords.Rows[i].Cells[0].FindControl("CheckBox1");
					CheckBoxIndex = GridviewRecords.PageSize * GridviewRecords.PageIndex + (i + 1);
					if (chk.Checked)
					{
						if (CheckBoxArray.IndexOf(CheckBoxIndex) == -1 && !CheckAllWasChecked)
						{
							CheckBoxArray.Add(CheckBoxIndex);
						}
					}
					else
					{
						if (CheckBoxArray.IndexOf(CheckBoxIndex) != -1 || CheckAllWasChecked)
						{
							CheckBoxArray.Remove(CheckBoxIndex);
						}
					}
				}
			}
			ViewState["CheckBoxArray"] = CheckBoxArray;
		}

		void RemoveFrmTable()
		{

		}
		protected void BtnExport_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnDelete_ServerClick(object sender, EventArgs e)
		{
			//ExportToExcel(IDelete.Delete);
		}


		protected void BtnDelete_ServerClick1(object sender, EventArgs e)
		{
			ExportToExcel(IDelete.Delete,true);
		}
	}
}