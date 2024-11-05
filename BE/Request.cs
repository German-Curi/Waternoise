using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public enum RequestStatus
    {
        OPEN,
        PENDING,
        CLOSED,
        REJECTED
    }
    public class Request : PersistentEntity
    {
        public int ID { get; set; }
        public int UserId { get; set; }
        public RequestStatus Status { get; set; }
        public string NameRequest { get; set; }
        public string ProblemType { get; set; }
        public string Description { get; set; }
        public string TechnicalFeatures { get; set; }
        public string AffectedWater { get; set; }
        public string Location { get; set; }
        public string Currency { get; set; }
        public decimal MinPrice { get; set; }
        public decimal MaxPrice { get; set; }

        public Request() { }

        public Request(int id, int userId, RequestStatus status, string nameRequest, string problemType, string description,
                       string technicalFeatures, string affectedWater, string location, string currency, decimal minPrice,
                       decimal maxPrice, DateTime createdAt, DateTime updatedAt, string updatedBy, bool isDeleted)
        {
            ID = id;
            UserId = userId;
            Status = status;
            NameRequest = nameRequest;
            ProblemType = problemType;
            Description = description;
            TechnicalFeatures = technicalFeatures;
            AffectedWater = affectedWater;
            Location = location;
            Currency = currency;
            MinPrice = minPrice;
            MaxPrice = maxPrice;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
            UpdatedBy = updatedBy;
            IsDeleted = isDeleted;
        }
    }
    public class PaginatedRequests
    {
        public int Page { get; set; }
        public int TotalPages { get; set; }
        public List<Request> Results { get; set; }

        public PaginatedRequests(int size, int offset, int totalRows)
        {
            if (size > totalRows)
                this.TotalPages = 1;
            else
                this.TotalPages = totalRows / size;

            decimal page = 1;
            if (offset != 0)
                page = (totalRows - (totalRows - (offset + size))) / size;
            this.Page = Convert.ToInt32(Math.Floor(page));
        }
    }
}
