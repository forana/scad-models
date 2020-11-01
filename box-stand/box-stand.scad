printerTolerance = 0.3;
$fn = 32;

holeXOffset = 6.5;
holeYOffset = 35;
dowelDiameter = 6.1;
dowelRadius = dowelDiameter/2;
dowelLength = 20;
dowelSocketDepth = 13;
footHeight = 100;
footWidth = holeXOffset * 2 + dowelDiameter + printerTolerance;
lipThickness = 5;
wallHeight = 20;
wallThickness = 5;
taperFactor = 0.75;
wingLength = 30;
wingHeight = 50;
wingThickness = 5;

isDouble = false;
includeWall = !isDouble;

if (isDouble) {
    translate([-footWidth/2, 0, 0]) footColumn();
    rotate([0, 0, 180]) translate([-footWidth/2, 0, 0]) footColumn();
} else {
    footColumn();
}

module roundedRect(w, h, r) {
    translate([-(w/2)+r, -(h/2)+r, 0]) minkowski() {
        square([w-2*r, h-2*r]);
        circle(r);
    }
}

module footColumn() {
    difference() {
        union() {
            hull() {
                linear_extrude(height = footHeight-lipThickness, scale = 1/taperFactor)
                    roundedRect(footWidth*taperFactor, footWidth*taperFactor, 4);
                if (isDouble) {
                    translate([footWidth/2, 0, 0])
                        rotate([0, 0, 180])
                        linear_extrude(height = footHeight-lipThickness, scale = 1/taperFactor)
                            translate([0, -footWidth*taperFactor/2, 0])
                                square([footWidth*taperFactor/2, footWidth*taperFactor]);
                }
                translate([0, 0, footHeight-(lipThickness/2)])
                    if (!includeWall) {
                        cube([footWidth, footWidth, lipThickness], center = true);
                    } else {
                        translate([wallThickness/2, 0, 0])
                            cube([footWidth + wallThickness, footWidth, lipThickness], center = true);
                    }
                if (includeWall) {
                    translate([footWidth/2, 0, footHeight])
                        linear_extrude(height = wallHeight, scale = taperFactor)
                            square([wallThickness, footWidth], center = true);
                }
            }
            rotate([0, 0, 0]) wing();
            rotate([0, 0, 90]) wing();
            rotate([0, 0, 180]) wing();
        }
        translate([0, 0, footHeight - dowelSocketDepth])
            cylinder(r = dowelRadius + printerTolerance, h = dowelLength);
        if (includeWall) {
            translate([-footWidth/2, -footWidth/2, footHeight])
                cube([footWidth, footWidth, wallHeight]);
        }
    }
}

module wing() {
    translate([0, 0, footHeight-wingHeight])
        rotate([0, -90, 0])
            translate([0, 0, -wingThickness/2])
                linear_extrude(height = wingThickness)
                    polygon([[0, 0], [wingHeight, 0], [wingHeight, wingLength]]);
}