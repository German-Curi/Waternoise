using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BE;
using DAL;

namespace BLL
{
    public class PortfolioBLL
    {
        PortfolioSQLServerDAL mapPortfolio = new PortfolioSQLServerDAL();
        UserSQLServerDAL mapUser = new UserSQLServerDAL();
        ProductsSQLServerDAL mapProduct= new ProductsSQLServerDAL();

        public Portfolio CreatePortfolio(Portfolio portfolio, string token)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);
                return mapPortfolio.Create(portfolio, user);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public Portfolio GetPortfolioByID(int id)
        {
            try
            {
                return mapPortfolio.GetByID(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedPortfolios GetPortfoliosByUserID(string token, int offset, int size, string searchTitle, string orderByColumn, string orderByOrder)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);

                return mapPortfolio.GetByUserID(user.ID, size, offset, searchTitle, orderByColumn, orderByOrder);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Product CreateProduct(Product product, string token)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);

                return mapProduct.Create(product, user);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Product GetProductByID(int id)
        {
            try
            {
                return mapProduct.GetByID(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Product> ProductsGetByPortfolioId(int portfolioId)
        {
            try
            {
                return mapProduct.ProductsGetByPortfolioId(portfolioId);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
