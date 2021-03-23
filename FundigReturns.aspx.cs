using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public partial class FundigReturns : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        Notifications n = new Notifications();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetInitialRow();
            }
            // FirstLoad();
        }
        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Date", typeof(string)));
            dt.Columns.Add(new DataColumn("Description", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;

            dr["Date"] = string.Empty;
            dr["Description"] = string.Empty;
            dr["Amount"] = string.Empty;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState
            ViewState["CurrentTable"] = dt;

            GridViewFund.DataSource = dt;
            GridViewFund.DataBind();

            //if (dt.Rows.Count > 1)
            for (int i = 1; i < 8; i++)
                AddNewRowToGrid();
        }
        private void AddNewRowToGrid()
        {
            int rowIndex = 0;


            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;
                if (dtCurrentTable.Rows.Count > 0)
                {
                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        //extract the HtmlInputText values
                        //HtmlInputText box1 = (HtmlInputText)GridViewTruckDumping.Rows[rowIndex].Cells[1].FindControl("TxtExc");
                        TextBox date = (TextBox)GridViewFund.Rows[rowIndex].Cells[1].FindControl("TxtDate");
                        TextBox desc = (TextBox)GridViewFund.Rows[rowIndex].Cells[2].FindControl("TxtDescription");
                        TextBox amount = (TextBox)GridViewFund.Rows[rowIndex].Cells[3].FindControl("TxtAmount");

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;

                        dtCurrentTable.Rows[i - 1]["Date"] = date.Text;
                        dtCurrentTable.Rows[i - 1]["Description"] = desc.Text;
                        dtCurrentTable.Rows[i - 1]["Amount"] = amount.Text;
                        rowIndex++;
                    }
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    GridViewFund.DataSource = dtCurrentTable;
                    GridViewFund.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");
            }
        }

        void FirstLoad()
        {
            List<string> val = new List<string>() { DateTime.Now.ToString(), "", "" };
            List<string> Col = new List<string>() { "Date", "Description", "Amount" };
            MasterInitializer(GridViewFund, "GridViewFundReturns", Col, val);
            //Session["Reqid"] = "5";
        }
        protected void GridViewFund_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridRow(sender, e, (DataTable)ViewState["CurrentTable"]);
        }
        void MasterInitializer(GridView gv, string table, List<string> Col, List<string> Val)
        {
            using (DataTable dt = bl.LoadReturns(0))
            {
                DataTable dt2 = new DataTable();
                ViewState[table.ToString()] = dt;
                if (dt.Rows.Count == 0)
                {

                    dt2 = AddNewRow(table, Col, Val);
                }
                else
                    dt2 = dt;

                gv.DataSource = dt2;
                gv.DataBind();
            }
        }
        DataTable AddNewRow(string vw, List<string> Col, List<string> Value)
        {
            DataTable dt = new DataTable();
            if (ViewState[vw.ToString()] != null)
            {
                dt = (DataTable)ViewState[vw.ToString()];
                DataRow workRow = null;
                workRow = dt.NewRow();
                if ((Col.Count > 0))
                    for (int i = 0; i < Col.Count; i++)
                    {
                        string v = "";
                        if (Value == null)
                            v = "";
                        else
                            if (Value[i] == null)
                            v = "";
                        else
                            v = Value[i];

                        workRow[Col[i]] = v;
                    }
                dt.Rows.Add(workRow);
                ViewState[vw.ToString()] = dt;
            }

            return dt;
        }
        
        protected void GridViewFund_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           // HideEmptyRows(e, "TxtAmount");
        }
        void HideEmptyRows(GridViewRowEventArgs e, string Controls)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label Label1 = (Label)e.Row.FindControl(Controls);
                if (Label1.Text == "")
                    e.Row.Visible = false;
            }
        }
        public void DeleteGridRow(object sender, GridViewDeleteEventArgs e, DataTable dt)
        {
            GridView gridView = (GridView)sender;
            int index = Convert.ToInt32(e.RowIndex);
            DeleteFromGrid(index);
            // string amnt = dt.Rows[index][8].ToString();
            dt.Rows[index].Delete();
            gridView.DataSource = dt;
            gridView.DataBind();
        }
        void DeleteFromGrid(int i)
        {
            TextBox Amn = GridViewFund.Rows[i].FindControl("TxtAmount") as TextBox;
            if (Amn.Text != "")
                TxtTotal.Text = (int.Parse(TxtTotal.Text) - int.Parse(Amn.Text)).ToString();
        }



        void LoadFudingList()
        {
            GridViewFund.DataSource = bl.LoadFunding(9);
            GridViewFund.DataBind();
        }

        protected void BtnSave2_ServerClick(object sender, EventArgs e)
        {
            SaveRecords();
        }

        protected void TxtSection_TextChanged(object sender, EventArgs e)
        {

        }
        void GetAmount()
        {
            if (TxtDate.Text != "")
            {
                ListFunding c = new ListFunding();
                c.section = TxtSection.Text;
                c.station = TxtStation.Text;
                c.period = (Convert.ToDateTime(TxtDate.Text).Year).ToString();
                c.month = DropDownPeriod.SelectedValue;
                using (DataTable dt = bl.GetFundedAmount(c))
                {
                    // string id = "";
                    if (dt.Rows.Count > 0)
                        foreach (DataRow row in dt.Rows)
                        {
                            TxtGid.Text = row["sid"].ToString();
                            TxtAmount.Text = row["Amount"].ToString();
                            GridViewFund.Enabled = true;
                        }

                }
            }
        }
        protected void DropDownPeriod_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetAmount();
        }

        protected void TxtAmount_TextChanged(object sender, EventArgs e)
        {
            //TextBox txt = (TextBox)sender;
            //if (txt.Text != "")
            //{
            //    GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
            //    GridView gv = (GridView)gvrow.NamingContainer;
            //    List<string> Col = new List<string>() { "Date", "Description", "Amount" };
            //    List<string> val = new List<string>();

            //    val.Add(((TextBox)gv.FooterRow.FindControl("TxtDate")).Text);
            //    val.Add(((TextBox)gv.FooterRow.FindControl("TxtDescription")).Text);
            //    TextBox AMNT = (TextBox)(gv.FooterRow.FindControl("TxtAmount"));
            //    val.Add(AMNT.Text);
            //    TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(AMNT.Text)).ToString();

            //    gv.DataSource = AddNewRow("GridViewFundReturns", Col, val);//.SubstandardDetails);
            //    gv.DataBind();

            //}
        }
        //*************************************SAVE RECORDS***************************
        void SaveRecords()
        {
            if (TxtGid.Text!="")
            {
                ListFunding c = new ListFunding();
                c.Amount = int.Parse(TxtAmount.Text);
                c.Date = TxtDate.Text;
                c.Enteredby = TxtEnteredby.Text;
                c.sid = int.Parse(TxtGid.Text);
                c.Balance = int.Parse(TxtBalance.Text);
                c.Total = int.Parse(TxtTotal.Text);

                using (DataTable dt = bl.NewFundingReturns(c))
                {
                    if (dt.Rows.Count == 1)
                    {
                        string pid = "";
                        foreach (DataRow row in dt.Rows)
                            pid = row["pid"].ToString();

                        if (pid != "")
                        {
                            c.pid = int.Parse(pid);
                            SaveGridEntries(c);
                        }
                    }
                }
            }
        }
        void SaveGridEntries(ListFunding c)
        {
            //c.sid = int.Parse(TxtGid.Text);
            string am = "";
            foreach(GridViewRow row in GridViewFund.Rows)
            {
             
                c.Description = ((TextBox)(row.FindControl("TxtDescription"))).Text;
                c.Date = ((TextBox)(row.FindControl("TxtDate"))).Text;
                am = ((TextBox)(row.FindControl("TxtAmount"))).Text;
                if (am != "" && c.Description != "")
                {
                    c.Amount = int.Parse(am);
                    bl.NewMultiFundingReturns(c);
                }
                    
            }
            Response.Redirect("FundigReturns.aspx");

        }

        protected void TxtEnteredby_TextChanged(object sender, EventArgs e)
        {
            GetAmount();
        }
        bool GetTotal()
        {
            float am = 0;
            foreach(GridViewRow row in GridViewFund.Rows)
            {
                string amt = (((TextBox)row.FindControl("TxtAmount")).Text);
                if (amt != "")
                    am = am + float.Parse(amt);
                TxtTotal.Text = am.ToString();
            }
            if (float.Parse(TxtAmount.Text) >= am)
            {
                TxtBalance.Text = (float.Parse(TxtAmount.Text) - am).ToString();
                TxtAmount.Style.Add("box-shadow", "0 0 20px white");
                return true;
            }
            else
            {
                TxtAmount.Style.Add("box-shadow", "0 0 20px red");
                n.Notification("Expense cannot exceed funded amount",INotification.warning,this);
                return false;
            }
        }
        protected void TxtAmount_TextChanged1(object sender, EventArgs e)
        {
            // if(TxtAmount.Text!="")
            TextBox txt = (TextBox)sender;
            
            if(GetTotal())
                txt.Style.Add("box-shadow", "0 0 20px blue");
            else
                txt.Style.Add("box-shadow", "0 0 20px red");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

		protected void LinkButton1_Click1(object sender, EventArgs e)
		{
			AddNewRowToGrid();
		}
		protected void BtnAddRow_ServerClick(object sender, EventArgs e)
		{
			AddNewRowToGrid();
		}
	}
}