$fn = 60;
$inch = 25.4;

length = 3;
width = 3/4;
thickness = 1/4;
screw_shaft_diameter = 5/32;
screw_head_diameter = 0.332;

scale([$inch, $inch, $inch]) difference() {
    union() {
        bracket();
        truss();
    };
    screw_shafts();
}

module bracket() {
    linear_extrude(0, 0, width) difference() {
        polygon([
            [0, 0],
            [length, 0],
            [0, length]
        ]);
        translate([length/2, length/2]) circle(r = length/2 - thickness);
        translate([length/2, thickness]) square(length);
        translate([thickness, length/2]) square(length);
    };
}

module screw_shafts() {
    translate([length/3, thickness/2, width/2])
        rotate([-90, 0, 0])
            cylinder(h = length, r1 = screw_head_diameter/2, r2 = screw_head_diameter/2);
    translate([length*2/3, thickness/2, width/2])
        rotate([-90, 0, 0])
            cylinder(h = length, r1 = screw_head_diameter/2, r2 = screw_head_diameter/2);
    translate([thickness/2, length/3, width/2])
        rotate([-90, 0, -90])
            cylinder(h = length, r1 = screw_head_diameter/2, r2 = screw_head_diameter/2);
    translate([thickness/2, length*2/3, width/2])
        rotate([-90, 0, -90])
            cylinder(h = length, r1 = screw_head_diameter/2, r2 = screw_head_diameter/2);
    translate([length/3, -thickness/2, width/2])
        rotate([-90, 0, 0])
            cylinder(h = length, r1 = screw_shaft_diameter/2, r2 = screw_shaft_diameter/2);
    translate([length*2/3, -thickness/2, width/2])
        rotate([-90, 0, 0])
            cylinder(h = length, r1 = screw_shaft_diameter/2, r2 = screw_shaft_diameter/2);
    translate([-thickness/2, length/3, width/2])
        rotate([-90, 0, -90])
            cylinder(h = length, r1 = screw_shaft_diameter/2, r2 = screw_shaft_diameter/2);
    translate([-thickness/2, length*2/3, width/2])
        rotate([-90, 0, -90])
            cylinder(h = length, r1 = screw_shaft_diameter/2, r2 = screw_shaft_diameter/2);
}

module truss() {
}
