use <pi-zero.scad>;
use <rounded-rect.scad>;

$fn = 64;

numSlots = 4;
slotWidth = 8;
slotLength = 75;
cutoutDepth = 15;
cutoutLength = 55;
height = 22;
outerRadius = 3;
cutoutRadius = 5;

difference() {
    intersection() {
        for (i = [0:numSlots -1]) {
            translate([i * slotWidth, 0, 0 ])
                piSlot();
        }
        linear_extrude(0, 0, height)
            translate([(numSlots - 1) / 2 * slotWidth, 0, 0])
                roundedRect(numSlots * slotWidth, slotLength, outerRadius);
    }
    translate([-slotWidth/2 - 1, 0, height])
        rotate([0, 90, 0])
            linear_extrude(0, 0, numSlots * slotWidth + 2)
                roundedRect(cutoutDepth * 2, cutoutLength, cutoutRadius);
}
        

module piSlot() {
    difference() {
        linear_extrude(0, 0, height)
            square([slotWidth, slotLength], center = true);
        translate([-2, -1, 16])
            rotate([0, 90, 0])
                piZero(printerTolerance = 0.4, includeHeatsink = false, sdWidth = 16);
    }
}