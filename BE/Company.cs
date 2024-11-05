using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Company : PersistentEntity
    {
        public int ID { get; set; }
        public string BusinessName { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string ContactNumber { get; set; }

        public Company() { }
        public Company(int id, string businessName, string email, string address, string contactNumber,
            DateTime createdAt, DateTime updatedAt, string updatedBy, bool isDeleted)
        {
            ID = id;
            BusinessName = businessName;
            Email = email;
            Address = address;
            ContactNumber = contactNumber;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            UpdatedBy = updatedBy;
            IsDeleted = isDeleted;
        }

    }
}
