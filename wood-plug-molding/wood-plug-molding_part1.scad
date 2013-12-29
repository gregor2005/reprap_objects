/*
 * file: wood-plug-molding.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 28.12.2013
 * last change: 28.12.2013
 * license: CC BY-NC-SA 4.0
 */

hole_diameter=6;
thickness=5;
wood_thickness=20;
depth=30;
length1=30;
length2=20;
$fn=50;

/****************/

temp_thickness=wood_thickness+2*thickness;
temp_length=length1+length2;

difference() {
	cube([temp_length,temp_thickness,depth]);
	translate([length2+0.01,thickness,-0.1])
		cube([length1,wood_thickness,depth+5]);
	translate([thickness,thickness,-0.1])
		cube([length2-2*thickness,wood_thickness,depth+5]);
	translate([-0.1,temp_thickness/2,depth/2])
		rotate([0,90,0])
			cylinder(h=temp_length+5,r=hole_diameter/2);
}
