$(document).ready(function() {
				$(".switch").each(function() {
					var t = $(this);
					var s = t.children(".switcher");
					
					s
						.css("width", (t.width() / 2 - 5) + "px")
						.css("left", (s.offset().left - 2) + "px");
					
					
					
					var on = t.children(".on");
					var off = t.children(".off");
					
					var pos = t.offset();
					var len = t.width();
					var targetLeft = pos.left;
					var targetRight = pos.left + len - s.width() - 4;
					var targetCenter = pos.left + (len / 2);
					
					// alert ("Left: " + pos.left + ", Len: " + len + ", Rechte Seite: " + (pos.left+len));
					s.draggable({
						containment: "parent",
						axis: "x",
						start: function(event, ui) {
							on.removeClass("dark");
							off.removeClass("dark");
						},
						stop: function(event, ui) {
							var aktPos = s.offset();
							// alert("Links: " + targetLeft + ", Mitte: " + targetCenter + "Akt: " + (aktPos.left + (s.width() / 2)));
							if (aktPos.left + (s.width() / 2) < targetCenter)
							{
								on.removeClass("dark");
								off.addClass("dark");
								s.animate({ left: targetLeft }, 500);
								s.removeClass("right");
							}
							else
							{
								on.addClass("dark");
								off.removeClass("dark");
								s.animate({ left: targetRight }, 500);
								s.addClass("right");
							}
						}
					});
					s.dblclick(function() {
						if (s.hasClass("right"))
						{
							on.removeClass("dark");
							off.addClass("dark");
							s.animate({ left: targetLeft }, 500);
							s.removeClass("right");
						}
						else
						{
							on.addClass("dark");
							off.removeClass("dark");
							s.animate({ left: targetRight }, 500);
							s.addClass("right");
						}
					});
					if (s.hasClass("right"))
					{
						s.css("left", targetRight + "px");
					}
				});
			});