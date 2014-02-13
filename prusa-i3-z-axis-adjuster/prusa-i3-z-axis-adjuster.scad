/*
 * file: prusa-i3-z-axis-adjuster.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

width=15;
heigth=25; //30;
lenght=12;
thickness=4;
thicknessbottom=1.5; //3;
holediameter=5;
holediameter2=2.5;
distance=10;

nutsize=4.5; //6;
nutheight=2.5; //3;
nutdiagonal=6; //7;

$fn=100;

rotate([-90,0,0]){

difference() {
	cube([width,thickness,heigth]);
	translate([width/2,thickness+1,heigth-(width/2)])
		rotate([90,0,0])
			cylinder(h=thickness+5,r=holediameter/2);
}
difference() {
	translate([0,-lenght,0])
		cube([width,lenght,thicknessbottom+thicknessbottom+nutheight]);
	translate([(width/2)-(nutsize/2),-(lenght-thickness+6),thicknessbottom])
		cube([nutsize,lenght-thickness+5,nutheight]);
	translate([width/2,-(lenght-thickness),-1])
		cylinder(h=thicknessbottom+thicknessbottom+nutheight+5,r=holediameter2/2);
}

}
