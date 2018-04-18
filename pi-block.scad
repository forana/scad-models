include <pi-zero.scad>;

$fn = 32;

numSlots = 4;
slotWidth = 12;
slotLength = 75;
height = 22;

intersection() {
    for (i = [0:numSlots -1]) {
        translate([i * slotWidth, 0, 0 ])
            piSlot();
    }
    linear_extrude(0, 0, height)
        translate([(numSlots - 1) / 2 * slotWidth, 0, 0])
            roundedRect(numSlots * slotWidth, slotLength, 5);
}

module piSlot() {
    difference() {
        linear_extrude(0, 0, height)
            square([slotWidth, slotLength], center = true);
        translate([-4, 0, 16])
            rotate([0, 90, 0])
                piZero(printerTolerance = 0.4, heightPadding = 0);
    }
}