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
        public int ID { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public int LoginRetries { get; set; }
        public bool IsBlocked { get; set; }
        public DateTime? LastLogin { get; set; }
        public List<Role> Roles { get; set; }
        public int CompanyID { get; set; }

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
