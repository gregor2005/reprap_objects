/*
 * file: prusa-i3-optostopadapter.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 9.2.2014
 * last change: 9.2.2014
 * license: CC BY-NC-SA 4.0
 */

hole_d=4.5;
thickness=1;
lenght=35;
mount_thickness=2;
depth=8;
width=14;
$fn=50;

cube([lenght,width,thickness]);
translate([0,0,thickness])
	difference() {
		cube([mount_thickness,width,depth]);
		translate([-0.1,width/2,depth/2])
			rotate([0,90,0])
		cylinder(h=depth+5,r=hole_d/2);
	}


