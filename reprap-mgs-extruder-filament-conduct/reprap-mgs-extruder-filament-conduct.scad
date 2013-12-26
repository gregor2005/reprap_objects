/*
 * file: reprap-mgs-extruder-filament-conduct.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 26.12.2013
 * last change: 26.12.2013
 * license: CC BY-NC-SA 4.0
 */

diameter_screw=4.4;
diameter_filament_top=6.8;
diameter_filament_bottom=4.1;
top_height=10;
thickness=2;
screw_distance=17;
back_depth_1=3;
back_depth_2=13;
$fn=100;

/****************/

temp_bottom_height=diameter_screw+2*thickness;
temp_top_width=screw_distance-diameter_screw-2*thickness;
temp_top_width2=diameter_filament_top+2*thickness;
temp_top_height=temp_bottom_height+top_height;
temp_middle=(screw_distance+diameter_screw+2*thickness)/2;

module mountingpart(d) {
	difference() {
		cube([d,temp_bottom_height,temp_bottom_height]);
		translate([-0.1,temp_bottom_height/2,temp_bottom_height/2])
			rotate([0,90,0])
				cylinder(h=d+5,r=diameter_screw/2);
	}
}

module filamentpart() {
	difference() {
		cube([temp_top_width2,temp_top_width,temp_top_height]);
		translate([temp_top_width2/2,temp_top_width/2,-0.1])
			cylinder(h=temp_top_height+5,r=diameter_filament_bottom/2);
		translate([temp_top_width2/2,temp_top_width/2,thickness])
			cylinder(h=temp_top_height+5,r=diameter_filament_top/2);
	}
}

union() {
mountingpart(back_depth_1);
translate([0,temp_middle-(temp_top_width/2),0])
	filamentpart();
translate([0,screw_distance-0.01,0])
	mountingpart(back_depth_2);
}
