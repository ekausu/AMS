<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestBubble.aspx.cs" Inherits="AdvanceSystem.TestBubble" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<div class="Bubble" id="Bubble">
    <div class="Bubble-container">      
    <a class="Bubble-item" href="Default.aspx"><img src="images/512Burn.png" alt="Home" /><span>Back to Home</span></a> 
         <a class="Bubble-item" href="NominationForm.aspx"><img src="images/Junior Icon 88.ico" alt="Nomination Form" /><span>Nomination Form</span></a>  
      <a class="Bubble-item" href="BlastingLic.aspx"><img src="images/App-core-bomb.ico" alt="Blasting License" /><span>Blasting License</span></a>     
    </div>
    </div>

			<script type="text/javascript">
	
	$(document).ready(
		function()
		{
			$('#Bubble').Fisheye(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.Bubble-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			)
		}
	);

</script>
        </div>
    </form>
</body>
</html>
