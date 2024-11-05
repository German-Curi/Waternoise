using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;

namespace DAL
{
    public class UserSQLServerDAL : AbstractSQLDAL
    {
        public User Create(User user, User creator)
        {
            try
            {
                string storeProcedureName = "users_create";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                new SqlParameter() { ParameterName = "@username", SqlDbType = SqlDbType.VarChar, Value = user.Username},
                new SqlParameter() { ParameterName = "@password", SqlDbType = SqlDbType.VarChar, Value = user.Password},
                new SqlParameter() { ParameterName = "@email", SqlDbType = SqlDbType.VarChar, Value = user.Email},
                new SqlParameter() { ParameterName = "@retries", SqlDbType = SqlDbType.Int, Value = 0},
                new SqlParameter() { ParameterName = "@is_blocked", SqlDbType = SqlDbType.Bit, Value = 0},
                new SqlParameter() { ParameterName = "@last_login", SqlDbType = SqlDbType.DateTime, Value = DBNull.Value},
                new SqlParameter() { ParameterName = "@created_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = creator.Username}
            };
                if (user.Roles.Contains(Role.ADVISOR))
                {
                    parameters.Add(new SqlParameter()
                    {
                        ParameterName = "company_id",
                        SqlDbType = SqlDbType.Int,
                        Value = -1
                    });
                }
                else
                {
                    parameters.Add(new SqlParameter()
                    {
                        ParameterName = "company_id",
                        SqlDbType = SqlDbType.Int,
                        Value = 0
                    });
                }

                this.Execute(storeProcedureName, parameters);
                return this.GetByUsername(user.Username);
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627)
                {
                    throw new UsernameAlreadyExistsException($@"Username {user.Username} already exists.");
                }
                throw ex;
            }
        }

        public User GetByID(int id, bool fetchDeleted = false)
        {
            User user = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "users_get_by_id";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.VarChar, Value = id},
            };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        user = MapUserFromDataRow(row);
                    }
                }

                if (user is null || (!fetchDeleted & user.IsDeleted))
                    throw new UserNotFoundException($"User with id {id} was not found.");
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public User GetByUsername(string username, bool fetchDeleted = false)
        {
            User user = null;
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedure = "users_get_by_username";

                List<SqlParameter> parameters = new List<SqlParameter>() {
                new SqlParameter() { ParameterName = "@username", SqlDbType = SqlDbType.VarChar, Value = username},
            };

                dataset = this.Execute(storeProcedure, parameters);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        user = MapUserFromDataRow(row);
                    }
                }

                if (user is null || (!fetchDeleted & user.IsDeleted))
                    throw new UserNotFoundException($"User with username {username} was not found.");
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IList<User> GetAvailableUsers()
        {
            List<User> usersList = new List<User>();
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "users_get_available_users";

                dataset = this.Execute(storeProcedureName, null);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        usersList.Add(MapUserFromDataRow(row));
                    }
                }

                return usersList;
            }
            catch (Exception ex)
            {
                throw new UserRepositoryException(ex.Message);
            }
        }

        public IList<User> GetAll()
        {
            List<User> usersList = new List<User>();
            try
            {
                DataSet dataset = new DataSet();
                string storeProcedureName = "users_get_all";

                dataset = this.Execute(storeProcedureName, null);
                if (dataset.Tables[0].Rows.Count > 0)
                {
                    foreach (DataRow row in dataset.Tables[0].Rows)
                    {
                        usersList.Add(MapUserFromDataRow(row));
                    }
                }

                return usersList;
            }
            catch (Exception ex)
            {
                throw new UserRepositoryException(ex.Message);
            }
        }

        public User Update(User user, User updator)
        {
            string storeProcedureName = "users_update";

            List<SqlParameter> parameters = new List<SqlParameter>() {
                new SqlParameter() { ParameterName = "@id", SqlDbType = SqlDbType.VarChar, Value = user.ID},
                new SqlParameter() { ParameterName = "@username", SqlDbType = SqlDbType.VarChar, Value = user.Username},
                new SqlParameter() { ParameterName = "@email", SqlDbType = SqlDbType.VarChar, Value = user.Email},
                new SqlParameter() { ParameterName = "@password", SqlDbType = SqlDbType.VarChar, Value = user.Password},
                new SqlParameter() { ParameterName = "@retries", SqlDbType = SqlDbType.Int, Value = user.LoginRetries},
                new SqlParameter() { ParameterName = "@is_blocked", SqlDbType = SqlDbType.Bit, Value = user.IsBlocked},
                new SqlParameter() { ParameterName = "@updated_at", SqlDbType = SqlDbType.DateTime, Value = DateTime.Now},
                new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = updator.Username},
                new SqlParameter() { ParameterName = "@is_deleted", SqlDbType = SqlDbType.Bit, Value = user.IsDeleted}
        };

            if (user.LastLogin != null)
            {
                parameters.Add(new SqlParameter() { ParameterName = "@last_login", SqlDbType = SqlDbType.DateTime, Value = user.LastLogin });
            }
            else
            {
                parameters.Add(new SqlParameter() { ParameterName = "@last_login", SqlDbType = SqlDbType.DateTime, Value = DBNull.Value });
            }

            this.Execute(storeProcedureName, parameters);
            return this.GetByUsername(user.Username);
        }

        public User Delete(User user, User deletor)
        {
            try
            {
                string storeProcedureName = "users_delete";
                List<SqlParameter> parameters = new List<SqlParameter>() {
                new SqlParameter() { ParameterName = "@username", SqlDbType = SqlDbType.VarChar, Value = user.Username},
                new SqlParameter() { ParameterName = "@updated_by", SqlDbType = SqlDbType.VarChar, Value = deletor.Username}
            };

                this.Execute(storeProcedureName, parameters);
                return user;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public bool UsernameExists(string username)
        {
            return this.GetByUsername(username) != null;
        }

        private User MapUserFromDataRow(DataRow row)
        {
            User user = new User();
            user.ID = Convert.ToInt32(row["id"]);
            user.Username = row["username"].ToString();
            user.Password = row["password"].ToString();
            user.Email = row["email"].ToString();
            user.LoginRetries = Convert.ToInt32(row["retries"]);
            user.IsBlocked = Convert.ToBoolean(row["is_blocked"]);
            if (row["last_login"] != DBNull.Value)
                user.LastLogin = Convert.ToDateTime(row["last_login"]);
            else
                user.LastLogin = null;
            user.CreatedAt = Convert.ToDateTime(row["created_at"]);
            user.UpdatedAt = Convert.ToDateTime(row["updated_at"]);
            user.UpdatedBy = row["updated_by"].ToString();
            user.IsDeleted = Convert.ToBoolean(row["is_deleted"]);

            List<Role> userRoles = new List<Role>();
            user.CompanyID = Convert.ToInt32(row["company_id"]);
            bool isAdmin = Convert.ToBoolean(row["is_admin"]);
            if (user.CompanyID != 0)
                userRoles.Add(Role.ADVISOR);
            else
                userRoles.Add(Role.USER);

            if (isAdmin)
                userRoles.Add(Role.ADMINISTRATOR);

            user.Roles = userRoles;

            return user;
        }
    }

    public class UserRepositoryException : Exception
    {
        public UserRepositoryException()
        { }

        public UserRepositoryException(string message)
            : base(message)
        { }

        public UserRepositoryException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }

    public class UsernameAlreadyExistsException : UserRepositoryException
    {
        public UsernameAlreadyExistsException()
        { }

        public UsernameAlreadyExistsException(string message)
            : base(message)
        { }

        public UsernameAlreadyExistsException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }

    public class UserNotFoundException : UserRepositoryException
    {
        public UserNotFoundException()
        { }

        public UserNotFoundException(string message)
            : base(message)
        { }

        public UserNotFoundException(string message, Exception innerException)
            : base(message, innerException)
        { }
    }
}
