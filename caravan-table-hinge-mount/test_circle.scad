/*
 * file: test_circle.scad
 * author: gregor binder
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>;

difference() {
	cylinder(h=heighttestcircle+1,r=(innerdiameter/2)+thicknesstestcircle);
	translate([0,0,-0.5])
		cylinder(h=heighttestcircle+2,r=(innerdiameter/2));
}
