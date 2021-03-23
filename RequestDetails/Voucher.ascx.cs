using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem.RequestDetails
{
	public partial class Voucher : System.Web.UI.UserControl
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		public void LoadVoucher(string Reqid)
		{
			GridViewVoucher.DataSource = bl.DisplayVoucher(Reqid);
			GridViewVoucher.DataBind();
		}
		protected void GridViewVoucher_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}
		void LoadExtraGrid(string id, GridViewRow row)
		{
			//DataTable dt = new DataTable();
			//dt = bl.DisplayVoucherTable(id);

			VoucherDetails voucherdetails = row.FindControl("VoucherDetails") as VoucherDetails;
			voucherdetails.LoadVoucherDetails(int.Parse(id));
		}
		protected void imgVoucher_Click(object sender, ImageClickEventArgs e)
		{
			ImageButton imgShowHide = (sender as ImageButton);
			// GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

			GridViewRow row = (imgShowHide.NamingContainer as GridViewRow);
			if (imgShowHide.CommandArgument == "Show")
			{
				row.FindControl("Panel1").Visible = true;
				Label lblid = row.FindControl("vid") as Label;
				imgShowHide.CommandArgument = "Hide";
				imgShowHide.ImageUrl = "~/minus.ico";
				LoadExtraGrid(lblid.Text, row);
				//  Htmlimages.Text = img.GenerateImages(bl.DisplayImages(lblid.Text));
			}
			else
			{
				row.FindControl("Panel1").Visible = false;
				imgShowHide.CommandArgument = "Show";
				imgShowHide.ImageUrl = "~/plus.ico";
			}
		}
	}
}