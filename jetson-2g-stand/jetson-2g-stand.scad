xDist = 83.35;
yDist = 55.35;
holeRadius = 2.54;
safeRadius = 4.8;

standoffHeight = 5;
pegHeight = 3;
outset = 5;
radius = 5;
plateThickness = 1.5;

wiggleRoom = 0.2;

$fn = 36;

module roundedRect(w, h, d, r) {
    linear_extrude(d)
        minkowski() {
            circle(r);
            square([w-2*r, h-2*r]);
        };
}

module peg() {
    cylinder(d=safeRadius, h=standoffHeight);
    cylinder(d=holeRadius - wiggleRoom, h=standoffHeight + pegHeight);
}

difference() {
    roundedRect(xDist + holeRadius + 2*outset, yDist + holeRadius + 2*outset, plateThickness, radius);
    translate([outset, outset, -0.1])
        cube([xDist + holeRadius - 2*outset, yDist + holeRadius - 2*outset, plateThickness+0.2]);
}
peg();
translate([xDist + holeRadius, 0, 0])
    peg();
translate([0, yDist + holeRadius, 0])
    peg();
translate([xDist + holeRadius, yDist + holeRadius, 0])
    peg();
