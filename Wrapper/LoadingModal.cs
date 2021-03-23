using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace AdvanceSystem.Wrapper
{
	public class LoadingModal
	{
		public string Loader(string button,string Modal)
		{
			StringBuilder sb = new StringBuilder();
		    sb.Append("$('#"+button+"').click(function() {");
			sb.Append("$('#" + button + "').attr('disabled', true);");
			sb.Append("$('#" + button + "').css('visibility:hidden;');");
			sb.Append("$('#" + button + "').remove();");
			sb.Append("$('#Loading').css('visibility:visible;');");
			sb.Append("var newURLString = window.location.href +'#LoadinBar';");
			sb.Append("window.location.href = newURLString.replace('#"+ Modal + "', '');");
			sb.Append("});");
			return sb.ToString();
		}
	}
}