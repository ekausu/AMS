using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdvanceSystem.Wrapper;
using System.IO;
using System.Data;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Net.Security;

namespace AdvanceSystem.Advance_Request
{
    public partial class Payslips : System.Web.UI.UserControl
    {
        BusinessLogic bl = new BusinessLogic();
        System.Web.UI.Page page = System.Web.HttpContext.Current.Handler as System.Web.UI.Page;
        public void PassPage(Page o)
        {
            if (o is AdvanceRequest)
                page = o as AdvanceRequest;
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Hide(bool above)
        {
            if (above)
            {
                Below.Visible = false;
                Above.Visible = true;
            }
            else
            {
                Below.Visible = true;
                Above.Visible = false;
            }
        }
        //void Conv(byte[] imageBytes, string filename, string ext)
        //{
        //    // string x = prevImg1.ImageUrl.Replace("data:image/png;base64,", "");
        //    // Convert Base64 String to byte[]
        //    // byte[] imageBytes = Convert.FromBase64String(x);
        //    MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

        //    // Convert byte[] to Image
        //    ms.Write(imageBytes, 0, imageBytes.Length);
        //    string ex = "." + ext;
        //    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
        //    image.Save(Server.MapPath("~/Payslips/" + filename + ex), Extensions(ext));
        //}
        //System.Drawing.Imaging.ImageFormat Extensions(string exe)
        //{
        //    if (exe == "png")
        //        return System.Drawing.Imaging.ImageFormat.Png;
        //    if (exe == "gif")
        //        return System.Drawing.Imaging.ImageFormat.Gif;
        //    if (exe == "bmp")
        //        return System.Drawing.Imaging.ImageFormat.Bmp;
        //    if (exe == "ico")
        //        return System.Drawing.Imaging.ImageFormat.Icon;
        //    if (exe == "jpeg")
        //        return System.Drawing.Imaging.ImageFormat.Jpeg;
        //    else
        //        return System.Drawing.Imaging.ImageFormat.Tiff;
        //}
        public int Validated()
        {
            int j = 0;
            for (int i = 0; i < Request.Files.Count; i++)
            {
                FileUploader f = new FileUploader();
                HttpPostedFile PostedFile = Request.Files[i];
                if (PostedFile.ContentLength > 0 && PostedFile.ContentLength < 20728650)
                {
                    j++;
                }
            }
            if (j == 0)
                return 1;
            else
                return 0;
        }
        //    public List<LinkedResource> UploadFiles(ListAdvanceDetails det)
        //    {
        //    List<LinkedResource> ImgList = new List<LinkedResource>();
        //    // if (Session["id"] != null)
        //    if (det.Reqid > 0)
        //        for (int i = 0; i < Request.Files.Count; i++)
        //        {
        //            FileUploader f = new FileUploader();
        //            HttpPostedFile PostedFile = Request.Files[i];
        //            if (PostedFile.ContentLength > 0 && PostedFile.ContentLength < 20728650)
        //            {
        //                string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
        //                string Ext = System.IO.Path.GetExtension(PostedFile.FileName);
        //                string path = "";
        //                path = Server.MapPath("~/Payslips/" + FileName);
        //                PostedFile.SaveAs(path);

        //                FileStream fs = new FileStream(Server.MapPath("~/Payslips/" + FileName), FileMode.Open, FileAccess.Read);
        //                BinaryReader br = new BinaryReader(fs);
        //                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        //                br.Close();
        //                fs.Close();


        //                // f.Image= bytes;

        //                f.Image = bytes;
        //                f.ContentType = PostedFile.ContentType;
        //                f.FileName = FileName;
        //                f.Extension = Ext;
        //                f.Id = det.Reqid;//int.Parse(Session["id"].ToString());

        //                //Conv(bytes, FileName, Ext);
        //                if (FileName != "" && Ext != "" && path != "")
        //                {
        //                    bl.NewIncidentImages(f);
        //                    LinkedResource rs = new LinkedResource(path);
        //                    rs.ContentId = FileName;
        //                    ImgList.Add(rs);
        //                }
        //            }
        //        }
        //    return ImgList;
        //}
        void Conv(byte[] imageBytes, string filename, string ext)
        {
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);

            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            string ex = "." + ext;
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
            image.Save(Server.MapPath("~/Payslips/" + filename + ex), Extensions(ext));
        }
        System.Drawing.Imaging.ImageFormat Extensions(string exe)
        {
            if (exe == "png")
                return System.Drawing.Imaging.ImageFormat.Png;
            if (exe == "gif")
                return System.Drawing.Imaging.ImageFormat.Gif;
            if (exe == "bmp")
                return System.Drawing.Imaging.ImageFormat.Bmp;
            if (exe == "ico")
                return System.Drawing.Imaging.ImageFormat.Icon;
            if (exe == "jpeg")
                return System.Drawing.Imaging.ImageFormat.Jpeg;
            else
                return System.Drawing.Imaging.ImageFormat.Tiff;
        }
        public List<LinkedResource> UploadFiles(ListAdvanceDetails det)
        {
            List<LinkedResource> ImgList = new List<LinkedResource>();
            // if (Session["id"] != null)
            if (det.Reqid > 0)
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    FileUploader f = new FileUploader();
                    HttpPostedFile PostedFile = Request.Files[i];
                    if (PostedFile.ContentLength > 0 && PostedFile.ContentLength < 20728650)
                    {
                        string FileName = System.IO.Path.GetFileName(PostedFile.FileName);
                        string Ext = System.IO.Path.GetExtension(PostedFile.FileName);
                        string path = "";
                        path = Server.MapPath("~/Payslips/" + FileName);
                        PostedFile.SaveAs(path);

                        FileStream fs = new FileStream(Server.MapPath("~/Payslips/" + FileName), FileMode.Open, FileAccess.Read);
                        BinaryReader br = new BinaryReader(fs);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        br.Close();
                        fs.Close();


                        // f.Image= bytes;

                        f.Image = bytes;
                        f.ContentType = PostedFile.ContentType;
                        f.FileName = FileName;
                        f.Extension = Ext;
                        f.Id = det.Reqid;//int.Parse(Session["id"].ToString());

                        //Conv(bytes, FileName, Ext);
                        if (FileName != "" && Ext != "" && path != "")
                        {
                            bl.NewIncidentImages(f);
                            LinkedResource rs = new LinkedResource(path);
                            rs.ContentId = FileName;
                            ImgList.Add(rs);
                        }
                    }
                }
            return ImgList;
        }

        //private Boolean InsertUpdateData(SqlCommand cmd)
        //{
        //    String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
        //    SqlConnection con = new SqlConnection(strConnString);
        //    cmd.CommandType = CommandType.Text;
        //    cmd.Connection = con;
        //    try
        //    {
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.Message);
        //        return false;
        //    }
        //    finally
        //    {
        //        con.Close();
        //        con.Dispose();
        //    }
        //}
        public List<LinkedResource> UploadFiless(ListAdvanceDetails det)
        {
            List<LinkedResource> ImgList = new List<LinkedResource>();
            FileUploader f = new FileUploader();
            // Read the file and convert it to Byte Array
            string filePath = FileUpload1.PostedFile.FileName;
            string FileName = Path.GetFileName(filePath);
            string ext = Path.GetExtension(FileName);
            string Ext = System.IO.Path.GetExtension(FileUpload1.FileName);
            string contenttype = String.Empty;

            //Set the contenttype based on File Extension
            switch (ext)
            {
                case ".doc":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".docx":
                    contenttype = "application/vnd.ms-word";
                    break;
                case ".xls":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".xlsx":
                    contenttype = "application/vnd.ms-excel";
                    break;
                case ".jpg":
                    contenttype = "image/jpg";
                    break;
                case ".png":
                    contenttype = "image/png";
                    break;
                case ".gif":
                    contenttype = "image/gif";
                    break;
                case ".pdf":
                    contenttype = "application/pdf";
                    break;
            }
            if (contenttype != String.Empty)
            {
                HttpPostedFile PostedFile = FileUpload1.PostedFile;

                string path = "";
                path = Server.MapPath("~/Payslips/" + FileName);
                PostedFile.SaveAs(path);

                FileStream fs = new FileStream(Server.MapPath("~/Payslips/" + FileName), FileMode.Open, FileAccess.Read);
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                br.Close();
                fs.Close();


                // f.Image= bytes;

                f.Image = bytes;
                f.ContentType = PostedFile.ContentType;
                f.FileName = FileName;
                f.Extension = Ext;
                f.Id = det.Reqid;//int.Parse(Session["id"].ToString());

                //Conv(bytes, FileName, Ext);
                if (FileName != "" && Ext != "" && path != "")
                {
                    bl.NewIncidentImages(f);
                    LinkedResource rs = new LinkedResource(path);
                    rs.ContentId = FileName;
                    ImgList.Add(rs);
                }

            }
            return ImgList;
        }
        protected void btnUpload_Click(object sender, EventArgs e)
        {

            //Stream fs = FileUpload1.PostedFile.InputStream;
            //BinaryReader br = new BinaryReader(fs);
            //Byte[] bytes = br.ReadBytes((Int32)fs.Length);

            ////insert the file into database
            //string strQuery = "insert into tblFiles(Name, ContentType, Data) values (@Name, @ContentType, @Data)";
            ////SqlCommand cmd = new SqlCommand(strQuery);
            ////cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename;
            ////cmd.Parameters.Add("@ContentType", SqlDbType.VarChar).Value = contenttype;
            ////cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
            ////InsertUpdateData(cmd);
            //lblMessage.ForeColor = System.Drawing.Color.Green;
            //lblMessage.Text = "File Uploaded Successfully";


        }
        //public void LoadUsers(int role)
        //{
        //    if (Session["Cheif"] != null)
        //        role = 2;
        //    GridViewUsers.DataSource = bl.DisplayUsers(role);
        //    GridViewUsers.DataBind();
        //}
        //protected void BtnUser_Click(object sender, EventArgs e)
        //{
        //    if (Session["bool"] != null)
        //    {
        //        Button txt = (Button)sender;
        //        GridViewRow gvrow = (GridViewRow)txt.Parent.Parent;

        //        ListAdvanceDetails det = new ListAdvanceDetails();
        //        det.Reason40 = TxtReason.Text;
        //        det.AssignedTo = ((Label)gvrow.FindControl("Name")).Text;
        //        string email = ((Label)gvrow.FindControl("Email")).Text;
        //        if (Validated() == 0)
        //        {
        //            if (Session["bool"].ToString().ToUpper() == "TRUE")
        //                ((AdvanceRequest)(page)).SaveRequest(true, email, det);
        //            else
        //                ((AdvanceRequest)(page)).SaveRequest(false, email, det);
        //        }
        //        else
        //            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alertScript", "location.href='#ModalValidate';", true);

        //    }
       // }
    }
}