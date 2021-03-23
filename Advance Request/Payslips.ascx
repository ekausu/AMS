<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Payslips.ascx.cs" Inherits="AdvanceSystem.Advance_Request.Payslips" %>
<div class="block-100" style="width:80%;margin-bottom:400px">
     <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
    <h2>PAYSLIPS</h2>

    <h3>Please attach your pay slips by clicking the orange button, then by clicking the newly displayed button labeled as "Browse"</h3>
    <br />
    <asp:FileUpload ID="FileUpload1"  runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" Text="" Font-Names = "Arial"></asp:Label>
     <div class="container_16 clearfix">
        <ul id = "FileUploadContainer" class='thumbnails gallery'>
           
 
         </ul>
        <div style="width:100%;text-align:center">
           <input id="btnadd" class="btn btn-warning" type="button" value="Add File upload Button" onclick = "AddFileUpload()" />
   </div>
            </div>    
                        <div runat="server" id="Above">  <a class="btn btn-success" href="#ModalSave"><i class="icon icon-white icon-save"></i>Send Request</a>
                         </div>
                        <div runat="server" id="Below" visible="false"><a class="btn btn-success" href="#ModalBelow"><i class="icon icon-white icon-save"></i>Send Request</a>
                      </div>
                     
</div>
