/*
 * file: heatbed-adjuster.scad
 * author: gregor binder
 * date: 10.11.2013
 * last change: 10.11.2013
 * license: CC BY-NC-SA 3.0
 */

include <configure.scad>;

module grip() {
	rotate([0,-90,0])
	for ( i = [0 : gripcount-1] ) {
		rotate( i * 360 / gripcount, [1, 0, 0])
			translate([0, 0, weeldiameter/2+1])
				rotate([0,90,0])
					cylinder(h=griopheight,r=gripradius);
	}
}



difference() {
	cylinder(h=nutheight+wallthickness,r=weeldiameter/2);
	translate([0,0,-1])
		cylinder(h=nutheight+wallthickness+5,r=holediameter/2);
	translate([0,0,wallthickness])
		cylinder(r = nutdiagonal/2, h=nutheight+5, $fn=6);
	translate([0,0,-1])
		grip();
}
