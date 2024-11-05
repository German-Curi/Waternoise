using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;
namespace BLL
{
    public class CompanyBLL
    {
        CompanySQLServerDAL mapCompany = new CompanySQLServerDAL();
        UserSQLServerDAL mapUser = new UserSQLServerDAL();
        public Company Create(User user, Company company)
        {
            try
            {
                Company createdCompany = mapCompany.Create(company, user);
                return createdCompany;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Company Update(Company company, string token)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);
                Company updateCompany = mapCompany.Update(company, user);
                return updateCompany;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Company GetByID(int id)
        {
            try
            {
                return mapCompany.GetByID(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
