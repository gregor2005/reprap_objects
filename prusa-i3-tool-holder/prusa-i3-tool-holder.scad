/*
 * file: prusa-i3-tool-holder.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 9.2.2014
 * last change: 9.2.2014
 * license: CC BY-NC-SA 4.0
 */

hole_d=3.5;
thickness=2;
length1=12;
length2=23;
ligther_thickness=11.5;
hole_distance=2;
width=15;
curve_radius=ligther_thickness/2;
$fn=100;

difference() {
	cube([thickness+thickness+ligther_thickness,width,length2]);
	translate([thickness,-0.1,length1+0.1])
		cube([thickness+thickness+ligther_thickness,width+5,length2-length1+5]);
	translate([(thickness+thickness+ligther_thickness)/2,-0.1,(thickness+thickness+ligther_thickness)/2])
		rotate([-90,0,0])
			cylinder(h=width+5,r=ligther_thickness/2);
	translate([thickness,-0.1,(thickness+thickness+ligther_thickness)/2])
		cube([ligther_thickness,width+5,length1]);
	translate([thickness+thickness+ligther_thickness-curve_radius,-0.1,-0.1]) {
		difference(){
			cube([curve_radius+5,width+5,curve_radius]);
			translate([0,-0.1,curve_radius])
				rotate([-90,0,0])
				cylinder(h=width+10,r=curve_radius);
		}
	}
	translate([-0.1,width/2,length2-hole_d-hole_distance])
		rotate([0,90,0])
			cylinder(h=thickness+5,r=hole_d/2);
}
