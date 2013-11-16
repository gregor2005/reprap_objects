/*
 * file: box-closer-right.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 16.11.2013
 * last change: 16.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>;

module grip() {
	count=15;
	for ( i = [0 : count-1] ) {
		rotate( i * 360 / count, [1, 0, 0])
			translate([0, 0, 7])
				rotate([0,90,0])
					cylinder(h=rightheight,r=gripradius+1);
	}
}

difference() {
	cylinder(h=rightheight,r=rightdiameter/2);
	translate([-(rightdiameter/4),-(nutdiagonale/2),nutplaceholder])
		cube([nutsize,20,nutheight]);
	translate([0,0,-3])
		cylinder(h=rightheight,r=screwdiameter/2);
	translate([0,0,rightheight+nutplaceholder+nutheight+nutplaceholder])
		rotate([0,90,0])
			grip();
}
