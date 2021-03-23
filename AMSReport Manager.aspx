<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AMSReport Manager.aspx.cs" Inherits="AdvanceSystem.AMSReport_Manager" %>

<%@ Register Src="~/Design Cotrols/Ribbon.ascx" TagPrefix="uc1" TagName="Ribbon" %>
<%@ Register Src="~/Reporting Grid/IssuedFunding.ascx" TagPrefix="uc1" TagName="IssuedFunding" %>
<%@ Register Src="~/Reporting Grid/Funded.ascx" TagPrefix="uc1" TagName="Funded" %>
<%@ Register Src="~/Reporting Grid/StationsGraph.ascx" TagPrefix="uc1" TagName="StationsGraph" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	
	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7, IE=EmulateIE9, IE=EDGE,chrome=1" />
    <title></title>

    <link href="advcss/bootstrap.min.css" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="advfonts/font-awesome.min.css" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="advcss/nprogress.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="advcss/daterangepicker.css" rel="stylesheet"/>
    <!-- bootstrap-datetimepicker -->
    <link href="advcss/bootstrap-datetimepicker.css" rel="stylesheet"/>
    <!-- iCheck -->
    <link href="advcss/green.css" rel="stylesheet"/>
    <!-- Datatables -->
    <link href="advcss/dataTables.bootstrap.min.css" rel="stylesheet"/>
    <link href="advcss/buttons.bootstrap.min.css" rel="stylesheet"/>
    <link href="advcss/fixedHeader.bootstrap.min.css" rel="stylesheet"/>
    <link href="advcss/responsive.bootstrap.min.css" rel="stylesheet"/>
    <link href="advcss/scroller.bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="advcss/custom.min.css" rel="stylesheet"/>
	<style>
		
.Cont {
	background-color: #fff;
	border: 3px solid #fff;
	display: inline-block;
	padding: 15px;
	position: fixed;
	-webkit-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-webkit-transition: opacity .5s, top .5s;
	-moz-transition: opacity .5s, top .5s;
	-o-transition: opacity .5s, top .5s;
	transition: opacity .5s, top .5s;
	background: #fff;
	padding: 30px;
	border-radius: 7px;
	box-shadow: 0 3px 20px rgba(0,0,0,0.9);
	background: #fff;
	background: -moz-linear-gradient(#fff, #ccc);
	background: -webkit-linear-gradient(#fff, #ccc);
	background: -o-linear-gradient(#fff, #ccc);
	background: linear-gradient(#fff, #ccc);
	text-shadow: 0 1px 0 #fff;
	opacity: 0.6;
	border-radius: 5px;
	left: 5%;
	box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.2) inset, 0px 0px 2px rgba(0, 0, 0, 0.5);

	width: 90%;
	/*background-color: #1ea167;*/
	opacity: 0.4;
	border-radius: 5px;
	padding: 20px;
	/*background-image: -webkit-linear-gradient(90deg, #168d59, #1ea167);*/
	position: absolute;
	left: 5%;
	top: 100px;
	box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.2) inset, 0px 0px 2px rgba(0, 0, 0, 0.5);
}
div.background {
	background: url(klematis.jpg) repeat;
	border: 2px solid black;
}

div.transbox {
	margin: 30px;
	background-color: #ffffff;
	border: 1px solid black;
	opacity: 0.6;
	filter: alpha(opacity=60); /* For IE8 and earlier */
}

	div.transbox p {
		margin: 5%;
		font-weight: bold;
		color: #000000;
	}

.login {
	width: 90%;
	/*background-color: #1ea167;*/
	border-radius: 5px;
	padding: 20px;
	/*background-image: -webkit-linear-gradient(90deg, #168d59, #1ea167);*/
	position: absolute;
	left: 5%;
	top: 100px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	/*-webkit-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	-moz-box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;
	box-shadow: 0 1px 1px 2px rgba(0, 0, 0, 0.4) inset;*/
	background: #fff;
	border-radius: 7px;
	/*box-shadow: 0 3px 20px rgba(0,0,0,0.9);*/
	background: #fff;
	background: -moz-linear-gradient(#fff, #ccc);
	background: -webkit-linear-gradient(#fff, #ccc);
	background: -o-linear-gradient(#fff, #ccc);
	background: linear-gradient(#fff, #ccc);
}
.login h2 {
  color: white;
  font-size: 20px;
  margin: 0 0 15px;
  text-shadow: 0px -1px rgba(0, 0, 0, 0.5);
}
.login fieldset {
  border: 0;
  padding: 0;
  margin-bottom: 10px;
}
/*input {
  outline: none;
  width: 400px;
  height: 20px;
  display: block;
  background: #138050;
  border: 1px solid #0d6b42;
  margin: 0;
  padding: 13px 15px;
  font-size: 13px;
}*/
.login fieldset input:focus, .login fieldset input:active {
  background-color: #1ea167;
}
.login fieldset input:nth-child(1) {
  border-radius: 5px 5px 0 0;
}
.login fieldset input:nth-child(2) {
  position: relative;
  top: -1px;
  border-radius: 0 0 5px 5px;
  box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1) inset, 0 1px 0 rgba(255, 255, 255, 0.4);
}
.login fieldset ::-webkit-input-placeholder {
  color: rgba(255, 255, 255, 0.5);
}
.login input[type="submit"] {
  margin: 0;
  display: block;
  padding: 13px 0;
  width: 335px;
  font-size: 13px;
  font-weight: bold;
  border: 0;
  text-shadow: 0px 1px 0px rbga(255, 255, 255, 1);
  background-color: #f6ba35;
  background-image: -webkit-linear-gradient(90deg, #eca418, #ffcd4e);
  border-radius: 5px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.3);
}
.login .utilities {
  margin-top: 20px;
}
.login .utilities a {
  color: #61e5ab;
  text-decoration: none;
  font-size: 12px;
  text-shadow: -1px -1px 0 rgba(0, 0, 0, 0.4);
}
.login .utilities a:hover {
  color: white;
}
.login .utilities a:nth-child(2) {
  display: block;
  float: right;
  width: 50%;
  text-align: right;
}
.login:before, .login:after {
  z-index: -1;
  position: absolute;
  content: "";
  left: 5px;
  width: 53%;
  top: 15px;
  height: 80%;
  bottom: 80%;
  max-width: 300px;
  background: rgba(0, 0, 0, 0.7);
  box-shadow: -10px -15px 20px rgba(0, 0, 0, 0.2);
  -webkit-transform: rotate(-3deg);
}
.login:after {
  box-shadow: 10px -15px 20px rgba(0, 0, 0, 0.2) !important;
  -webkit-transform: rotate(3deg);
  right: 5px;
  left: auto;
}

.centered {
	text-align: center;
}

.left {
	float: left;
	padding: 20px;
}

.right {
	float: right;
	padding: 20px;
}

.button {
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 1px #000;
	font-size: 16px;
	text-decoration: none;
	padding: 0.5em 1.5em;
	margin: 0.5em;
	width: 90px;
	cursor: pointer;
	width: 200px;
	overflow: visible;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-transition: all 0.25s ease-in-out;
	-moz-transition: all 0.25s ease-in-out;
	-o-transition: all 0.25s ease-in-out;
	transition: all 0.25s ease-in-out;
}

.glass {
	background: -moz-linear-gradient(top, rgba(96,103,104,0.3) 0%, rgba(187,187,187,0.3) 3%, rgba(187,187,187,0.3) 27%, rgba(0,0,0,0.3) 28%, rgba(0,0,0,0.3) 60%, rgba(0,0,0,0.3) 73%, rgba(75,80,81,0.3) 88%, rgba(0,0,0,0.3) 97%, rgba(0,0,0,0.3) 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(96,103,104,0.3)), color-stop(3%,rgba(187,187,187,0.3)), color-stop(27%,rgba(187,187,187,0.3)), color-stop(28%,rgba(0,0,0,0.3)), color-stop(60%,rgba(0,0,0,0.3)), color-stop(73%,rgba(0,0,0,0.3)), color-stop(88%,rgba(75,80,81,0.3)), color-stop(97%,rgba(0,0,0,0.3)), color-stop(100%,rgba(0,0,0,0.3))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, rgba(96,103,104,0.3) 0%,rgba(187,187,187,0.3) 3%,rgba(187,187,187,0.3) 27%,rgba(0,0,0,0.3) 28%,rgba(0,0,0,0.3) 60%,rgba(0,0,0,0.3) 73%,rgba(75,80,81,0.3) 88%,rgba(0,0,0,0.3) 97%,rgba(0,0,0,0.3) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, rgba(96,103,104,0.3) 0%,rgba(187,187,187,0.3) 3%,rgba(187,187,187,0.3) 27%,rgba(0,0,0,0.3) 28%,rgba(0,0,0,0.3) 60%,rgba(0,0,0,0.3) 73%,rgba(75,80,81,0.3) 88%,rgba(0,0,0,0.3) 97%,rgba(0,0,0,0.3) 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, rgba(96,103,104,0.3) 0%,rgba(187,187,187,0.3) 3%,rgba(187,187,187,0.3) 27%,rgba(0,0,0,0.3) 28%,rgba(0,0,0,0.3) 60%,rgba(0,0,0,0.3) 73%,rgba(75,80,81,0.3) 88%,rgba(0,0,0,0.3) 97%,rgba(0,0,0,0.3) 100%); /* IE10+ */
	background: linear-gradient(to bottom, rgba(96,103,104,0.3) 0%,rgba(187,187,187,0.3) 3%,rgba(187,187,187,0.3) 27%,rgba(0,0,0,0.3) 28%,rgba(0,0,0,0.3) 60%,rgba(0,0,0,0.3) 73%,rgba(75,80,81,0.3) 88%,rgba(0,0,0,0.3) 97%,rgba(0,0,0,0.3) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4d606768', endColorstr='#4d000000',GradientType=0 ); /* IE6-9 */
	border-color: rgba(0, 0, 0, 0.6);
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset;
}

button:active {
	margin-left: 2px;
	margin-right: -2px;
}

	/**
 * Style A
 */
	button:hover.clear-a, button:active.red-a, button:active.green-a, button:active.blue-a {
		-webkit-transition: none !important;
		-moz-transition: none !important;
		-o-transition: none !important;
		transition: none !important;
		*/
	}

button:hover.clear-a {
	color: rgba(255, 255, 255, 0.99) !important;
	text-shadow: 0px 0px 2px rgba(255, 255, 255, 0.99), 0px 0px 4px rgba(255, 255, 255, 0.75) !important;
	border-color: rgba(255, 255, 255, 0.4) !important;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75), 0 0 10px 2px rgba(255, 255, 255, 0.75) inset !important;
}

button:active.clear-a {
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 1px #000;
	border-color: rgba(255, 255, 255, 0.6) !important;
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px 0 0 rgba(255, 255, 255, 0.5) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75), 0 0 10px 2px rgba(255, 255, 255, 0.75) inset !important;
	background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(255,255,255,1)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
}

.red-a, .red-b {
	color: rgba(255, 200, 200, 0.99);
	background-color: rgba(255, 120, 120, 0.5);
}

button:hover.red-a {
	color: rgba(255, 230, 230, 0.99) !important;
	text-shadow: 0px 0px 2px rgba(255, 230, 230, 0.99), 0px 0px 4px rgba(255, 200, 200, 0.99) !important;
	border-color: rgba(255, 120, 120, 0.4) !important;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0 5px 2px rgba(255, 120, 120, 0.75), 0 0 10px 2px rgba(255, 120, 120, 0.75) inset !important;
}

.green-a, .green-b {
	color: rgba(180, 255, 220, 0.99);
	background-color: rgba(110,255,185,0.5);
}

button:hover.green-a {
	color: rgba(220, 255, 240, 0.99);
	text-shadow: 0px 0px 2px rgba(220, 255, 240, 0.99), 0px 0px 4px rgba(180, 255, 220, 0.99);
	border-color: rgba(110, 255, 185, 0.4);
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0px 5px 2px rgba(110, 255, 185, 0.75), 0 0px 10px 2px rgba(110, 255, 185, 0.75) inset;
}

.blue-a, .blue-b {
	color: rgba(200, 230, 255, 0.99) !important;
	background-color: rgba(120, 200, 255, 0.5) !important;
}

button:hover.blue-a {
	color: rgba(230, 240, 255, 0.99) !important;
	text-shadow: 0px 0px 2px rgba(230, 240, 255, 0.99), 0px 0px 4px rgba(200, 230, 255, 0.99) !important;
	border-color: rgba(120, 200, 255, 0.4) !important;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0px 5px 2px rgba(120, 200, 255, 0.75), 0 0px 10px 2px rgba(120, 200, 255, 0.75) inset !important;
}

/**
 * Style B
 */
.clear-b, .red-b, .green-b, .blue-b {
	-webkit-transition: none;
	-moz-transition: none;
	-o-transition: none;
	transition: none;
}

button:hover.clear-b {
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 1px #000;
	border-color: rgba(0, 0, 0, 0.6);
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px rgba(255, 255, 255, 0.5) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75);
	background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(255,255,255,1)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
}

button:active.clear-b {
	border-color: rgba(255, 255, 255, 0.6) !important;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px 0 0 rgba(255, 255, 255, 0.5) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75), 0 0 10px 2px rgba(255, 255, 255, 0.75) inset !important;
}

button:hover.red-b {
	border-color: rgba(0, 0, 0, 0.6);
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px rgba(255, 180, 180, 0.5) inset, 0 0 5px 2px rgba(255, 120, 120, 0.75), 0 0 10px 2px rgba(255, 120, 120, 0.75) inset;
	background: -moz-radial-gradient(center, ellipse cover, rgba(255, 120, 120,1) 0%, rgba(255, 120, 120,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(255, 120, 120,1)), color-stop(100%,rgba(255, 120, 120,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(255, 120, 120,1) 0%,rgba(255, 120, 120,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(255, 120, 120,1) 0%,rgba(255, 120, 120,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(255, 120, 120,1) 0%,rgba(255, 120, 120,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(255, 120, 120,1) 0%,rgba(255, 120, 120,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#643232', endColorstr='#ff7878',GradientType=0 ); /* IE6-9 fallback on vertical gradient */
}

button:active.red-b {
	border-color: rgba(255, 180, 180, 0.6) !important;
	box-shadow: 0 1px 0 0 rgba(255, 120, 120, 0.4) inset, 0 10px 0 0 rgba(255, 180, 180, 0.5) inset, 0 0 5px 2px rgba(255, 120, 120, 0.75), 0 0 10px 2px rgba(255, 120, 120, 0.75) inset !important;
}

button:hover.green-b {
	border-color: rgba(0, 0, 0, 0.6);
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px rgba(110, 255, 185, 0.5) inset, 0 0 5px 2px rgba(110, 255, 185, 0.75), 0 0 10px 2px rgba(110, 255, 185, 0.75) inset;
	background: -moz-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%, rgba(110, 255, 185,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(110, 255, 185,1)), color-stop(100%,rgba(110, 255, 185,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#643232', endColorstr='#ff7878',GradientType=0 ); /* IE6-9 fallback on vertical gradient */
}

button:active.green-b {
	border-color: rgba(110, 255, 185, 0.6) !important;
	box-shadow: 0 1px 0 0 rgba(110, 255, 185, 0.4) inset, 0 10px 0 0 rgba(110, 255, 185, 0.5) inset, 0 0 5px 2px rgba(110, 255, 185, 0.75), 0 0 10px 2px rgba(110, 255, 185, 0.75) inset !important;
}

button:hover.blue-b {
	border-color: rgba(0, 0, 0, 0.6);
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px rgba(120, 200, 255, 0.5) inset, 0 0 5px 2px rgba(120, 200, 255, 0.75), 0 0 10px 2px rgba(120, 200, 255, 0.75) inset;
	background: -moz-radial-gradient(center, ellipse cover, rgba(120, 200, 255,1) 0%, rgba(120, 200, 255,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(120, 200, 255,1)), color-stop(100%,rgba(120, 200, 255,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(120, 200, 255,1) 0%,rgba(120, 200, 255,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(120, 200, 255,1) 0%,rgba(120, 200, 255,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(120, 200, 255,1) 0%,rgba(120, 200, 255,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(120, 200, 255,1) 0%,rgba(120, 200, 255,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#643232', endColorstr='#ff7878',GradientType=0 ); /* IE6-9 fallback on vertical gradient */
}

button:active.blue-b {
	border-color: rgba(120, 200, 255, 0.6) !important;
	box-shadow: 0 1px 0 0 rgba(120, 200, 255, 0.4) inset, 0 10px 0 0 rgba(120, 200, 255, 0.5) inset, 0 0 5px 2px rgba(120, 200, 255, 0.75), 0 0 10px 2px rgba(120, 200, 255, 0.75) inset !important;
}


.glow {
	box-shadow: 0 0 20px white;
}

.Op {
	background: rgba(46, 51, 56, 0.2) !important;
}

	.Op:hover {
		background: rgba(0,0,0,0.4) !important;
	}

.buttonX {
	/* background styles */
	position: relative;
	display: inline-block;
	padding: 15px 25px;
	background-color: green; /*for compatibility with older browsers*/
	background-image: linear-gradient(green,lightgreen);
	margin-bottom: 20px;
	/* text styles */
	margin-left: 30%;
	margin-right: 30%;
	text-decoration: none;
	color: #fff;
	font-size: 15px;
	font-family: sans-serif;
	font-weight: 100;
	opacity: 0.5;
}

	.buttonX:after {
		content: '';
		position: absolute;
		top: 2px;
		left: 2px;
		width: calc(100% - 4px);
		height: 5%;
		background: linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.2));
	}

	.buttonX:hover {
		background: linear-gradient(#073,#0fa);
	}

.buttonH:hover.clear-a {
	color: rgba(255, 255, 255, 0.99);
	text-shadow: 0px 0px 2px rgba(255, 255, 255, 0.99), 0px 0px 4px rgba(255, 255, 255, 0.75);
	border-color: rgba(255, 255, 255, 0.4);
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75), 0 0 10px 2px rgba(255, 255, 255, 0.75) inset;
}

.buttonH:active.clear-a {
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 1px #000;
	border-color: rgba(255, 255, 255, 0.6) !important;
	border-image: none;
	border-style: solid;
	border-width: 1px;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px 0 0 rgba(255, 255, 255, 0.5) inset, 0 0 5px 2px rgba(255, 255, 255, 0.75), 0 0 10px 2px rgba(255, 255, 255, 0.75) inset !important;
	background: -moz-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%, rgba(255,255,255,0) 100%); /* FF3.6+ */
	background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(255,255,255,1)), color-stop(100%,rgba(255,255,255,0))); /* Chrome,Safari4+ */
	background: -webkit-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* Opera 12+ */
	background: -ms-radial-gradient(center, ellipse cover, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* IE10+ */
	background: radial-gradient(ellipse at center, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#00ffffff',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
}

.buttonH:hover.blue-a {
	color: rgba(230, 240, 255, 0.99);
	text-shadow: 0px 0px 2px rgba(230, 240, 255, 0.99), 0px 0px 4px rgba(200, 230, 255, 0.99);
	border-color: rgba(120, 200, 255, 0.4);
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 2px 6px rgba(0, 0, 0, 0.5), 0 10px rgba(0, 0, 0, 0.05) inset, 0 0px 5px 2px rgba(120, 200, 255, 0.75), 0 0px 10px 2px rgba(120, 200, 255, 0.75) inset;
}

.buttonC {
	color: rgba(255, 255, 255, 0.8);
	text-shadow: 0px 1px #000;
	font-size: 12px;
	text-decoration: none;
	padding: 0.5em 1.5em;
	margin: 0.5em;
	width: 90px;
	cursor: pointer;
	width: 200px;
	overflow: visible;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-transition: all 0.25s ease-in-out;
	-moz-transition: all 0.25s ease-in-out;
	-o-transition: all 0.25s ease-in-out;
	transition: all 0.25s ease-in-out;
}

	.buttonC:active.green-b {
		border-color: rgba(110, 255, 185, 0.6) !important;
		box-shadow: 0 1px 0 0 rgba(110, 255, 185, 0.4) inset, 0 10px 0 0 rgba(110, 255, 185, 0.5) inset, 0 0 5px 2px rgba(110, 255, 185, 0.75), 0 0 10px 2px rgba(110, 255, 185, 0.75) inset !important;
	}

	.buttonC:hover.green-b {
		border-color: rgba(0, 0, 0, 0.6);
		border-image: none;
		border-style: solid;
		border-width: 1px;
		box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.4) inset, 0 10px rgba(110, 255, 185, 0.5) inset, 0 0 5px 2px rgba(110, 255, 185, 0.75), 0 0 10px 2px rgba(110, 255, 185, 0.75) inset;
		background: -moz-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%, rgba(110, 255, 185,0) 100%); /* FF3.6+ */
		background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%,rgba(110, 255, 185,1)), color-stop(100%,rgba(110, 255, 185,0))); /* Chrome,Safari4+ */
		background: -webkit-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* Chrome10+,Safari5.1+ */
		background: -o-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* Opera 12+ */
		background: -ms-radial-gradient(center, ellipse cover, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* IE10+ */
		background: radial-gradient(ellipse at center, rgba(110, 255, 185,1) 0%,rgba(110, 255, 185,0) 100%); /* W3C */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#643232', endColorstr='#ff7878',GradientType=0 ); /* IE6-9 fallback on vertical gradient */
	}


	

.menu-open-button {
   background: #EEEEEE;
   border-radius: 100%;
   width: 80px;
   height: 80px;
   margin-left: -40px;
   position: absolute;
   color: #FFFFFF;
   text-align: center;
   line-height: 80px;
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
   -webkit-transition: -webkit-transform ease-out 200ms;
   transition: -webkit-transform ease-out 200ms;
   transition: transform ease-out 200ms;
   transition: transform ease-out 200ms, -webkit-transform ease-out 200ms;
}

.menu-item img {
	width:90%;
	height:90%;
}
.menu-item {
	opacity: 0.4;
	width: 80px;
	height: 80px;
	margin-left: -40px;
	position: absolute;
	text-align: center;
	line-height: 80px;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
	-webkit-transition: -webkit-transform ease-out 200ms;
	transition: -webkit-transform ease-out 200ms;
	transition: transform ease-out 200ms;
	transition: transform ease-out 200ms, -webkit-transform ease-out 200ms;
}
	.menu-item:hover {
		opacity: 1;
		background:none;
	}
	.menu-open {
		display: none;
	}

.lines {
   width: 25px;
   height: 3px;
   background: #596778;
   display: block;
   position: absolute;
   top: 50%;
   left: 50%;
   margin-left: -12.5px;
   margin-top: -1.5px;
   -webkit-transition: -webkit-transform 200ms;
   transition: -webkit-transform 200ms;
   transition: transform 200ms;
   transition: transform 200ms, -webkit-transform 200ms;
}

.line-1 {
   -webkit-transform: translate3d(0, -8px, 0);
   transform: translate3d(0, -8px, 0);
}

.line-2 {
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
}

.line-3 {
   -webkit-transform: translate3d(0, 8px, 0);
   transform: translate3d(0, 8px, 0);
}

.menu-open:checked + .menu-open-button .line-1 {
   -webkit-transform: translate3d(0, 0, 0) rotate(45deg);
   transform: translate3d(0, 0, 0) rotate(45deg);
}

.menu-open:checked + .menu-open-button .line-2 {
   -webkit-transform: translate3d(0, 0, 0) scale(0.1, 1);
   transform: translate3d(0, 0, 0) scale(0.1, 1);
}

.menu-open:checked + .menu-open-button .line-3 {
   -webkit-transform: translate3d(0, 0, 0) rotate(-45deg);
   transform: translate3d(0, 0, 0) rotate(-45deg);
}

.menu {
   /*margin: auto;*/
   margin-left:5px;
   position: absolute;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   width: 80px;
   height: 80px;
   text-align: center;
   box-sizing: border-box;
   font-size: 26px;
}

.menu-item:hover {
   /*background: #EEEEEE;*/
   color: #3290B1;
}

.menu-item:nth-child(3) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(4) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(5) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(6) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(7) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(8) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-item:nth-child(9) {
   -webkit-transition-duration: 180ms;
   transition-duration: 180ms;
}

.menu-open-button {
   z-index: 2;
   -webkit-transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
   transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
   -webkit-transition-duration: 400ms;
   transition-duration: 400ms;
   -webkit-transform: scale(1.1, 1.1) translate3d(0, 0, 0);
   transform: scale(1.1, 1.1) translate3d(0, 0, 0);
   cursor: pointer;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
}

.menu-open-button:hover {
   -webkit-transform: scale(1.2, 1.2) translate3d(0, 0, 0);
   transform: scale(1.2, 1.2) translate3d(0, 0, 0);
}

.menu-open:checked + .menu-open-button {
   -webkit-transition-timing-function: linear;
   transition-timing-function: linear;
   -webkit-transition-duration: 200ms;
   transition-duration: 200ms;
   -webkit-transform: scale(0.8, 0.8) translate3d(0, 0, 0);
   transform: scale(0.8, 0.8) translate3d(0, 0, 0);
}

.menu-open:checked ~ .menu-item {
   -webkit-transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
   transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
}

.menu-open:checked ~ .menu-item:nth-child(3) {
   transition-duration: 180ms;
   -webkit-transition-duration: 180ms;
   -webkit-transform: translate3d(0.08361px, -104.99997px, 0);
   transform: translate3d(0.08361px, -104.99997px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(4) {
   transition-duration: 280ms;
   -webkit-transition-duration: 280ms;
   -webkit-transform: translate3d(90.9466px, -52.47586px, 0);
   transform: translate3d(90.9466px, -52.47586px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(5) {
   transition-duration: 380ms;
   -webkit-transition-duration: 380ms;
   -webkit-transform: translate3d(90.9466px, 52.47586px, 0);
   transform: translate3d(90.9466px, 52.47586px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(6) {
   transition-duration: 480ms;
   -webkit-transition-duration: 480ms;
   -webkit-transform: translate3d(0.08361px, 104.99997px, 0);
   transform: translate3d(0.08361px, 104.99997px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(7) {
   transition-duration: 580ms;
   -webkit-transition-duration: 580ms;
   -webkit-transform: translate3d(-90.86291px, 52.62064px, 0);
   transform: translate3d(-90.86291px, 52.62064px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(8) {
   transition-duration: 680ms;
   -webkit-transition-duration: 680ms;
   -webkit-transform: translate3d(-91.03006px, -52.33095px, 0);
   transform: translate3d(-91.03006px, -52.33095px, 0);
}

.menu-open:checked ~ .menu-item:nth-child(9) {
   transition-duration: 780ms;
   -webkit-transition-duration: 780ms;
   -webkit-transform: translate3d(-0.25084px, -104.9997px, 0);
   transform: translate3d(-0.25084px, -104.9997px, 0);
}

.blue {
   background-color: #669AE1;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.blue:hover {
   color: #669AE1;
   text-shadow: none;
}

.green {
   /*background-color: #70CC72;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);*/
}
\
.green:hover {
   color: #70CC72;
   text-shadow: none;
}

.red {
   /*background-color: #FE4365;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);*/
}

.red:hover {
   color: #FE4365;
   text-shadow: none;
}

.purple {
   /*background-color: #C49CDE;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);*/
}

.purple:hover {
   color: #C49CDE;
   text-shadow: none;
}

.orange {
   /*background-color: #FC913A;
  
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);*/
}

.orange:hover {
   color: #FC913A;
   text-shadow: none;
}

.lightblue {
   background-color: #62C2E4;
   box-shadow: 3px 3px 0 0 rgba(0, 0, 0, 0.14);
   text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.12);
}

.lightblue:hover {
   color: #62C2E4;
   text-shadow: none;
}

.credit {
   margin: 24px 20px 120px 0;
   text-align: right;
   color: #EEEEEE;
}

.credit a {
   padding: 8px 0;
   color: #C49CDE;
   text-decoration: none;
   transition: all 0.3s ease 0s;
}

.credit a:hover {
   text-decoration: underline;
}
.pagination {
	display: inline-block;
}
#pageButton {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}
.pageButton {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

/*.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}

	.form-control:focus {
		border-color: #66afe9;
		outline: 0;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
	}

	.form-control::-moz-placeholder {
		color: #999;
		opacity: 1
	}

	.form-control:-ms-input-placeholder {
		color: #999
	}

	.form-control::-webkit-input-placeholder {
		color: #999
	}

	.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
		cursor: not-allowed;
		background-color: #eee;
		opacity: 1
	}*/

textarea.form-control {
	height: auto
}
/*#mainselection select {
	border: 0;
	color: #EEE;
	background: transparent;
	font-size: 20px;
	font-weight: bold;
	padding: 2px 10px;
	width: 378px;
	*width: 350px;
	*background: #58B14C;
	-webkit-appearance: none;
}*/

#mainselection {
	overflow: hidden;
	width: 350px;
	-moz-border-radius: 9px 9px 9px 9px;
	-webkit-border-radius: 9px 9px 9px 9px;
	border-radius: 9px 9px 9px 9px;
	box-shadow: 1px 1px 11px #330033;
	background: #58B14C url("http://i62.tinypic.com/15xvbd5.png") no-repeat scroll 319px center;
}

.semi-square {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

/* -------------------- Colors: Background */
.slate {
	background-color: #ddd;
}

.green {
	background-color: #779126;
}

.blue {
	background-color: #3b8ec2;
}

.yellow {
	background-color: #eec111;
}

.black {
	background-color: #000;
}

/* -------------------- Colors: Text */
/*.slate select {
	color: #000;
}

.green select {
	color: #fff;
}

.blue select {
	color: #fff;
}

.yellow select {
	color: #000;
}

.black select {
	color: #fff;
}*/

/* -------------------- Select Box Styles: stackoverflow.com Method */
/* -------------------- Source: http://stackoverflow.com/a/5809186 */
/*select{
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
	-webkit-user-select: none;
	background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-position: 97% center;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	margin: 20px;
	overflow: hidden;
	padding: 5px 10px;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 300px;
}

select#soflow-color {
	color: #fff;
	background-image: url(http://i62.tinypic.com/15xvbd5.png), -webkit-linear-gradient(#779126, #779126 40%, #779126);
	background-color: #779126;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	border-radius: 20px;
	padding-left: 15px;
}*/
select,input{
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
	-webkit-user-select: none;
	background-image: url(../images/Pen_256.png), -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-size:20px;
	background-position: 97% center;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	/*font-size: inherit;
	margin: 20px;*/
	overflow: hidden;
	padding: 5px 10px;
	text-overflow: ellipsis;
	min-width:100px;
}
/*background: url(mountain.jpg);
background-repeat: no-repeat;
background-size: auto;*/
/*input {
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
	-webkit-user-select: none;
	background: -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-position: 97% center;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	margin: 20px;
	overflow: hidden;
	padding: 5px 10px;
	text-overflow: ellipsis;
	width: 300px;
}*/

		table {
	max-width: 100%;
	background-color: transparent;
	border-collapse: collapse;
	border-spacing: 0;
	box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.2) inset, 0px 0px 2px rgba(0, 0, 0, 0.5);
}

.table {
	width: 100%;
	margin-bottom: 18px;
	text-align:center;
	
}

	.table th,
	.table td {
		padding: 8px;
		line-height: 18px;
		text-align:center;
		vertical-align: top;
		border-top: 1px solid #dddddd;
	}

	.table th {
		font-weight: bold;
	}

	.table thead th {
		vertical-align: bottom;
	}

	.table caption + thead tr:first-child th,
	.table caption + thead tr:first-child td,
	.table colgroup + thead tr:first-child th,
	.table colgroup + thead tr:first-child td,
	.table thead:first-child tr:first-child th,
	.table thead:first-child tr:first-child td {
		border-top: 0;
	}

	.table tbody + tbody {
		border-top: 2px solid #dddddd;
	}

.table-condensed th,
.table-condensed td {
	padding: 4px 5px;
}

.table-bordered {
	border: 1px solid double;
	border-collapse: separate;
	*border-collapse: collapsed;
	border-left: 0;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
}

	.table-bordered th,
	.table-bordered td {
		border-left: 1px solid #dddddd;
	}

	.table-bordered caption + thead tr:first-child th,
	.table-bordered caption + tbody tr:first-child th,
	.table-bordered caption + tbody tr:first-child td,
	.table-bordered colgroup + thead tr:first-child th,
	.table-bordered colgroup + tbody tr:first-child th,
	.table-bordered colgroup + tbody tr:first-child td,
	.table-bordered thead:first-child tr:first-child th,
	.table-bordered tbody:first-child tr:first-child th,
	.table-bordered tbody:first-child tr:first-child td {
		border-top: 0;
	}

		.table-bordered thead:first-child tr:first-child th:first-child,
		.table-bordered tbody:first-child tr:first-child td:first-child {
			-webkit-border-top-left-radius: 4px;
			border-top-left-radius: 4px;
			-moz-border-radius-topleft: 4px;
		}

		.table-bordered thead:first-child tr:first-child th:last-child,
		.table-bordered tbody:first-child tr:first-child td:last-child {
			-webkit-border-top-right-radius: 4px;
			border-top-right-radius: 4px;
			-moz-border-radius-topright: 4px;
		}

	.table-bordered thead:last-child tr:last-child th:first-child,
	.table-bordered tbody:last-child tr:last-child td:first-child {
		-webkit-border-radius: 0 0 0 4px;
		-moz-border-radius: 0 0 0 4px;
		border-radius: 0 0 0 4px;
		-webkit-border-bottom-left-radius: 4px;
		border-bottom-left-radius: 4px;
		-moz-border-radius-bottomleft: 4px;
	}

	.table-bordered thead:last-child tr:last-child th:last-child,
	.table-bordered tbody:last-child tr:last-child td:last-child {
		-webkit-border-bottom-right-radius: 4px;
		border-bottom-right-radius: 4px;
		-moz-border-radius-bottomright: 4px;
	}

.table-striped tbody tr:nth-child(odd) td,
.table-striped tbody tr:nth-child(odd) th {
	background-color: #f9f9f9;
}

.table tbody tr:hover td,
.table tbody tr:hover th {
	background-color: #ffd800;
}

		.Head {
			visibility:hidden;
		}
		#section-to-print table {
			width:90%;
			margin-left:0px;
			margin-right:0px;
    	}
	</style>
    <style>
        @media print
{
  @page { size: A4;}
  body * {
    content: none;
	visibility:hidden;
  }
    	.ribbon {
		

			margin-bottom:0px;
			visibility:hidden;
    	}
  #section-to-print, #section-to-print * {
    visibility: visible;
  }
    	#section-to-print table {
			width:90%;
			margin-left:0px;
			margin-right:0px;
    	}
  .Head {
			visibility:visible;
		}
  #section-to-print {
    position: absolute;
    left: 0;
    top: 0;
  }
}
         /*@media print {
              #DivToPrint { display: block; }*/
             /*.DivToPrint {
        background-color: white;
        height: 100%;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        margin: 0;
        padding: 15px;
        font-size: 14px;
        line-height: 18px;
    }*/
             /*@page { size: A4;}*/

    /*.Break {page-break-before: always;}*/

    </style>
</head>
<body style="background:#ffffff">   
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="ScriptmAN"/>
        <uc1:Ribbon runat="server" ID="Ribbon" />
	<div>

           
                <div class="x_panel">
             
                  <div class="x_content">
                      
                      <table>
                           <tr>
                              <td><img src="images/briefcase_256x256.png" width="20" height="20" alt="Briefcase" />  </td>
                              <td>   
               <asp:TextBox ID="TxtSection" placeholder="Station" CssClass="form-control" runat="server"></asp:TextBox>
                               </td>
                          
                              <td><img src="images/planner.png" width="20" height="20" alt="Briefcase" /></td>
                             <td> 
                                  <asp:TextBox ID="TxtDateFrm" placeholder="Date from" CssClass="form-control" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="TxtDateFrm" TodaysDateFormat="MM-dd-yyyy:HH:mm:ss" />
				          </td>
                      
                              <td><img src="images/planner.png" width="20" height="20" alt="Briefcase" /></td>
                             <td> 
                         <asp:TextBox ID="TxtDateTo" placeholder="Date To" runat="server" CssClass="form-control"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" BehaviorID="txtdate_CalendarExtender" TargetControlID="TxtDateTo" TodaysDateFormat="MM-dd-yyyy:HH:mm:ss" />
				
                      </td>
                          </tr>
						  <tr>
							   <td><img src="images/briefcase_256x256.png" width="40" height="40" alt="Briefcase" />  </td>
							  <td colspan="5">  <asp:TextBox ID="TxtReportTitle" OnTextChanged="TxtReportTitle_TextChanged" AutoPostBack="true" placeholder="Report Title" Width="100%" runat="server" CssClass="form-control"></asp:TextBox></td>
						  </tr>
                         
                      </table>
					   <div class="login" id="section-to-print">  
						   	   <img src="img/Roundel_of_Zambia.png" alt="" width="80" height="80" />
						     <h1 style="text-align:center">ZAMBIA AIR FORCE</h1>
						   <h2 style="text-align:center"><asp:Label ForeColor="Black" Font-Size="Larger" ID="lblTitle" runat="server" Text="Report Name"></asp:Label></h2>

					     <uc1:IssuedFunding runat="server" id="IssuedFunding" />
						   <uc1:Funded runat="server" id="Funded" />
						   <uc1:StationsGraph runat="server" id="StationsGraph" />
                     <%--
						 <uc1:IssuedFunding runat="server" ID="IssuedFunding" />--%>
                   
               
                  </div>
                </div>
             
        <!-- /footer content -->
      </div>
    </div>
    
   
    </form>
</body>
</html>
