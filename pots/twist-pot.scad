use <npoly.scad>;
$fn = 64;

slices = 72;
sliceHeight = 0.5;
sliceAngle = 1;
n = 5;
r = 30;

difference() {
    for (i = [0:slices-1]) {
        translate([0, 0, sliceHeight * i])
        rotate([0, 0, sliceAngle * i])
        hull() {
            linear_extrude(0, 0, 0.0001) offset(r = 5) polygon(npoly(n, r));
            translate([0, 0, sliceHeight]) linear_extrude(0, 0, 0.0001) offset(r = 5) polygon(npoly(n, r, sliceAngle));
        }
    }
    translate([0, 0, 3]) cylinder(h = sliceHeight * slices, r = r *5/6);
}