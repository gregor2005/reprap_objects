/*
 * file: test-angle.scad
 * author: gregor binder <gregor_reprap@catrix.at>
 * date: 09.12.2013
 * last change: 8.1.2014
 * license: CC BY-NC-SA 4.0
 */

include <configure.scad>;

temp_height=angle_thickness*2+angle_hole_diameter;
temp_part_width=angle_plate_widht*0.24;
temp_part_length=angle_plate_lenght+temp_height/2;
temp_part_space=angle_plate_widht*0.26+temp_part_width;

module roundshape() {
	difference() {
	cube([temp_height/2,angle_plate_widht+5,angle_thickness*2+angle_hole_diameter+0.2]);
	translate([temp_height/2,-0.1,temp_height/2])
	rotate([-90,0,0])
		cylinder(h=angle_plate_widht+5,r=temp_height/2);
	}
}

module angle() {
	difference() {
	union() {
	cube([temp_part_length,temp_part_width,temp_height]);
	translate([0,0,temp_height])
		cube([temp_part_length-temp_height/2,temp_part_width,angle_thickness_part2]);
	translate([0,temp_part_space,temp_height])
		cube([temp_part_length-temp_height/2,temp_part_width,angle_thickness_part2]);
	translate([0,temp_part_space,0])
		cube([temp_part_length,temp_part_width,temp_height]);
	}
	translate([temp_part_length+0.01,angle_plate_widht,-0.01])
		rotate([0,0,180])
			roundshape();
	translate([temp_part_length-temp_height/2,-0.01,temp_height/2])
		rotate([-90,0,0])
			cylinder(h=angle_plate_widht+5,r=angle_hole_diameter/2);
	}
	// plate
	translate([0,0,temp_height+angle_thickness_part2])
		cube([angle_plate_lenght,angle_plate_widht,angle_plate_thickness]);
}

angle();
