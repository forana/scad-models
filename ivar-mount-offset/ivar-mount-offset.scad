pegDiameter = 5.5;
pegDistance = 27 + pegDiameter;
plateWidth = 14.5;
plateThickness = 2.7;
plateRadius = 1;
pegLength = 20;

plateLength = (1.5 * pegDistance) + (pegDiameter) + (plateThickness/2);

tabLength = 32.5;
tabWidth = 12.5;
screwHoleDiameter = 3.25;
screwLengthInset = 24.85 + screwHoleDiameter/2;
screwWidthInset = 5.9 + screwHoleDiameter/2;

$fn=64;

module roundedRect(width, height, thickness, radius) {
    translate([radius, radius, 0])
        linear_extrude(thickness) minkowski() {
            circle(radius);
            square([width - 2*radius, height - 2*radius]);
        }
}

module peg(bevel=0.5) {
    cylinder(d=pegDiameter, h=pegLength-bevel);
    translate([0, 0, pegLength-bevel])
        cylinder(d1=pegDiameter, d2=pegDiameter-2*bevel, h=bevel);
}

module plate() {
    roundedRect(plateWidth, plateLength, plateThickness, plateRadius);
    translate([plateWidth/2, pegDiameter, 0])
        rotate([0, 180, 0])
            peg();
    translate([plateWidth/2, pegDiameter + pegDistance, 0])
        rotate([0, 180, 0])
            peg();
    translate([plateWidth, plateLength, 0])
        rotate([90, -90, 0])
            difference() {
                roundedRect(tabWidth, tabLength, plateThickness, plateRadius);
                translate([screwWidthInset, screwLengthInset, -1])
                    cylinder(d=screwHoleDiameter, h = 10);
            };
    rotate([0, 90, 0])
        linear_extrude(plateWidth)
            polygon(points = [
                [0, plateLength],
                [0, plateLength-tabWidth],
                [-tabWidth, plateLength]
            ]);
}

plate();
