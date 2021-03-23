using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
    public partial class FundingDetails : System.Web.UI.Page
    {
        BusinessLogic bl = new BusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadGroupFunding();
        }
        void LoadGroupFunding()
        {
          GridviewGroupFunding.DataSource=  bl.LoadGroup();
          GridviewGroupFunding.DataBind();
        }
        void LoadFunding(GridView gv,string gid)
        {
            try
            {
                if (gid != "")
                {
                    gv.DataSource = bl.LoadFunding(int.Parse(gid));
                    gv.DataBind();
                }
            }
            catch(Exception)
            {

            }
        }
        void LoadReturns(GridView gv, string pid)
        {
            try
            {
                if (pid!="")
                {
                    gv.DataSource = bl.DisplayFundingReturns(int.Parse(pid));
                    gv.DataBind();
                }
            }
            catch(Exception)
            {

            }
        }

        protected void imgGrid2_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            // GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {
                row.FindControl("Panel1").Visible = true;
                Label Gid = row.FindControl("Gid") as Label;
                Label Htmlimages = row.FindControl("LblImages") as Label;
                GridView GridStationFunding = row.FindControl("GridStationFunding") as GridView;
               // string id = ((Label)row.FindControl("incidentid")).Text;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/minus.ico";
                LoadFunding(GridStationFunding, Gid.Text);
            }
            else
            {
                row.FindControl("Panel1").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/plus.ico";
            }

        }

        protected void imgGrid3_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgShowHide = (sender as ImageButton);
            
            GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
            if (imgShowHide.CommandArgument == "Show")
            {
                row.FindControl("Panel1").Visible = true;
                Label sid = row.FindControl("sid") as Label;
                Label Htmlimages = row.FindControl("LblImages") as Label;
                GridView GridviewReturns = row.FindControl("GridviewReturns") as GridView;
              //  string id = ((Label)row.FindControl("incidentid")).Text;
                imgShowHide.CommandArgument = "Hide";
                imgShowHide.ImageUrl = "~/minus.ico";
                LoadReturns(GridviewReturns, sid.Text);
            }
            else
            {
                row.FindControl("Panel1").Visible = false;
                imgShowHide.CommandArgument = "Show";
                imgShowHide.ImageUrl = "~/plus.ico";
            }

        }

        protected void GridviewGroupFunding_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}