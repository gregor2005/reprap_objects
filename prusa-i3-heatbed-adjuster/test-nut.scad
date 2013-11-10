/*
 * file: test-nut.scad
 * author: gregor binder
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>;

difference(){
	cylinder(h=nutheight+thicknesstestnut,r=outerdiametertestnut/2);
	translate([0,0,thicknesstestnut])
		cylinder(r = nutdiagonal/2, h=nutheight+5, $fn=6);
	translate([0,0,-0.5])
		cylinder(h=nutheight+thicknesstestnut+5,r=holediameter/2);
}
