/*
 * file: prusa-i3-z-axis-adjuster.scad
 * author: gregor binder
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

width=15;
heigth=30;
lenght=12;
thickness=5;
thicknessbottom=3;
holediameter=4;
distance=10;

nutsize=6;
nutheight=3;
nutdiagonal=7;


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
		cylinder(h=thicknessbottom+thicknessbottom+nutheight+5,r=holediameter/2);
}

/*
difference() {
	cylinder(h=nutheight+wallthickness,r=weeldiameter/2);
	translate([0,0,-1])
		cylinder(h=nutheight+wallthickness+5,r=holediameter/2);
	translate([0,0,wallthickness])
		cylinder(r = nutdiagonal/2, h=nutheight+5, $fn=6);
	translate([0,0,-1])
		grip();
}
*/
/*
	translate([0,0,wallthickness])
		cylinder(r = nutdiagonal/2, h=nutheight, $fn=6);
*/
