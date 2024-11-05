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
    public class ProductsSQLServerDAL : AbstractSQLDAL
    {
        public Product Create(Product product, User creator)
        {
            try
            {
                string storeProcedureName = "products_create";
                List<SqlParameter> parameters = new List<SqlParameter>()
                {
                    new SqlParameter() { ParameterName = "@portfolio_id", SqlDbType = SqlDbType.Int, Value = product.PortfolioID },
                    new SqlParameter() { ParameterName = "@company_id", SqlDbType = SqlDbType.Int, Value = product.CompanyID },
                    new SqlParameter() { ParameterName = "@name_product", SqlDbType = SqlDbType.VarChar, Value = product.Name },
                    new SqlParameter() { ParameterName = "@problemType", SqlDbType = SqlDbType.VarChar, Value = product.ProblemType },
                    new SqlParameter() { ParameterName = "@technicalFeatures", SqlDbType = SqlDbType.VarChar, Value = product.TechnicalFeatures },
                    new SqlParameter() { ParameterName = "@currency", SqlDbType = SqlDbType.VarChar, Value = product.Currency },
                    new SqlParameter() { ParameterName = "@price", SqlDbType = SqlDbType.Decimal, Value = product.Price },
                    new SqlParameter() { ParameterName = "@warrantyPeriod", SqlDbType = SqlDbType.VarChar, Value = product.WarrantyPeriod },
                    new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
                    new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username }
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

        public Product GetByID(int id, bool fetchDeleted = false)
        {
            Product product = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "products_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                       new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.Int, Value = id},
                };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        product = MapProductFromDataRow(row);
                    }
                }
                return product;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Product> ProductsGetByPortfolioId(int idPorfolio)
        {
            try
            {
                Product product = new Product();
                List<Product> listProducts = new List<Product>();
                DataSet dataset = new DataSet();
                string storeProcedure = "products_get_by_portfolio_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                       new SqlParameter() { ParameterName = "@portfolio_id", SqlDbType = SqlDbType.Int, Value = idPorfolio},
                };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        product = MapProductFromDataRow(row);
                        listProducts.Add(product);
                    }
                }
                return listProducts;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private Product MapProductFromDataRow(DataRow row)
        {
            Product product = new Product();

            product.ID = Convert.ToInt32(row["id"]);
            product.PortfolioID = Convert.ToInt32(row["portfolio_id"]);
            product.CompanyID = Convert.ToInt32(row["IDcompany"]);
            product.Name = row["name_product"].ToString();
            product.ProblemType = row["problemType"].ToString();
            product.TechnicalFeatures = row["technicalFeatures"].ToString();
            product.Currency = row["currency"].ToString();
            product.Price = Convert.ToDouble(row["price"]);
            product.WarrantyPeriod = row["warrantyPeriod"].ToString();

            product.CreatedAt = Convert.ToDateTime(row["created_at"]);
            product.UpdatedAt = Convert.ToDateTime(row["updated_at"]);
            product.UpdatedBy = row["updated_by"].ToString();
            product.IsDeleted = Convert.ToBoolean(row["is_deleted"]);

            return product;
        }


    }
}
