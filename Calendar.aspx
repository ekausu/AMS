<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="AdvanceSystem.Calendar" %>

<%@ Register Src="~/Design Cotrols/StyleBox.ascx" TagPrefix="uc1" TagName="StyleBox" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <link href='caljs/fullcalendar.min.css' rel='stylesheet' />
<link href='caljs/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:StyleBox runat="server" ID="StyleBox" />
         <div class="container-fluid">
                    <%-- <div class="row-fluid">--%>
                <div id="content" class="span10">
       
        <div>
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
            <div id='calendar' style="width:100%"></div>
                        </div>
                    </div>
                 </div>
        </div>
                   <%-- </div>--%>
                         </div>
             </div>
        <script src='caljs/moment.min.js'></script>
<script src='caljs/jquery.min.js'></script>
<script src='caljs/fullcalendar.min.js'></script>
<script>

    $(document).ready(function () {

        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaDay,agendaWeek,listDay,listWeek,listMonth,listYear'
            },

            // customize the button names,
            // otherwise they'd all just say "list"
            views: {
                listDay: { buttonText: 'list day' },listWeek: { buttonText: 'list week' },listMonth: { buttonText: 'list Month' },listYear: { buttonText: 'list Year' }
            },

            defaultView: 'listYear',
            defaultDate: '2017-05-12',
            navLinks: true, // can click day/week names to navigate views
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: [
                {
                    title: 'All Day Event',
                    start: '2017-05-01'
                },
                {
                    title: 'Long Event',
                    start: '2017-05-07',
                    end: '2017-05-10'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2017-05-09T16:00:00'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2017-05-16T16:00:00'
                },
                {
                    title: 'Conference',
                    start: '2017-05-11',
                    end: '2017-05-13'
                },
                {
                    title: 'Meeting',
                    start: '2017-05-12T10:30:00',
                    end: '2017-05-12T12:30:00'
                },
                {
                    title: 'Lunch',
                    start: '2017-05-12T12:00:00'
                },
                {
                    title: 'Meeting',
                    start: '2017-05-12T14:30:00'
                },
                {
                    title: 'Happy Hour',
                    start: '2017-05-12T17:30:00'
                },
                {
                    title: 'Dinner',
                    start: '2017-05-12T20:00:00'
                },
                {
                    title: 'Birthday Party',
                    start: '2017-05-13T07:00:00'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2017-05-28'
                }
            ]
        });

    });

</script>

    </form>
</body>
</html>
