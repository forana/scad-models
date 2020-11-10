ivarXDist = 25;
ivarYDist = 32;
ivarPegDiameter = 6;
ivarPegDepth = 20; // technically 25, but we don't need to go that deep

piZeroWidth = 30;
piZeroLength = 65;
piScrewInset = 3.5;
piScrewHoleDiameter = 2.54;
piScrewSafeDiameter = 6;
piSafeInset = 7.8;

piStandoffHeight = 2;

plateThickness = 2;
plateHoleDiameter = 2.4;
screwHeadDepth = 1.6;
screwHeadDiameter = 4.4;

$fn = 64;

module roundedRect(width, height, thickness, radius) {
    translate([radius, radius, 0])
        linear_extrude(thickness) minkowski() {
            circle(radius);
            square([width - 2*radius, height - 2*radius]);
        }
}

module piPlate() {
    difference() {
        union() {
            roundedRect(piZeroWidth, piZeroLength, plateThickness, piScrewHoleDiameter);
            translate([piScrewInset, piScrewInset, plateThickness])
                cylinder(d=piScrewSafeDiameter, h = piStandoffHeight);
            translate([piZeroWidth-piScrewInset, piScrewInset, plateThickness])
                cylinder(d=piScrewSafeDiameter, h = piStandoffHeight);
            translate([piScrewInset, piZeroLength-piScrewInset, plateThickness])
                cylinder(d=piScrewSafeDiameter, h = piStandoffHeight);
            translate([piZeroWidth-piScrewInset, piZeroLength-piScrewInset, plateThickness])
                cylinder(d=piScrewSafeDiameter, h = piStandoffHeight);
        }
        translate([piSafeInset, piSafeInset, -0.1])
            cube([piZeroWidth-2*piSafeInset, piZeroLength-2*piSafeInset, plateThickness + 0.2]);
            //roundedRect(piZeroWidth-2*piSafeInset, piZeroLength-2*piSafeInset, plateThickness + 0.2, piScrewHoleDiameter);
        translate([piScrewInset, piScrewInset, -0.1]) {
            cylinder(d=plateHoleDiameter, h=10);
            cylinder(d=screwHeadDiameter, h=screwHeadDepth+0.1);
        }
        translate([piZeroWidth-piScrewInset, piScrewInset, -0.1]) {
            cylinder(d=plateHoleDiameter, h=10);
            cylinder(d=screwHeadDiameter, h=screwHeadDepth+0.1);
        }
        translate([piScrewInset, piZeroLength-piScrewInset, -0.1]) {
            cylinder(d=plateHoleDiameter, h=10);
            cylinder(d=screwHeadDiameter, h=screwHeadDepth+0.1);
        }
        translate([piZeroWidth-piScrewInset, piZeroLength-piScrewInset, -0.1]) {
            cylinder(d=plateHoleDiameter, h=10);
            cylinder(d=screwHeadDiameter, h=screwHeadDepth+0.1);
        }
    }
    
}

module ivarPlate(w, h) {
    for (i=[1:w]) {
        for (j=[1:h]) {
            translate([(i-1)*ivarXDist, (j-1)*ivarYDist, 0])
                cylinder(d=ivarPegDiameter, h=ivarPegDepth);
        }
    }
}

translate([-piZeroWidth/2, 0, 0])
    piPlate();
translate([-ivarXDist/2, (piZeroLength-ivarYDist)/2, -ivarPegDepth])
    ivarPlate(2, 2);
