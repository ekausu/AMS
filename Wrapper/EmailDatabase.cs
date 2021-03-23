using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AdvanceSystem.Wrapper
{
    public class EmailDatabase
    {

        public static void smtpSettings(out string UserId, out string UserPassword, out string EmailAddress, out string SMTPClientHost)
        {
            DataTable dt = new DataTable();
            dt = ExecuteSelectCommand("EmailSettings", CommandType.StoredProcedure);
            UserId = "";
            UserPassword = "";
            EmailAddress = "";
            SMTPClientHost = "";
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    UserId = row["User Id"].ToString();
                    UserPassword = row["User Password"].ToString();
                    EmailAddress = row["Email Address"].ToString();
                    SMTPClientHost = row["SMTP Client Host"].ToString();
                }
            }
            else
            {
                UserId = "";
                UserPassword = "";
                EmailAddress = "";
                SMTPClientHost = "";
            }
        }
        internal static DataTable ExecuteSelectCommand(string CommandName, CommandType cmdType)
        {
            DataTable table = null;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))// SqlConnection con = new SqlConnection(CONNECTION_STRING))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return table;
        }


        //private static DataTable ExecuteSelectCommand(string CommandName, CommandType cmdType)
        //{
        //    DataTable table = null;
        //    using (SqlConnection con = new SqlConnection(CONNECTION_STRING))
        //    {
        //        using (SqlCommand cmd = con.CreateCommand())
        //        {
        //            cmd.CommandType = cmdType;
        //            cmd.CommandText = CommandName;

        //            try
        //            {
        //                if (con.State != ConnectionState.Open)
        //                {
        //                    con.Open();
        //                }

        //                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //                {
        //                    table = new DataTable();
        //                    da.Fill(table);
        //                }
        //            }
        //            catch
        //            {
        //                throw;
        //            }
        //        }
        //    }

        //    return table;
        //}
    }
}