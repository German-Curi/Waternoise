using BE;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DAL
{
    public class ProposalSQLServerDAL : AbstractSQLDAL
    {
        public Proposal Create(Proposal proposal, User creator)
        {
            try
            {
                string storeProcedureName = "proposals_create";
                List<SqlParameter> parameters = new List<SqlParameter>()
                {
                    new SqlParameter() { ParameterName = "@request_id", SqlDbType = SqlDbType.Int, Value = proposal.RequestID },
                    new SqlParameter() { ParameterName = "@user_request_id", SqlDbType = SqlDbType.Int, Value = proposal.UserRequestID },
                    new SqlParameter() { ParameterName = "@advisor_id", SqlDbType = SqlDbType.Int, Value = proposal.AdvisorID },
                    new SqlParameter() { ParameterName = "@portfolio_id", SqlDbType = SqlDbType.Int, Value = proposal.PortfolioID },
                    new SqlParameter() { ParameterName = "@status", SqlDbType = SqlDbType.VarChar, Value = proposal.Status.ToString() },
                    new SqlParameter() { ParameterName = "@total_price", SqlDbType = SqlDbType.Decimal, Value = proposal.TotalPrice },
                    new SqlParameter() { ParameterName = "@details", SqlDbType = SqlDbType.VarChar, Value = proposal.Details },            
                    new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username }
                };

                // Ejecutar el procedimiento almacenado y recuperar el ID generado
                DataSet dataset = this.Execute(storeProcedureName, parameters);
                int createdID = Convert.ToInt32(dataset.Tables[0].Rows[0]["NewProposalID"]);

                // Retornar la propuesta creada llamando a otro método para obtenerla
                return this.GetByID(createdID);
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public Proposal GetByID(int id)
        {
            try
            {
                string storeProcedure = "proposals_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.VarChar, Value = id }
                };

                DataSet dataset = this.Execute(storeProcedure, parameters);

                DataRow row = dataset.Tables[0].Rows[0];
                Proposal entity = MapProposalFromDataRow(row);
                return entity;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private Proposal MapProposalFromDataRow(DataRow row)
        {
            Proposal entity = new Proposal
            {
                ID = Convert.ToInt32(row["id"]),
                RequestID = Convert.ToInt32(row["request_id"]),
                UserRequestID = Convert.ToInt32(row["user_request_id"]),
                AdvisorID = Convert.ToInt32(row["advisor_id"]),
                PortfolioID = Convert.ToInt32(row["portfolio_id"]),
                Status = Enum.TryParse(row["status"].ToString(), out ProposalStatus status) ? status : ProposalStatus.PENDING,
                TotalPrice = Convert.ToDecimal(row["total_price"]),
                Details = row["details"].ToString(),
                CreatedAt = Convert.ToDateTime(row["created_at"]),
                UpdatedAt = Convert.ToDateTime(row["updated_at"]),
                UpdatedBy = row["updated_by"].ToString(),
                IsDeleted = Convert.ToBoolean(row["is_deleted"])
            };

            return entity;
        }
    }
}
