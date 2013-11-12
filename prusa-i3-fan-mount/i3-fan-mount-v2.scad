/*
 * file: i3-fan-mount-v2.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 12.11.2013
 * last change: 12.11.2013
 * license: CC BY-NC-SA 3.0
 * changelog:
 *	- created a second hole to mount the fan
 */

hole=5;
thickness=4;
width=hole+thickness+thickness+5;
lenght=hole+thickness+thickness;
holedistance=71;
lenghtfanmount=holedistance+hole+(thickness*3);
$fn=50;

rotate([90,0,0])
union() {
difference() {
	cube([width,lenght,thickness]);
	translate([width/2,lenght/2,-0.5])
		cylinder(h=thickness+1,r=hole/2);
}
difference() {
	translate([0,-thickness,0])
		cube([width,thickness,lenghtfanmount]);
	translate([width/2,0.5,lenght/2+thickness])
		rotate([90,0,0])
			cylinder(h=thickness+1,r=hole/2);
	translate([width/2,0.5,(lenght/2+thickness)+holedistance])
		rotate([90,0,0])
			cylinder(h=thickness+1,r=hole/2);
}
}
