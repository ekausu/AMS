using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace AdvanceSystem.Reporting_Grid
{
    public partial class IssuedFunding : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
        System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
        public void PassPage(Page o)
        {
            if (o is AMSReport_Manager)
                page = o as AMSReport_Manager;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //    LoadReturns("2018-01-01","2019-01-01","");
        }
        public void LoadReturns(string DateFrom,string DateTo,string sec)
        {
            DataTable dt = new DataTable();
            dt= bl.ReportsTotalIssued(DateFrom, DateTo,sec);
            GridViewTotalIssued.DataSource = dt;
            GridViewTotalIssued.DataBind();
            GridViewExtraData.Visible = false;

			//ReportDataSource datasource = new
			//   ReportDataSource(dt);
			//ReportViewer1.LocalReport.ReportPath= "~Report1.rdlc";

			//DataSet ds = new DataSet();
			//ds.Tables.AddRange(new DataTable[] { dt});
			//ReportDataSource datasource = new
			// ReportDataSource(dt.TableName,
			// ds.Tables[0]);

			//ReportViewer1.LocalReport.DataSources.Clear();
			//ReportViewer1.LocalReport.DataSources.Add(datasource);

			//ReportViewer1.LocalReport.Refresh();

			//GridViewGrapGenerator.DataSource = dt;
			//GridViewGrapGenerator.DataBind();
			//ReportViewer1.LocalReport.DataSources = dt;

		}
        public void ReportAutoDeductions(string DateFrom, string DateTo,string sec)
        {
            DataTable dt = new DataTable();
            dt = bl.ReportAutoDeductions(DateFrom, DateTo,sec);
            GridViewTotalIssued.DataSource = dt;
            GridViewTotalIssued.DataBind();
            GridViewExtraData.Visible = false;

			//ReportViewer1.Reset();
			//ReportDataSource rd = new ReportDataSource("DataSet1", dt);
			//ReportViewer1.LocalReport.DataSources.Add(rd);

			//ReportViewer1.LocalReport.Refresh();
		}
		public void ReportAdvancePaidBack(string DateFrom, string DateTo,string sec)
        {
            DataTable dt = new DataTable();
            dt = bl.ReportsAdvancePaidBack(DateFrom, DateTo,sec);
            GridViewTotalIssued.DataSource = dt;
            GridViewTotalIssued.DataBind();
            GridViewExtraData.Visible = false;
        }
        public void ReportTotalCollected(string DateFrom, string DateTo, string sec)
        {
            DataTable dt = new DataTable();
            dt = bl.ReportsAdvancePaidBack(DateFrom, DateTo, sec);
            GridViewTotalIssued.DataSource = dt;
            GridViewTotalIssued.DataBind();

            GridViewExtraData.DataSource = bl.ReportAutoDeductions(DateFrom, DateTo, sec);
            GridViewExtraData.DataBind();
            GridViewExtraData.Visible = true;
        }
        public void LoadAdvanceRemainingReturns(string Section)
        {
            DataTable dt = new DataTable();
            dt = bl.ReportAdvanceRem(Section);
            GridViewTotalIssued.DataSource = dt;
            GridViewTotalIssued.DataBind();
            //GridViewGrapGenerator.DataSource = dt;
            //GridViewGrapGenerator.DataBind();
        }//ReportsAdvanceRemaining
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
         //   AdvanceSystem.Reporting_Grid.Databound bound = new Databound();
          //  bound.GridDataBound(GridView1);
        }
    }
}