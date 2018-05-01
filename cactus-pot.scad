glarch(60, 40, 60);

module glarch(h, r) {
    $fn = 4;
    hull() {
        // 9/9
        translate([0, 0, h*3/3]) rotate([0, 0, 45]) cylinder(h = 1, r = r, $fn = 8);
        // 8/9
        translate([0, 0, h*2/3]) cylinder(h = 1, r = r, $fn = 8);
        // 7/9
        // 6/9
        translate([0, 0, h*0/3]) rotate([0, 0, 45]) cylinder(h = 1, r = r);
    }
}