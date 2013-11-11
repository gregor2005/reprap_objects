/*
 * file: prusa-i3-belt-shim.scad
 * author: gregor binder
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

innerdiameter=12;
outerdiameter=18;
thickness=2.5;
holediameter=4.5;

difference() {
	cylinder(h=thickness,r1=outerdiameter/2,r2=innerdiameter/2);
	translate([0,0,-0.5])
		cylinder(h=thickness+5,r=holediameter/2);
}
