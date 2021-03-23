using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvanceSystem.Wrapper
{
    public class ListAdvanceClear
    {
        public string Reqid { get; set; }
        public string Date { get; set; }
        public string EmployeeNumber {get;set;}
        public string Enteredby { get; set; }
        public int Amount { get; set; }
        public int TotalAmount { get; set; }
        public float Balance { get; set; }
        public int id { get; set; }
		//***************************************************
		public string PaidBy { get; set; }
		public string Name { get; set; }
		public string NewBalance { get; set; }

	}
}