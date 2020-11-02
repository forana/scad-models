$fn = 64;

linear_extrude(0, 0, 1) roundedRect(10, 20, 2, center = false);

module roundedRect(w, h, r, center = true) {
    translate([center ? 0 : (w/2), center ? 0 : (h/2), 0]) {
        square([w - 2 * r, h], center = true);
        square([w, h - 2 * r], center = true);
        translate([w/2 - r, h/2 - r, 0]) circle(r = r);
        translate([-(w/2 - r), h/2 - r, 0]) circle(r = r);
        translate([w/2 - r, -(h/2 - r), 0]) circle(r = r);
        translate([-(w/2 - r), -(h/2 - r), 0]) circle(r = r);
    }
}
