
// basics
pi_w = 85;
pi_h = 55;
margin = 1;
wall = 2;
depth = 30;

// USB + ethernet hole
usb_w = 38;
usb_h = depth;
usb_offset = 1;

// Jack hole
jack_w = 10;
jack_h = 15;
jack_offset = 16;

// Video hole
video_w = 12;
video_h = 20;
video_offset = 34;

// SD card hole
sd_h = 5;
sd_w = 29;
sd_offset = 12;


// HDMI hole
hdmi_h = 12;
hdmi_w = 18;
hdmi_offset = 33;

// Power USB hole
power_h = 8;
power_w = 10;
power_offset = 2.5;


// the front face
front_h = 82;
front_border = 25;
front_offset = 10;
front_depth = 15;
front_second = 8;

// display
display_w = 65;
display_h = 47;
display_w_offset = 10;
display_h_offset = 1;

// What to render
//box();
front();

module box() {
	difference() {
		bottom();
		usb_ethernet();
		jack();
		video();
		sd();
		hdmi();
		power();
	}
}

module front() {
	difference() {
		cube([front_border*2+display_w,front_h,wall]);
		translate([front_border,(front_h-display_h)/2,-wall]) cube([display_w,display_h,wall*3]);
	}
	translate([front_offset,0,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	translate([front_offset,front_h-wall,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	translate([front_offset,front_second,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	translate([front_offset,front_h-wall-front_second,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
}

module bottom() {
	difference() {
		cube([pi_w+2*margin+2*wall,pi_h+2*margin+2*wall,depth]);
		translate([wall+margin,wall+margin,wall]) cube([pi_w,pi_h,depth]);
	}
}

module usb_ethernet() {
	translate([-wall/2,wall+margin+pi_h-usb_w-usb_offset,wall])
		cube([2*wall,usb_w,usb_h]);
}

module sd() {
	translate([pi_w+wall*1.5,wall+margin+sd_offset,wall])
		cube([2*wall,sd_w,sd_h]);
}

module jack() {
	translate([wall+margin+jack_offset,-wall/2,wall])
		cube([jack_w,2*wall,jack_h]);
}

module video() {
	translate([wall+margin+video_offset,-wall/2,wall])
		cube([video_w,2*wall,video_h]);
}

module hdmi() {
	translate([wall+margin+hdmi_offset,pi_h+wall*1.5,wall])
		cube([hdmi_w,2*wall,hdmi_h]);
}

module power() {
	translate([pi_w+wall*1.5,wall+margin+pi_h-power_w-power_offset,wall])
		cube([2*wall,power_w,power_h]);
}


