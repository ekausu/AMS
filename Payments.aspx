<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="AdvanceSystem.Payments" %>


<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>
<%@ Register Src="~/Design Cotrols/TopBar.ascx" TagPrefix="uc1" TagName="TopBar" %>
<%@ Register Src="~/Design Cotrols/MainMenu.ascx" TagPrefix="uc1" TagName="MainMenu" %>
<%@ Register Src="~/Design Cotrols/BreadCrumb.ascx" TagPrefix="uc1" TagName="BreadCrumb" %>
<%@ Register Src="~/Advance Request/Voucher/PaymentsVoucher.ascx" TagPrefix="uc1" TagName="PaymentsVoucher" %>


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
               <div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-file"></i>Advance Approval</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
                        <%--<uc1:PaymentsVoucher runat="server" ID="PaymentsVoucher" />--%>
                  <%---------------------------------------------------------------------------------------------%>
						
 <div class="block-100" style="margin-bottom:150px">
      <div style="text-align:right">
         
      <img src="img/Roundel_of_Zambia.png" />
     </div>
     <h2>PAYMENT VOUCHER</h2>
     <br />
     <br />
	   <div class="top-row">
         <div class="field-wrap">
              <label>
                                                          Date
                                                        </label>
         <input type="text" class="input-xlarge datepicker" style="width:100%" id="TxtDate" runat="server" placeholder="Date" required="required" />
             </div>
                <div class="field-wrap">
                   
                    </div>
               </div>
	 <hr />
         <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Account Type
                                                        </label>
         <input type="text" class="inputz" id="TxtAccountType" runat="server" required="required" />
             </div>
			   <div class="field-wrap">
                      <label>
                                                           Ministry
                                                        </label>
                <asp:TextBox ID="TxtMinistry" ReadOnly="true" Text="DEFENCE" CssClass="inputz" runat="server"></asp:TextBox>
    
            
                    </div>
              
               </div>
             	   <div class="top-row">
         <div class="field-wrap">
              <label>
                                                          Station
                                                        </label>
             <asp:TextBox ID="TxtStation" required="required" CssClass="inputz" runat="server"></asp:TextBox>
         <%--<input type="text" class="inputz" id="TxtENumber" runat="server" placeholder="Employee Number" required="required" />--%>
             </div>
               <div class="field-wrap">
                     <label>
                                                          Department
                                                        </label>
					<asp:TextBox ID="TxtDepts" ReadOnly="true" Text="ZAF" CssClass="inputz" runat="server"></asp:TextBox>
    
        <%--<input type="text" class="inputz" id="TxtDept" readonly="readonly" runat="server" required="required" />--%>
                    </div>
               </div>
	 <asp:UpdatePanel ID="dw" runat="server"><ContentTemplate>
     <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-edit"></i>DEBIT SECTION</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                        <asp:GridView ID="GridViewVoucher" OnRowDeleting="GridViewVoucher_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewVoucher_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>
                                 <asp:TemplateField HeaderText="Class/ Function" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtClass" runat="server" Text='<%# Eval("Class/Function") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtClass" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Head" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtHead" runat="server" Text='<%# Eval("Head") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtHead" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Dept" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtDept" runat="server" Text='<%# Eval("Dept") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtDept" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Unit" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtUnit" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Accounting Officer" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtOfficer" runat="server" Text='<%# Eval("Accounting Officer") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtOfficer" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Programme" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtProg" runat="server" Text='<%# Eval("Programme") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtProg"  runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Activity" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtActivity" runat="server" Text='<%# Eval("Activity") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtActivity" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Account Code" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtAccountCode" runat="server" Text='<%# Eval("Account Code") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAccountCode" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Subsidiary" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtSubsidiary" runat="server" Text='<%# Eval("Subsidiary") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtSubsidiary" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Amount(K)" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                     <asp:Label ID="TxtAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAmount" BackColor="#C6E2FF" OnTextChanged="TxtAmount_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                                     <asp:TemplateField>
                                                <ItemTemplate>
                                                          <asp:LinkButton ID="LinkButton1" Width="100%" CommandName="Delete" Text="<div class='btn btn-danger'><i class='icon-trash icon-white'></i>Delete</div>" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                      
        </Columns>
    </asp:GridView>
						  </div>
 
                        </div>
                    </div>
						 <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-edit"></i> CREDIT SECTION</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
					<%--------------------------------------------------------------------------------------------------------------------------------------%>
						<asp:GridView ID="GridViewVoucherTableCredit" OnRowDeleting="GridViewVoucherTableCredit_RowDeleting" Width="100%" ShowFooter="true" OnRowDataBound="GridViewVoucherTableCredit_RowDataBound" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" runat="server">
                        <Columns>
                                 <asp:TemplateField HeaderText="Class/ Function" Visible="true">
                                   <ControlStyle Width="100%" />
                                 <ItemTemplate>
									
                                      <asp:Label ID="TxtClass" runat="server" Text='<%# Eval("Class/Function") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
								     <span class="add-on"><i class=" icon-pencil"></i></span><asp:TextBox ID="TxtClass" Width="60%" runat="server"></asp:TextBox>
                                         
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Head" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtHead" runat="server" Text='<%# Eval("Head") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                    <asp:TextBox ID="TxtHead" Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Dept" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtDept" runat="server" Text='<%# Eval("Dept") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtDept" Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Unit" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtUnit" Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Accounting Officer" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtOfficer" runat="server" Text='<%# Eval("Accounting Officer") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtOfficer" Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField>
                             <asp:TemplateField HeaderText="Programme" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtProg" runat="server" Text='<%# Eval("Programme") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtProg"  Width="90%"  runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Activity" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtActivity" runat="server" Text='<%# Eval("Activity") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtActivity"  Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Account Code" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtAccountCode" runat="server" Text='<%# Eval("Account Code") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAccountCode"  Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Subsidiary" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                      <asp:Label ID="TxtSubsidiary" runat="server" Text='<%# Eval("Subsidiary") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtSubsidiary"  Width="90%" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                             <asp:TemplateField HeaderText="Amount(K)" Visible="true">
                                   <ControlStyle Width="95%" />
                                 <ItemTemplate>
                                     <asp:Label ID="TxtAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                     </ItemTemplate>
                                    <FooterTemplate>
                                     <asp:TextBox ID="TxtAmount"  Width="90%" BackColor="Red" OnTextChanged="TxtAmount_TextChanged1" AutoPostBack="true" runat="server"></asp:TextBox>
                               </FooterTemplate>
                                 </asp:TemplateField> 
                                     <asp:TemplateField>
                                                <ItemTemplate>
                                                          <asp:LinkButton ID="LinkButton1" Width="100%" CommandName="Delete" Text="<div class='btn btn-danger'><i class='icon-trash icon-white'></i>Delete</div>" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                      
        </Columns>
    </asp:GridView>
						  </div>
 
                        </div>
                    </div>
					<%-----------------------------------------------------------------------------------------------------------------------------------------------%>
	 	 <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well">
						<h2><i class="icon-edit"></i>TOTALS</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
						</div>
					</div>
					<div class="box-content">
                          <div class="top-row">
         <div class="field-wrap">
			  <label>
                                                       ADVANCE REQUESTED
                                                        </label>
                                             <asp:TextBox Width="80%" ID="TxtAdvance" ReadOnly="true" Text="0" runat="server"></asp:TextBox>
    
              
             </div>
                <div class="field-wrap">
					<table>
						<tr>
							<td>TOTAL</td>
							<td>TOTAL DEBIT</td>
							<td>TOTAL CREDIT</td>
						</tr>
						<tr>
								<td><asp:TextBox Width="80%" ID="TxtSumTotal" ReadOnly="true" Text="0" placeholder="TOTAL (Kw)" runat="server"></asp:TextBox></td>
							<td><asp:TextBox Width="80%" ID="TxtTotal" ReadOnly="true" Text="0" BackColor="SkyBlue" placeholder="TOTAL (Kw)" runat="server"></asp:TextBox></td>
							<td><asp:TextBox Width="80%" ID="TxtTotalCredit" ReadOnly="true" Text="0" BackColor="red" placeholder="TOTAL (Kw)" runat="server"></asp:TextBox></td>
						</tr>
					</table>
                    </div>
               </div>
                      
                     </div>
 
                        </div>
                    </div>
		 </ContentTemplate></asp:UpdatePanel>
       <div class="top-row">
         <div class="field-wrap">
              <label>
                                                         Payee
                                                        </label>
         <input type="text" class="inputz" readonly="readonly" id="TxtPayee" runat="server" placeholder="Payee Name" required="required" />
             </div>
                <div class="field-wrap">
                     <label>
                                                       Authorities
                                                        </label>
        <input type="text" class="inputz" id="TxtAuthorit" runat="server" required="required" />
                    </div>
               </div>
      <div class="container_16 clearfix">
                                                    <div class="grid_16">
                                                        <p class="btn-info" style="         text-align: center;
         font-size: small">REMITTANCE TO BE SENT</p>
                                                    </div>
                                                </div>
       <div class="top-row">
         <div class="field-wrap">
              <label>
                                                           Name
                                                        </label>
         <input type="text" class="inputz" readonly="readonly" id="TxtName" runat="server" required="required" />
             </div>
                <div class="field-wrap">
                     <label>
                                                          Address
                                                        </label>
        <input type="text" class="inputz" id="TxtAddress" runat="server" placeholder="Physical Address" required="required" />
                    </div>
               </div>
       <div class="top-row">
                     <label>
                                                          Description of payment
                                                        </label>
<asp:TextBox ID="TxtDescription" required="required" TextMode="MultiLine" Height="150px" ForeColor="Black" CssClass="inputz" runat="server"></asp:TextBox>
        <%--<input type="text" class="inputz" id="Text5" runat="server" placeholder="Last Name" required="required" />--%>
                    </div>
        <a class="btn btn-success" runat="server" id="BeginSave" onserverclick="BeginSave_ServerClick"><i class="icon icon-white icon-save"></i>Save voucher</a>
	 
        <a class="btn btn-warning" runat="server" visible="false" id="BtnLoadVocher" onserverclick="BtnLoadVocher_ServerClick"><i class="icon icon-white icon-pdf"></i>Display Voucher</a>
       
         </div>
       

						<%--------------------------------------------------------------------------------------------------%>
					</div>
				</div><!--/span-->
                  
                        </div>
         
            </div>
				    <%--------------------MODAL ASSIGNED---------------------------------------%>
             <a href="#x" class="overlay" runat="server" id="ModalUsers"></a>
        <div class="popup">
            <h2>ASSIGNED TO</h2>
            <br />Please select who the form should be reassigned to
            <br />
			<div style="max-height:400px;overflow:auto">
             <asp:GridView ID="GridViewUsers" EmptyDataText="NO USER FOUND" Width="100%" AutoGenerateColumns="false" CssClass="table table-striped table-bordered bootstrap-datatable datatable" runat="server">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Button ID="BtnUser" OnClick="BtnUser_Click" Width="100%" CssClass="btn btn-success" Text="Select" runat="server"></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Active Directory" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="User" runat="server" Text='<%# Eval("User") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Email" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Email" Visible="false" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Section" Visible="True">
                            <ItemTemplate>
                                <asp:Label ID="Section" runat="server" Text='<%# Eval("Section") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Station" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Station" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Role" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Position" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Position" runat="server" Text='<%# Eval("Position") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </div>
              <a class="close" href="#close"></a>
        </div>

        <%-------------------------------------------------------------%>
				<a href="#x" class="overlay" runat="server" id="LoadinBar"></a>
		<div class="popup" style="background: rgba(0,0,0,0.2);">
			<h2 style="margin-left:30%">AMS</h2>
			<img id="Loading" style="visibility: visible;margin-left:30%" height="100" width="100" src='img/fluid-loader.gif' alt='loading' />
		</div>
					<%--	-----------------------------------------------------------%>
            <a href="#x" class="overlay" runat="server" id="ModalWarning"></a>
        <div class="popup">
			<div class="box span12">
				<div class="span2">
			<img src="images/warning.png" width="50" height="50" />
					</div>
				<div class="span10">
            <h2>Warning values are not matching with the advance amount requested by the applicant</h2>
                  </div>
				<div class="span12" style="margin-top:20px">
					   <a class="btn btn-success" href="#ModalSave">
                                <i class="icon-ok icon-white"></i>
                                Continue                                           
									</a>
             <a class="btn btn-danger" href="#Close" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                       
									</a>
                        </div>
				</div>
				</div>
              <a class="close" href="#close"></a>
        </div>
		
			<%--	-----------------------------------------------------------%>
            <a href="#x" class="overlay" runat="server" id="ModalSave"></a>
        <div class="popup">
            <h2>Are you sure you want to save?</h2>
                     <a class="btn btn-success" runat="server" onserverclick="BtnSaveRe_ServerClick1" id="BtnSaveRe">
                                <i class="icon-ok icon-white"></i>
                                Save                                           
									</a>
             <a class="btn btn-danger" runat="server" id="Btnscancel" >
                                <i class="icon-remove icon-white"></i>
                               Cancel                                       
									</a>
              <a class="close" href="#close"></a>
        </div>
            <hr>

            <footer>
                <p class="pull-left">&copy; Powered by esnagen software 2018</p>
                <asp:TextBox ID="idholder" Visible="false" runat="server"></asp:TextBox>
				  <asp:TextBox ID="TxtUser" Visible="false" runat="server"></asp:TextBox>
				  <asp:TextBox ID="TxtEmail" Visible="false" runat="server"></asp:TextBox>
            </footer>
                </div>
        </div>
  <script src="js/charisma.js"></script>
        
        <script type="text/javascript" src="js/fileinput.min.js"></script>       
         
       <script>
			$("#BtnSaveRe").click(function () {
				//$("#BtnSaveRe").attr("disabled", true);
				//$("#BtnSaveRe").css('visibility:hidden;');
				//$("#BtnSaveRe").remove();
				$("#Loading").css('visibility:visible;');
				var newURLString = window.location.href + '#LoadinBar';
				window.location.href = newURLString.replace('#ModalSave', '');
			});
		</script>
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
