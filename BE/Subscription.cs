using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Subscription : PersistentEntity
    {
        public int ID { get; set; }
        public int CompanyID { get; set; }
        public string CardholderName { get; set; }
        public string CardNumber { get; set; }
        public DateTime ExpirationDate { get; set; }
        public string CVVCode { get; set; }
        public int SubscriptionDuration { get; set; }
        public decimal SubscriptionTotal { get; set; }
        public Subscription() { }

        public Subscription(
            int id, int companyId, string cardholderName, string cardNumber, DateTime expirationDate,
            string cvvCode, int subscriptionDuration, decimal subscriptionTotal,
            DateTime createdAt, DateTime updatedAt, string updatedBy, bool isDeleted)
        {
            this.ID = id;
            this.CompanyID = companyId;
            this.CardholderName = cardholderName;
            this.CardNumber = cardNumber;
            this.ExpirationDate = expirationDate;
            this.CVVCode = cvvCode;
            this.SubscriptionDuration = subscriptionDuration;
            this.SubscriptionTotal = subscriptionTotal;
            this.CreatedAt = createdAt;
            this.UpdatedAt = updatedAt;
            this.UpdatedBy = updatedBy;
            this.IsDeleted = isDeleted;
        }
    }
}
