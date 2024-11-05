using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using static System.Net.Mime.MediaTypeNames;

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
            public int UserRequestID { get; set; }
            public int AdvisorID { get; set; }
            public int PortfolioID { get; set; }
            public string Message { get; set; }
            public User Advisor { get; set; }
            public Portfolio Portfolio { get; set; }
            public Request Request { get; set; }
            public ProposalStatus status { get; set; }
            public decimal TotalPrice { get; set; }
            public string Details { get; set; }

            public Proposal() { }
        //    public Proposal(int id, int requestId, int advisorId, int productId, string status, string state, string region, string propertyType, string currency, double price, string operationType, int? roomsNumber, int? squadMeters, int? coveredSquadMeters, int? bathrooms, int? garages, int? antiquityYears, int? floors, bool? petFriendly)
        //    {
        //        ID = id;
        //        UserRequestID = requestId;
        //        AdvisorID = advisorId;
        //        PortfolioID = productId;
        //        Status = status;
        //        State = state;
        //        Region = region;
        //        PropertyType = propertyType;
        //        Currency = currency;
        //        Price = price;
        //        OperationType = operationType;
        //        RoomsNumber = roomsNumber;
        //        SquadMeters = squadMeters;
        //        CoveredSquadMeters = coveredSquadMeters;
        //        Bathrooms = bathrooms;
        //        Garages = garages;
        //        AntiquityYears = antiquityYears;
        //        Floors = floors;
        //        PetFriendly = petFriendly;
        //    }
        //}

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
