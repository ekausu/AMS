<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StyleBox.ascx.cs" Inherits="AdvanceSystem.Design_Cotrols.StyleBox" %>
    <script src="Scripts/moment.js"></script>
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.js"></script>
    <script src="Scripts/bootstrap-datetimepicker.min.js"></script>

<link href="../css/Browser.css" rel="stylesheet" />
<link href="css/Browser.css" rel="stylesheet" />
		<link href="css/popup.css" rel="stylesheet" />

    <link href="css/pics.css" rel="stylesheet" />
    <link href="css/blueimp-gallery.min.css" rel="stylesheet" />
    
		<link href="css/popup.css" rel="stylesheet" />
        <%--<script src="js/charisma.js"></script>--%>
        	<script src="js/datetimepicker.min.js"></script> <!-- Date & Time Picker -->
           <script src="js/functions.js"></script>

<link id="bs-css" href="css/bootstrap-simplex.css" rel="stylesheet">
<style>
	.ajax-link:hover img {
		width:50px;
		height:50px;
	}
</style>
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
       
/*.Tx input:valid { outline: solid blue 2px; }
.dock ul{
display: inline-block;
float: left;
width: auto;
margin: 0px;
padding: 0px;
list-style: none;
background: rgba(0, 0, 0, 0.3);
padding-right: 76px;
}
.dock ul li {
width: auto;
height: auto;
display: inline-block;
bottom: 0;
vertical-align: bottom;
margin-top: -43px;
}
.dock ul li a {
display: block;
height: 10px;
width: 10px;
position: relative;
-webkit-transition-property: width, height,margin-top;
-webkit-transition-duration: 0.5s;
-o-transition-property: width, height,margin-top;
-o-transition-duration: 0.5s;
-moz-transition-property: width, height,margin-top;
-moz-transition-duration: 0.5s;
}
.dock ul li a:hover {
width: 50px;
height: 50px;
margin-top: -50px;
}
.dock ul li a img {
width: 100%;
position: absolute;
bottom: 0;
left: 0;
border: none;
padding: 0px 0px 0px 30px;
}
.dock_left{
width: 31px;
-webkit-transform: rotate(33deg);
-moz-transform: rotate(33deg);
-o-transform: rotate(33deg);
position: relative;
background: #EEE;
overflow: hidden;
float: left;
height: 100px;
z-index: 2;
margin: -18px;
}
.dock_right{
width: 36px;
-webkit-transform: rotate(-33deg);
-moz-transform: rotate(-33deg);
-o-transform: rotate(-33deg);
position: relative;
background: #EEE;
overflow: hidden;
float: left;
height: 100px;
z-index: 2;
margin: -18px;
}*/
.tableZ {
	background: #f5f5f5;
	border-collapse: separate;
	box-shadow: inset 0 1px 0 #fff;
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
	  .sidebar-nav {
		padding: 9px 0;
	  }
       @keyframes blink {
            0% {
                box-shadow: 0 0 20px blue;
            }

            50% {
                box-shadow: none;
            }

            100% {
                box-shadow: 0 0 20px white;
            }
        }

        @-webkit-keyframes input {
            0% {
                box-shadow: 0 0 20px white;
            }

            50% {
                box-shadow: 0 0 0;
            }

            100% {
                box-shadow: 0 0 20px white;
            }
        }

        /*.blink {
            -webkit-animation: blink 1.0s linear infinite;
            -moz-animation: blink 1.0s linear infinite;
            -ms-animation: blink 1.0s linear infinite;
            -o-animation: blink 1.0s linear infinite;
            animation: blink 1.0s linear infinite;
        }*/
   .tableBlink tr:hover{
         -webkit-animation: blink 1.0s linear infinite;
            -moz-animation: blink 1.0s linear infinite;
            -ms-animation: blink 1.0s linear infinite;
            -o-animation: blink 1.0s linear infinite;
            animation: blink 1.0s linear infinite;
    }
	</style>

<link href="LoadBar/pace-theme-loading-bar.css" rel="stylesheet" />
	<script data-pace-options='{ "ajax": false }' src="js/Pace.js"></script>
 
	<link href="css/iziToast.css" rel="stylesheet" />
<link href="css/iziToast.min.css" rel="stylesheet" />

<link href="css/Modal.css" rel="stylesheet" />
    <link href="css/Tabbed.css" rel="stylesheet" />
	<link href="css/charisma-app.css" rel="stylesheet"><link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<%--<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>--%>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>
<%--<link href="css/inputs.css" rel="stylesheet" />--%>
<link href='css/inputsDesign.css' rel='stylesheet'/>
<%-------------------------------------------------------------------------------------------------------------------------------%>

       <script src="js/jquery-1.7.2.min.js"></script>
        <!-- jQuery UI -->
        <script src="js/jquery-ui-1.8.21.custom.min.js"></script>
        <!-- transition / effect library -->
        <script src="js/bootstrap-transition.js"></script>
        <!-- alert enhancer library -->
        <script src="js/bootstrap-alert.js"></script>
        <!-- modal / dialog library -->
        <script src="js/bootstrap-modal.js"></script>
        <!-- custom dropdown library -->
        <script src="js/bootstrap-dropdown.js"></script>
        <!-- scrolspy library -->
        <script src="js/bootstrap-scrollspy.js"></script>
        <!-- library for creating tabs -->
        <script src="js/bootstrap-tab.js"></script>
        <!-- library for advanced tooltip -->
        <script src="js/bootstrap-tooltip.js"></script>
        <!-- popover effect library -->
        <script src="js/bootstrap-popover.js"></script>
        <!-- button enhancer library -->
        <script src="js/bootstrap-button.js"></script>
        <!-- accordion library (optional, not used in demo) -->
        <script src="js/bootstrap-collapse.js"></script>
        <!-- carousel slideshow library (optional, not used in demo) -->
        <script src="js/bootstrap-carousel.js"></script>
        <!-- autocomplete library -->
        <script src="js/bootstrap-typeahead.js"></script>
        <!-- tour library -->
        <script src="js/bootstrap-tour.js"></script>
        <!-- library for cookie management -->
        <script src="js/jquery.cookie.js"></script>
        <!-- calander plugin -->
<%--        <script src='js/fullcalendar.min.js'></script>--%>
        <!-- data table plugin -->
        <script src='js/jquery.dataTables.min.js'></script>
        <!-- chart libraries start -->
        <script src="js/excanvas.js"></script>
        <script src="js/jquery.flot.min.js"></script>
        <script src="js/jquery.flot.pie.min.js"></script>
        <script src="js/jquery.flot.stack.js"></script>
        <script src="js/jquery.flot.resize.min.js"></script>
        <!-- chart libraries end -->
        <!-- select or dropdown enhancer -->
        <script src="js/jquery.chosen.min.js"></script>
        <!-- checkbox, radio, and file input styler -->
        <script src="js/jquery.uniform.min.js"></script>
        <!-- plugin for gallery image view -->
        <script src="js/jquery.colorbox.min.js"></script>
        <!-- rich text editor library -->
        <script src="js/jquery.cleditor.min.js"></script>
        <!-- notification plugin -->
        <script src="js/jquery.noty.js"></script>
        <!-- file manager library -->
        <script src="js/jquery.elfinder.min.js"></script>
        <!-- star rating plugin -->
        <script src="js/jquery.raty.min.js"></script>
        <!-- for iOS style toggle switch -->
        <script src="js/jquery.iphone.toggle.js"></script>
        <!-- autogrowing textarea plugin -->
        <script src="js/jquery.autogrow-textarea.js"></script>
        <!-- multiple file upload plugin -->
        <script src="js/jquery.uploadify-3.1.min.js"></script>
        <!-- history.js for cross-browser state change on ajax -->
        <script src="js/jquery.history.js"></script>
<script src="js/iziToast.js"></script>
<script src="js/iziToast.min.js"></script>
        <!-- application script for Charisma demo -->
        <%--<script src="js/charisma.js"></script>--%>

           <%--       </ContentTemplate>
       
      </asp:UpdatePanel>--%>
<style>
       .file-input-wrapper input[type=file],
.file-input-wrapper input[type=file]:focus,
.file-input-wrapper input[type=file]:hover {
  position: absolute;
  top: 0;
  left: 0;
  cursor: pointer;
  opacity: 0;
  filter: alpha(opacity=0);
  z-index: 99;
  outline: 0;
}
.file-input-name {
  margin-left: 10px;
}
file-input {
  overflow-x: auto;
}
.file-loading {
  top: 0;
  right: 0;
  width: 25px;
  height: 25px;
  font-size: 999px;
  text-align: right;
  color: #fff;
  background: transparent url(../img/fileinput/loading.gif) top left no-repeat;
  border: none;
}
.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  background: none repeat scroll 0 0 transparent;
  cursor: inherit;
  display: block;
}
.file-caption .glyphicon {
  display: inline-block;
  min-width: 18px;
  float: left;
  margin-top: 2px;
}
.file-caption-name {
  display: inline-block;
  float: left;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  width: 85%;
}
.file-error-message {
  background-color: #f2dede;
  color: #a94442;
  text-align: center;
  border-radius: 0px;
  padding: 5px;
}
.file-caption-disabled {
  background-color: #EEE;
  cursor: not-allowed;
  opacity: 1;
}
.file-input .btn .disabled,
.file-input .btn[disabled] {
  cursor: not-allowed;
}
.file-preview {
  border-radius: 0px;
  border: 1px solid #ddd;
  padding: 5px;
  width: 100%;
  margin-bottom: 5px;
}
.file-preview-frame {
  display: table;
  margin: 10px;
  height: 160px;
  border: 1px solid #d5d5d5;
  box-shadow: 0px 1px 1px 0 rgba(0, 0, 0, 0.1);
  padding: 3px;
  float: left;
  text-align: center;
}
.file-preview-frame:hover {
  background-color: #F5F5F5;
}
.file-preview-image {
  height: 150px;
  vertical-align: text-center;
}
.file-preview-text {
  display: table-cell;
  width: 150px;
  height: 150px;
  color: #428bca;
  font-size: 11px;
  vertical-align: middle;
  text-align: center;
}
.file-preview-other {
  display: table-cell;
  width: 150px;
  height: 150px;
  font-family: Monaco,Consolas,monospace;
  font-size: 11px;
  vertical-align: middle;
  text-align: center;
}
.file-input-new .close,
.file-input-new .file-preview,
.file-input-new .fileinput-remove-button,
.file-input-new .fileinput-upload-button,
.file-input-new .glyphicon-file {
  display: none;
}


/*.btn-danger2 {
  background-color: #E04B4A;
  border-color: #E04B4A;
}
.btn-danger2:hover,
.btn-danger2:focus,
.btn-danger2:active,
.btn-danger2.active,
.open > .dropdown-toggle.btn-danger2 {
  background-color: #a43f3e;
  border-color: #a43f3e;
}
.btn-danger2[disabled],
.btn-danger2.disabled {
  background: #c66968;
  border-color: #c36261;
}
.inputz { 
	width: 100%; 
	margin-bottom: 10px; 
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
	-webkit-transition: box-shadow .5s ease;
	-moz-transition: box-shadow .5s ease;
	-o-transition: box-shadow .5s ease;
	-ms-transition: box-shadow .5s ease;
	transition: box-shadow .5s ease;
}
.btnz { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btnz:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btnz-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btnz:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btnz-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btnz-primary.active { color: rgba(255, 255, 255, 0.75); }
.btnz-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btnz-primary:hover, .btnz-primary:active, .btnz-primary.active, .btnz-primary.disabled, .btnz-primary[disabled] { filter: none; background-color: #4a77d4; }
.btnz-block { width: 100%; display:block; }

.inputz:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }*/

.dock ul{
display: inline-block;
float: left;
width: auto;
margin: 0px;
padding: 0px;
list-style: none;
background: rgba(0, 0, 0, 0.3);
padding-right: 76px;
}
.dock ul li {
width: auto;
height: auto;
display: inline-block;
bottom: 0;
vertical-align: bottom;
margin-top: -43px;
}
.dock ul li a {
display: block;
height: 50px;
width: 50px;
margin-left:30px;
position: relative;
-webkit-transition-property: width, height,margin-top;
-webkit-transition-duration: 0.5s;
-o-transition-property: width, height,margin-top;
-o-transition-duration: 0.5s;
-moz-transition-property: width, height,margin-top;
-moz-transition-duration: 0.5s;
}
.dock ul li a:hover {
width: 70px;
height: 70px;
margin-top: -50px;
text-shadow:rgba(255, 255, 255, 0.6);
}
.dock span{
    text-align:center;
    z-index:50;
    margin-bottom:0px;
    margin-left:70%;
}
.dock:hover text {
width: 50px;
height: 50px;
margin-top: -50px;
color:blue;
font-size:large;
}
.dock ul li a img {
width: 100%;
position: absolute;
bottom: 0;
left: 0;
border: none;
padding: 0px 0px 0px 30px;
}
.dock_left{
width: 31px;
-webkit-transform: rotate(33deg);
-moz-transform: rotate(33deg);
-o-transform: rotate(33deg);
position: relative;
background: #EEE;
overflow: hidden;
float: left;
height: 100px;
z-index: 2;
margin: -18px;
}
.dock_right{
width: 36px;
-webkit-transform: rotate(-33deg);
-moz-transform: rotate(-33deg);
-o-transform: rotate(-33deg);
position: relative;
background: #EEE;
overflow: hidden;
float: left;
height: 100px;
z-index: 2;
margin: -18px;
}

</style>
<style>
	
a.dashboard-module, 
a.dashboard-module:visited { 
	width: 110px; 
	height: 110px; 
	display: block; 
	float: left; 
	background: url(dashboard-module.gif) top left no-repeat; 

	text-align: center; 
	color: #444444; 
    border-radius: 25px;
       /*box-shadow: 10px 10px 5px #888888;*/
     box-shadow:0 0 10px rgba(0,0,0,0.8);
     margin-right:8px;
    
	}
	
a.dashboard-module:hover, 
a.dashboard-module:active { 
	background-position: bottom left; 
	text-decoration: none; 
	color:#0063be; 
      box-shadow:0 0 10px rgba(0,0,0,0.8);
     -webkit-transition: all 200ms ease-in;
    -webkit-transform: scale(1.1);
    -ms-transition: all 200ms ease-in;
    -ms-transform: scale(1.1);   
    -moz-transition: all 200ms ease-in;
    -moz-transform: scale(1.1);
    transition: all 200ms ease-in;
    transform: scale(1.1);
    z-index:1000;
	}

a.dashboard-module img { 
	margin-top: 20px; 
    width:50px;
    
	}
	
a.dashboard-module span { 
	margin-top: 0px; 
	display: block; 
  
	}

</style>