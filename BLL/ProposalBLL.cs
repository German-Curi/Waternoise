using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static BE.Proposal;

namespace BLL
{
    public class ProposalBLL
    {
        UserSQLServerDAL mapUser = new UserSQLServerDAL();
        ProposalSQLServerDAL mapProposal = new ProposalSQLServerDAL();
        public Proposal Create(Proposal proposal, string token)
        {
            try
            {
                int userId = Convert.ToInt32(token);
                User user = mapUser.GetByID(userId);
                Proposal createProposal = mapProposal.Create(proposal, user);
                return createProposal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateProposalStatus(int requestId, int advisorId, string newStatus, User updater)
        {
            try
            {
                mapProposal.UpdateProposalStatus(requestId, advisorId, newStatus, updater);
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }
        public Proposal GetByID(int id)
        {
            try
            {
                Proposal proposal = mapProposal.GetByID(id);
                return proposal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Proposal GetByRequestID(int requestID,int advisorID)
        {
            try
            {
                Proposal proposal = mapProposal.GetByRequestID(requestID, advisorID);
                return proposal;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public PaginatedProposals GetAllPaginatedProposals(int size = 10, int offset = 0, int? advisorID = null, int? userRequestID = null, List<string> status = null, string orderByColumn = null, string orderByOrder = null)
        {
            try
            {
                return mapProposal.GetAllPaginatedProposals(size, offset, advisorID, userRequestID, status, orderByColumn, orderByOrder);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
