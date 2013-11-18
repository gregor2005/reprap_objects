/*
 * file: cabinet-door-locker.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 18.11.2013
 * last change: 18.11.2013
 * license: CC BY-NC-SA 3.0
 */

holediameter=12;
holestrengthening=3;
thickness=6;
length1=32;
height1=5;
length2=35;
radius=5;
securepart_length=15;
securepart_height=5;
$fn=100;

/*****************************/

outter_radius=(holediameter/2)+holestrengthening;
tempradius=(outter_radius-height1);

module securepart() {
	if (securepart_length>0 && securepart_height>0) {
		cube([securepart_height,securepart_length,thickness]);
		translate([-securepart_height,securepart_length-radius,0]) {
			difference() {
				cube([radius,radius,thickness]);
				translate([0,0,-0.5])
					cylinder(h=thickness+5,r=radius);
			}
		}
	}
}

translate([-outter_radius+(height1+length2-securepart_height),length1-securepart_length,0])
	securepart();

union() {

translate([(-((holediameter/2)+holestrengthening))+height1+radius,length1-radius,0]) {
	rotate([0,0,90])
	difference() {
		cube([radius+1,radius+1,thickness]);
		translate([0,0,-0.5])
			cylinder(h=thickness+5,r=radius);
	}
}


translate([0,tempradius+outter_radius,0]) {
	rotate([0,0,180])
	difference(){
		cube([tempradius+holestrengthening,tempradius+holestrengthening,thickness]);
		translate([0,0,-0.5])		
			cylinder(h=thickness+5,r=tempradius);
	}
}

translate([(-((holediameter/2)+holestrengthening))+height1,length1,0])
difference() {
	cylinder(h=thickness,r=height1);
	translate([0,-height1,-0.5])
		cube([height1*2,height1*2,thickness+5]);
	translate([-height1,-height1*2,-0.5])
		cube([height1*2,height1*2,thickness+5]);
}

difference() {
union() {
cylinder(h=thickness,r=outter_radius);
translate([-((holediameter/2)+holestrengthening),0,0])
	cube([height1,length1,thickness]);
translate([(-((holediameter/2)+holestrengthening))+height1,length1,0])
	cube([length2,height1,thickness]);
}
translate([0,0,-0.5])
	cylinder(h=thickness+5,r=holediameter/2);
}
}
