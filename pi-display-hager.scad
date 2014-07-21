
// basics
pi_w = 85;
pi_h = 55;
margin = 2;
wall = 2.5;
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
video_offset = 32;

// SD card hole
sd_h = 50;
sd_w = 31;
sd_offset = 12;


// HDMI hole
hdmi_h = 15;
hdmi_w = 26;
hdmi_offset = 30;

// Power USB hole
power_h = 50;
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
display_dead = 5;
display_w_offset = 10;
display_h_offset = 1;

// What to render
translate([+((display_w+2*front_border)-pi_w)/2-wall*2,-(front_h-pi_h-wall)/2,depth+wall])
	rotate([180,0,0])
		box();
translate([0,-front_h-wall,0])
	front();

//back();

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
	poles();
}

module back() {
    difference() {
        cube([pi_w+2*margin+8*wall,pi_h+2*margin+2*wall,wall]);
        translate([wall*1.5,wall*4.5,-1*wall])
            cylinder(r=wall*0.7,h=3*wall);
        translate([pi_w+2*margin+6.5*wall,wall*4.5,-1*wall])
            cylinder(r=wall*0.7,h=3*wall);
    }
}

module front() {
	difference() {
		cube([front_border*2+display_w,front_h,wall]);
		translate([front_border+display_dead,(front_h-display_h)/2-wall*1.5,-wall]) cube([display_w-display_dead,display_h,wall*3]);
	}
	translate([front_offset,0,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	translate([front_offset,0,0])
		cube([display_w+2*front_border-2*front_offset,front_second+wall,3.5*wall]);
	translate([front_offset,front_h-wall,0])
		cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	//translate([front_offset,front_second,0])
		//cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	//translate([front_offset,front_h-wall-front_second,0])
		//cube([display_w+2*front_border-2*front_offset,wall,front_depth]);
	translate([front_offset,front_h-wall-front_second,0])
		cube([display_w+2*front_border-2*front_offset,front_second,3.5*wall]);
}

module bottom() {
	difference() {
		cube([pi_w+2*margin+2*wall,pi_h+2*margin+2*wall,depth]);
		translate([wall+margin/2,wall+margin/2,-wall]) cube([pi_w+margin,pi_h+margin,depth+2*wall]);
	}
}

module usb_ethernet() {
	translate([-wall/2,wall+margin+pi_h-usb_w-usb_offset,0])
		cube([2*wall,usb_w,usb_h]);
}

module poles() {
	translate([-wall*3,wall*3,0]) difference() {
		cube([3*wall,3*wall,depth+wall]);
		translate([wall*1.5,wall*1.5,0]) cylinder(r=wall*0.7,h=depth+3*wall);
	}
	translate([wall*4+pi_w-margin,wall*3,0]) difference() {
		cube([3*wall,3*wall,depth+wall]);
		translate([wall*1.5,wall*1.5,0]) cylinder(r=wall*0.7,h=depth+3*wall);
	}
	translate([wall*4+pi_w-margin,display_h+wall*4.3,0]) difference() {
		cube([2.5*wall,2.5*wall,depth+wall]);
		translate([wall*1.25,wall*1.25,0]) cylinder(r=wall*0.5,h=depth+3*wall);
	}
	translate([-wall*2.5,display_h+wall*4.3,0]) difference() {
		cube([2.5*wall,2.5*wall,depth+wall]);
		translate([wall*1.25,wall*1.25,0]) cylinder(r=wall*0.5,h=depth+3*wall);
	}
}

module sd() {
	translate([pi_w+wall*1.5,wall+margin+sd_offset,wall])
		cube([3*wall,sd_w,sd_h]);
}

module jack() {
	translate([wall+margin+jack_offset,-wall/2,0])
		cube([jack_w,2*wall,jack_h+2*wall]);
}

module video() {
	translate([wall+margin+video_offset,-wall/2,0])
		cube([video_w,2*wall,video_h+wall]);
}

module hdmi() {
	translate([wall+margin+hdmi_offset,pi_h+wall*1.5,0])
		cube([hdmi_w,3*wall,hdmi_h+wall]);
}

module power() {
	translate([pi_w+wall*1.5,wall+margin+pi_h-power_w-power_offset,wall])
		cube([3*wall,power_w,power_h]);
}


