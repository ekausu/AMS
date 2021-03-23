<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AdvanceSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7, IE=EmulateIE9, IE=EDGE,chrome=1" />
    <title>AMS</title>
    <link href="LoadBar/Authenticate.css" rel="stylesheet" />
    <style>
        body {
    font-family: "Lato", Calibri, Arial, sans-serif;
    /*background: #ddd url(../images/bg.jpg) repeat top left;*/
    background:#fff;
    font-weight: 300;
    font-size: 15px;
    color: #000000;
    -webkit-font-smoothing: antialiased;
    overflow-y: scroll;
    overflow-x: hidden;
}
.main {
	width: 90%;
	margin: 0 auto;
	position: relative;
    /*margin-top:30%;*/
}

.container > header {
	margin: 10px;
	padding: 20px 10px 10px 10px;
	position: relative;
	display: block;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
    text-align: center;
}

.container > header h1 {
	font-size: 40px;
	line-height: 38px;
	margin: 0;
	position: relative;
	font-weight: 300;
	color: #666;
	text-shadow: 0 1px 1px rgba(255,255,255,0.6);
}

.container > header h2 {
	font-size: 15px;
	font-weight: 400;
	margin: 0;
	padding: 15px 10px 20px;
	color: #666;
	text-shadow: 0 1px 1px rgba(255,255,255,0.6);
}
.background .container > header h1,
.background .container > header h2 {
	color: #fff;
	text-shadow: 0 1px 1px rgba(0,0,0,0.7);
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <header>
			<h1>AMS</h1>
            <h2>Please wait, Authenticating user...</h2>
			</header>
     <section class="main">
<div class="cssload-loader">
	<div class="cssload-square cssload-square--main">
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
			<div class="cssload-square cssload-square--mini"></div>
	</div>
    
</div>
         </section>
    </div>
        <script>
            setTimeout(function () { window.location.href = 'AdvanceRequest.aspx' }, 5000);
</script>
    </form>
</body>
</html>
