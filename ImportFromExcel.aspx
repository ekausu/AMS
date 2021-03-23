<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportFromExcel.aspx.cs" Inherits="AdvanceSystem.ImportFromExcel" %>


<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
    <meta charset="utf-8">
    <title>AMS</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
    <link rel="shortcut icon" href="img/Device-blockdevice-cubes.ico">

    <style>
        .Test2 {
            position: relative;
            display: inline-block;
            padding: 15px 25px;
            background-color: green; /*for compatibility with older browsers*/
            background-image: linear-gradient(green,lightgreen);
            /* text styles */
            text-decoration: none;
            color: #fff;
            font-size: 25px;
            font-family: sans-serif;
            font-weight: 100;
        }

            .Test2:after {
                content: '';
                position: absolute;
                top: 2px;
                left: 2px;
                width: calc(100% - 4px);
                height: 50%;
                background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.2));
                border-radius: 3px;
                box-shadow: 0px 1px 4px -2px #333;
                text-shadow: 0px -1px #333;
            }

        .Test {
            font-family: 'PT Sans', arial, serif;
            color: #ffffff;
            /*text-align:center;*/
            font-size: 24px;
            font-weight: bold;
            /*padding:10px;*/
            text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
            /*border: 1px solid rgba(0,0,0,0.5);
	border-bottom: 3px solid rgba(0,0,0,0.5);*/
            /*-webkit-border-radius: 3px;
	-moz-border-radius: 3px;*/
            /*border-radius: 3px;*/
            background: rgba(0,0,0,0.25);
            -o-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            -webkit-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            -moz-box-shadow: 0 2px 8px rgba(0,0,0,0.5), inset 0 1px rgba(255,255,255,0.3), inset 0 10px rgba(255,255,255,0.2), inset 0 10px 20px rgba(255,255,255,0.25), inset 0 -15px 30px rgba(0,0,0,0.3);
            box-shadow: 0 2px 8px rgba(0,0,0,0.5), /* Exterior Shadow */
            inset 0 1px rgba(255,255,255,0.3), /* Top light Line */
            inset 0 10px rgba(255,255,255,0.2), /* Top Light Shadow */
            inset 0 10px 20px rgba(255,255,255,0.25), /* Sides Light Shadow */
            inset 0 -15px 30px rgba(0,0,0,0.3); /* Dark Background */
            /*margin: 40px;*/
            /*display: inline-block;*/
            text-decoration: none;
        }
    	.hide {
			border:solid 1px white;
    	}
    	input {
			border-style:hidden;
			border:1px solid #fff;
			background:#fff;
			text-align:left;
			overflow:hidden;
    	}
    		input:hover {
				background:#00ff21;
    		}
    	table tr:hover {
			background:#ff6a00;
    	}
    	table td {
			background:#fff;
    	}
		table tr td {
    padding-top: 1px;
    padding-bottom: 1px;
	padding-right: 10px;
	padding-left: 10px;
}
   
    </style>

    </head>

<body onload="load()" >
    <form runat="server" id="form1" enctype="multipart/form-data" method = "post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>
        <uc1:StyleBox runat="server" id="StyleBox" />
        <uc1:TopBar runat="server" id="TopBar" />
        <!-- topbar ends -->
        <div class="container-fluid">
                      
<%--------------------------------------------------------------------------------------------------------------------------------------%>
            <div class="row-fluid">

                <uc1:MainMenu runat="server" ID="MainMenu" />
                <!-- left menu ends -->

                <div id="content" class="span10">
                      
                    <!-- content starts -->
                    <uc1:BreadCrumb runat="server" ID="BreadCrumb" />
					                        <%------------------------------------------------------------------------%>
                      
                    <%-------------------------------------------------------------------------------------%>
                    <asp:TextBox ID="TxtStatus" Visible="false" Text="" runat="server"></asp:TextBox>
                    <%--------------------------------------------------------------------------------%>
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>IMPORT FROM EXCEL</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">

        <div>
    <div>
		  <div class="block-area shortcut-area" id="BtnMenu" runat="server">                      
               <div class="dock" style="margin-left:35%">
<ul style="background:none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
   	      <li><a id="BtnExport" runat="server" href="#ModalErrorHandling">
				 <img src="images/Microsoft%20Excel.png" /></a><span>Help</span></li>		
	  <li><a id="A2" runat="server" href="#ModalUnsaved">
				 <img src="images/database_remove.png" /></a><span>Failed</span></li>	
	<li><a id="BtnSavedRecs" href="#ModalSaved">
         <img src="images/server.png" /></a><span>Records</span></li>
      <li><a id="BtnWarning" href="#ModalErrors">
         <img src="images/warning.png" /></a><span>Errors</span></li>
</ul>
</div>       
 </div>

				<ul class="breadcrumb">
					<li>
						 <asp:FileUpload ID="FileUpload1" runat="server" />
					</li>
					<li>
						 <asp:Button ID="btnUpload" CssClass="btn btn-round" runat="server" OnClick="btnUpload_Click" Text="Click Me after clicking Choose file" />
					</li>
				</ul>
		
			</div>
			  <a class="btn btn-info" href="#ModaSave" id="A1" >
                                <i class="icon icon-white icon-xls"></i>
                              SAVE DATA                                 
									</a>
			<a class="btn btn-danger" runat="server" onserverclick="BtnClear_ServerClick" id="BtnClear" >
                                <i class="icon icon-white icon-refresh"></i>
                              CLEAR TABLE                                
									</a>
			<br />
			<hr />
       	 <%--<asp:Button ID="BtnSave" CssClass="btn btn-info" runat="server" OnClick="BtnSave_Click" Text="Save" />--%>
   
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="gvExcelFile" runat="server" OnRowDataBound="gvExcelFile_RowDataBound" OnDataBound="gvExcelFile_DataBound" AutoGenerateColumns="false" ForeColor="#333333" GridLines="Vertical">
            <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775" />--%>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
			 <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Save a file first to proceed" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>UPLOAD EXCEL FILES ONLY</div>
					<div>1. Use the upload button "Upload File"
						<br />2. Then click the button next to your upload to generate the grid.
						<br />3. To Save click the blue button above
					</div>
					<span class="notification green">EXCEL</span>
				</a>
                               </EmptyDataTemplate>
			<Columns>
				  <asp:TemplateField HeaderText="First Name" >
                <ItemTemplate>
					<%--<asp:Label ID="lblGo" Visible="false" runat="server" Text=""></asp:Label>--%>
					<asp:TextBox ID="lblFName" runat="server" CssClass="hide" Text='<%# Eval("First Name") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Last Name" >
                <ItemTemplate>
					<asp:TextBox ID="lblLName" runat="server" Text='<%# Eval("Last Name") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Rank" >
                <ItemTemplate>
					<asp:TextBox ID="lblRank" runat="server" Text='<%# Eval("Rank") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Employee Number" >
                <ItemTemplate>
					<asp:TextBox ID="lblEmployeeNumber" runat="server" Text='<%# Eval("Employee Number") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="PD Code" >
					   <ControlStyle Width="40px" />
                <ItemTemplate>
					<asp:TextBox ID="lblPDCode" runat="server" Text='<%# Eval("PD Code") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Station" >
                <ItemTemplate>
					<asp:TextBox ID="lblStation" runat="server" Text='<%# Eval("Station") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Amount" >
                <ItemTemplate>
					<asp:TextBox ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Period" >
					  <ControlStyle Width="40px" />
                <ItemTemplate>
					<asp:TextBox ID="lblPeriod" runat="server" Text='<%# Eval("Period") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Start Date" >
                <ItemTemplate>
					<asp:TextBox ID="lblStartDate" runat="server" Text='<%# Eval("Start Date") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
				  <asp:TemplateField HeaderText="Paid Amount" >
                <ItemTemplate>
					<asp:TextBox ID="lblPaidAmount" runat="server" Text='<%# Eval("Paid Amount") %>'></asp:TextBox>
                 </ItemTemplate>
             </asp:TemplateField> 
			</Columns>
        </asp:GridView>
    
        <br />
    
    </div>
    	</div>
				</div><!--/span-->
                  
                        </div>
         
            </div>
            <%--------------------MODAL HELP---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalErrorHandling"></a>
        <div class="popup" style="width:50%">
            <h2>HELP INSTRUCTIONS</h2>
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-picture"></i> Gallery</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<%--	<p class="center">
							<button id="toggle-fullscreen" class="btn btn-large btn-primary visible-desktop" data-toggle="button">Toggle Fullscreen</button>
						</p>--%>
						<br/>
						<ul class="thumbnails gallery">
														<li id="image-1" class="thumbnail">
								<a style="background:url(images/image-1.png)" title="Sample Image 1" href="images/image-1.png"><img class="grayscale" src="images/image-1.png" alt="Excel Format"></a>
							</li>
														<li id="image-2" class="thumbnail">
								<a style="background:url(images/image-2.png)" title="Sample Image 2" href="images/image-2.png"><img class="grayscale" src="images/image-2.png" alt="Form Controls"></a>
							</li>
														<li id="image-3" class="thumbnail">
								<a style="background:url(images/image-3.png)" title="Sample Image 3" href="images/image-3.png"><img class="grayscale" src="images/image-3.png" alt="Error Handling"></a>
							</li>
							</ul>
						</div>
					</div>
				</div>
              <a class="close" href="#close"></a>
        </div>
			
                   <%--------------------MODAL SAVED---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalSaved"></a>
        <div class="popup" style="max-width:90%">
            <h2>SAVED RECORDS</h2>
		   <div style="overflow:auto;max-height:400px">
			 <asp:GridView ID="GridViewSavedData" CssClass="table" runat="server">
				 <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Save a file first to proceed" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>NO RECORDS</div>
					<div>There are no historical records displayed</div>
					<span class="notification green">EXCEL</span>
				</a>
                               </EmptyDataTemplate>
			 </asp:GridView>
          </div>
              <a class="close" href="#close"></a>
        </div>
				     <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalUnsaved"></a>
        <div class="popup" style="width:50%">
            <h2>FAILED RECORDS</h2>
         <div style="overflow:auto;max-height:400px">
			 <asp:GridView ID="GridViewUnsaved" CssClass="table" runat="server">
				  <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Save a file first to proceed" href="#">
					<span class="icon32 icon-color icon-info"></span>
					<div>NO RECORDS</div>
					<div>There are no historical records displayed</div>
					<span class="notification green">EXCEL</span>
				</a>
                               </EmptyDataTemplate>
			 </asp:GridView>
         </div>
              <a class="close" href="#close"></a>
        </div>
                <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalErrors"></a>
        <div class="popup" style="width:50%">
            <h2>Error List</h2>
         <div style="overflow:auto;max-height:400px">
			 <asp:GridView ID="GridViewErrorList" CssClass="table" runat="server">
				  <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Save a file first to proceed" href="#">
					<span class="icon32 icon-green icon-lightbulb"></span>
					<div>NO ERRORS FOUND</div>
					<div>There are no ERROR records displayed</div>
					
				</a>
                               </EmptyDataTemplate>
			 </asp:GridView>
         </div>
              <a class="close" href="#close"></a>
        </div>
				                    <%--------------------MODAL REJECT---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModaSave"></a>
        <div class="popup">
            <h2>Save</h2>
            <br />
           Are sure you want to import these records into the database?
			<br />
			  <a class="btn btn-info" runat="server" onserverclick="BtnImport_ServerClick" id="BtnImport" >
                                <i class="icon icon-white icon-check"></i>
                               IMPORT                                       
									</a>
         <a class="btn btn-danger" runat="server" onserverclick="BtnReqReject_ServerClick" id="BtnReqReject" >
                                <i class="icon icon-white icon-cross"></i>
                               REJECT                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
           
        <%-------------------------------------------------------------%>
				
            <hr>

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
				<asp:ListBox ID="listErrorRows" Visible="false" runat="server"></asp:ListBox>
				<asp:ListBox ID="ListErrorMessage" Visible="false" runat="server"></asp:ListBox>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            
            </footer>
                </div>
        </div>
  <script src="js/charisma.js"></script>
        
  <%--<script src="js/Cha.js"></script>--%>
        <%--<script type="text/javascript" src="js/fileinput.min.js"></script>--%>       
         
<script src="js/modernizr.custom.04022.js"></script>
       
           <script type="text/javascript"> 
               function load() {
                   Sys.WebForms.PageRequestManager.getInstance().add_endRequest(jsFunctions);
               }
               function jsFunctions() {
                   $('.thumbnails').on('click', '.gallery-delete', function (e) {
                       e.preventDefault();                     
                       $(this).parents('.thumbnail').fadeOut();
                   });
                   //gallery edit
                   $('.thumbnails').on('click', '.gallery-edit', function (e) {
                       e.preventDefault();
                       //get image id
                       //alert($(this).parents('.thumbnail').attr('id'));
                   });

                   //gallery colorbox
                   $('.thumbnail a').colorbox({ rel: 'thumbnail a', transition: "elastic", maxWidth: "95%", maxHeight: "95%" });

                   //gallery fullscreen
                   $('#toggle-fullscreen').button().click(function () {
                       var button = $(this), root = document.documentElement;
                       if (!button.hasClass('active')) {
                           $('#thumbnails').addClass('modal-fullscreen');
                           if (root.webkitRequestFullScreen) {
                               root.webkitRequestFullScreen(
                                   window.Element.ALLOW_KEYBOARD_INPUT
                               );
                           } else if (root.mozRequestFullScreen) {
                               root.mozRequestFullScreen();
                           }
                       } else {
                           $('#thumbnails').removeClass('modal-fullscreen');
                           (document.webkitCancelFullScreen ||
                               document.mozCancelFullScreen ||
                               $.noop).apply(document);
                       }
                   });
               } 
</script>
    </form>
</body>
</html>
