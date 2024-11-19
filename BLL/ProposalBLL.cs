using BE;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
