/*
 * file: cable-holder-iphone-v2.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 12.11.2013
 * last change: 12.11.2013
 * license: CC BY-NC-SA 3.0
 * changelog:
 *	- increase the back mounting surface so it can be better glued on a surface
 */

cablediameter=7;
width=17;
heightfront=9;
heightback=16;
plugthickness=8;
plugheight=9;
thickness=3;
fillet=6;

/******************/

depth=thickness+thickness+plugthickness;

module fillet() {
	difference() {
		rotate([0,90,0])
			cylinder(h=width,r=fillet);
		translate([-0.5,-fillet,0])
			cube([width+1,fillet*2,fillet]);
		translate([-0.5,0,-rr])
			cube([width+5,fillet,fillet+5]);
	}
	translate([0,0,-fillet])
		cube([width,depth-fillet,fillet]);
}

difference() {
	union() {
		cube([width,thickness,heightfront-fillet]);
		translate([0,thickness+plugthickness,0])
			cube([width,thickness,heightback-fillet]);
		translate([0,fillet,0])
			fillet();
	}
	translate([(width/2)-(cablediameter/2),-1,-0.5-fillet])
		cube([cablediameter,thickness+plugthickness+1,heightfront+fillet+5]);
}
