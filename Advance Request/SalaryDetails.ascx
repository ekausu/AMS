
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalaryDetails.ascx.cs" Inherits="AdvanceSystem.Advance_Request.SalaryDetails" %>
<div class="block-100" style="width:80%;margin-bottom:150px;margin-left:100px">
     <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
      <asp:UpdatePanel runat="server" ID="UP">
                    <ContentTemplate>
    <h2>SALARY DETAILS</h2>
             	         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Trade
                                                        </label>
         <input type="text" class="inputz" id="TxtTrade" runat="server"  />
             </div>
                <div class="field-wrap">
                     <label>
                                                           Appointment
                                                        </label>
        <input type="text" class="inputz" id="TxtAppointment" runat="server" />
                    </div>
               </div>
                          <div class="top-row">
         <div class="field-wrap">
         
              <label>
                                                           Net Pay
                                                        </label>
             <asp:TextBox ID="TxtSalry" OnTextChanged="TxtSalry_TextChanged" onkeypress="return (event.charCode >= 48 && event.charCode <= 57) ||  event.charCode == 46 || event.charCode == 0" AutoPostBack="true" runat="server"></asp:TextBox>
         <%--<input type="number" class="inputz" id="TxtSalary" runat="server" placeholder="Salary" required="required" />--%>
               </div>
  <div class="field-wrap">
         
              <label>
                                                         Station Applied from
                                                        </label>
           <asp:DropDownList data-rel="chosen" Width="100%" ID="DropDownStation" runat="server"></asp:DropDownList>
           </div>
               </div>
                         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Unit
                                                        </label>
             <input type="text" class="inputz" id="Txtnit" runat="server" />
        
           </div>
                  <div class="field-wrap">
              <label>
                                                         Section
                                                        </label>
             <%--<input type="text" class="inputz" id="TxtSection"  runat="server" placeholder="Section" />--%>
         <asp:TextBox ID="TxtSection" OnTextChanged="TxtSection_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
           </div>
               </div>
      <%--<div class="container_16 clearfix">
        <ul id = "FileUploadContainer" class='thumbnails gallery'>
           
 
         </ul>
        <div style="width:100%;text-align:center">
           <input id="btnadd" class="btn btn-warning" type="button" value="Add File upload Button" onclick = "AddFileUpload()" />
   </div>
            </div>--%>            
       
      
                    </ContentTemplate>
                        </asp:UpdatePanel>
</div>
    
 <script type = "text/javascript">
     var counter = 0;
     function AddFileUpload() {
         var div = document.createElement('li');
         div.className = "thumbnail";
         div.innerHTML = '<input id="file' + counter + '" name = "file' + counter + '" type="file" />';
         document.getElementById("FileUploadContainer").appendChild(div);


         $("#file" + counter).fileinput({
             showUpload: false,
             showCaption: false,
             browseClass: "btn btn-info",
             fileType: "any"
         });
         counter++;
     }
     function AddFileUpload2() {
         var div = document.createElement('li');
         div.className = "thumbnail";
         div.innerHTML = '<input id="file' + counter + '" name = "file' + counter + '" type="file" />';
         document.getElementById("FileUploadContainer2").appendChild(div);
         var hidme = document.getElementById("Hideme");
         hidme.style.visibility = "visible";

         $("#file" + counter).fileinput({
             showUpload: false,
             showCaption: false,
             browseClass: "btn btn-info",
             fileType: "any"
         });
         counter++;
     }
     function RemoveFileUpload(div) {
         document.getElementById("FileUploadContainer").removeChild(div.parentNode);
     }

    </script>
       