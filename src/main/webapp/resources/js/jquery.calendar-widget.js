(function($) {

	function calendarWidget(el, params) {

		var now   = new Date();
		var thisMonth = now.getMonth();
		var thisYear  = now.getFullYear();
		var thisDay = now.getDate();

		var opts = {
			month: thisMonth,
			year: thisYear
		};

		$.extend(opts, params);

		var monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		var dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
		var month = i = parseInt(opts.month);
		var year = parseInt(opts.year);
		var table = '';

		// next month
		if (month == 11) {
			var next_month = '<a href="?month=' + 1 + '&amp;year=' + (year + 1) + '" title="' + monthNames[0] + ' ' + (year + 1) + '">' + monthNames[0] + ' ' + (year + 1) + '</a>';
		} else {
			var next_month = '<a href="?month=' + (month + 2) + '&amp;year=' + (year) + '" title="' + monthNames[month + 1] + ' ' + (year) + '">' + monthNames[month + 1] + ' ' + (year) + '</a>';
		}

		// previous month
		if (month == 0) {
			var prev_month = '<a href="?month=' + 12 + '&amp;year=' + (year - 1) + '" title="' + monthNames[11] + ' ' + (year - 1) + '">' + monthNames[11] + ' ' + (year - 1) + '</a>';
		} else {
			var prev_month = '<a href="?month=' + (month) + '&amp;year=' + (year) + '" title="' + monthNames[month - 1] + ' ' + (year) + '">' + monthNames[month - 1] + ' ' + (year) + '</a>';
		}

		table += ('<h3 id="current-month">'+monthNames[month]+' '+year+'</h3>');
		table += ('<table class="calendar-month " ' +'id="calendar-month'+i+' " cellspacing="0">');

		table += '<tr>';

		for (var d=0; d<7; d++) {
			table += '<th class="weekday">' + dayNames[d] + '</th>';
		}

		table += '</tr>';

		var firstDayDate = new Date(year,month,1);
		var firstDay = firstDayDate.getDay();

		var prev_m = month == 0 ? 11 : month-1;
		var prev_y = prev_m == 11 ? year - 1 : year;
		var prev_days = getDaysInMonth(prev_m, prev_y);
		firstDay = (firstDay == 0 && firstDayDate) ? 7 : firstDay;

		var i = 0;
		firstDay = firstDay === 7 ? 0 : firstDay;
		// block = 7 * 6
		for (var block = 0; block < 42; block++){

			if (block < firstDay){
				table += ('<td class="other-month"><span class="day">'+ (prev_days - firstDay + block + 1) +'</span></td>');
			} else if (block >= (firstDay + getDaysInMonth(month, year))) {
				i = i + 1;
				table += ('<td class="other-month"><span class="day">'+ i +'</span></td>');
			}else{
				var day = block - firstDay + 1;
				if (day === thisDay) {
					table += ('<td class="current-month today day'+ day +'"><span class="day">'+ day +'</span></td>');
				} else {
					table += ('<td class="current-month day'+ day +'"><span class="day">'+ day +'</span></td>');
				}
			}

			if (block%7==6)  table += ('</tr>');
		}

		table += ('</table>');
		el.html(table);
	}

	function getDaysInMonth(month,year)  {
		var daysInMonth=[31,28,31,30,31,30,31,31,30,31,30,31];
		if ((month==1)&&(year%4==0)&&((year%100!=0)||(year%400==0))){
			return 29;
		}else{
			return daysInMonth[month];
		}
	}


	// jQuery plugin initialisation
	$.fn.calendarWidget = function(params) {
		calendarWidget(this, params);
		return this;
	};

})(jQuery);