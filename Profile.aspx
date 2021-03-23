<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="AdvanceSystem.Profile" %>

<%@ Register Src="~/RequestDetails/ProfileControl.ascx" TagPrefix="uc1" TagName="ProfileControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
		<link href="css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="css/site.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/fontawsom-all.min.css">
	<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
			<uc1:ProfileControl runat="server" id="ProfileControl" />
		</div>
		<script src="js/site.js"></script>

<script src="js/Popper.min.js"></script>
		
<script src="js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
    </form>
</body>
</html>
