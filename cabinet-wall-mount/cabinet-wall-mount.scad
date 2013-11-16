/*
 * file: cabinet-wall-mount.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 16.11.2013
 * last change: 16.11.2013
 * license: CC BY-NC-SA 3.0
 */

depth=15;
holediameter=4.5;
holelength=18;
thickness=8;
holedistance=5;
length1=30;
length2=49;
length3=35;
length4=35;
radius=5;
$fn=50;

/***********************/

module long_hole(){
	cylinder(h=thickness+5,r=holediameter/2);
	translate([0,-(holelength-holediameter),0])
		cylinder(h=thickness+5,r=holediameter/2);
	translate([-(holediameter/2),-(holelength-holediameter),0])
		cube([holediameter,holelength-holediameter,thickness+5]);
}

module shape(){
linear_extrude(height = depth)
	polygon(points=[
	[0,0],[0,-length1],[length3,-length1],[length3,-(length1+length2)],[length3+length4,-(length1+length2)],[length3+length4,-(length1+length2-thickness)],[length3+thickness,-(length1+length2-thickness)],[length3+thickness,-(length1-thickness)],[thickness,-(length1-thickness)],[thickness,0]],
	paths=[[0,1,2,3,4,5,6,7,8,9]]);
}

module strengthening() {
	translate([-radius,-radius,0])
		difference() {
			cube([radius,radius,depth]);
			translate([0,0,-0.5])
				cylinder(h=depth+5,r=radius);
		}
}

union() {
difference() {
	shape();
	translate([-0.5,-holedistance,depth/2])
		rotate([0,90,0])
			long_hole();
	translate([length3+length4-thickness,-(length1+length2+0.5),depth/2])
		rotate([-90,0,0])
			cylinder(h=thickness+5,r=holediameter/2);
}
translate([length3,-length1,0])
	strengthening();
translate([length3+thickness,0-(length1+length2-thickness),0])
	rotate([0,0,180])
		strengthening();
}
