pegLength = 21.9;
pegWidth = 2;
bellendWidth = 3.7;
bellendLength = 1.7;
bellendStickout = (bellendWidth - pegWidth)/2;
pegThickness = 2.2;

$fn = 64;

module roundedRect(w, h, d, r) {
    ew = w - 2*r;
    eh = h - 2*r;
    ed = d - 2*r;
    translate([r, r, 0]) minkowski() {
        cube([ew, eh, d/2]);
        cylinder(r=r, h=d/2);
    }
}

module peg() {
    roundedRect(pegWidth, pegLength, pegThickness, pegWidth/4);
    translate([-bellendStickout, 0, 0])
        roundedRect(bellendWidth, bellendLength, pegThickness, bellendStickout/2);
}

peg();
