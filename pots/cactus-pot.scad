difference() {
    glarch(70, 70, 6);
    translate([0, 0, 2]) glarch(70, 65, 6);
}

module glarch(h, r, sides) {
    $fn = sides;
    hull() {
        for (i = [0:3]) {
            translate([0, 0, h*i/3])
                rotate([0, 0, 180 / sides  * i])
                    cylinder(h = 1, r = r * (i + 6) / 9);
        }
    }
}