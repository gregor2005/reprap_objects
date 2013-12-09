/*
 * file: simple-box.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 09.12.2013
 * last change: 09.12.2013
 * license: CC BY-NC-SA 4.0
 */

width=75;
length=110;
thickness=3;
height=35;
radius=5;
$fn=100;

/****************/

module inner_radius(h) {
	translate([radius,radius,0])
	difference() {
		translate([-radius,-radius,0])
			cube([radius,radius,h]);
		translate([0,0,-0.1])
			cylinder(h=h-thickness+5,r=radius);
	}
}

module corpus() {
	difference() {
		cube([width,length,height]);
		translate([thickness,thickness,thickness])
			cube([width-thickness*2,length-thickness*2,height+5]);
	}
}

difference() {
	corpus();
	translate([-0.1,-0.1,-0.1])
		inner_radius(height+5);
	translate([-0.1,length+0.1,-0.1])
		rotate([0,0,-90])
			inner_radius(height+5);
	translate([width+0.1,length+0.1,-0.1])
		rotate([0,0,180])
			inner_radius(height+5);
	translate([width+0.1,-0.1,-0.1])
		rotate([0,0,90])
			inner_radius(height+5);
}

translate([thickness,thickness,0])
	inner_radius(height);
translate([thickness,length-thickness,0])
	rotate([0,0,-90])
		inner_radius(height);
translate([width-thickness,thickness,0])
	rotate([0,0,90])
		inner_radius(height);
translate([width-thickness,length-thickness,0])
	rotate([0,0,-180])
		inner_radius(height);


