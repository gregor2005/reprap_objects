/*
 * file: prusa-i3-filament-holder-v2.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 13.11.2013
 * last change: 14.11.2013
 * license: CC BY-NC-SA 3.0
 * changelog:
 *	- switched from freecad to openscad
 */

bottomwidth=60;
bottomheight=5;
depth=25;
height=100-bottomheight;
width=20;
holediameter=3;
thickness=3;
holderdepth=10;
$fn=100;

/********************/

difference() {
	cube([bottomwidth,depth,bottomheight]);
	translate([((bottomwidth-width)/2)/2,depth/2,-0.5])
		cylinder(h=bottomheight+5,r=holediameter/2);
	translate([bottomwidth-(((bottomwidth-width)/2)/2),depth/2,-0.5])
		cylinder(h=bottomheight+5,r=holediameter/2);
}

translate([(bottomwidth-width)/2,0,bottomheight])
difference() {
	cube([width,depth,height]);
	translate([(width/2)-((width-(thickness*2))/2),-0.1,height+0.1])
		rotate([-90,0,0])
	linear_extrude(height = depth-thickness)
		polygon(points=[[0,0],[width-(thickness*2),0],[(width-(thickness*2))/2,holderdepth]], paths=[[0,1,2]]);
}
