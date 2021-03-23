using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.ComponentModel;
using System.IO;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class ImportFromExcel : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		Notifications n = new Notifications();
		static List<ListExportToSQl> Errorcatch = new List<ListExportToSQl>();
		//static List<ErrorRows> Errors = new List<ErrorRows>(); 
		//static List<ErrorRows> Errors2 = new List<ErrorRows>(); 
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["UserName"] != null)
				{
					//Test();
				}
				else
					Response.Redirect("Default.aspx");
			}
		}
		void Test()
		{
			try
			{
				string script = string.Format("window.open('{0}');", "test.xlsx");
				ClientScript.RegisterClientScriptBlock(this.GetType(), "newExcel", script, true);
			}
			catch (Exception)
			{
				return;
			}
		}
		ListExportToSQl Capture(GridViewRow row, ListExportToSQl xl)
		{
			try
			{
				xl.Code = int.Parse((row.FindControl("lblPDCode") as TextBox).Text);
				xl.EmployeeNumber = (row.FindControl("lblEmployeeNumber") as TextBox).Text;
				xl.FirstName = (row.FindControl("lblFName") as TextBox).Text;
				xl.LastName = (row.FindControl("lblLName") as TextBox).Text;
				xl.PaidAmount = float.Parse((row.FindControl("lblPaidAmount") as TextBox).Text);
				xl.Period = int.Parse((row.FindControl("lblPeriod") as TextBox).Text);
				xl.Rank = (row.FindControl("lblRank") as TextBox).Text;
				xl.startDate = Convert.ToDateTime((row.FindControl("lblStartDate") as TextBox).Text);
				xl.Station = (row.FindControl("lblStation") as TextBox).Text;
				xl.Amount = float.Parse((row.FindControl("lblAmount") as TextBox).Text);
				xl.Error = "";
				return xl;
			 }
			catch (Exception ex)
			{
				xl.Error = ex.ToString();
				return xl;
			}
		}
		void GetValues(ListExportToSQl xl)
		{
		//	Errors = new List<ErrorRows>();
			if (gvExcelFile.Rows.Count > 0)
			{
				Errorcatch.Clear();
				foreach (GridViewRow row in gvExcelFile.Rows)
				{
					int x = 0;
					ListExportToSQl c = new ListExportToSQl();
					c=Capture(row, xl);
					x = bl.ExportExcelToSql(c, row.RowIndex + 1);
					if (x > 0)
					{
						Errorcatch.Add(c);
						ListErrorMessage.Items.Add(c.Error);
						listErrorRows.Items.Add(x.ToString());
					}
				}
				if (ListErrorMessage.Items.Count > 0)
				{
					//HideSavedRows(gvExcelFile);
					RemoveOnlySavedData();
					n.Notification("Saved but errors were detected", INotification.info, this);
				}
				else
				{
						n.Notification("Save successfull", INotification.success, this);
					Response.Redirect("ImportFromExcel.aspx");
				}
				SavedRows();
				gvExcelFile.Columns.Clear();
			}
			else
				n.Notification("Saving failed",INotification.warning,this);
		}

		void SavedRows()
		{
			DataTable dt = new DataTable();
			if (Session["ExcelTable"] != null)
				dt = (DataTable)Session["ExcelTable"];
			if(listErrorRows.Items.Count>0)
			for (int i = 0; i < listErrorRows.Items.Count; i++)
			{
				dt.Rows[int.Parse(listErrorRows.Items[i].ToString()) - 1].Delete();
			   //if(listErrorRows.Items.Contains(""))
			}
			//GenerateErrorModal();
			GridViewSavedData.DataSource = dt;
			GridViewSavedData.DataBind();
	    }
		void RemoveOnlySavedData()
		{
			GridViewUnsaved.DataSource = Errorcatch;
			GridViewUnsaved.DataBind();
			GenerateErrorModal();
		}
		void GenerateErrorModal()
		{		
			List<ErrorRows> Errors = new List<ErrorRows>();
			for (int i = 0; i < listErrorRows.Items.Count; i++)
			{
				ErrorRows er = new ErrorRows();
				er.Error = ListErrorMessage.Items[i].ToString();
				er.Row = int.Parse(listErrorRows.Items[i].ToString());
				Errors.Add(er);
			}
			GridViewErrorList.DataSource = Errors;
			GridViewErrorList.DataBind();
			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalErrors';", true);
			ListErrorMessage.Items.Clear();
			listErrorRows.Items.Clear();
		}
		public void Import()
		{
			try
			{

				string ConStr = "";
				//Extantion of the file upload control saving into ext because 
				//there are two types of extation .xls and .xlsx of excel 
				string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
				//getting the path of the file 
				string path = Server.MapPath("~/Barcode Images/" + FileUpload1.FileName);
				//saving the file inside the MyFolder of the server
				FileUpload1.SaveAs(path);
				Label1.Text = FileUpload1.FileName + "\'s Data showing into the GridView";
				//checking that extantion is .xls or .xlsx
				if (ext.Trim() == ".xls")
				{
					//connection string for that file which extantion is .xls
					ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
				}
				else if (ext.Trim() == ".xlsx")
				{
					//connection string for that file which extantion is .xlsx
					ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
				}
				//making query
				string query = "SELECT * FROM [Sheet1$]";
				//Providing connection
				OleDbConnection conn = new OleDbConnection(ConStr);
				//checking that connection state is closed or not if closed the 
				//open the connection
				if (conn.State == ConnectionState.Closed)
				{
					conn.Open();
				}
				//create command object
				OleDbCommand cmd = new OleDbCommand(query, conn);
				// create a data adapter and get the data into dataadapter
				DataTable table;
				using (OleDbDataAdapter da = new OleDbDataAdapter(cmd))
				{
					table = new DataTable();
					da.Fill(table);
				}
				//DataSet ds = new DataSet();
				//fill the excel data to data set
				//da.Fill(ds);
				//set data source of the grid view
				//Session["ExcelTable"] = ds.Tables[0];
				Session["ExcelTable"] = table;
				gvExcelFile.DataSource = table;//ds.Tables[0];
				//binding the gridview
				gvExcelFile.DataBind();
				//close the connection
				conn.Close();
			}
			catch (Exception ex)
			{
				n.Notification(ex.ToString(),INotification.error,this);
				
			}
		}

		protected void btnUpload_Click(object sender, EventArgs e)
		{
			Import();
		}

		protected void gvExcelFile_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				TextBox Code = e.Row.FindControl("lblPDCode") as TextBox;
				TextBox EmployeeNumber = e.Row.FindControl("lblEmployeeNumber") as TextBox;
				TextBox FirstName = e.Row.FindControl("lblFName") as TextBox;
				TextBox LastName = e.Row.FindControl("lblLName") as TextBox;
				TextBox PaidAmount = e.Row.FindControl("lblPaidAmount") as TextBox;
				TextBox Period = e.Row.FindControl("lblPeriod") as TextBox;
				TextBox Rank = e.Row.FindControl("lblRank") as TextBox;
				TextBox startDate = e.Row.FindControl("lblStartDate") as TextBox;
				TextBox Station = e.Row.FindControl("lblStation") as TextBox;
				TextBox Amount = e.Row.FindControl("lblAmount") as TextBox;
				Label lblGo = e.Row.FindControl("lblGo") as Label;
				//lblGo.Text = "<div id='"+e.Row.RowIndex+"'></div>";

				n.VALIDATE2(Code);
				n.VALIDATE2(EmployeeNumber);
				n.VALIDATE2(FirstName);
				n.VALIDATE2(LastName);
				n.VALIDATE2(PaidAmount);
				n.VALIDATE2(Period);
				n.VALIDATE2(Rank);
				n.VALIDATE2(startDate);
				n.VALIDATE2(Station);
				n.VALIDATE2(Amount);

				ListExportToSQl xl = new ListExportToSQl();
				ListExportToSQl v = Capture(e.Row, xl);
				if (v.Error != "" || v.EmployeeNumber == "" || v.FirstName == "" || v.LastName == "" || v.Rank == "" || v.Station == "")
				{
					if (v.Error.Contains("StringToNumber"))
						v.Error = "text has been detected in a number only field";
					if (v.Error.Contains("Number.ParseSingle"))
						v.Error = "text has been detected in a number only field";
					if (v.Error.Contains("DateTime "))
						v.Error = "Date is not in the required format (dd-MM-yyyy) ";
					if (v.Error == "")
						v.Error = "A value is missing in the row";
					else
						v.Error = "An error has been detected";
					//ErrorRows r = new ErrorRows();
					//r.Error = v.Error;
					//r.Row = e.Row.RowIndex + 1;

					   ListErrorMessage.Items.Add(v.Error);
						listErrorRows.Items.Add((e.Row.RowIndex + 1).ToString());
				
				}
			}
		}

		protected void BtnSave_Click(object sender, EventArgs e)
		{
			ListExportToSQl s = new ListExportToSQl();
			GetValues(s);
		}

		protected void gvExcelFile_DataBound(object sender, EventArgs e)
		{
			GenerateErrorModal();
			//GridViewErrorList.DataSource = Errors;
			//GridViewErrorList.DataBind();
			//ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalErrors';", true);
		}

		protected void BtnReqReject_ServerClick(object sender, EventArgs e)
		{

		}

		protected void BtnImport_ServerClick(object sender, EventArgs e)
		{
			ListExportToSQl v = new ListExportToSQl();
			GetValues(v);
		}

		protected void BtnClear_ServerClick(object sender, EventArgs e)
		{
			Response.Redirect("ImportFromExcel.aspx");
		}
	}
	public class ErrorRows
	{
		public int Row { get; set; }
		public string Error { get; set; }
	}
	public static class DTList
	{
		public static DataTable ToDataTable<T>(this IList<T> data)
		{
			PropertyDescriptorCollection props =
				TypeDescriptor.GetProperties(typeof(T));
			DataTable table = new DataTable();
			for (int i = 0; i < props.Count; i++)
			{
				PropertyDescriptor prop = props[i];
				table.Columns.Add(prop.Name, prop.PropertyType);
			}
			object[] values = new object[props.Count];
			foreach (T item in data)
			{
				for (int i = 0; i < values.Length; i++)
				{
					values[i] = props[i].GetValue(item);
				}
				table.Rows.Add(values);
			}
			return table;
		}
	}
}