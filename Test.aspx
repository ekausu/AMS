<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="AdvanceSystem.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* message box */
.message-box {
  display: none;
  position: fixed;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: 9999;
}
.message-box.open {
  display: block;
}
.message-box .mb-container {
  position: absolute;
  left: 0px;
  top: 35%;
  background: rgba(0, 0, 0, 0.9);
  padding: 20px;
  width: 100%;
}
.message-box .mb-container .mb-middle {
  width: 50%;
  left: 25%;
  position: relative;
  color: #FFF;
}
.message-box .mb-container .mb-middle .mb-title {
  width: 100%;
  float: left;
  padding: 10px 0px 0px;
  font-size: 31px;
  font-weight: 400;
  line-height: 36px;
}
.message-box .mb-container .mb-middle .mb-title .fa,
.message-box .mb-container .mb-middle .mb-title .glyphicon {
  font-size: 38px;
  float: left;
  margin-right: 10px;
}
.message-box .mb-container .mb-middle .mb-content {
  width: 100%;
  float: left;
  padding: 10px 0px 0px;
}
.message-box .mb-container .mb-middle .mb-content p {
  margin-bottom: 0px;
}
.message-box .mb-container .mb-middle .mb-footer {
  width: 100%;
  float: left;
  padding: 10px 0px;
}
.message-box.message-box-warning .mb-container {
  background: rgba(254, 162, 35, 0.9);
}
.message-box.message-box-danger .mb-container {
  background: rgba(182, 70, 69, 0.9);
}
.message-box.message-box-info .mb-container {
  background: rgba(63, 186, 228, 0.9);
}
.message-box.message-box-success .mb-container {
  background: rgba(149, 183, 93, 0.9);
}

    </style>
	<style>
    .ajax__tab_header { font-family: Arial, Helvetica, sans-serif; font-size: 12px;font-weight: bold;color:#000;border-left:solid 1px #666666; border-bottom:thin 1px #666666 }
     /*.ajax__tab_outer { padding-right: 4px; height: 20px; background-color: #fff; margin-right: 1px; border-right: solid 1px #666666; border-top: solid 1px #666666 }*/
      .ajax__tab_inner { padding-left: 4px; background-color: #fff; }
       .ajax__tab { height: 13px; padding: 4px; margin: 0; }
       .ajax__tab:hover .ajax__tab_outer { background-color:  #c9c9c9}
     .ajax__tab_hover .ajax__tab_inner { background-color:  #c9c9c9}
         .ajax__tab:hover .ajax__tab { background-color: #c9c9c9; cursor:pointer }
      .ajax__tab_active .ajax__tab_outer { background-color:#9ebae8; border-left: solid 1px #999999; }
       .ajax__tab_active .ajax__tab_inner { background-color:#9ebae8; }
       .ajax__tab_active .ajax__tab_tab {background-color:#9ebae8;cursor:inherit }
       .ajax__tab_body {border: 1px solid #666666; padding: 6px; background-color: #ffffff; }
       .ajax__tab_disabled {color:Gray }
</style>
	<style>
		
		/*.ajax__tab_inner {
			height:19 !important;
			width:120px !important;
		}
		.ajax__tab_header {
			width:600px !important;
		}*/
		/*.ajax_tab .ajax_tab_tab {
			height:300px !important;
			margin:0;
			padding:10px 4px;
		}
		.ajax_tab .ajax_tab_body {
			position:absolute;
			top:100px;
			width:205px;
		}*/
	</style>
</head>
<body>
    <form id="form1" runat="server">
		<asp:ScriptManager runat="server" ID="fef"/>
        <div>
                         <button type="button" class="btn btn-success mb-control" data-box="#message-box-success">Success</button>
                                        <button type="button" class="btn btn-info mb-control" data-box="#message-box-info">Info</button>
                                        <button type="button" class="btn btn-warning mb-control" data-box="#message-box-warning">Warning</button>
                                        <button type="button" class="btn btn-danger mb-control" data-box="#message-box-danger">Danger</button>
                           
             <div class="alert alert-success" role="alert">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Well done!</strong> You successfully read this important alert message.
                            </div>
                            <div class="alert alert-info" role="alert">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Heads up!</strong> This alert needs your attention, but it's not super important.
                            </div>
                            <div class="alert alert-warning" role="alert">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Warning!</strong> Better check yourself, you're not looking too good.
                            </div>
                            <div class="alert alert-danger" role="alert">
                                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <strong>Oh snap!</strong> Change a few things up and try submitting again.
                            	<br />
								<br />
                            </div>                        
                           
             <div class="message-box message-box-danger animated fadeIn" id="message-box-danger">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-times"></span> Danger</div>
                    <div class="mb-content">
<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at tellus sed mauris mollis pellentesque nec a ligula. Quisque ultricies eleifend lacinia. Nunc luctus quam pretium massa semper tincidunt. Praesent vel mollis eros. Fusce erat arcu, feugiat ac dignissim ac, aliquam sed urna. Maecenas scelerisque molestie justo, ut tempor nunc.</p>--%>
                    </div>
                    <div class="mb-footer">
                        <button class="btn btn-default btn-lg pull-right mb-control-close">Close</button>
                    </div>
                </div>
            </div>
        </div>
       
        </div>
           <script type="text/javascript" src="js//jquery.min.js"></script>
            <script type="text/javascript" src="js/jquery-ui.min.js"></script>
            <script type="text/javascript" src="js//bootstrap.min.js"></script>        
         
           <script type="text/javascript" src="js/plugins.js"></script>        
            <script type="text/javascript" src="js/actions.js"></script>        
         
    	<ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="2" Height="300px" Width="597px">
			<ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
			</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
			</ajaxToolkit:TabPanel>
			<ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
				<ContentTemplate>
					qwdwd dwdw
				</ContentTemplate>
			</ajaxToolkit:TabPanel>
		</ajaxToolkit:TabContainer>
         
    </form>
</body>
</html>
