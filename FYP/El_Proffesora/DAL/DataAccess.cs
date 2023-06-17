using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace El_Proffesora.DAL
{
    public class DataAccess
    {

        //static SqlConnection conn = new SqlConnection("Server=192.169.82.106;Database=EL_Professora;User ID=elprofessora;Password=qx45Ow&6");
       
        static SqlConnection conn = new SqlConnection("data source=DESKTOP-I75SMEB\\SQLEXPRESS;initial catalog=EL_Professora;integrated security=true");

        public static DataTable ExecuteSpTable(string spname, SqlParameter p)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(spname, conn);
                ad.SelectCommand.Parameters.Add(p);
                ad.SelectCommand.CommandType = CommandType.StoredProcedure;

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;

            }


        }
        public static DataTable ExecuteSpTable(string spname, SqlParameter[] p)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(spname, conn);

                ad.SelectCommand.CommandType = CommandType.StoredProcedure;
                ad.SelectCommand.Parameters.AddRange(p);
                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;

            }
        }
        public static DataSet ExecuteSpDataSet(string spname, SqlParameter[] p)
        {
            DataSet dt = new DataSet();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(spname, conn);

                ad.SelectCommand.CommandType = CommandType.StoredProcedure;
                ad.SelectCommand.Parameters.AddRange(p);
                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;

            }


        }
        public static DataTable ExecuteSpTable(string spname)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(spname, conn);
                ad.SelectCommand.CommandType = CommandType.StoredProcedure;

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;

            }


        }
        public static DataTable ExecuteSpTable(string spname, string prmname, int id)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(spname, conn);
                ad.SelectCommand.CommandType = CommandType.StoredProcedure;
                ad.SelectCommand.Parameters.Add(prmname, id);

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;
            }
        }
        public static bool ExecuteSpQuery(string spname, SqlParameter p)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(spname, conn);
                cmd.Parameters.Add(p);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                conn.Close();
                return false;

            }


        }
        public static bool ExecuteSpQuery(string spname, SqlParameter[] p)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(spname, conn);
                cmd.Parameters.AddRange(p);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                conn.Close();
                return false;

            }

        }
        public static DataTable ExecuteTable(string query)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(query, conn);

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;
            }

        }
        public static DataTable ExecuteTable(string query, SqlParameter p)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(query, conn);
                ad.SelectCommand.Parameters.Add(p);

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;
            }

        }
        public static DataTable ExecuteTable(string query, SqlParameter[] p)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter ad = new SqlDataAdapter(query, conn);
                ad.SelectCommand.Parameters.AddRange(p);

                ad.Fill(dt);
                return dt;
            }
            catch (Exception e)
            {
                return dt;
            }

        }
        public static bool ExecuteQuery(string query, SqlParameter[] p)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddRange(p);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                conn.Close();
                return false;
            }

        }
        public static bool ExecuteQuery(string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                conn.Close();
                return false;
            }

        }
        public static bool ExecuteQuery(string query, SqlParameter p)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.Add(p);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
            }
            catch (Exception e)
            {
                conn.Close();
                return false;
            }

        }
    }
}