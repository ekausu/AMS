<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.ascx.cs" Inherits="AdvanceSystem.Design_Cotrols.MainMenu" %>

<div class="span2 main-menu-span ">
    <div class="well nav-collapse sidebar-nav ">
        <ul class="nav nav-tabs nav-stacked main-menu" runat="server" id="ulNav">
              <li class="nav-header hidden-tablet">MY ADVANCE REQUESTS</li>
             <li><a class="ajax-link" href="../AdvanceRequest.aspx"  visible="false" >
				 <img src="../images/Bloc%20notes.png" height="20" width="20" /><%--<i class="icon-file"></i>--%><span class="hidden-tablet">NEW ADVANCE REQUEST</span></a></li>
            <li><a class="ajax-link" href="../AdvanceStatus.aspx"  visible="false" >
				<img src="../images/clock.png" height="20" width="20" /><%--<i class="icon-folder-open"></i>--%><span class="hidden-tablet">MY ADVANCE RECORDS</span></a></li>
             <li><a class="ajax-link" href="../Schedule.aspx"  visible="false" >
				 <img src="../images/planner.png" height="20" width="20" /><%--<i class="icon-calendar"></i>--%><span class="hidden-tablet">PAYMENT SCHEDULE</span></a></li>
            
            <li class="nav-header hidden-tablet">ADVANCE APPROVAL</li>
            <li><a class="ajax-link" id="BtnApproval" runat="server"  visible="false"  onserverclick="BtnApproval_ServerClick" >
				<img src="../images/blog_post_accept.png" height="20" width="20" />	<%--<i class="icon-thumbs-up"></i>--%><span class="hidden-tablet">ADVANCE APPROVAL</span></a></li>
            <li><%--<a class="ajax-link" href="NearMissRecs.aspx"><i class=" icon-share"></i><span class="hidden-tablet">NEAR MISS RECORDS</span></a>--%></li>
        <li class="nav-header hidden-tablet">VOUCHER HANDLING</li>
       <%--<li><a class="ajax-link" id="BtnPayments" runat="server" onserverclick="BtnPayments_ServerClick"><i class=" icon-share"></i><span class="hidden-tablet">NEW VOUCHER</span></a></li>--%>
       <li><a class="ajax-link" id="BtnVRecs" runat="server"  visible="false"  onserverclick="BtnVRecs_ServerClick">
		   <img src="../images/blog_post_accept.png" height="20" width="20" /><%--<i class=" icon-thumbs-up"></i>--%><span class="hidden-tablet">CREATE VOUCHER</span></a></li>
       <li class="nav-header hidden-tablet">CASHIER</li>
			<li><a class="ajax-link" id="BtnVoucherApproval" visible="false" height="20" width="20" runat="server" onserverclick="BtnVoucherApproval_ServerClick">
			<img src="../images/blog_post_accept.png" height="20" width="20" /><%--<i class="icon-list-alt"></i>--%><span class="hidden-tablet">VOUCHER APPROVAL</span></a></li>
     
			<li><a class="ajax-link" id="BtnClearance" height="20" width="20"  visible="false"  runat="server" onserverclick="BtnClearance_ServerClick">
			<img src="../icons/Antialiasfactory-Jewelry-Paper-Money.ico" height="20" width="20" /><span class="hidden-tablet">ADVANCE CASH CLEARANCE</span></a></li>
     
			<li class="nav-header hidden-tablet">FILE LIBRARY</li>
			<li><a class="ajax-link" id="BtnCashClearance" visible="false" runat="server" onserverclick="BtnCashClearance_ServerClick">
		<img src="../images/archive.png" height="20" width="20" /><%--<i class="icon-book"></i>--%><span class="hidden-tablet">CASH RECEIPT RECORDS</span></a></li>
     <li><a class="ajax-link" id="BtnVouchers" visible="false" runat="server" onserverclick="BtnVouchers_ServerClick">
		<img src="../images/archive.png" height="20" width="20" /><%--<i class="icon-book"></i>--%><span class="hidden-tablet">VOUCHER RECORDS</span></a></li>
          
			<li class="nav-header hidden-tablet">ADMIN SECTION</li>
			  <li><a class="ajax-link" id="BtnSettings" runat="server" visible="false" onserverclick="BtnSettings_ServerClick"> <img src="../icons/System.png" height="20" width="20" /><%--<i class="icon-wrench"></i>--%><span class="hidden-tablet">SETTINGS</span></a></li>
             <li><a class="ajax-link" id="BtnAdmin" runat="server" visible="false" onserverclick="BtnAdmin_ServerClick"> <img src="images/user.png" height="20" width="20" /><%--<i class="icon-wrench"></i>--%><span class="hidden-tablet">ADD USERS</span></a></li>
             <li><a class="ajax-link" id="BtnEditUser" runat="server" visible="false" onserverclick="BtnEditUser_ServerClick"> <img src="../images/user.png" height="20" width="20" /><%--<i class="icon-wrench"></i>--%><span class="hidden-tablet">EDIT USERS</span></a></li>
             <li><a class="ajax-link" id="BtnImportData" runat="server" visible="false" onserverclick="BtnImportData_ServerClick">
				 <img src="../images/New%20Database.png" height="20" width="20" /><%--<i class="icon-wrench"></i>--%><span class="hidden-tablet">IMPORT DATA</span></a></li>
        
              </ul>
    </div>
	 <%--<div class="well nav-collapse sidebar-nav ">--%>
		 
<%--           <ul class="nav nav-tabs nav-stacked main-menu" runat="server" id="ul1">
              <li class="nav-header hidden-tablet">MY ADVANCE REQUESTS</li>--%>
			     <asp:Label ID="lblLibrary" runat="server"></asp:Label>
			<%--</ul>--%>
			<%--</div>--%>
    <!--/.well -->
</div>
<!--/span-->
