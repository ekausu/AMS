<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AdvanceSystem.Reports" %>


<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/Reporting Grid/ExpenseFunding.ascx" TagPrefix="uc1" TagName="ExpenseFunding" %>
<%@ Register Src="~/Reporting Grid/IssuedFunding.ascx" TagPrefix="uc1" TagName="IssuedFunding" %>



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
        table tr:hover{
           background-color:#fff400 !important;
            color:#110ee3;
        }
    </style>
    
<%--<script src="Scripts/jquery-1.10.2.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="css/SearchBox.css"/>
    <link rel='stylesheet' href='css/jquery-ui.min.css' />
    <script src="js/highcharts.js"></script>
<script src="js/data.js"></script>
<script src="js/exporting.js"></script>
    
<script src="js/highcharts-3d.js"></script>--%>
    </head>

<body>
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
                    		<div class="row-fluid sortable">
				<div class="box span9">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-font"></i> REPORT</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						  <%--<div class="page-header">
							  <h1>REPORT<small>Headings, paragraphs, lists, and other inline type elements</small></h1>
						  </div>--%>     
                          <div class="row-fluid">
							  <div class="span12">
								  <h3>FILTERS</h3>
								  <div class="row-fluid">
							  <table>
                                    <tr><td>Type Of Report</td>
                                <td>  
                                    <asp:DropDownList data-rel="chosen" ID="DropDownReportType" CssClass="width" runat="server">
                                                           <asp:ListItem></asp:ListItem>
                                                           <asp:ListItem>Vouchers</asp:ListItem>
                                                           <asp:ListItem>Pending Requests</asp:ListItem>
                                                           <asp:ListItem>Completed Requests</asp:ListItem>
                                                       </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>Date From</td>
                                <td>   <asp:TextBox ID="TxtDateFrom" CssClass="input-xlarge datepicker" Visible="true" runat="server"></asp:TextBox>
                                                    </td>
                                <td>Date To</td>
                                <td>   <asp:TextBox ID="TxtDateTo" CssClass="input-xlarge datepicker" Visible="true" runat="server"></asp:TextBox>
                                                    </td>
                                </tr>
                                
                            <tr>
                                <td colspan="4">
                                     <a class="btn btn-success" runat="server" onserverclick="BtnReport_ServerClick"  id="BtnReport">
                                <i class="icon-th-list icon-white"></i>
                                Load Report                                           
									</a>
                                </td>
                            </tr>
                        </table>
								  </div>
							  </div>
						  </div>
						  <div class="row-fluid ">  
                              <uc1:ExpenseFunding runat="server" ID="ExpenseFunding" />
						  </div>
						
						  
					  </div>
				</div><!--/span-->
				<%------------------------SIDE GRAPHS--------------------------------%>
				<div class="box span3">
					<div class="box-header well" data-original-title>
						<h3>PIE CHART</h3>
						<div class="box-icon">
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						            <div id="realtimechart" style="height:190px;"></div>
						 <p>You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>
						 <p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>
				
					</div>
				</div><!--/span-->
				
				
			
			</div><!--/row-->
         
            </div>
                <hr>

                 <script src="js/charisma.js"></script>
        
  
            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
            </footer>
                </div>
        </div>

    </form>
</body>
</html>
