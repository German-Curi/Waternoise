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
    public class RequestSQLServerDAL : AbstractSQLDAL
    {
        public Request Create(Request request, User creator)
        {
            try
            {
                string storeProcedureName = "user_requests_create";
                List<SqlParameter> parameters = new List<SqlParameter>()
        {
            new SqlParameter() { ParameterName = "@user_id", SqlDbType = SqlDbType.Int, Value = creator.ID },
            new SqlParameter() { ParameterName = "@status", SqlDbType = SqlDbType.VarChar, Value = request.Status.ToString() },
            new SqlParameter() { ParameterName = "@name_request", SqlDbType = SqlDbType.VarChar, Value = request.NameRequest },
            new SqlParameter() { ParameterName = "@problem_type", SqlDbType = SqlDbType.VarChar, Value = request.ProblemType },
            new SqlParameter() { ParameterName = "@description", SqlDbType = SqlDbType.VarChar, Value = request.Description },
            new SqlParameter() { ParameterName = "@technical_features", SqlDbType = SqlDbType.VarChar, Value = request.TechnicalFeatures },
            new SqlParameter() { ParameterName = "@affected_water", SqlDbType = SqlDbType.VarChar, Value = request.AffectedWater },
            new SqlParameter() { ParameterName = "@location", SqlDbType = SqlDbType.VarChar, Value = request.Location },
            new SqlParameter() { ParameterName = "@currency", SqlDbType = SqlDbType.VarChar, Value = request.Currency },
            new SqlParameter() { ParameterName = "@min_price", SqlDbType = SqlDbType.Decimal, Value = (object)request.MinPrice ?? DBNull.Value },
            new SqlParameter() { ParameterName = "@max_price", SqlDbType = SqlDbType.Decimal, Value = request.MaxPrice },
            new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
            new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now },
            new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username },
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

        public Request GetByID(int id, bool fetchDeleted = false)
        {
            Request entity = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "user_requests_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.VarChar, Value = id},
                };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        entity = MapUserRequestFromDataRow(row);
                    }
                }

                if (entity is null || (!fetchDeleted & entity.IsDeleted))
                    throw new UserNotFoundException($"Request with id {id} was not found.");
                return entity;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedRequests GetUserRequestsByUserID(int userID, int size, int offset, string orderByColumn = null, string orderByOrder = null)
        {
            PaginatedRequests paginatedUserRequests = null;
            List<Request> userRequestsList = new List<Request>();

            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "user_requests_get_by_user_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@user_id", SqlDbType = SqlDbType.Int, Value = userID },
                    new SqlParameter() { ParameterName = "@size", SqlDbType = SqlDbType.Int, Value = size },
                    new SqlParameter() { ParameterName = "@offset", SqlDbType = SqlDbType.Int, Value = offset },
                    new SqlParameter() { ParameterName = "@order_by_column", SqlDbType = SqlDbType.VarChar, Value = orderByColumn },
                    new SqlParameter() { ParameterName = "@order_by_order", SqlDbType = SqlDbType.VarChar, Value = orderByOrder }
                };

                dataset = this.Execute(storeProcedureName, parameters);

                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        if (paginatedUserRequests == null)
                            paginatedUserRequests = new PaginatedRequests(size, offset, Convert.ToInt32(row["total_rows"]));

                        Request userRequest = this.MapUserRequestFromDataRow(row);
                        userRequestsList.Add(userRequest);
                    }
                }

                if (paginatedUserRequests == null)
                    paginatedUserRequests = new PaginatedRequests(size, offset, 0);

                paginatedUserRequests.Results = userRequestsList;
                return paginatedUserRequests;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedRequests GetAllPaginatedRequests(int size = 10, int offset = 0, List<string> status = null, List<string> locations = null,
            List<string> usernames = null, string orderByColumn = null, string orderByOrder = null, DateTime? fromDate = null, DateTime? toDate = null)
        {
            PaginatedRequests paginatedRequests = null;
            List<Request> requestsList = new List<Request>();
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "user_requests_get_all";

                // Prepara los DataTables para los filtros
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

                DataTable locationList = new DataTable();
                locationList.Columns.Add("location", typeof(String));
                if (locations != null)
                {
                    foreach (string location in locations)
                    {
                        DataRow dr = locationList.NewRow();
                        dr["location"] = location;
                        locationList.Rows.Add(dr);
                    }
                }

                DataTable usernamesList = new DataTable();
                usernamesList.Columns.Add("usernames", typeof(String));
                if (usernames != null)
                {
                    foreach (string username in usernames)
                    {
                        DataRow dr = usernamesList.NewRow();
                        dr["usernames"] = username;
                        usernamesList.Rows.Add(dr);
                    }
                }

                // Configura los parámetros para el SP
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@size", SqlDbType = SqlDbType.Int, Value = size },
                    new SqlParameter() { ParameterName = "@offset", SqlDbType = SqlDbType.Int, Value = offset },
                    new SqlParameter() { ParameterName = "@usernames", SqlDbType = SqlDbType.Structured, Value = usernamesList },
                    new SqlParameter() { ParameterName = "@status", SqlDbType = SqlDbType.Structured, Value = statusList },
                    new SqlParameter() { ParameterName = "@location", SqlDbType = SqlDbType.Structured, Value = locationList },
                    new SqlParameter() { ParameterName = "@order_by_column", SqlDbType = SqlDbType.VarChar, Value = orderByColumn },
                    new SqlParameter() { ParameterName = "@order_by_order", SqlDbType = SqlDbType.VarChar, Value = orderByOrder }
                };

                if (fromDate != null)
                    parameters.Add(new SqlParameter() { ParameterName = "@from_date", SqlDbType = SqlDbType.DateTime, Value = fromDate });
                else
                    parameters.Add(new SqlParameter() { ParameterName = "@from_date", SqlDbType = SqlDbType.DateTime, Value = DBNull.Value });

                if (toDate != null)
                    parameters.Add(new SqlParameter() { ParameterName = "@to_date", SqlDbType = SqlDbType.DateTime, Value = toDate });
                else
                    parameters.Add(new SqlParameter() { ParameterName = "@to_date", SqlDbType = SqlDbType.DateTime, Value = DBNull.Value });

                dataset = this.Execute(storeProcedureName, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        if (paginatedRequests == null)
                            paginatedRequests = new PaginatedRequests(size, offset, Convert.ToInt32(row["total_rows"]));
                        Request req = this.MapUserRequestFromDataRow(row);
                        requestsList.Add(req);
                    }
                }
                if (paginatedRequests == null)
                    paginatedRequests = new PaginatedRequests(size, offset, 0);

                paginatedRequests.Results = requestsList;
                return paginatedRequests;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Request Update(int id, RequestStatus status)
        {
            try
            {
                string storeProcedureName = "user_requests_update";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                    new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.Int, Value = id},
                    new SqlParameter() { ParameterName = "@status", SqlDbType = SqlDbType.VarChar, Value = status}
                };

                DataSet dataset = this.Execute(storeProcedureName, parameters);
                return this.GetByID(id);
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        private Request MapUserRequestFromDataRow(DataRow row)
        {
            Request entity = new Request
            {
                ID = Convert.ToInt32(row["id"]),
                UserId = Convert.ToInt32(row["user_id"]),
                Status = Enum.TryParse(row["status"].ToString(), out RequestStatus status) ? status : RequestStatus.OPEN,
                NameRequest = row["name_request"].ToString(),
                ProblemType = row["problemType"].ToString(),
                Description = row["description"].ToString(),
                TechnicalFeatures = row["technicalFeatures"].ToString(),
                AffectedWater = row["affected_water"].ToString(),
                Location = row["location"].ToString(),
                Currency = row["currency"].ToString(),
                MinPrice =  Convert.ToDecimal(row["min_price"]),
                MaxPrice = Convert.ToDecimal(row["max_price"]),
                CreatedAt = Convert.ToDateTime(row["created_at"]),
                UpdatedAt = Convert.ToDateTime(row["updated_at"]),
                UpdatedBy = row["updated_by"].ToString(),
                IsDeleted = Convert.ToBoolean(row["is_deleted"])
            };
            return entity;
        }


    }
}
