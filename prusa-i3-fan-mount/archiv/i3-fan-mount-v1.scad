/*
file: i3-fan-mount-v1.scad
author: gregor binder <gregor_reprap@catrix.at>
date: 7.11.2013
license: CC BY-NC-SA 3.0
*/

hole=5;
thickness=4;
width=hole+thickness+thickness+5;
lenght=hole+thickness+thickness;

union() {
difference() {
	cube([width,lenght,thickness]);
	translate([width/2,lenght/2,-0.5])
		cylinder(h=thickness+1,r=hole/2);
}
difference() {
	translate([0,-thickness,0])
		cube([width,thickness,lenght+thickness]);
	translate([width/2,0.5,lenght/2+thickness])
		rotate([90,0,0])
			cylinder(h=thickness+1,r=hole/2);
}
}
