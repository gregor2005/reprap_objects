/*
 * file: caravan-table-hinge-mount.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>;

outterdiameter = innerdiameter+(thickness*2);

module roundinglefttop() {
	translate([0,mountingwidth,0])
		rotate([0,-90,0])
			rotate([90,0,0])
	difference() {
		translate([-(roundingleft),-(roundingleft),0])
			cube([roundingleft,roundingleft,mountingwidth+5]);
		translate([-(roundingleft),-(roundingleft),-0.5])
			cylinder(h=mountingwidth+6,r=roundingleft);
	}
}

module roundingleftbottom() {
	translate([0,0,0])
	rotate([0,-90,0])
	roundinglefttop();
}

module fillettopinner() {
	cylinder(h=phasenbreite,r1=innerdiameter/2,r2=(innerdiameter/2)+phasenbreite);
}

module filletbottominner() {
	rotate([0,180,0])
		fillettopinner();
}

module screwhead() {
			cylinder(h=screwheadheigth+1,r1=holediameter/2,r2=screwheaddiameter/2);
}

module screw() {
	laenge=mountingwidth+1;
	translate([0,laenge+screwheadheigth,0])
		rotate([90,0,0]) {
		union() {
			cylinder(h=laenge,r=holediameter/2);
			translate([0,0,laenge])
				screwhead();
		}
	}
}

module fillet(radius) {
	difference() {
		translate([-(radius),-(radius),0])
			cube([radius,radius,height]);
		translate([-(radius),-(radius),-0.5])
			cylinder(h=height+1,r=radius);
	}
}

module mountingplate() {
	difference() {
		cube([mountinglength,mountingwidth,height]);
		translate([holedistance,0,height/2])
			screw();
		translate([mountinglength-holedistance,0,height/2])
			screw();
		translate([-0.001,2,height+0.001])
			roundinglefttop();
		translate([-0.001,2,-0.001])
			roundingleftbottom();
	}
}

difference() {
	union() {
		cylinder(h=height,r=(outterdiameter/2));	
		translate([-(outterdiameter/2),0,0])
			cube([outterdiameter/2,outterdiameter/2,height]);
		translate([-((outterdiameter/2)+mountinglength),(outterdiameter/2)-mountingwidth,0])
			mountingplate();
		translate([-(outterdiameter/2),(outterdiameter/2)-mountingwidth,0])
			fillet(rounding);
	}
	translate([0,0,-0.5])
		cylinder(h=height+1,r=(innerdiameter/2));
	translate([0,0,height-phasenbreite+0.001])
		fillettopinner();
	translate([0,0,phasenbreite+0.001])
		filletbottominner();
}
