/*
 * file: doorstop-adapter.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 14.11.2013
 * last change: 14.11.2013
 * license: CC BY-NC-SA 3.0
 */

height1=20;
height2=10;
outterdiameter=27;
innerdiameter=7;
$fn=200;

/****************/

module shim(shimwidth,shimlength,shimdepth) {
	linear_extrude(height = shimdepth, center = true)
	polygon(points=[[0,0],[shimwidth,0],[shimwidth,shimlength]],paths=[ [0,1,2] ]);
}

difference() {
	cylinder(h=height1, r=outterdiameter/2);
	translate([0,0,(height1/2)])
		cylinder(h=(height1)+2, r=innerdiameter/2, center=true);
	translate([outterdiameter/2,0,height1+0.1])
		rotate([90,180,0])
			shim(outterdiameter,height2,outterdiameter);
}
