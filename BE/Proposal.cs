using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{

    public enum ProposalStatus
    {
        OPEN,
        PENDING,
        CLOSED,
        REJECTED
    }
    public class Proposal : PersistentEntity
    {
        public int ID { get; set; }
        public int RequestID { get; set; }
        public int UserRequestID { get; set; }
        public int AdvisorID { get; set; }
        public int PortfolioID { get; set; }
        public User Advisor { get; set; }
        public Portfolio Portfolio { get; set; }
        public Request Request { get; set; }
        public ProposalStatus Status { get; set; }
        public decimal TotalPrice { get; set; }
        public string Details { get; set; }

        public Proposal(
            int id,
            int requestId,
            int userRequestId,
            int advisorId,
            int portfolioId,
            User advisor,
            Portfolio portfolio,
            Request request,
            ProposalStatus status,
            decimal totalPrice,
            string details)
        {
            ID = id;
            RequestID = requestId;
            UserRequestID = userRequestId;
            AdvisorID = advisorId;
            PortfolioID = portfolioId;
            Advisor = advisor;
            Portfolio = portfolio;
            Request = request;
            Status = status;
            TotalPrice = totalPrice;
            Details = details;
        }
        public Proposal() { }

        public class PaginatedProposals
        {
            public int Page { get; set; }
            public int Total { get; set; }
            public int TotalPages { get; set; }
            public List<Proposal> Results { get; set; }

            public PaginatedProposals(int size, int offset, int totalRows)
            {
                this.Total = totalRows;
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
}    
