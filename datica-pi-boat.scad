use <pi-block.scad>;
use <rounded-rect.scad>;

printerTolerance = 0.4;
$fn = 64;

difference() {
    union() {
        linear_extrude(0, 0, 3)
            roundedRect(32, 67, 3.5);
        translate([0, 0, 6]) hull(120);
    };
    translate([0, -2, 0])
        linear_extrude([0, 0, 1])
            roundedRect(4 * 8, 75, 5);
    // cut off anything below
    translate([0, 0, -8])
        rotate([180, 0, 0])
            linear_extrude(0, 0, 50)
                square(200, center = true);
};

translate([0, -2, 0])
    piBlock(/*cutoutDepth = 0, cutoutRadius = 0, */cutoutLength = 56, outerRadius = 5, height = 16.5);

module hull(hl)
{
    color("brown")
    difference() {
        translate([0,hl*-1/32,-hl*0/32])
            union() {
                scale([0.7,2.1,1]) translate([0,0,-hl/12]) 
                    cylinder(r1=hl/5, r2=hl/4, h=hl/6,center=true);
                difference() {
                    scale([0.7,2.1,1]) translate([0,0,hl/12]) 
                        cylinder(r=hl/4, h=hl/6, center=true);
                    translate([0,hl/4.5,hl/1.7]) cube(hl, center=true);
                    translate([0,hl*1/32,hl*9/32]) cube(hl/2, center=true);
                }
            }
        translate([0,-hl*17/32,4*hl/32]) cube([hl,hl/8,hl/2],center=true);
    }
}
	
