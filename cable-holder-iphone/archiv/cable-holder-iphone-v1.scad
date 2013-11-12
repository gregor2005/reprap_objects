/*
 * file: cable-holder-iphone-v1.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

cablediameter=5;
width=15;
height=9;
plugthickness=7;
plugheight=9;
thickness=3;
fillet=6;

/******************/

depth=thickness+thickness+plugthickness;

module rundung() {
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
		cube([width,depth,height-fillet]);
		translate([0,fillet,0])
			rundung();
	}
	translate([(width/2)-(cablediameter/2),-1,-0.5-fillet])
		cube([cablediameter,thickness+plugthickness+1,height+fillet+5]);
	translate([-0.5,thickness,height-plugheight+0.1])
		cube([width+5,plugthickness,plugheight]);
}
