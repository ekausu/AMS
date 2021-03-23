using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using System.Collections;

using System.ComponentModel;

using System.Data;

using System.Drawing;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;

namespace AdvanceSystem
{
	public partial class PDF_Filler : System.Web.UI.Page
	{
		BusinessLogic bl = new BusinessLogic();
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (!IsPostBack)
				
			//	Create();
			//FillForm();
		}

		public void CreateCashReceipt(ListAdvanceClear cle)
		{
			try
			{
				string filename = "cash receipt" + cle.Reqid + ".pdf";// "cash receipt.pdf"; "cash receipt" + c.Reqid + ".pdf";
			// string.Concat(Guid.NewGuid().ToString(), ".pdf");
			    PdfReader pdfReader = new PdfReader(Server.MapPath(@"cash receipt.pdf"));

				using (FileStream stream = new FileStream(string.Concat(Server.MapPath("~/Barcode Images/"), filename), FileMode.Create))
				{
					PdfStamper pdfStamper = new PdfStamper(pdfReader, stream);

					AcroFields pdfFormFields = pdfStamper.AcroFields;

					pdfFormFields.SetField("TxtFrm", cle.PaidBy);
					pdfFormFields.SetField("TxtFor", cle.Name+" "+cle.EmployeeNumber);
					pdfFormFields.SetField("TxtBy", cle.Enteredby);

					pdfFormFields.SetField("TxtBalance", cle.Balance.ToString());
					pdfFormFields.SetField("TxtPaid", cle.TotalAmount.ToString());
					pdfFormFields.SetField("TxtTotal", cle.TotalAmount.ToString());
						pdfFormFields.SetField("TxtNewBalance", (float.Parse(cle.NewBalance) - float.Parse(cle.TotalAmount.ToString())).ToString());
						pdfFormFields.SetField("TxtDate", cle.Date);
					pdfFormFields.SetField("TxtCode", Guid.NewGuid().ToString());
					pdfFormFields.SetField("Txtid", "00"+cle.Reqid);

					pdfStamper.FormFlattening = true;
					pdfStamper.Close();
					Session["Receipt"] = true;
					//string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", filename));
					//ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);
				}
		}
			catch (Exception ex)
			{
				//lblMessage.Text = ex.Message;
				return;
			}
}
		public void Create(ListVoucher v)
		{
			//try
			//{
				string filename = "invoice"+v.Reqid+".pdf";// string.Concat(Guid.NewGuid().ToString(), ".pdf");
				PdfReader pdfReader = new PdfReader(Server.MapPath(@"invoice.pdf"));

				using (FileStream stream = new FileStream(string.Concat(Server.MapPath("~/Barcode Images/"), filename), FileMode.Create))
				{
					PdfStamper pdfStamper = new PdfStamper(pdfReader, stream);

				//*********************Images***********************
				//var pdfContentByte = pdfStamper.GetOverContent(1);
				//iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(Server.MapPath(@"watermark.png"));
				////image.Transparency = 10;
				//image.ScaleToFit(200f,200f);
				//image.SetAbsolutePosition(70, 50);
				//pdfContentByte.AddImage(image);
				////...
				//PdfContentByte canvas = writer.getDirectContentUnder();
				//iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(Server.MapPath(@"watermark.png"));
				//image.SetAbsolutePosition(0, 0);
				//pdfContentByte.SaveState();
				//PdfGState state = new PdfGState();
				//state.setFillOpacity(0.6f);
				////pdfContentByte.SetGrayFill();
				//canvas.setGState(state);
				//canvas.addImage(image);
				//canvas.restoreState();

				//*********************************************

				AcroFields pdfFormFields = pdfStamper.AcroFields;

					VoucherTable(v,pdfFormFields);
					pdfFormFields.SetField("TxtAccType", v.AccountType);
					pdfFormFields.SetField("TxtDeprtment", v.Department);
					pdfFormFields.SetField("TxtStation", v.Station);
					pdfFormFields.SetField("TxtMinistry", v.Ministry);
					pdfFormFields.SetField("TxtRefNo", v.Reqid);
					pdfFormFields.SetField("TxtChqueNo", "");
					pdfFormFields.SetField("TxtChqDate", v.Date);
					pdfFormFields.SetField("TxtPayee", v.Payee);
					pdfFormFields.SetField("TxtRName", v.Name);
					pdfFormFields.SetField("TxtAddress",v.Address);
					pdfFormFields.SetField("TxtAuthorities", v.Authorities);
					pdfFormFields.SetField("TxtDescription", v.Description);
					pdfFormFields.SetField("TxtAmount", v.Amount);
					pdfFormFields.SetField("TxtTotal", v.Total);
					pdfFormFields.SetField("TxtReceivedSignatur", string.Concat(Guid.NewGuid().ToString(),v.Payee));
					pdfFormFields.SetField("TxtReceivedDate", DateTime.Now.ToString());
					pdfFormFields.SetField("TxtSig1", string.Concat(Guid.NewGuid().ToString(), v.Name));
					pdfFormFields.SetField("TxtTitle", v.Title);
					pdfFormFields.SetField("TxtDate", v.Date);
					pdfFormFields.SetField("TxtCompiledBy", v.Name);
					pdfFormFields.SetField("TxtCreatedBy", v.Name+"(" + Guid.NewGuid().ToString() +")");
					pdfFormFields.SetField("TxtSig2", v.Code);

				pdfStamper.FormFlattening = true;
					pdfStamper.Close();
					Session["Voucher"] = true;
					//string script = string.Format("window.open('{0}');", string.Concat("/Barcode Images/", filename));
					//ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);
			}
			//Watermark(filename);

			//}
			//catch (Exception ex)
			//{
			//	//lblMessage.Text = ex.Message;
			//}
		}
		void VoucherTable(ListVoucher v, AcroFields pdfFormFields)
		{
			int i= 1;
			int x = 1;
			//VoucherTable vt = new VoucherTable();
			foreach (VoucherTable vt in v.VTable)
			{
				if (vt.Debit == 1)
				{
					SetFieldsPdf(pdfFormFields, vt, i);
					i++;
				}
				else if (vt.Debit == 2)
				{
					SetFieldsPdf2(pdfFormFields, vt, x);
					x++;
				}
			}
		}
		void SetFieldsPdf(AcroFields pdfFormFields,VoucherTable vt, int i)
		{
			pdfFormFields.SetField("C" + i, vt.Function);
			pdfFormFields.SetField("A" + i, vt.Head);
			pdfFormFields.SetField("B" + i, vt.Dept);
			pdfFormFields.SetField("D" + i, vt.Unit);
			pdfFormFields.SetField("E" + i, vt.AccountingOfficer);
			pdfFormFields.SetField("F" + i, vt.Programme);
			pdfFormFields.SetField("G" + i, vt.Subsidiary);
			pdfFormFields.SetField("H" + i, vt.Amount);
			pdfFormFields.SetField("I" + i, vt.Activity);
			pdfFormFields.SetField("X" + i, vt.AccountCode);
		}
		public void Watermark(string filename)
		{
			// PdfReader pdfReader = new PdfReader(Server.MapPath(@"cash receipt.pdf"));

		// string.Concat(Server.MapPath("~/Barcode Images/"), "watermark.png"));
			//_image.SetAbsolutePosition(200, 400);
			//Response.ContentType = "application/pdf";
			Document doc = new Document(iTextSharp.text.PageSize.LETTER,10,10,42,35);
			PdfWriter pw = PdfWriter.GetInstance(doc, new FileStream(Server.MapPath("~/Barcode Images/" + filename), FileMode.Open));
			doc.Open();
			iTextSharp.text.Image _image = iTextSharp.text.Image.GetInstance(Server.MapPath(@"watermark.png"));
			//string filename = "invoice" + v.Reqid + ".pdf";
			//PdfReader pdfReader = new PdfReader(Server.MapPath(@"invoice.pdf"));
			//using (FileStream stream = new FileStream(string.Concat(Server.MapPath("~/Barcode Images/"),
			//PdfWriter pw = PdfWriter.GetInstance(doc, new FileStream(string.Concat(Server.MapPath("~/Barcode Images/"), filename), FileMode.Open));//Response.OutputStream);
			//Response.OutputStream);

			
			//_image.ScalePercent(25f);
			_image.ScaleToFit(50f,100f);
			_image.SetAbsolutePosition(doc.PageSize.Width - 36f - 72f,doc.PageSize.Height - 36f - 216.6f);
			doc.Add(_image);
			//StringBuilder sb = new StringBuilder();
			//string testSentence = "test sentence.";
			//for (int k = 0; k < 80; ++k)
			//{
			//	sb.Append(testSentence);
			//	sb.Append(" ");
			//	doc.Add(new Paragraph(sb.ToString()) { SpacingAfter = 8 });
			//}
			doc.Close();
			//Response.End();
			// set transparency, see commented section below; 'image watermark'
			//_state = new PdfGState()
			//{
			//	FillOpacity = 0.3F,
			//	StrokeOpacity = 0.3F
			//};
			//PdfContentByte cb = writer.DirectContentUnder;
			//cb.SaveState();
			//cb.SetGState(_state);
			//cb.AddImage(_image);
			//cb.RestoreState();
		}
		void SetFieldsPdf2(AcroFields pdfFormFields, VoucherTable vt, int i)
		{
			pdfFormFields.SetField("Ca" + i, vt.Function);
			pdfFormFields.SetField("Aa" + i, vt.Head);
			pdfFormFields.SetField("Ba" + i, vt.Dept);
			pdfFormFields.SetField("Da" + i, vt.Unit);
			pdfFormFields.SetField("Ea" + i, vt.AccountingOfficer);
			pdfFormFields.SetField("Fa" + i, vt.Programme);
			pdfFormFields.SetField("Ga" + i, vt.Subsidiary);
			pdfFormFields.SetField("Ha" + i, vt.Amount);
			pdfFormFields.SetField("Ia" + i, vt.Activity);
			pdfFormFields.SetField("Xa" + i, vt.AccountCode);
		}
		//		private void FillForm()

		//		{

		//			string pdfTemplate = Server.MapPath(@"invoice.pdf");
		//			string newFile = Server.MapPath(@"\Barcode Images\invoice.pdf");
		//			PdfReader pdfReader = new PdfReader(pdfTemplate);

		//			PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(newFile, FileMode.Create));

		//			AcroFields pdfFormFields = pdfStamper.AcroFields;
		//			pdfFormFields.SetField("f1_01(0)", "Eric");
		//			pdfFormFields.SetField("TxtAccType", "Eric");
		//			pdfFormFields.SetField("TxtDeprtment", "Eric");
		//			pdfFormFields.SetField("TxtStation", "Eric");
		//			pdfFormFields.SetField("TxtMinistry", "Eric");
		//			pdfFormFields.SetField("TxtRefNo", "Eric");
		//			pdfFormFields.SetField("TxtChqueNo", "Eric");
		//			pdfFormFields.SetField("TxtChqDate", "Eric");
		//			pdfFormFields.SetField("TxtPayee", "Eric");
		//			pdfFormFields.SetField("TxtRName", "Eric");
		//			pdfFormFields.SetField("TxtAddress", "Eric");
		//			pdfFormFields.SetField("TxtAuthorities", "Eric");
		//			pdfFormFields.SetField("TxtDescription", "Eric");
		//			pdfFormFields.SetField("TxtAmount", "Eric");
		//			pdfFormFields.SetField("TxtTotal", "Eric");
		//			pdfFormFields.SetField("TxtReceivedSignatur", "Eric");
		//pdfFormFields.SetField("TxtReceivedDate", "Eric");
		//			pdfFormFields.SetField("TxtSig1", "Eric");
		//			pdfFormFields.SetField("TxtTitle", "Eric");
		//			pdfFormFields.SetField("TxtDate", "Eric");
		//			pdfFormFields.SetField("TxtCompiledBy", "Eric");
		//			pdfFormFields.SetField("TxtCreatedBy", "Eric");
		//			pdfFormFields.SetField("TxtSig2", "Eric");

		//			// report by reading values from completed PDF

		//		//string sTmp = "W-4 Completed for " + pdfFormFields.GetField("f1_09(0)") + " " + pdfFormFields.GetField("f1_10(0)");

		//			// flatten the form to remove editting options, set it to false
		//			// to leave the form open to subsequent manual edits
		//		pdfStamper.FormFlattening = false;
		//			// close the pdf
		//			pdfStamper.Close();

		//			string script = string.Format("window.open('{0}');", newFile);//string.Concat("/Barcode Images/", "invoice.pdf"));
		//			ClientScript.RegisterClientScriptBlock(this.GetType(), "newPDF", script, true);


		//		}
		//********************************************8CREATE VOUCHER*********************************
		public void PrintVoucher(string Reqid)
		{
			ListVoucher v = new ListVoucher();

			string vid = "";
			using (DataTable dt = bl.DisplayVoucher(Reqid))
			{
				if (dt.Rows.Count > 0)
				{
					foreach (DataRow row in dt.Rows)
					{
						v.Authorities = row["Authorities"].ToString();
						v.Date = row["Date"].ToString();
						v.Reqid = Reqid;//row["Authorities"].ToString();
						v.Address = row["Address"].ToString();
						v.Description = row["Description"].ToString();
						v.Department = row["Department"].ToString();
						v.AccountType = row["Account Type"].ToString();
						v.Ministry = row["Ministry"].ToString();
						v.Name = row["Name"].ToString();
						v.Payee = row["Payee"].ToString();
						v.Station = row["Station"].ToString();
						// v.Total = row["Total"].ToString();
						v.UserName = row["Entered by"].ToString();
						vid = row["vid"].ToString();


					}
					LoadVoucherTable(v, vid);
				}
			}
		}
		void LoadVoucherTable(ListVoucher v, string vid)
		{
			//  ListVoucher Lis = new ListVoucher();
			
			int amount = 0;
			using (DataTable dt = bl.DisplayVoucherTable(vid))
			{
				string x = "";
				List<VoucherTable> Lis = new List<VoucherTable>();
				if (dt.Rows.Count > 0)
					foreach (DataRow row in dt.Rows)
					{
						VoucherTable vt = new VoucherTable();
						vt.Function = row["Class/Function"].ToString();
						vt.Head = row["Head"].ToString();
						vt.Dept = row["Dept"].ToString();
						vt.Unit = row["Unit"].ToString();
						vt.AccountingOfficer = row["Accounting Officer"].ToString();
						vt.Programme = row["Programme"].ToString();
						vt.Subsidiary = row["Subsidiary"].ToString();

						vt.AccountCode = row["Account Code"].ToString();
						vt.Activity = row["Activity"].ToString();
						x = row["Debit"].ToString();
						if (x != "")
							vt.Debit = int.Parse(x);
						else
							vt.Debit = 1;

						vt.Amount = row["Amount"].ToString();
						if (vt.Amount != "")
						{
							if (vt.Debit.ToString() == "1")
								amount = int.Parse(vt.Amount) + amount;
							else
								amount = amount - int.Parse(vt.Amount);
						}

						Lis.Add(vt);
					}
				v.VTable = Lis;
				v.Total = amount.ToString();
			}
			//v.Code = GetBarCode(v.Reqid);
			PDF_Filler fi = new PDF_Filler();
			fi.Create(v);
		
			//if (Session["Voucher"] == null)
				//n.Notification("Please check popup blocker located in your browsers search section", INotification.info, this);

		}

	}
}