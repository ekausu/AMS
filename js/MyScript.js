
$(document).ready(function () {
    //themes, change CSS with JS
    //default theme(CSS) is cerulean, change it if needed
   // var current_theme = $.cookie('current_theme') == null ? 'cerulean' : $.cookie('current_theme');
    //switch_theme(current_theme);

   // $('#themes a[data-value="' + current_theme + '"]').find('i').addClass('icon-ok');

    $('#themes a').click(function (e) {
        e.preventDefault();
        current_theme = $(this).attr('data-value');
        $.cookie('current_theme', current_theme, { expires: 365 });
        switch_theme(current_theme);
        $('#themes i').removeClass('icon-ok');
        $(this).find('i').addClass('icon-ok');
    });


    function switch_theme(theme_name) {
        $('#bs-css').attr('href', 'css/bootstrap-' + theme_name + '.css');
    }

    //ajax menu checkbox
    $('#is-ajax').click(function (e) {
        $.cookie('is-ajax', $(this).prop('checked'), { expires: 365 });
    });
   // $('#is-ajax').prop('checked', $.cookie('is-ajax') === 'true' ? true : false);

    //disbaling some functions for Internet Explorer
    if ($.browser.msie) {
        $('#is-ajax').prop('checked', false);
        $('#for-is-ajax').hide();
        $('#toggle-fullscreen').hide();
        $('.login-box').find('.input-large').removeClass('span10');

    }


    //highlight current / active link
    $('ul.main-menu li a').each(function () {
        if ($($(this))[0].href == String(window.location))
            $(this).parent().addClass('active');
    });

    //establish history variables
    //var
	//	History = window.History, // Note: We are using a capital H instead of a lower h
	//	State = History.getState(),
	//	$log = $('#log');

    //bind to State Change
    //History.Adapter.bind(window, 'statechange', function () { // Note: We are using statechange instead of popstate
    //    var State = History.getState(); // Note: We are using History.getState() instead of event.state
    //    $.ajax({
    //        url: State.url,
    //        success: function (msg) {
    //            $('#content').html($(msg).find('#content').html());
    //            $('#loading').remove();
    //            $('#content').fadeIn();
    //            var newTitle = $(msg).filter('title').text();
    //            $('title').text(newTitle);
    //            docReady();
    //        }
    //    });
    //});

    //ajaxify menus
    $('a.ajax-link').click(function (e) {
        if ($.browser.msie) e.which = 1;
        if (e.which != 1 || !$('#is-ajax').prop('checked') || $(this).parent().hasClass('active')) return;
        e.preventDefault();
        if ($('.btn-navbar').is(':visible')) {
            $('.btn-navbar').click();
        }
        $('#loading').remove();
        $('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
        var $clink = $(this);
        History.pushState(null, null, $clink.attr('href'));
        $('ul.main-menu li.active').removeClass('active');
        $clink.parent('li').addClass('active');
    });

    //animating menus on hover
    $('ul.main-menu li:not(.nav-header)').hover(function () {
        $(this).animate({ 'margin-left': '+=5' }, 300);
    },
	function () {
	    $(this).animate({ 'margin-left': '-=5' }, 300);
	});

    //other things to do on document ready, seperated for ajax calls
    docReady();
});


function docReady() {
    //prevent # links from moving to top
    $('a[href="#"][data-top!=true]').click(function (e) {
        e.preventDefault();
    });


    $('.btn-close').click(function (e) {
        e.preventDefault();
        $(this).parent().parent().parent().fadeOut();
    });
    $('.btn-minimize').click(function (e) {
        e.preventDefault();
        var $target = $(this).parent().parent().next('.box-content');
        if ($target.is(':visible')) $('i', $(this)).removeClass('icon-chevron-up').addClass('icon-chevron-down');
        else $('i', $(this)).removeClass('icon-chevron-down').addClass('icon-chevron-up');
        $target.slideToggle();
    });
    //$('.btn-setting').click(function (e) {
    //    e.preventDefault();
    //    $('#myModal').modal('show');
    //});




    //initialize the external events for calender

    $('#external-events div.external-event').each(function () {

        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true,      // will cause the event to go back to its
            revertDuration: 0  //  original position after the drag
        });

    });


    //initialize the calendar
    //$(document).ready(function () {

    //    $('#calendar').fullCalendar({
    //        theme: true,
    //        header: {
                
    //            left: 'prev,next today,listDay,listWeek,listYear',
    //            center: 'title',
    //            right: 'basicDay,basicWeek,month,agendaDay,agendaWeek'
    //        },
    //        defaultDate: '2017-05-12',
    //        navLinks: true, // can click day/week names to navigate views

    //        weekNumbers: true,
    //        weekNumbersWithinDays: true,
    //        weekNumberCalculation: 'ISO',

    //        editable: true,
    //        eventLimit: true, // allow "more" link when too many events
    //        events: [
	//			{
	//			    title: 'All Day Event',
	//			    start: '2017-05-01'
	//			},
	//			{
	//			    title: 'Long Event',
	//			    start: '2017-05-07',
	//			    end: '2017-05-10'
	//			},
	//			{
	//			    id: 999,
	//			    title: 'Repeating Event',
	//			    start: '2017-05-09T16:00:00'
	//			},
	//			{
	//			    id: 999,
	//			    title: 'Repeating Event',
	//			    start: '2017-05-16T16:00:00'
	//			},
	//			{
	//			    title: 'Conference',
	//			    start: '2017-05-11',
	//			    end: '2017-05-13'
	//			},
	//			{
	//			    title: 'Meeting',
	//			    start: '2017-05-12T10:30:00',
	//			    end: '2017-05-12T12:30:00'
	//			},
	//			{
	//			    title: 'Lunch',
	//			    start: '2017-05-12T12:00:00'
	//			},
	//			{
	//			    title: 'Meeting',
	//			    start: '2017-05-12T14:30:00'
	//			},
	//			{
	//			    title: 'Happy Hour',
	//			    start: '2017-05-12T17:30:00'
	//			},
	//			{
	//			    title: 'Dinner',
	//			    start: '2017-05-12T20:00:00'
	//			},
	//			{
	//			    title: 'Birthday Party',
	//			    start: '2017-05-13T07:00:00'
	//			},
	//			{
	//			    title: 'Click for Google',
	//			    url: 'http://google.com/',
	//			    start: '2017-05-28'
	//			}
    //        ]
    //    });

    //});
    //$('#calendar').fullCalendar({
    //    header: {
    //        left: 'prev,next today',
    //        center: 'title',
    //        right: 'month,agendaWeek,agendaDay'
    //    },
    //    editable: true,
    //    droppable: true, // this allows things to be dropped onto the calendar !!!
    //    drop: function (date, allDay) { // this function is called when something is dropped

    //        // retrieve the dropped element's stored Event Object
    //        var originalEventObject = $(this).data('eventObject');

    //        // we need to copy it, so that multiple events don't have a reference to the same object
    //        var copiedEventObject = $.extend({}, originalEventObject);

    //        // assign it the date that was reported
    //        copiedEventObject.start = date;
    //        copiedEventObject.allDay = allDay;

    //        // render the event on the calendar
    //        // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
    //        $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

    //        // is the "remove after drop" checkbox checked?
    //        if ($('#drop-remove').is(':checked')) {
    //            // if so, remove the element from the "Draggable Events" list
    //            $(this).remove();
    //        }

    //    }
    //});


    //chart with points
    if ($("#sincos").length) {
        var sin = [], cos = [];

        for (var i = 0; i < 14; i += 0.5) {
            sin.push([i, Math.sin(i) / i]);
            cos.push([i, Math.cos(i)]);
        }

        var plot = $.plot($("#sincos"),
			   [{ data: sin, label: "sin(x)/x" }, { data: cos, label: "cos(x)" }], {
			       series: {
			           lines: { show: true },
			           points: { show: true }
			       },
			       grid: { hoverable: true, clickable: true, backgroundColor: { colors: ["#fff", "#eee"] } },
			       yaxis: { min: -1.2, max: 1.2 },
			       colors: ["#539F2E", "#3C67A5"]
			   });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css({
                position: 'absolute',
                display: 'none',
                top: y + 5,
                left: x + 5,
                border: '1px solid #fdd',
                padding: '2px',
                'background-color': '#dfeffc',
                opacity: 0.80
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#sincos").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if (item) {
                if (previousPoint != item.dataIndex) {
                    previousPoint = item.dataIndex;

                    $("#tooltip").remove();
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);

                    showTooltip(item.pageX, item.pageY,
                                item.series.label + " of " + x + " = " + y);
                }
            }
            else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });



        $("#sincos").bind("plotclick", function (event, pos, item) {
            if (item) {
                $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                plot.highlight(item.series, item.datapoint);
            }
        });
    }

    //flot chart
    if ($("#flotchart").length) {
        var d1 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.25)
            d1.push([i, Math.sin(i)]);

        var d2 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.25)
            d2.push([i, Math.cos(i)]);

        var d3 = [];
        for (var i = 0; i < Math.PI * 2; i += 0.1)
            d3.push([i, Math.tan(i)]);
    }

    //stack chart
    if ($("#stackchart").length) {
        var d1 = [];
        for (var i = 0; i <= 10; i += 1)
            d1.push([i, parseInt(Math.random() * 30)]);

        var d2 = [];
        for (var i = 0; i <= 10; i += 1)
            d2.push([i, parseInt(Math.random() * 30)]);

        var d3 = [];
        for (var i = 0; i <= 10; i += 1)
            d3.push([i, parseInt(Math.random() * 30)]);

        var stack = 0, bars = true, lines = false, steps = false;
    }

    // plotWithOptions();

    //$(".stackControls input").click(function (e) {
    //    e.preventDefault();
    //    stack = $(this).val() == "With stacking" ? true : null;
    //    plotWithOptions();
    //});
    //$(".graphControls input").click(function (e) {
    //    e.preventDefault();
    //    bars = $(this).val().indexOf("Bars") != -1;
    //    lines = $(this).val().indexOf("Lines") != -1;
    //    steps = $(this).val().indexOf("steps") != -1;
    //    plotWithOptions();
    //});
    //}

    //pie chart
    var data = [
	{ label: "Internet Explorer", data: 12 },
	{ label: "Mobile", data: 27 },
	{ label: "Safari", data: 85 },
	{ label: "Opera", data: 64 },
	{ label: "Firefox", data: 90 },
	{ label: "Chrome", data: 112 }
    ];

    if ($("#piechart").length) {
        $.plot($("#piechart"), data,
		{
		    series: {
		        pie: {
		            show: true
		        }
		    },
		    grid: {
		        hoverable: true,
		        clickable: true
		    },
		    legend: {
		        show: false
		    }
		});

        function pieHover(event, pos, obj) {
            if (!obj)
                return;
            percent = parseFloat(obj.series.percent).toFixed(2);
            $("#hover").html('<span style="font-weight: bold; color: ' + obj.series.color + '">' + obj.series.label + ' (' + percent + '%)</span>');
        }
        $("#piechart").bind("plothover", pieHover);
    }

    //donut chart
    if ($("#donutchart").length) {
        $.plot($("#donutchart"), data,
		{
		    series: {
		        pie: {
		            innerRadius: 0.5,
		            show: true
		        }
		    },
		    legend: {
		        show: false
		    }
		});
    }




    // we use an inline data source in the example, usually data would
    // be fetched from a server
    var data = [], totalPoints = 300;
    function getRandomData() {
        if (data.length > 0)
            data = data.slice(1);

        // do a random walk
        while (data.length < totalPoints) {
            var prev = data.length > 0 ? data[data.length - 1] : 50;
            var y = prev + Math.random() * 10 - 5;
            if (y < 0)
                y = 0;
            if (y > 100)
                y = 100;
            data.push(y);
        }

        // zip the generated y values with the x values
        var res = [];
        for (var i = 0; i < data.length; ++i)
            res.push([i, data[i]])
        return res;
    }

    // setup control widget
    var updateInterval = 30;
    $("#updateInterval").val(updateInterval).change(function () {
        var v = $(this).val();
        if (v && !isNaN(+v)) {
            updateInterval = +v;
            if (updateInterval < 1)
                updateInterval = 1;
            if (updateInterval > 2000)
                updateInterval = 2000;
            $(this).val("" + updateInterval);
        }
    });

    //realtime chart
    if ($("#realtimechart").length) {
        var options = {
            series: { shadowSize: 1 }, // drawing is faster without shadows
            yaxis: { min: 0, max: 100 },
            xaxis: { show: false }
        };
        var plot = $.plot($("#realtimechart"), [getRandomData()], options);
        function update() {
            plot.setData([getRandomData()]);
            // since the axes don't change, we don't need to call plot.setupGrid()
            plot.draw();

            setTimeout(update, updateInterval);
        }

        update();
    };

}

