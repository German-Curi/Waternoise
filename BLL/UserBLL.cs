using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;
using Service;

namespace BLL
{
    public class UserBLL
    {
        UserSQLServerDAL mapUser = new UserSQLServerDAL();
        public User Create(User user)
        {
            try
            {
                User createdUser = mapUser.Create(user, user);
                return createdUser;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public User GetByUsername(string username)
        {
            try
            {
                return mapUser.GetByUsername(username);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public User GetByID(int id)
        {
            try
            {
                return mapUser.GetByID(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private User UpdateUserLastLogin(User user)
        {
            try
            {
                user.LastLogin = DateTime.Now;
                user.LoginRetries = 0;
                mapUser.Update(user, user);
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public User Login(string pUsername, string pPassword)
        {
            try
            {
                User user = this.GetByUsername(pUsername);

                if (!Cryptography.Hash(pPassword).Equals(user.Password))
                {
                    user.LoginRetries++;
                    if (user.LoginRetries == 3)
                        user.IsBlocked = true;
                    mapUser.Update(user, user);
                    throw user.IsBlocked ?
                        new Exception("The user is blocked after 3 failed login attempts.") :
                        throw new Exception("Invalid credentials");
                }

                if (user.IsBlocked)
                    throw new Exception("The user is blocked after 3 failed login attempts.");

                user = this.UpdateUserLastLogin(user);
                return user;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
