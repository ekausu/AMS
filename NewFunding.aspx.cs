using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem
{
    public partial class NewFunding : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        Notifications n = new Notifications();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                SetInitialRow();
               // FirstLoad();
        }
        private void SetInitialRow()
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Station", typeof(string)));
            dt.Columns.Add(new DataColumn("Section", typeof(string)));
            dt.Columns.Add(new DataColumn("Balance", typeof(string)));
            dt.Columns.Add(new DataColumn("Total", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount", typeof(string)));
            dr = dt.NewRow();
            dr["RowNumber"] = 1;

            dr["Station"] = string.Empty;
            dr["Section"] = string.Empty;
            dr["Balance"] = string.Empty;
            dr["Total"] = string.Empty;
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
                        TextBox station = (TextBox)GridViewFund.Rows[rowIndex].Cells[1].FindControl("TxtStation");
                        TextBox section = (TextBox)GridViewFund.Rows[rowIndex].Cells[2].FindControl("TxtSection");
                        TextBox balance = (TextBox)GridViewFund.Rows[rowIndex].Cells[1].FindControl("TxtBalance");
                        TextBox total = (TextBox)GridViewFund.Rows[rowIndex].Cells[2].FindControl("TxtTotal");
                        TextBox amount = (TextBox)GridViewFund.Rows[rowIndex].Cells[3].FindControl("TxtAmount");

                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["RowNumber"] = i + 1;



                        dtCurrentTable.Rows[i - 1]["Station"] = station.Text;
                        dtCurrentTable.Rows[i - 1]["Section"] = section.Text;

                        dtCurrentTable.Rows[i - 1]["Balance"] = balance.Text;
                        dtCurrentTable.Rows[i - 1]["Total"] = total.Text;
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
            List<string> val = new List<string>() { "", "", ""};
            List<string> Col = new List<string>() { "Station", "Section", "Amount" };
            MasterInitializer(GridViewFund, "GridViewFund", Col, val);
            //Session["Reqid"] = "5";
        }
        protected void GridViewFund_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DeleteGridRow(sender, e, (DataTable)ViewState["CurrentTable"]);
        }

        protected void GridViewFund_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //DeleteGridRow(sender, e, (DataTable)ViewState["GridViewVoucher"]);
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
            TextBox Amn = GridViewFund.Rows[i].FindControl("TxtTotal") as TextBox;
            if (Amn.Text != "")
                TxtTotal.Text = (int.Parse(TxtTotal.Text) - int.Parse(Amn.Text)).ToString();
        }



        void LoadFudingList()
        {
            GridViewFund.DataSource = bl.LoadFunding(9);
            GridViewFund.DataBind();
        }
        protected void TxtAmount_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            if (txt.Text != "")
            {
                GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
                GridView gv = (GridView)gvrow.NamingContainer;
                List<string> Col = new List<string>() { "Station", "Section", "Amount" };
                List<string> val = new List<string>();

                val.Add(((TextBox)gv.FooterRow.FindControl("TxtStation")).Text);
                val.Add(((TextBox)gv.FooterRow.FindControl("TxtSection")).Text);
                TextBox AMNT = (TextBox)(gv.FooterRow.FindControl("TxtAmount"));
                val.Add(AMNT.Text);
                TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(AMNT.Text)).ToString();

                gv.DataSource = AddNewRow("GridViewFund", Col, val);//.SubstandardDetails);
                gv.DataBind();

            }
        }
        void MasterInitializer(GridView gv, string table, List<string> Col, List<string> Val)
        {
            string incidentId = "";
            //  if (Session["Incidentid"] != null)
            //  incidentId = Session["Incidentid"].ToString();
            using (DataTable dt = bl.LoadFunding(0))
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
                        //DateTime date = new DateTime();
                        //Int32 x = new Int32();
                        //if(i==2)
                        //    workRow[Col[i]] = date;
                        //if (i == 4)
                        //    workRow[Col[i]] = x;
                        //else
                        workRow[Col[i]] = v;
                    }
                dt.Rows.Add(workRow);
                ViewState[vw.ToString()] = dt;
            }

            return dt;
        }
        void SetGridViewRows(GridView gv, string vw, List<string> Col, bool dropdown, string Control)
        {
            List<string> Val = new List<string>();
            if (Col.Count > 0)
                for (int i = 0; i < Col.Count; i++)
                {
                    if (dropdown)
                        Val.Add(((DropDownList)gv.FooterRow.FindControl(Control + i)).Text);
                    else
                        Val.Add(((TextBox)gv.FooterRow.FindControl(Control + i)).Text);
                }
            if (Val.Count > 0)
            {
                gv.DataSource = AddNewRow(vw, Col, Val);//.SubstandardDetails);
                gv.DataBind();
            }
        }
        void SaveGroup()
        {
            ListFunding fd = new ListFunding();
            fd.EnteredBy = TxtEnteredby.Text;
            fd.Date=TxtDate.Text;
            fd.TotalAmount= TxtTotal.Text;
            fd.month = DropDownPeriod.Text;
            fd.period = DateTime.Parse(fd.Date).Year.ToString();
            using (DataTable dt = bl.NewFundGroup(fd))
            {
                string gid = "";
                if (dt.Rows.Count == 1)
                    foreach (DataRow row in dt.Rows)
                        gid = row["Gid"].ToString();
                fd.Gid = gid;
                if(gid!="")
                SaveNewFunding(fd);
            }
        }
        void SaveNewFunding(ListFunding fd)
        {
            if (GridViewFund.Rows.Count > 0)
            {
                foreach (GridViewRow row in GridViewFund.Rows)
                {

                    string amnt = "";
                    fd.Station=(((TextBox)row.FindControl("TxtStation")).Text);
                    fd.Section = (((TextBox)row.FindControl("TxtSection")).Text);
                   amnt= ((TextBox)row.FindControl("TxtTotal")).Text;
                    if (amnt == "")
                        fd.Amount = 0;
                    else
                        fd.Amount = int.Parse(amnt);
                    // Label DropDownNearMiss = (Label)row.FindControl("Txt3");
                    if (fd.Amount>0 && fd.Station!= "" && fd.Section!="")
                    {
                        bl.NewFunding(fd);

                    }
                }
                n.Notification("Records have been saved successfully",INotification.success,this);
            }

        }

        protected void BtnSave2_ServerClick(object sender, EventArgs e)
        {
            SaveGroup();
            Response.Redirect("NewFunding.aspx");

        }

        protected void TxtSection_TextChanged(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
            
            //TextBox box3 = (TextBox)row.FindControl("TxtControllerID");
            TextBox station = (TextBox)gvrow.FindControl("TxtStation");
            TextBox TxtBal = (TextBox)gvrow.FindControl("TxtBalance");

            using (DataTable dt = bl.GetBaalanceReturns(txt.Text, station.Text))
            {
                if(dt.Rows.Count==1)
                    foreach(DataRow row in dt.Rows)
                    {
                        TxtBal.Text=row["balance"].ToString();
                    }
            }
        }

        protected void TxtAmount_TextChanged1(object sender, EventArgs e)
        {
            TextBox txt = (TextBox)sender;
            if (txt.Text != "")
            {
                GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;
                GridView gv = (GridView)gvrow.NamingContainer;
               // List<string> Col = new List<string>() { "Station", "Section", "Amount" };
               // List<string> val = new List<string>();

               //TextBox amt= ((TextBox)gv.FooterRow.FindControl("TxtAmount"));
                TextBox bal = ((TextBox)gvrow.FindControl("TxtBalance"));
                TextBox total = ((TextBox)gvrow.FindControl("TxtTotal"));

                TextBox AMNT = (TextBox)(gvrow.FindControl("TxtAmount"));
                total.Text = (int.Parse(bal.Text) + int.Parse(AMNT.Text)).ToString();
               // val.Add(AMNT.Text);
                TxtTotal.Text = (int.Parse(TxtTotal.Text) + int.Parse(total.Text)).ToString();
            }
            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }
    }
}