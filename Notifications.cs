using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace AdvanceSystem
{
	public class Notifications
	{
		public void Notification(string message, INotification noti)
		{
			System.Web.UI.Page p = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
			string type = "";
			string title = "";
			if (noti == INotification.warning)
			{
				type = noti.ToString();
				title = "Missing Entry";
			}
			else if (noti == INotification.success)
			{
				type = noti.ToString();
				title = "Operation Successfull";
			}
			else if (noti == INotification.info)
			{
				type = noti.ToString();
				title = "Notice";
			}
			else if (noti == INotification.error)
			{
				type = noti.ToString();
				title = "Error";
			}
			else if (noti == INotification.entry)
			{
				type = INotification.warning.ToString();
				title = "Warning Shift Date/ Shift";
			}
			StringBuilder strScript = new StringBuilder();
			strScript.Append("iziToast." + type + "({");
			strScript.Append("title: '" + title + "',");
			strScript.Append("position: 'topRight',");
			strScript.Append("message: '" + message + "',");
			strScript.Append("});");

			ClientScriptManager script = p.ClientScript;
			p.ClientScript.RegisterStartupScript(GetType(), "Javascript", strScript.ToString(), true);
		}
		public void Notification(string message, INotification noti, Page p)
		{
			string type = "";
			string title = "";
			if (noti == INotification.warning)
			{
				type = noti.ToString();
				title = "Missing Entry";
			}
			else if (noti == INotification.success)
			{
				type = noti.ToString();
				title = "Operation Successfull";
			}
			else if (noti == INotification.info)
			{
				type = noti.ToString();
				title = "Notice";
			}
			else if (noti == INotification.error)
			{
				type = noti.ToString();
				title = "Error";
			}
			else if (noti == INotification.entry)
			{
				type = INotification.warning.ToString();
				title = "Warning Shift Date/ Shift";
			}
			StringBuilder strScript = new StringBuilder();
			strScript.Append("iziToast." + type + "({");
			strScript.Append("title: '" + title + "',");
			strScript.Append("position: 'topRight',");
			strScript.Append("message: '" + message + "',");
			strScript.Append("});");

			ClientScriptManager script = p.ClientScript;
			p.ClientScript.RegisterStartupScript(GetType(), "Javascript", strScript.ToString(), true);
		}
		public void VALIDATE2(TextBox c)
		{
			  if (c is TextBox)
             {
                TextBox x = ((TextBox)c);
                if (x.Text == "")
                    x.Style.Add("box-shadow", "0 0 10px red");
                else
                {
                    x.Style.Remove("box-shadow");
                    x.Style.Add("border", "solid 1px white");
                }
             }
		}
        public void VALIDATE(Control c)
        {

            if (c is HtmlInputGenericControl)
            {
                HtmlInputGenericControl x = ((HtmlInputGenericControl)c);
                if (x.Value == "")
                {
                    x.Style.Add("box-shadow", "0 0 20px blue");
                }
                else
                {
                    x.Style.Remove("box-shadow");
                    x.Style.Add("border", "1px solid #cccccc");
                }
            }
            if (c is HtmlInputText)
            {
                HtmlInputText x = ((HtmlInputText)c);
                if (x.Value == "")
                {
                    x.Style.Add("box-shadow", "0 0 20px blue");
                }
                else
                {
                    x.Style.Remove("box-shadow");
                    x.Style.Add("border", "solid 1px black");
                }
            }
            if (c is TextBox)
            {
                TextBox x = ((TextBox)c);
                if (x.Text == "")
                    x.Style.Add("box-shadow", "0 0 20px blue");
                else
                {
                    x.Style.Remove("box-shadow");
                    x.Style.Add("border", "solid 1px black");
                }
            }
            if (c is DropDownList)
            {
                DropDownList list = ((DropDownList)c);
				if (list.Text == "" || list.Text.ToUpper() == "--SELECT--")
					list.Style.Add("box-shadow", "0 0 20px blue");
				else
				{
					list.Style.Clear();
					list.Style.Add("border", "solid 1px black");
				}
            }
        }
		public void VALCLEAR(Control c)
		{

			if (c is HtmlInputGenericControl)
			{
				HtmlInputGenericControl x = ((HtmlInputGenericControl)c);
				x.Value = "";
					x.Style.Remove("box-shadow");
					x.Style.Add("border", "1px solid #cccccc");			
			}
			if (c is HtmlInputText)
			{
				HtmlInputText x = ((HtmlInputText)c);
				x.Value = "";
					x.Style.Remove("box-shadow");
					x.Style.Add("border", "solid 1px black");	
			}
			if (c is TextBox)
			{
				TextBox x = ((TextBox)c);
				x.Text = "";
					x.Style.Remove("box-shadow");
					x.Style.Add("border", "solid 1px black");			
			}
			if (c is DropDownList)
			{
				DropDownList list = ((DropDownList)c);
				list.Text = "";
				list.Style.Clear();
				list.Style.Add("border", "solid 1px black");
			}
		}



	}
	public enum INotification
    {
        info,
        success,
        warning,
        error,
        entry
    }
}