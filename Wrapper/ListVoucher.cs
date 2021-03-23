using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvanceSystem.Wrapper
{
    public class ListVoucher
    {
		public List<VoucherTable> VTable = new List<VoucherTable>();
		public List<VoucherTable> Voucher
		{
			get
			{
				return VTable;
			}
			set
			{
				VTable = value;
			}
		}

		public string Reqid { get; set; }
        public string vid { get; set; }
        public string UserName { get; set; }

        public string AccountType { get; set; }
        public string Department { get; set; }
        public string Station { get; set; }
        public string Ministry { get; set; }
        public string Function { get; set; }
        public string Head { get; set; }
        public string Dept { get; set; }
        public string Unit { get; set; }
        public string AccountingOfficer { get; set; }
        public string Programme { get; set; }
        public string Subsidiary { get; set; }
        public string Amount { get; set; }
        public string Payee { get; set; }
        public string Name { get; set; }
		public string Code { get; set; }
		public string Address { get; set; }
        public string Authorities { get; set; }
        public string Description { get; set; }
        public string Date { get; set; }
		public string Activity { get; set; }
		public string AccountCode { get; set; }
		public int Debit { get; set; }
		public string EmployeeNumber { get; set; }
        public string Total { get; set; }
        public string Title { get; set; }
    }
	public class VoucherTable
	{
	    public string Function { get; set; }
		public string Head { get; set; }
		public string Dept { get; set; }
		public string Unit { get; set; }
		public string AccountingOfficer { get; set; }
		public string Programme { get; set; }
		public string Subsidiary { get; set; }
		public string Amount { get; set; }
		public string Activity { get; set; }
		public string AccountCode { get; set; }
		public int Debit { get; set; }
	}
}