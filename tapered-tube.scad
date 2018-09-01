height = 150;
thickness = 1.5;
radius = 7.5;
taper = 2;

difference () {
    cylinder(h = height, r1 = radius, r2 = radius - taper);
    cylinder(h = height, r1 = radius - thickness, r2 = radius - taper - thickness);
}