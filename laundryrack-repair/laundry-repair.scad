/*
 * file: laundry-repair.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 09.12.2013
 * last change: 8.1.2014
 * license: CC BY-NC-SA 4.0
 */

include <configure.scad>;
use <angle.scad>;
use <round_part.scad>;

if (position=="middle") {
	translate([(-angle_plate_lenght)+(inner_diameter+thickness*2)/2,-angle_plate_widht/2,-(angle_thickness*2+angle_hole_diameter)-angle_plate_thickness])
		angle();
} else if (position=="left") {
	translate([(-angle_plate_lenght)+(inner_diameter+thickness*2)/2,-(inner_diameter+thickness*2)/2,-(angle_thickness*2+angle_hole_diameter)-angle_plate_thickness])
		angle();
} else if (position=="right") {
	translate([(-angle_plate_lenght)+(inner_diameter+thickness*2)/2,-(angle_plate_widht-(inner_diameter+thickness*2)/2),-(angle_thickness*2+angle_hole_diameter)-angle_plate_thickness])
		angle();
} else {
	angle();
}
rotate([0,0,180])
	round_part();


