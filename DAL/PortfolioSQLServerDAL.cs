using BE;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PortfolioSQLServerDAL : AbstractSQLDAL
    {
        public Portfolio Create(Portfolio portfolio, User creator)
        {
            try
            {
                string storeProcedureName = "portfolios_create";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@user_id", SqlDbType = SqlDbType.Int, Value = creator.ID},
                    new SqlParameter() { ParameterName = "@title", SqlDbType = SqlDbType.VarChar, Value = portfolio.Title},
                    new SqlParameter() { ParameterName = "@description", SqlDbType = SqlDbType.VarChar, Value = portfolio.Description},
                    new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username}
                };

                DataSet dataset = this.Execute(storeProcedureName, parameters);
                int createdID = Convert.ToInt32(dataset.Tables[0].Rows[0]["id"]);

                return this.GetByID(createdID);
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    throw new UsernameAlreadyExistsException($@"Portfolio already exists.");
                }
                throw ex;
            }
        }


        public Portfolio GetByID(int id, bool fetchDeleted = false)
        {
            Portfolio portfolio = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "portfolios_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                       new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.Int, Value = id},
                };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        portfolio = MapPortfolioFromDataRow(row);
                    }
                }

                if (portfolio is null || (!fetchDeleted & portfolio.IsDeleted))
                    throw new UserNotFoundException($"Portfolio with id {id} was not found.");
                return portfolio;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public PaginatedPortfolios GetByUserID(int userID, int size = 10, int offset = 0, string searchTitle = null, string orderByColumn = null, string orderByOrder = null)
        {
            PaginatedPortfolios paginatedPortfolios = null;
            List<Portfolio> portfoliosList = new List<Portfolio>();
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "portfolios_get_by_user_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@user_id", SqlDbType = SqlDbType.Int, Value = userID},
                    new SqlParameter() { ParameterName = "@size", SqlDbType = SqlDbType.Int, Value = size},
                    new SqlParameter() { ParameterName = "@offset", SqlDbType = SqlDbType.Int, Value = offset},
                    new SqlParameter() { ParameterName = "@order_by_column", SqlDbType = SqlDbType.VarChar, Value = orderByColumn},
                    new SqlParameter() { ParameterName = "@order_by_order", SqlDbType = SqlDbType.VarChar, Value = orderByOrder},
                };

                dataset = this.Execute(storeProcedureName, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        if (paginatedPortfolios == null)
                            paginatedPortfolios = new PaginatedPortfolios(size, offset, Convert.ToInt32(row["total_rows"]));
                        Portfolio portfolio = this.MapPortfolioFromDataRow(row);
                        portfoliosList.Add(portfolio);
                    }
                }
                if (paginatedPortfolios == null)
                    paginatedPortfolios = new PaginatedPortfolios(size, offset, 0);
                paginatedPortfolios.Results = portfoliosList;
                return paginatedPortfolios;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private Portfolio MapPortfolioFromDataRow(DataRow row)
        {
            Portfolio portfolio = new Portfolio();
            portfolio.ID = Convert.ToInt32(row["id"]);
            portfolio.UserID = Convert.ToInt32(row["user_id"]);
            portfolio.Title = row["title"].ToString();
            portfolio.Description = row["description"].ToString();
            portfolio.CreatedAt = Convert.ToDateTime(row["created_at"]);
            portfolio.UpdatedAt = Convert.ToDateTime(row["updated_at"]);
            portfolio.UpdatedBy = row["updated_by"].ToString();
            portfolio.IsDeleted = Convert.ToBoolean(row["is_deleted"]);

            return portfolio;
        }
    }
}
