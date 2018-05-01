use <pi-block.scad>;
use <rounded-rect.scad>;

n = 10;
height = 20;
length = 75;
slotWidth = 10;

deck();

module deck() {
    intersection() {
        piBlock(numSlots=n, height=height, outerRadius=0, slotWidth=slotWidth, slotLength=length, cutoutLength=length-20, cutoutDepth=height-7, cutoutRadius=5);
        
        rotate([0, 90, 0])
            translate([0, 0, -(slotWidth * n / 2)])
                linear_extrude(0, 0, slotWidth * n)
                    translate([-height, 0, 0])
                        roundedRect(2 * height, length, 8);
    }
}