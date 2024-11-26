using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class SubscriptionBLL
    {
        SubscriptionSQLServerDAL mapsubs = new SubscriptionSQLServerDAL();
        public Subscription Create(Subscription subscription, User user)
        {
            try
            {
                Subscription createdSub = mapsubs.Create(subscription, user.Username);
                return createdSub;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Subscription GetByID(int id)
        {
            try
            {
                return mapsubs.GetByID(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Subscription> GetAll()
        {
            try
            {
                List<Subscription> subscriptions = mapsubs.GetAll();
                return subscriptions;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<Subscription> GetByCompanyID(int companyid)
        {
            try
            {
                List<Subscription> subscriptions = mapsubs.GetByCompanyID(companyid);
                return subscriptions;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
