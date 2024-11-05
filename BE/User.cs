using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public enum Role
    {
        USER,
        ADVISOR,
        ADMINISTRATOR
    }
    public class User : PersistentEntity
    {
        public int ID;
        public string Username;
        public string Password;
        public string Email;
        public int LoginRetries;
        public bool IsBlocked;
        public DateTime? LastLogin;
        public List<Role> Roles;
        public int CompanyID;

        public User() { }
        public User(
            int id, string username, string password, string email, int loginRetries, bool isBlocked, DateTime lastLogin,
            DateTime createdAt, DateTime updatedAt, string updatedBy, bool isDeleted, List<Role> roles, int companyId)
        {
            this.ID = id;
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.LoginRetries = loginRetries;
            this.IsBlocked = isBlocked;
            this.LastLogin = lastLogin;
            this.CreatedAt = createdAt;
            this.UpdatedAt = updatedAt;
            this.UpdatedBy = updatedBy;
            this.IsDeleted = isDeleted;
            this.Roles = roles;
            this.CompanyID = companyId;
        }
    }
}
