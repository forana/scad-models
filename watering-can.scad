$fn=128;

height = 50;
radius = 20;
wall_thickness = 0.6;
spout_radius = 5;
spout_angle = 30;

intersection() {
    union() {
        translate([0, 0, wall_thickness])
            difference() {
                union() {
                    color("cyan")
                        cylinder(h = height, r1 = radius, r2 = radius);
                    translate([radius - spout_radius, 0, 0])
                        rotate([0, spout_angle, 0])
                            color("green")
                                cylinder(h = height * 2, r1 = spout_radius, r2 = spout_radius);
                    
                    translate([-radius * 3/4, 0, height/3])
                    rotate([90, 0, 0])
                        rotate_extrude()
                            translate([height/4, 0, 0])
                                circle(r = 2.5);
                };
                cylinder(h = height*2, r1 = radius - wall_thickness, r2 = radius - wall_thickness);
                translate([radius - spout_radius, 0, 0])
                        rotate([0, spout_angle, 0])
                            translate([0, 0, wall_thickness])
                                cylinder(h = height * 2, r1 = spout_radius - wall_thickness, r2 = spout_radius - wall_thickness);
                rotate([180, 0, 0])
                    linear_extrude(0, 0, radius)
                        square([radius * 10, radius * 10], center = true);
            };
        color("yellow")
            cylinder(h = wall_thickness, r1 = radius - wall_thickness * 0.6, r2 = radius);
    };
    union() {
        cylinder(h = height, r1 = radius + 0.1, r2 = radius + 0.1);
        cylinder(h = height * 2/3, r1 = radius * 10, r2 = radius * 10);
    };
}
