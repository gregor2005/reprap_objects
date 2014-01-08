/*
 * file: laundry-repair.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 09.12.2013
 * last change: 8.1.2014
 * license: CC BY-NC-SA 4.0
 */

include <configure.scad>;

module round_part_inner(h) {
	difference() {
		cylinder(h=h,r=inner_diameter/2+(thickness));
		translate([0,0,-0.1])
			cylinder(h=h+5,r=inner_diameter/2);
	}
	translate([-(inner_diameter/2),-nose_width/2,0])
		cube([nose_height,nose_width,h]);
}

module round_part_outter(h) {
	difference() {
		cylinder(h=h,r=inner_diameter/2+(thickness));
		translate([0,0,-0.1])
			cylinder(h=h+5,r=inner_diameter/2);
	}
}

module round_part() {
	translate([(temp_height/2)+(inner_diameter+thickness*2)/2,(inner_diameter+thickness*2)/2,temp_height+plate_thickness]) {
		round_part_inner(round_part_inner_height);
		translate([0,0,round_part_inner_height])
			round_part_outter(round_part_height);
	}
}

round_part();

