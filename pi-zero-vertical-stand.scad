use <rounded-rect.scad>;
use <pi-zero.scad>;

printerTolerance = 0.2;
piCount = 4;

piThickness = 1.55;
piWidth = 30;
piLength = 65;

heatsinkHeight = 8;

slotWidth = heatsinkHeight + piThickness;
slotDepth = piWidth;
slotHeight = 55;
baseThickness = 3;
wallThickness = 2;
scoopDepth = 25;
scoopHeight = 15;

// how far the pi's bottom needs to be vertically sunk into the slot
piSinkDepth = slotWidth - piThickness - heatsinkHeight - printerTolerance;

multiSlot();

module multiSlot() {
    difference() {
        union() {
            for (i = [0:piCount-1]) {
                translate([i * (slotWidth + wallThickness), 0, 0])
                    piSlot();
            }
            // end wall
            translate([piCount * (slotWidth + wallThickness), 0, 0])
                linear_extrude(0, 0, slotHeight + baseThickness)
                    square([wallThickness, slotDepth + 2*wallThickness]);
        };
        // the scoop
        translate([-1, -1, baseThickness + scoopHeight])
            linear_extrude(0, 0, slotHeight)
                square([(piCount + 1) * (slotWidth + wallThickness), scoopDepth + wallThickness + 2]);
    }
}

module piSlot() {
    difference() {
        // the actual frame
        linear_extrude(0, 0, slotHeight + baseThickness)
            square([wallThickness + slotWidth, slotDepth + 2*wallThickness]);
        // pi cutout
        translate([wallThickness, wallThickness, baseThickness])
            piCutout();
    }
}

module piCutout () {
    translate([-piSinkDepth, piWidth, 0])
    rotate([90, 0, 0])
    rotate([0, 90, 0])
    translate([-piWidth/2, piLength/2, -printerTolerance])
    piZero(includeCables = true, heatsinkHeight = heatsinkHeight, cutOutCorners = true, cutOutGPIO = true, printerTolerance = printerTolerance);
}