$fn = 64;

radius = 20;
height = 45;
wall_thickness = 1;
bottom_thickness = 5;
bottom_flare = 1;
lip_height = 10;
lip_radius = 15;
spout_offset = 0;
spout_radius = 4;
spout_angle = 30;
spout_length = 80;

difference() {
    union() {
        cylinder(h = height, r1 = radius, r2 = radius);
        translate([0, 0, bottom_thickness])
            cylinder(h = bottom_thickness, r1 = radius + bottom_flare, r2 = radius);
        cylinder(h = bottom_thickness, r1 = radius + bottom_flare, r2 = radius + bottom_flare);
        translate([0, 0, spout_offset])
            rotate([0, spout_angle, 0])
                cylinder(h = spout_length, r1 = spout_radius, r2 = spout_radius);
        translate([-radius * 5/8, 0, height/2])
            rotate([90, 0, 0])
                rotate_extrude()
                    translate([height/3.5, 0, 0])
                        circle(r = 2.5);
    }
    translate([0, 0, bottom_thickness])
        cylinder(h = height, r1 = radius - wall_thickness, r2 = radius - wall_thickness);
    translate([0, 0, spout_offset])
            rotate([0, spout_angle, 0])
                translate([0, 0, bottom_thickness * 4])
                    cylinder(h = spout_length, r1 = spout_radius - wall_thickness, r2 = spout_radius - wall_thickness);
    rotate([180, 0, 0])
        linear_extrude(0, 0, 100)
            square(1000, center = true);
    translate([0, 0, height + 2 * lip_height])
        linear_extrude(0, 0, 100)
            square(500, center = true);
}

translate([0, 0, height]) difference() {
    cylinder(h = lip_height, r1 = radius, r2 = lip_radius);
    translate([0, 0, -wall_thickness]) cylinder(h = lip_height + 2 * wall_thickness, r1 = radius - wall_thickness, r2 = lip_radius - wall_thickness);
}