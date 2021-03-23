<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ribbon.ascx.cs" Inherits="AdvanceSystem.Design_Cotrols.Ribbon" %>
<%@ Register Src="~/Design Cotrols/RibbonBackstage.ascx" TagPrefix="uc1" TagName="RibbonBackstage" %>
<style>
	@media print /*--This is for Print--*/

{

    .btn

    {

        display: none;

    }

    .tble

    {

        background-color: #CD853F;

        border:1px solid green;

        -webkit-print-color-adjust: exact

 

/*above line of codes will set the table background-color and change the border color when we give the print and preview (print preview only when we see on print preview via browser) command*/

    }

   

}

@media screen /*--This is for Print Preview Screen--*/

{

    .btn

    {

        display: none;

    }

    .tble

    {

        background-color: #CD853F;

        border:1px solid green;

    }

}
@media screen /*--This is for Screen--*/

{

    .btn

    {

        background-color: #AFAFAF;

        display: block;

    }

    .tble

    {

        background-color: #E5E5E5;

        border: 1px solid #CD853F;

    }

}
</style>
<script type="text/javascript">
	
    function PrintDoc() {

        var toPrint = document.getElementById('section-to-print');

        var popupWin = window.open('', '_blank', 'width=600,height=600,location=no,left=200px');

        popupWin.document.open();

        popupWin.document.write('<html><title>::Preview::</title><link rel="stylesheet" type="text/css" href="print.css" /></head><body onload="window.print()">')

        popupWin.document.write(toPrint.innerHTML);

        popupWin.document.write('</html>');

        popupWin.document.close();

    }

/*--This JavaScript method for Print Preview command--*/

    function PrintPreview() {

        var toPrint = document.getElementById('section-to-print');

        var popupWin = window.open('', '_blank', 'top=10,width=900,height=800,location=no,left=200px');

        popupWin.document.open();

        popupWin.document.write('<html><title>::Print Preview::</title><link rel="stylesheet" type="text/css" href="Print.css" media="screen"/></head><body">')

        popupWin.document.write(toPrint.innerHTML);

        popupWin.document.write('</html>');

        popupWin.document.close();

    }
</script>
<link href="../Ribbon Css/ribbon.css" rel="stylesheet" type="text/css" />
	<link href="soft_button.css" rel="stylesheet" type="text/css" />
	<link href="../Ribbon%20Css/ribbon.css" rel="stylesheet" />
	<link href="Ribbon Css/soft_button.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    <script src="../Ribbon%20js/ribonn%20jquery.js"></script>
    <script src="../Ribbon%20js/ribbon.js"></script>
	<script type="text/javascript" src="../Ribbon js/jquery.tooltip.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#ribbon').ribbon();
			
			$('#enable-btn').click(function() {
				$('#del-table-btn').enable();
				$('#del-page-btn').enable();
				$('#save-btn').enable();
				$('#other-btn-2').enable();
				
				$('#enable-btn').hide();
				$('#disable-btn').show();	
			});
			$('#disable-btn').click(function() {
				$('#del-table-btn').disable();
				$('#del-page-btn').disable();
				$('#save-btn').disable();
				$('#other-btn-2').disable();
				
				$('#disable-btn').hide();
				$('#enable-btn').show();	
			});
			
			//$('.ribbon-button').click(function() {
			//	if (this.isEnabled()) {
			//		alert($(this).attr('id') + ' clicked');
			//	}
			//});
		});
	</script>

<script>
function myFunction() {
    window.print();
}
</script>
 <div id="ribbon">
		<span class="ribbon-window-title">Ribbon App Test</span>
		<div class="ribbon-tab file" id="file-tab">
			<span class="ribbon-title">File</span>
			<div class="ribbon-backstage" style="overflow-y:scroll">
				This is the Backstage.<br/><br/>
			<%--	<div class="button big">
					<img src="icons/normal/open-page.png" alt="Open" />
					<span class="label">Open</span>
					<span class="desc">Open a document from your computer</span>
				</div><br/>
				<div class="button big">
					<img src="icons/normal/save-page.png" alt="Save" />
					<span class="label">Save</span>
					<span class="desc">Save your document to your computer</span>
				</div>--%>

<uc1:RibbonBackstage runat="server" ID="RibbonBackstage" />
                
			</div>
		</div>

		<div class="ribbon-tab" id="format-tab">
			<span class="ribbon-title">Advance Reports</span>
			<div class="ribbon-section">
				<span class="section-title">Tables</span>
				<a class="ribbon-button ribbon-button-large" id="BtnTotalIssued" runat="server" onserverclick="BtnTotalIssued_ServerClick">
					<span class="button-title">Total<br/>Issued</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/apps.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
                <a class="ribbon-button ribbon-button-large" id="BtnAdvanceRemaining" runat="server" onserverclick="BtnAdvanceRemaining_ServerClick">
					<span class="button-title">Advance<br/>Remaining</span>
					<span class="button-help">This button will add a table to your document.</span>
				<img class="ribbon-icon ribbon-normal" src="../images/Cash%20register.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					
						<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
				<a class="ribbon-button ribbon-button-large" id="BtnAdvanceCollected" runat="server" onserverclick="BtnAdvanceCollected_ServerClick">
					<span class="button-title">Advance Auto<br/>Collected</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/Picture.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
                <a class="ribbon-button ribbon-button-large" id="BtnPaidBack" runat="server" onserverclick="BtnPaidBack_ServerClick">
					<span class="button-title">Advance Paid<br/>back</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/Picture.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
                 <a class="ribbon-button ribbon-button-large" id="BtnAdvanceCollect" runat="server" onserverclick="BtnAdvanceCollect_ServerClick">
					<span class="button-title">Total advance<br/>Collected</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/Picture.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
			</div>
          
			<%--<div class="ribbon-section">
				<span class="section-title">Actions</span>
				<div class="ribbon-button ribbon-button-small" id="run-btn">
					<span class="button-title">Run</span>
					<span class="button-help">This button will run the program.</span>
					<img class="ribbon-icon ribbon-normal" src="icons/normal/run.png" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/run.png" />
				</div>
				<div class="ribbon-button ribbon-button-small" id="repeat-btn">
					<span class="button-title">Repeat</span>
					<span class="button-help">This button will repeat something.</span>
					<img class="ribbon-icon ribbon-normal" src="icons/normal/repeat.png" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/repeat.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/repeat.png" />
				</div>
				<div class="ribbon-button ribbon-button-small disabled" id="save-btn">
					<span class="button-title">Save</span>
					<span class="button-help">This button will save your document.</span>
					<img class="ribbon-icon ribbon-normal" src="icons/normal/save.png" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/save.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/save.png" />
				</div>
			</div>--%>
				<div class="ribbon-section">
				<span class="section-title">Tables</span>
			
				<a class="ribbon-button ribbon-button-large" id="BtnFundingDetails" runat="server" onserverclick="BtnFundingDetails_ServerClick">
					<span class="button-title">Funding<br/>Details</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/apps.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
                <a class="ribbon-button ribbon-button-large" runat="server" onserverclick="BtnFundedOnly_ServerClick" id="BtnFundedOnly">
					<span class="button-title">Periodic<br/>Funding</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/Doc.png" style="width:32px;height:32px" />
				<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
						<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
				<a class="ribbon-button ribbon-button-large" runat="server" onserverclick="BtnExpenses_ServerClick" id="BtnExpenses">
					<span class="button-title">Funding<br/>Expenses</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/Picture.png" style="width:32px;height:32px" />
				<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
						<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
			</div>
			<div class="ribbon-section">
				<span class="section-title">Tables</span>
				<a class="ribbon-button ribbon-button-large" id="BtnHome" href="../AdvanceRequest.aspx">
					<span class="button-title">Back to<br/>Home</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/House_by_Artdesigner.lv.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
                </div>
		</div>
    <%-----------------------------------------FUNDING------------------------------------------------------%>
     		<%--<div class="ribbon-tab" id="format-tab2">
			<span class="ribbon-title">Funding Reports</span>
			<div class="ribbon-section">
				<span class="section-title">Tables</span>
			
				<a class="ribbon-button ribbon-button-large" id="BtnFundingDetails" runat="server" onserverclick="BtnFundingDetails_ServerClick">
					<span class="button-title">Funding<br/>Details</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/apps.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
                <a class="ribbon-button ribbon-button-large" runat="server" onserverclick="BtnFundedOnly_ServerClick" id="BtnFundedOnly">
					<span class="button-title">Periodic<br/>Funding</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/Doc.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</a>
				<a class="ribbon-button ribbon-button-large" runat="server" onserverclick="BtnExpenses_ServerClick" id="BtnExpenses">
					<span class="button-title">Funding<br/>Expenses</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/black/Picture.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
			</div>
            <div class="ribbon-section">
                <span class="section-title">Pages</span>
                	<div class="ribbon-button ribbon-button-large" id="open-table-btn">
					<span class="button-title">Advances<br/>Issued</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/Cash%20register.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</div>
                	<div class="ribbon-button ribbon-button-large" id="open-table-btn">
					<span class="button-title">Vouchers<br/>Issued</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/invoice_256x256.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</div>
                <div class="ribbon-button ribbon-button-large" id="open-table-btn">
					<span class="button-title">Generate<br/>Pie</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/money_256x256.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="../icons/waiting.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</div>
			</div>
			
		</div>--%>
     <%-----------------------------SECOND TAB-------------------------------------------------%>
		<div class="ribbon-tab" id="next-tab">
			<span class="ribbon-title">Options</span>
            <div class="ribbon-section">
                <span class="section-title">Pages</span>
                	<a class="ribbon-button ribbon-button-large" runat="server" onserverclick="BtnSummarygRAPH_ServerClick" id="BtnSummarygRAPH">
					<span class="button-title">Station<br/>Summary</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/Maintenance.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/open-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
				  	<a class="ribbon-button ribbon-button-large" runat="server" onclick="PrintDoc()" id="A1">
					<span class="button-title">Print<br/>Doc</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/document-print.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/open-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
					<%--<img src="../images/document-print.png" />--%>
					<%--<img src="../images/document-print-preview.png" />--%>
                <a class="ribbon-button ribbon-button-large" onclick="PrintPreview()" id="BtnPrint">
					<span class="button-title">Print<br/>Preview</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/document-print-preview.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/open-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
			    	<a class="ribbon-button ribbon-button-large" id="open-table-btn">
					<span class="button-title">Generate<br/>Graph</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/stats.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/open-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</a>
				<div class="ribbon-button ribbon-button-large" id="add-page-btn">
					<span class="button-title">Add<br/>Page</span>
					<span class="button-help">This button will add a page to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../images/pie-chart_256x256.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/new-page.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-page.png" />
				</div>

			</div>
			<div class="ribbon-section">
                	<span class="ribbon-title">Format</span>
			<div class="ribbon-section">
				<span class="section-title">Tables</span>
				<div class="ribbon-button ribbon-button-large" id="BtnAdvancePayments">
					<span class="button-title">Advance<br/>Payments</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/chart_accept.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/chart_accept.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</div>
                <div class="ribbon-button ribbon-button-large" id="BtnAdvance">
					<span class="button-title">Advance<br/>Returns</span>
					<span class="button-help">This button will add a table to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/chart_add.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/new-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/new-table.png" />
				</div>
				<div class="ribbon-button ribbon-button-large" id="open-table-btn">
					<span class="button-title">Advance<br/>Payslips</span>
					<span class="button-help">This button will open a table and add it to your document.</span>
					<img class="ribbon-icon ribbon-normal" src="../icons/chart_remove.png" style="width:32px;height:32px" />
					<img class="ribbon-icon ribbon-hot" src="icons/hot/open-table.png" />
					<img class="ribbon-icon ribbon-disabled" src="icons/disabled/open-table.png" />
				</div>
			</div>
				<span class="section-title">More Stuff</span>
				<div class="ribbon-button ribbon-button-large">
					<span class="button-title">Other<br/>Feature</span>
					<span class="button-help">This button will do something else.</span>
					<img class="ribbon-icon ribbon-normal" src="icons/normal/bullet-orange.png" />
				</div>
				<div class="ribbon-button ribbon-button-large disabled" id="other-btn-2">
					<span class="button-title">Remove<br/>Table</span>
					<span class="button-help">This button will remove the selected table from your document.</span>
					<img class="ribbon-icon ribbon-normal" src="icons/normal/delete-table.png" />
				</div>
			</div>
      </div>
    </div>
