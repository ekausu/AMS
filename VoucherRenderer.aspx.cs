using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvanceSystem
{
    public partial class VoucherRenderer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["Voucher"]!=null)
                {
                    lblVoucher.Text = Session["Voucher"].ToString();
                }
            }
        }
    }
}