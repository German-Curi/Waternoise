using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Product : PersistentEntity
    {
        public int ID { get; set; }
        public int PortfolioID { get; set; }
        public int CompanyID { get; set; }
        public string Name { get; set; }
        public string ProblemType { get; set; }
        public string TechnicalFeatures { get; set; }
        public string Currency { get; set; }
        public double Price { get; set; }
        public string WarrantyPeriod { get; set; }
    }

    public class PaginatedProducts
    {
        public int Page { get; set; }
        public int TotalPages { get; set; }
        public List<Product> Results { get; set; }

        public PaginatedProducts(int size, int offset, int totalRows)
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
