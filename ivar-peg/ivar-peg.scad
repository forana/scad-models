pegLength = 40;
pegDiameter = 6;
flatDepth = 0.6;
$fn = 36;

intersection() {
    translate([0, pegDiameter/2, pegDiameter/2-flatDepth])
        rotate([0, 90, 0])
            cylinder(d = pegDiameter, h = pegLength);
    cube([pegLength, pegDiameter, pegDiameter-2*flatDepth]);
}
