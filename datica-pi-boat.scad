include <rounded-rect.scad>;
include <pi-zero.scad>;

printerTolerance = 0.3;
$fn = 64;

// pi zero, horizontally
//difference() {
//    union() {
//        linear_extrude(0, 0, 3)
//            roundedRect(32, 67, 3.5);
//        translate([0, 0, 6]) hull(120);
//    };
//    translate([0, 0, 1])
//        piZero(heightPadding = 20);
//    // cut off anything below
//    translate([0, 0, -8])
//        rotate([180, 0, 0])
//            linear_extrude(0, 0, 50)
//                square(200, center = true);
////    translate([-10, -27.5, 0])
////        linear_extrude(0, 0, 3)
////            stripeBlock(20, 55, 2);
//};

difference() {
    translate([0, 4, -2]) hull(90);
    translate([-1.55, 0, 0]) rotate([0, 90, 0])
        piZero(heightPadding = 0.5, sdWidth = 20, cameraWidth=25);
}

module stripeBlock(w, h, stripeSpacing = 2) {
    intersection() {
        for (i = [2:2:(w + h)]) {
            polygon([
                [(i - 1) * stripeSpacing, 0],
                [i * stripeSpacing, 0],
                [0, i * stripeSpacing],
                [0, (i - 1) * stripeSpacing]
            ]);
        };
        square([w, h]);
    };
}


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
	
