using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace DAL
{
    public class AbstractSQLDAL
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        
        protected SqlConnection conn = new SqlConnection(connectionString);
        protected SqlTransaction transaction;
        protected SqlCommand command;

        protected DataSet Execute(string storeProcedureName, List<SqlParameter> parameters = null)
        {
            SqlConnection usedConnection = conn;
            try
            {
                usedConnection.Open();
                transaction = usedConnection.BeginTransaction();
                command = new SqlCommand(storeProcedureName, usedConnection, transaction);
                command.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    command.Parameters.AddRange(parameters.ToArray());

                DataSet dataset = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(command);

                da.Fill(dataset);

                transaction.Commit();
                usedConnection.Close();

                return dataset;
            }
            catch (SqlException ex)
            {
                transaction.Rollback();
                usedConnection.Close();
                throw ex;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                usedConnection.Close();
                throw ex;
            }
        }
        protected void ExecuteAutoCommit(string storeProcedureName, List<SqlParameter> parameters = null, bool useMasterConn = false)
        {
            SqlConnection usedConnection = conn;
            try
            {
                usedConnection.Open();
                command = new SqlCommand(storeProcedureName, usedConnection);
                command.CommandType = CommandType.StoredProcedure;
                if (parameters != null)
                    command.Parameters.AddRange(parameters.ToArray());

                command.ExecuteNonQuery();
                usedConnection.Close();

                return;
            }
            catch (SqlException ex)
            {
                usedConnection.Close();
                throw ex;
            }
            catch (Exception ex)
            {
                usedConnection.Close();
                throw ex;
            }
        }
    }
}
