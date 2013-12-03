/*
 * file: drum-stand.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 03.12.2013
 * last change: 03.12.2013
 * license: CC BY-NC-SA 4.0
 */

r_front=260/2;
width=150;
thickness=50;
height=40;
$fn=400;

/****************/

h=r_front-(1/2)*sqrt(4*r_front*r_front-width*width);
//h=10;

//rotate([0,90,0])
difference() {
	cube([thickness,width,height]);
	translate([-0.5,width/2,r_front+height-h])
		rotate([0,90,0])
			cylinder(h=thickness+5,r=r_front);
}
