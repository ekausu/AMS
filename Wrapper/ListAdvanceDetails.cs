using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.SessionState;

namespace AdvanceSystem.Wrapper
{
   public class ListAdvanceDetails
    {
        public int Reqid { get; set; }
         public string CurrentSalary { get; set; }
        public string AdvanceAmount { get; set; }
        public string RecoveryDuration { get; set; }
        public string Reason { get; set; }
		public string Entered
		{
			get;set;
		}
	//    public string Enteredby {
	//        get
	//        {
	//if(SessionStateUtility.)
	//            return Environment.UserName.ToString();
	//        }
	//    }
		public string AdvanceState { get; set; }

        public DateTime StartDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Rank { get; set; }
        public string EmployeeNumber { get; set; }
        public string Trade { get; set; }
		public string Station { get; set; }
		public string Appointment { get; set; }
		public string Email { get; set; }
		public string Phone { get; set; }
		public string Unit { get; set; }
        public string Section { get; set; }
        
        //************BELOW 40%
        public Below40 Below40 { get; set; }
        public string Reason40 { get; set; }

        //************************APPROVALS

        public string ApprovedBy { get; set; }
        public string AssignedTo { get; set; }
        public ApproveType Approved { get; set; }
       // public string Reason { get; set; }

    }

    public enum ApproveType
    {
        Approved,
        Rejected,
        Reassigned,
		Terminated
	}
public enum Below40
{
    Yes,
    No
}

}
