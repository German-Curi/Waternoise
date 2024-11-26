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
    public class SubscriptionSQLServerDAL : AbstractSQLDAL
    {
        public Subscription Create(Subscription subscription, string creator)
        {
            try
            {
                string storeProcedureName = "subscriptions_create";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@company_id", SqlDbType = SqlDbType.Int, Value = subscription.CompanyID },
                    new SqlParameter() { ParameterName = "@cardholder_name", SqlDbType = SqlDbType.VarChar, Value = subscription.CardholderName },
                    new SqlParameter() { ParameterName = "@card_number", SqlDbType = SqlDbType.VarChar, Value = subscription.CardNumber },
                    new SqlParameter() { ParameterName = "@expiration_date", SqlDbType = SqlDbType.DateTime, Value = subscription.ExpirationDate },
                    new SqlParameter() { ParameterName = "@cvv_code", SqlDbType = SqlDbType.VarChar, Value = subscription.CVVCode },
                    new SqlParameter() { ParameterName = "@subscription_duration", SqlDbType = SqlDbType.Int, Value = subscription.SubscriptionDuration },
                    new SqlParameter() { ParameterName = "@subscription_total", SqlDbType = SqlDbType.Decimal, Value = subscription.SubscriptionTotal },
                    new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator }
                };

                DataSet dataset = this.Execute(storeProcedureName, parameters);
                int createdID = Convert.ToInt32(dataset.Tables[0].Rows[0]["id"]);
                return this.GetByID(createdID);
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public Subscription GetByID(int id)
        {
            Subscription subscription = null;
            try
            {
                string storeProcedure = "subscriptions_get_by_id";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.Int, Value = id }
                };

                DataSet dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        subscription = MapSubscriptionFromDataRow(row);
                    }
                }

                if (subscription == null)
                    throw new Exception($"Subscription with ID {id} not found.");

                return subscription;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Subscription> GetByCompanyID(int companyId)
        {
            List<Subscription> subscriptions = new List<Subscription>();
            try
            {
                string storeProcedure = "subscriptions_get_by_company_id";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@company_id", SqlDbType = SqlDbType.Int, Value = companyId }
                };

                DataSet dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        subscriptions.Add(MapSubscriptionFromDataRow(row));
                    }
                }

                return subscriptions;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Subscription> GetAll()
        {
            List<Subscription> subscriptionsList = new List<Subscription>();
            try
            {
                string storeProcedureName = "subscriptions_get_all";

                DataSet dataset = this.Execute(storeProcedureName, null);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        subscriptionsList.Add(MapSubscriptionFromDataRow(row));
                    }
                }

                return subscriptionsList;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error fetching subscriptions: {ex.Message}");
            }
        }

        private Subscription MapSubscriptionFromDataRow(DataRow row)
        {
            Subscription subscription = new Subscription();
            subscription.ID = Convert.ToInt32(row["id"]);
            subscription.CompanyID = Convert.ToInt32(row["company_id"]);
            subscription.CardholderName = row["cardholder_name"].ToString();
            subscription.CardNumber = row["card_number"].ToString();
            subscription.ExpirationDate = Convert.ToDateTime(row["expiration_date"]);
            subscription.CVVCode = row["cvv_code"].ToString();
            subscription.SubscriptionDuration = Convert.ToInt32(row["subscription_duration"]);
            subscription.SubscriptionTotal = Convert.ToDecimal(row["subscription_total"]);
            subscription.CreatedAt = Convert.ToDateTime(row["created_at"]);
            subscription.UpdatedAt = Convert.ToDateTime(row["updated_at"]);
            subscription.UpdatedBy = row["updated_by"].ToString();
            subscription.IsDeleted = Convert.ToBoolean(row["is_deleted"]);

            return subscription;
        }



    }
}
