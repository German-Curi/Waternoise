using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Portfolio : PersistentEntity
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public User Owner { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public List<Product> Content;
    }

    public class PaginatedPortfolios
    {
        public int Page { get; set; }
        public int TotalPages { get; set; }
        public List<Portfolio> Results { get; set; }

        public PaginatedPortfolios(int size, int offset, int totalRows)
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
