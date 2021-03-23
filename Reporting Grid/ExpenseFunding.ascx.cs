using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.Data;

namespace AdvanceSystem.Reporting_Grid
{
    public partial class ExpenseFunding : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadGrid();
        }
        public void LoadGrid()
        {
            GridView1.DataSource = bl.LoadFundingReports(IReports.Returns);
            GridView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
               AdvanceSystem.Reporting_Grid.Databound bound = new Databound();
               bound.GridDataBound(GridView1);
        }
    }
}