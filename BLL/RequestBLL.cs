using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RequestBLL
    {
        UserSQLServerDAL mapUser = new UserSQLServerDAL();
        RequestSQLServerDAL mapRequest = new RequestSQLServerDAL();
        public Request Create(Request request, string token)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);
                Request createdRequest = mapRequest.Create(request, user);
                return createdRequest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Request Update(int id, RequestStatus status)
        {
            try
            {
                Request createdRequest = mapRequest.Update(id, status);
                return createdRequest;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Request GetByID(int id)
        {
            try
            {
                Request request = mapRequest.GetByID(id);
                return request;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedRequests GetUserRequestsByUserID(string token, int offset, int size, string orderByColumn, string orderByOrder)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);

                return mapRequest.GetUserRequestsByUserID(user.ID, size, offset, orderByColumn, orderByOrder);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public PaginatedRequests GetAllPaginatedRequests(int size = 10, int offset = 0, List<string> status = null, List<string> location = null,
        List<string> usernames = null, string orderByColumn = null, string orderByOrder = null, DateTime? fromDate = null, DateTime? toDate = null)
        {
            try
            {
                return mapRequest.GetAllPaginatedRequests(size, offset, status, location, usernames, orderByColumn, orderByOrder, fromDate, toDate);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    } 
}
