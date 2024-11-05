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
    public class CompanySQLServerDAL : AbstractSQLDAL
    {
        public Company Create(Company company, User creator)
        {
            try
            {
                string storeProcedureName = "companies_create";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@user_id", SqlDbType = SqlDbType.Int, Value = creator.ID},
                    new SqlParameter() { ParameterName = "@business_name", SqlDbType = SqlDbType.VarChar, Value = company.BusinessName},
                    new SqlParameter() { ParameterName = "@address", SqlDbType = SqlDbType.VarChar, Value = company.Address},
                    new SqlParameter() { ParameterName = "@email", SqlDbType = SqlDbType.VarChar, Value = company.Email},
                    new SqlParameter() { ParameterName = "@contact_number", SqlDbType = SqlDbType.VarChar, Value = company.ContactNumber},
                    new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username}
                };

                DataSet dataset = this.Execute(storeProcedureName, parameters);
                int createdID = Convert.ToInt32(dataset.Tables[0].Rows[0]["id"]);
                return this.GetByID(createdID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Company GetByID(int id, bool fetchDeleted = false)
        {
            Company company = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "companies_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.VarChar, Value = id},
                };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        company = MapCompanyFromDataRow(row);
                    }
                }
                return company;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Company Update(Company company, User updator)
        {
            string storeProcedureName = "companies_update";
            List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.Int, Value = company.ID},
                    new SqlParameter() { ParameterName = "@address", SqlDbType = SqlDbType.VarChar, Value = company.Address},
                    new SqlParameter() { ParameterName = "@email", SqlDbType = SqlDbType.VarChar, Value = company.Email},
                    new SqlParameter() { ParameterName = "@contact_number", SqlDbType = SqlDbType.VarChar, Value = company.ContactNumber},
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = updator.Username}
                };

            this.Execute(storeProcedureName, parameters);
            return this.GetByID(company.ID);
        }

        private Company MapCompanyFromDataRow(DataRow row)
        {
            Company company = new Company();
            company.ID = Convert.ToInt32(row["id"]);
            company.BusinessName = row["business_name"].ToString();
            company.Address = row["address"].ToString();
            company.Email = row["email"].ToString();
            company.ContactNumber = row["contact_number"].ToString();
            company.CreatedAt = Convert.ToDateTime(row["created_at"]);
            company.UpdatedAt = Convert.ToDateTime(row["updated_at"]);
            company.UpdatedBy = row["updated_by"].ToString();
            company.IsDeleted = Convert.ToBoolean(row["is_deleted"]);

            return company;
        }
    }
}
