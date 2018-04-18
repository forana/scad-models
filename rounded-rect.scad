$fn = 16;

linear_extrude(0, 0, 1) roundedRect(10, 20, 2);

module roundedRect(w, h, r) {
    square([w - 2 * r, h], center = true);
    square([w, h - 2 * r], center = true);
    translate([w/2 - r, h/2 - r, 0]) circle(r = r);
    translate([-(w/2 - r), h/2 - r, 0]) circle(r = r);
    translate([w/2 - r, -(h/2 - r), 0]) circle(r = r);
    translate([-(w/2 - r), -(h/2 - r), 0]) circle(r = r);
}
