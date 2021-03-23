<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete Records.aspx.cs" Inherits="AdvanceSystem.Delete_Records" %>

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
					
.tableZ {
	background: #f5f5f5;
	border-collapse: separate;
	     box-shadow:0 0 20px rgba(0,0,0,0.8);
	
	
	font-size: 12px;
	line-height: 24px;
	margin: 30px auto;
	text-align: left;
	width: 800px;
}	

.tableZ th {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
	border-left: 1px solid #555;
	border-right: 1px solid #777;
	border-top: 1px solid #555;
	border-bottom: 1px solid #333;
	box-shadow: inset 0 1px 0 #999;
	color: #fff;
  font-weight: bold;
	padding: 10px 15px;
	position: relative;
	text-shadow: 0 1px 0 #000;	
}

.tableZ th:after {
	background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
	content: '';
	display: block;
	height: 25%;
	left: 0;
	margin: 1px 0 0 0;
	position: absolute;
	top: 25%;
	width: 100%;
}

.tableZ th:first-child {
	border-left: 1px solid #777;	
	box-shadow: inset 1px 1px 0 #999;
}

.tableZ th:last-child {
	box-shadow: inset -1px 1px 0 #999;
}
.Combo{
    line-height: 1.6;
}
.tableZ td {
	border-right: 1px solid #fff;
	border-left: 1px solid #e8e8e8;
	border-top: 1px solid #fff;
	border-bottom: 1px solid #e8e8e8;
	padding: 10px 15px;
	position: relative;
	transition: all 300ms;
}

.tableZ td:first-child {
	box-shadow: inset 1px 0 0 #fff;
}	

.tableZ td:last-child {
	border-right: 1px solid #e8e8e8;
	box-shadow: inset -1px 0 0 #fff;
}	

.tableZ tr {
	background: url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

.tableZ tr:nth-child(odd) td {
	background: #f1f1f1 url(https://jackrugile.com/images/misc/noise-diagonal.png);	
}

.tableZ tr:last-of-type td {
	box-shadow: inset 0 -1px 0 #fff; 
}

.tableZ tr:last-of-type td:first-child {
	box-shadow: inset 1px -1px 0 #fff;
}	

.tableZ tr:last-of-type td:last-child {
	box-shadow: inset -1px -1px 0 #fff;
}	

/*.tableZ tbody:hover td {
	color: transparent;
	text-shadow: 0 0 3px #aaa;
}*/

.tableZ tbody:hover tr:hover td {
	color: #444;
	text-shadow: 0 1px 0 #fff;
}
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
                        <div class="block-area shortcut-area" id="BtnMenu" runat="server">                      
               <div class="dock" style="margin-left:35%">
<ul style="background:none; -webkit-box-reflect: below 0px -webkit-linear-gradient(bottom, rgba(255, 255, 255, 0.2) 0%, transparent 90%, transparent 100%);">
   	      <li><a id="BtnSearch" runat="server" href="#ModaleEmployeeNumber">
				 <img src="images/Loupe.png" /></a><span>Search</span></li>						
	<li><a href="#ModalOptions">
         <img src="images/Database%203.png" /></a><span>Options</span></li>

</ul>
</div>       
 </div>
                    <%-------------------------------------------------------------------------------------%>
                    <asp:TextBox ID="TxtStatus" Visible="false" Text="" runat="server"></asp:TextBox>
                    <%--------------------------------------------------------------------------------%>
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>SYSTEM RECORDS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content" style="max-height:600px;overflow:auto;">

                        <%----------------------------------------------------------------------------------%>
                           <asp:GridView ID="GridviewRecords" AllowPaging="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable"  runat="server">
                                 <EmptyDataTemplate>
                        <a style="width:100%;text-align:center" data-rel="tooltip" title="Use Menu above to load all records" class="well span3 top-block" href="#">
					<span class="icon32 icon-color icon-user"></span>
					<div>You have no Records Assigned to you</div>
					<div>Use Options above to load all records</div>
					<span class="notification green">AMS</span>
				</a>
                               </EmptyDataTemplate>    
                            <Columns>
								 <%--<asp:TemplateField HeaderStyle-Width="100px">
              <ItemTemplate>
             <div class="btn-group" style="width:90%">
							<button class="btn btn-primary dropdown-toggle"  data-toggle="dropdown"><i class="icon-th-list"></i>Options</button>
							<ul class="dropdown-menu">
							     <li><a id="BtnExport" runat="server" onserverclick="BtnExport_ServerClick"><i class="icon32 icon-color icon-clipboard"></i>Export To Excel</a></li>
							    <li><a id="BtnDelete" runat="server" onserverclick="BtnDelete_ServerClick"><i class="icon32 icon-color icon-calendar"></i>Delete Record</a></li>			
							   </ul>
						</div>
                </ItemTemplate>
             </asp:TemplateField>--%>
		
<asp:TemplateField>
<HeaderTemplate>
  <asp:CheckBox ID="chkAll" runat="server" onclick = "checkAll(this)" />
</HeaderTemplate> 
<ItemTemplate>
 <asp:CheckBox ID="CheckBox1" runat="server" onclick = "Check_Click(this)" />
</ItemTemplate> 
</asp:TemplateField> 
		 <asp:TemplateField Visible="false" HeaderText="Request id" >
              <ItemTemplate>
                <asp:Label ID="id" runat="server"  Text='<%# Eval("Reqid") %>'></asp:Label>
                </ItemTemplate>
             </asp:TemplateField> 
                            </Columns>
                               </asp:GridView>
                  
					</div>
				</div><!--/span-->
                  
                        </div>
         
            </div>
                  
                  
                  <%--------------------MODAL APPROVERS LIST---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalApprovers"></a>
        <div class="popup">
            <h2>RECORDS ARE BACKED UP</h2>
         
              <a class="close" href="#close"></a>
        </div>
				  <%---------------------------DIALOGUE OPTIONS-------------------------------------------------------------------------------------------------%>
            <a href="#x" class="overlay" runat="server" id="ModalOptions"></a>
            <div class="popup">
                <h2 style="text-align:center">SERVER CONTROLS</h2> 
				 <h3>ALL RECORDS ARE AUTOMATICALLY BACKED UP</h3>
                      <a runat="server" id="BtnApp" class="dashboard-module">
                          <img src="images/Database%203.png" alt="" />
                    <span>Load All Records</span>
                </a>
                  <a runat="server" id="BtnDelete" onserverclick="BtnDelete_ServerClick1" class="dashboard-module">
                   <img src="images/Delete%20Database.png" alt="" />
                    <span>Delete Selected</span>
                </a>
                 <a runat="server" id="BtnReassigns" class="dashboard-module">
                     <img src="images/Download%20Database.png" alt="" />
                    <span>Download Selected</span>
                </a>
                 <a runat="server" id="BtnCert" class="dashboard-module">
                    <img src="images/New%20Database.png" alt="" />
                    <span>Import DATA to Database</span>
                </a>
				 <a runat="server" id="A1" class="dashboard-module">
                    <img src="images/repeat.png" alt="" />
                    <span>Restore Changes</span>
                </a>
             
               <%-- <input id="BtnModalAction" type="button" runat="server" onserverclick="BtnModalAction_ServerClick" class="btn btn-danger" value="Approve" />
                <input id="BtnModalReject" type="button" runat="server" onserverclick="BtnModalReject_ServerClick" class="btn btn-danger" value="Reject" />
                <input id="BtnModalReassign" type="button" runat="server" onserverclick="BtnModalReassign_ServerClick" class="btn btn-danger" value="Reassign" />
                <input id="BtnModalDetails" type="button" runat="server" onserverclick="BtnModalDetails_ServerClick" class="btn btn-danger" value="View Details" />
                <input id="BtnWorkCapacityCert" type="button" runat="server" onserverclick="BtnWorkCapacityCert_ServerClick" class="btn btn-info" value="Work capacity Certificate" />
            --%>    <a class="close" href="#close"></a>
            </div>
        <%-------------------------------------------------------------%>
				
            <hr>

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
                 <asp:TextBox ID="txtlevel" Text="0" Visible="false" runat="server"></asp:TextBox>
                
                 <asp:TextBox ID="txtClickedOption" Text="0" Visible="false" runat="server"></asp:TextBox>
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
		    <script type = "text/javascript">
function checkAll(objRef)
{
    var GridView = objRef.parentNode.parentNode.parentNode;
    var inputList = GridView.getElementsByTagName("input");
    for (var i=0;i<inputList.length;i++)
    {
        var row = inputList[i].parentNode.parentNode;
        if(inputList[i].type == "checkbox"  && objRef != inputList[i])
        {
            inputList[i].checked = objRef.checked;
        }
    }
}

function Check_Click(objRef)
{
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode;
    
    //Get the reference of GridView
    var GridView = row.parentNode;
    
    //Get all input elements in Gridview
    var inputList = GridView.getElementsByTagName("input");
    
    for (var i=0;i<inputList.length;i++)
    {
        //The First element is the Header Checkbox
        var headerCheckBox = inputList[0];
        
        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        var checked = true;
        if(inputList[i].type == "checkbox" && inputList[i] != headerCheckBox)
        {
            if(!inputList[i].checked)
            {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;
    
}
    </script> 

    </form>
</body>
</html>
