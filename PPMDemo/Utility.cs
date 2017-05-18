using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Security.Principal;
using System.Globalization;


namespace PPMDemo
{
  

    public class Utility
    {

        SqlCommand cmd = null;
        SqlDataAdapter adp = null;
        DataTable dt = null;
        SqlConnection conn = null;
        string sqlQuery = "";
        SqlParameter param;
        System.Configuration.ConnectionStringSettings connString = null;
        public String ErrorMessage = "";

        public Utility()
        {

        }
        private void GetConnectionString()
        {
            System.Configuration.Configuration rootWebConfig =
               System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/WebApplication75");

            if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
            {
                connString =
                    rootWebConfig.ConnectionStrings.ConnectionStrings["PPMDemoConnectionString"];
                if (connString != null)
                    Console.WriteLine("DB connection string = \"{0}\"",
                        connString.ConnectionString);
                else
                    Console.WriteLine("No DB connection string");
            }
            conn = new SqlConnection(connString.ConnectionString);

        }

        public DataTable GetDBDataIntoTable(string sqlQuery)
        {
            try
            {

                GetConnectionString();
                cmd = new SqlCommand(sqlQuery, conn);
                adp = new SqlDataAdapter(cmd);
                dt = new DataTable();

                adp.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {


                return dt;
            }
        }

        public string[] GetDBDataIntoArray(string sqlQuery,string columnName)
        {
            try
            {

                GetConnectionString();
                cmd = new SqlCommand(sqlQuery, conn);
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                List<String> lst = new List<string>();

                while (rdr.Read())
                {
                    lst.Add((String)rdr[columnName]);

                }

                return lst.ToArray();
            }
            catch (Exception ex)
            {


                return null;
            }
        }
        public List<int> GetEquipmentWisePPMEvents(string equipment_id, string year)
        {
            List<int> result = new List<int>();
            sqlQuery = "[GetEquipmentYearPPMEvents]";

            try
            {

                GetConnectionString();
                cmd = new SqlCommand(sqlQuery, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                param = cmd.Parameters.Add("@equipment_id", SqlDbType.NVarChar, 100);
                param.Value = equipment_id;
                param = cmd.Parameters.Add("@from_year", SqlDbType.NVarChar, 4);
                param.Value = year;


                using (conn)
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result.Add(Convert.ToInt32(reader["scheduled_week"]));
                        }
                    }
                }
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {

                conn.Close();
                return result;
            }
        }


        public List<int> GetDayOfTheWeekForPPMEvents( string year)
        {
            List<int> result = new List<int>();
            sqlQuery = "[GetFirstDayOfTheWeek]";

            try
            {

                GetConnectionString();
                cmd = new SqlCommand(sqlQuery, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                
                param = cmd.Parameters.Add("@from_year", SqlDbType.NVarChar, 4);
                param.Value = year;


                using (conn)
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result.Add(Convert.ToInt32(reader["day_of_the_week"]));
                        }
                    }
                }
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {

                conn.Close();
                return result;
            }
        }

        public List<int> GetJobCompletionDetails(string equipment_id, string year)
        {
            List<int> result = new List<int>();
            sqlQuery = "[GetJobCompletionDetails]";

            try
            {

                GetConnectionString();
                cmd = new SqlCommand(sqlQuery, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                param = cmd.Parameters.Add("@equipment_id", SqlDbType.NVarChar, 100);
                param.Value = equipment_id;
                param = cmd.Parameters.Add("@year", SqlDbType.NVarChar, 4);
                param.Value = year;


                using (conn)
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            result.Add(Convert.ToInt32(reader["actual_week"]));
                        }
                    }
                }
                conn.Close();
                return result;
            }
            catch (Exception ex)
            {

                conn.Close();
                return result;
            }
        }



      









        public int GetSundaysInMonth(int year,int month)
        {
            int sundays = 0;
          //  int month = thisMonth.Month;
         //   int year = thisMonth.Year;
            int daysThisMonth = DateTime.DaysInMonth(year, month);
            DateTime beginingOfThisMonth = new DateTime(year, month, 1);
            for (int i = 0; i < daysThisMonth; i++)
                if (beginingOfThisMonth.AddDays(i).DayOfWeek == DayOfWeek.Sunday)
                    sundays++;
            return sundays;
        }

        public int GetWeeksInYear(int year)
        {
            DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
            DateTime date1 = new DateTime(year, 12, 31);
            Calendar cal = dfi.Calendar;
            return cal.GetWeekOfYear(date1, dfi.CalendarWeekRule,
                                                dfi.FirstDayOfWeek);
        }

        public bool InsertUpdtDelDBData(string sqlCommand)
        {

            bool result = false;

            try
            {
                GetConnectionString();
                conn.Open();
                cmd = new SqlCommand(sqlCommand, conn);
                // Execute the command
                int rowsAffectedCount = cmd.ExecuteNonQuery();
                if (rowsAffectedCount != 0)
                    result = true;
                // Close and dispose
                cmd.Dispose();
                conn.Close();
                conn.Dispose();


                return result;
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message.ToString();
                cmd.Dispose();
                conn.Close();
                conn.Dispose();


                return result;
            }



        }








    }
}