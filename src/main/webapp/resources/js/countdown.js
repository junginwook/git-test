/**
 * Created by jm1218 on 15. 3. 12.
 */
var CountDown = (function ($) {
	var ringer = {
		countdown_to: "10/12/2015",
		rings: {
			'DAYS': {
				s: 86400000, // mseconds in a day,
				max: 365
			},
			'HOURS': {
				s: 3600000, // mseconds per hour,
				max: 24
			},
			'MINUTES': {
				s: 60000, // mseconds per minute
				max: 60
			},
			'SECONDS': {
				s: 1000,
				max: 60
			},
			'MICROSEC': {
				s: 10,
				max: 100
			}
		},
		r_count: 4,
		r_spacing: 6, // px
		r_size: 60, // px
		r_thickness: 4, // px
		update_interval: 1000, // ms


		init: function(countdown_to, options){

			var that = this;
			that.countdown_to = countdown_to;
			//todo : working options
			that.cvs = document.createElement('canvas');

			that.size = {
				w: (that.r_size + that.r_thickness) * that.r_count + (that.r_spacing*(that.r_count-1)),
				h: (that.r_size + that.r_thickness)
			};



			that.cvs.setAttribute('width',that.size.w);
			that.cvs.setAttribute('height',that.size.h);
			that.ctx = that.cvs.getContext('2d');
			$(".countdownwrap").append(that.cvs);
			that.cvs = $(that.cvs);
			that.ctx.textAlign = 'center';
			that.actual_size = that.r_size + that.r_thickness;
			that.countdown_to_time = new Date(that.countdown_to).getTime();
			that.cvs.css({ width: that.size.w+"px", height: that.size.h+"px" });
			that.go();
		},
		ctx: null,
		go: function(){
			var idx=0;
			var that = this;
			this.time = (new Date().getTime()) - this.countdown_to_time;

			for(var r_key in that.rings) {
				this.unit(idx++,r_key,that.rings[r_key]);
			}

			setTimeout(function () {
				return that.go();
			}, that.update_interval);
		},
		unit: function(idx,label,ring) {
			var x,y, value, ring_secs = ring.s;
			var that = this;
			value = parseFloat(that.time/ring_secs);
			that.time-=Math.round(parseInt(value)) * ring_secs;
			value = Math.abs(value);

			x = (that.r_size*.5 + that.r_thickness*.5);
			x +=+(idx*(that.r_size+that.r_spacing+that.r_thickness));
			y = that.r_size*.5;
			y += that.r_thickness*.5;


			// calculate arc end angle
			var degrees = 360-(value / ring.max) * 360.0;
			var endAngle = degrees * (Math.PI / 180);

			that.ctx.save();

			that.ctx.translate(x,y);
			that.ctx.clearRect(that.actual_size*-0.5,that.actual_size*-0.5,that.actual_size,that.actual_size);

			// first circle
			that.ctx.strokeStyle = "rgba(128,128,128,0.2)";
			that.ctx.beginPath();
			that.ctx.arc(0,0,that.r_size/2,0,2 * Math.PI, 2);
			that.ctx.lineWidth =that.r_thickness;
			that.ctx.stroke();

			// second circle
			that.ctx.strokeStyle = "rgba(253, 128, 1, 0.9)";
			that.ctx.beginPath();
			that.ctx.arc(0,0,that.r_size/2,0,endAngle, 1);
			that.ctx.lineWidth =that.r_thickness;
			that.ctx.stroke();

			// label
			that.ctx.fillStyle = "#000000";

			that.ctx.font = '8px Helvetica';
			that.ctx.fillText(label, 0, 18);
			that.ctx.fillText(label, 0, 18);

			that.ctx.font = 'bold 30px Helvetica';
			that.ctx.fillText(Math.floor(value), 0, 10);

			that.ctx.restore();
		}
	};
	
	return {
		init : function (countdown_to, options) {
			return ringer.init.apply(ringer, Array.prototype.slice.call(arguments));
		}
	};

})(jQuery);
