/*
 * file: box-closer-left.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 16.11.2013
 * last change: 16.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>

module grip() {
	count=5;
	translate([0,0,nutplaceholder+nutheight+nutplaceholder])
	for ( i = [0 : count-1] ) {
	translate([0, i*2.5, 0])
		cylinder(h=rightheight,r=gripradius);
	}
}

difference() {
	cube([leftwidth,leftthickness,leftheight]);
	translate([(leftwidth/2)-(nutsize/2),(leftthickness/2)-(nutdiagonale/2),nutplaceholder])
		cube([nutsize,leftthickness+10,nutheight]);
	translate([leftwidth/2,leftthickness/2,-1])
		cylinder(h=leftheight+5,r=screwdiameter/2);
	translate([leftwidth/2,leftthickness/2,nutplaceholder+nutsize+2])
		cylinder(h=10,r=screwheaddiameter/2);
	translate([-gripradius/2,0,0])
		grip();
	translate([leftwidth+(gripradius/2),leftthickness,0])
		rotate(	[0,0,180])
		grip();
}
