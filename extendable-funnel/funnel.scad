r1 = 50;
r2 = 8;
r3 = 5;

h1 = 50;
h2 = 50;
thickness = 1.5;

difference() {
    tornado(r1, r2, r3, h1, h2);
    tornado(r1 - thickness, r2 - thickness, r3 - thickness, h1, h2);
}

module tornado(r1, r2, r3, h1, h2) {
    cylinder(h = h1, r1 = r1, r2 = r2);
    translate([0, 0, h1]) cylinder(h = h2, r1 = r2, r2 = r3);
}