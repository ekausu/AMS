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
    static class Database
    {
        public static DataTable ExecuteSelectCommand(string CommandName, CommandType cmdType)
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
        //internal static SqlDataAdapter ExecuteAdapterSelectCommand(string CommandName, CommandType cmdType)
        //{
        //    DataTable table = null;
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))// SqlConnection con = new SqlConnection(CONNECTION_STRING))
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
        //                    //table = new DataTable();
        //                    //da.Fill(table);
        //                    return da;
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
        // This function will be used to execute R(CRUD) operation of parameterized commands
        internal static DataTable ExecuteParamerizedSelectCommand(string CommandName, CommandType cmdType, SqlParameter[] param)
        {
            DataTable table = new DataTable();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(param);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
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
        // This function will be used to execute CUD(CRUD) operation of parameterized commands
        internal static bool ExecuteNonQuery(string CommandName, CommandType cmdType, SqlParameter[] pars)
        {
            try
            {
                int result = 0;
                // var connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
                {
                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = cmdType;
                        cmd.CommandText = CommandName;
                        cmd.Parameters.AddRange(pars);

                        try
                        {
                            if (con.State != ConnectionState.Open)
                            {
                                con.Open();
                            }

                            result = cmd.ExecuteNonQuery();
                        }
                        catch (SqlException e)
                        {
                            throw;
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }

                return (result > 0);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        internal static void ExecuteNonQueryList(string CommandName, CommandType cmdType, SqlParameter[] pars)
        {
            int result = 0;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(pars);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        result = cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        throw;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }

        }

        static string SafeGetString(this SqlDataReader reader, int colIndex)
        {
            if (!reader.IsDBNull(colIndex))
                return reader.GetString(colIndex).ToString();
            else
                return "***NO DATA****";
        }
    }
}