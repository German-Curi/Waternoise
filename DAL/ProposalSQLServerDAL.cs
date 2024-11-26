using BE;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using static BE.Proposal;

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

        public void UpdateProposalStatus(int requestId, int advisorId, string newStatus, User updater)
        {
            try
            {
                string storeProcedureName = "update_proposal_status";
                List<SqlParameter> parameters = new List<SqlParameter>()
                {
                    new SqlParameter() { ParameterName = "@request_id", SqlDbType = SqlDbType.Int, Value = requestId },
                    new SqlParameter() { ParameterName = "@advisor_id", SqlDbType = SqlDbType.Int, Value = advisorId },
                    new SqlParameter() { ParameterName = "@new_status", SqlDbType = SqlDbType.VarChar, Value = newStatus },
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.Int, Value = updater.ID }
                };

                // Ejecutar el procedimiento almacenado
                this.Execute(storeProcedureName, parameters);
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
        public Proposal GetByRequestID(int id,int adivsorID)
        {
            try
            {
                Proposal entity = null;
                string storeProcedure = "proposals_get_by_requestID";

                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter() { ParameterName = "@requestID", SqlDbType = SqlDbType.VarChar, Value = id },
                    new SqlParameter() { ParameterName = "@advisor_id", SqlDbType = SqlDbType.VarChar, Value = adivsorID },
                };

                DataSet dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        entity = MapProposalFromDataRow(row);
                    }
                }
                return entity;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedProposals GetAllPaginatedProposals(int size = 10,int offset = 0,int? advisorID = null,int? userRequestID = null,List<string> status = null,string orderByColumn = null,string orderByOrder = null)
        {
            PaginatedProposals paginatedProposals = null;
            List<Proposal> proposalsList = new List<Proposal>();
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "proposals_get_by_filters";

                // Preparar DataTable para los estados
                DataTable statusList = new DataTable();
                statusList.Columns.Add("status", typeof(string));
                if (status != null)
                {
                    foreach (string st in status)
                    {
                        DataRow dr = statusList.NewRow();
                        dr["status"] = st;
                        statusList.Rows.Add(dr);
                    }
                }

                // Configurar los parámetros del procedimiento almacenado
                List<SqlParameter> parameters = new List<SqlParameter>
                {
                    new SqlParameter() { ParameterName = "@size", SqlDbType = SqlDbType.Int, Value = size },
                    new SqlParameter() { ParameterName = "@offset", SqlDbType = SqlDbType.Int, Value = offset },
                    new SqlParameter() { ParameterName = "@status", SqlDbType = SqlDbType.Structured, Value = statusList },
                    new SqlParameter() { ParameterName = "@order_by_column", SqlDbType = SqlDbType.VarChar, Value = orderByColumn ?? (object)DBNull.Value },
                    new SqlParameter() { ParameterName = "@order_by_order", SqlDbType = SqlDbType.VarChar, Value = orderByOrder ?? (object)DBNull.Value },
                    new SqlParameter() { ParameterName = "@advisor_id", SqlDbType = SqlDbType.Int, Value = advisorID ?? (object)DBNull.Value },
                    new SqlParameter() { ParameterName = "@user_request_id", SqlDbType = SqlDbType.Int, Value = userRequestID ?? (object)DBNull.Value }
                };

                // Ejecutar el procedimiento almacenado
                dataset = this.Execute(storeProcedureName, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        if (paginatedProposals == null)
                            paginatedProposals = new PaginatedProposals(size, offset, Convert.ToInt32(row["total_rows"]));

                        Proposal proposal = this.MapProposalFromDataRow(row);
                        proposalsList.Add(proposal);
                    }
                }

                // Si no hay resultados, inicializar el objeto paginado
                if (paginatedProposals == null)
                    paginatedProposals = new PaginatedProposals(size, offset, 0);

                paginatedProposals.Results = proposalsList;
                return paginatedProposals;
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
