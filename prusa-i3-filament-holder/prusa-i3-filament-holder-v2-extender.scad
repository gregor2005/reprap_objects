/*
 * file: prusa-i3-filament-holder-v2-extender.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 26.1.2014
 * last change: 26.1.2014
 * license: CC BY-NC-SA 4.0
 */

include <configure.scad>

module strengthening() {
	translate([0,0,extender_strengthening_d/2])
	rotate([-90,0,0])
	difference() {
		cube([extender_strengthening_d/2,extender_strengthening_d/2,depth]);
		translate([0,0,-0.1])
			cylinder(h=depth+5,r=extender_strengthening_d/2);
	}
}

translate([-extender_strengthening_d/2+0.1,0,bottomheight-0.1])
strengthening();
rotate([0,0,180])
translate([-bottomwidth-extender_strengthening_d/2+0.1,-depth,bottomheight-0.1])
strengthening();

difference() {
	cube([bottomwidth,depth,extender_height]);
	translate([((bottomwidth-width)/2)/2,depth/2,extender_height-extender_top_hole_depth+0.01])
		cylinder(h=extender_top_hole_depth,r=extender_top_hole/2);
	translate([bottomwidth-(((bottomwidth-width)/2)/2),depth/2,extender_height-extender_top_hole_depth+0.01])
		cylinder(h=extender_top_hole_depth,r=extender_top_hole/2);
}

temp = (-extender_width/2)+bottomwidth/2;

translate([(-extender_width/2)+bottomwidth/2,0,0])
	difference() {
		cube([extender_width,depth,bottomheight]);
		translate([-temp/2,depth/2,-0.01])
			cylinder(h=bottomheight+5,r=holediameter/2);
		translate([extender_width+temp/2,depth/2,-0.01])
			cylinder(h=bottomheight+5,r=holediameter/2);
	}
