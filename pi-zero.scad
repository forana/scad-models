use <rounded-rect.scad>;

piZero(includeHeatsink = false, includeCables = false);

module piZero(includeCables = true, includeHeatsink = true, heightPadding = 0, sdWidth = 12, cameraWidth = 17, r = 3.5, printerTolerance = 0) {
    // base board
    color("green")
        linear_extrude(0, 0, 1.55 + 2 + heightPadding + printerTolerance)
            difference() {
                roundedRect(30 + 2 * printerTolerance, 65 + 2 * printerTolerance, r - printerTolerance);
                *union() {
                    translate([11.5 + printerTolerance, 29 + printerTolerance, 0]) circle(r = 1.25 - printerTolerance);
                    translate([-11.5 - printerTolerance, 29 + printerTolerance, 0]) circle(r = 1.25 - printerTolerance);
                    translate([11.5 + printerTolerance, -29 - printerTolerance, 0]) circle(r = 1.25 - printerTolerance);
                    translate([-11.5 - printerTolerance, -29 - printerTolerance, 0]) circle(r = 1.25 - printerTolerance);
                };
            };
    // top stuff
    translate([0, 0, 1.55 + printerTolerance])
        color("cyan")
            union() {
                // camera port cover
                linear_extrude(0, 0, 1 + heightPadding + printerTolerance)
                    translate([0, -32.5 - printerTolerance, 0])
                        square([cameraWidth + 2 * printerTolerance, 2 + 2 * printerTolerance], center = true);
                // micro usb ports
                translate([-10, -8.9, 1])
                    rotate([0, -90, 0])
                        linear_extrude(0, 0, 6)
                            square([2 + 2 * printerTolerance, 8 + 2 * printerTolerance], center = true);
                translate([-10, -21.5, 1])
                    rotate([0, -90, 0])
                        linear_extrude(0, 0, 6)
                            square([2 + 2 * printerTolerance, 8 + 2 * printerTolerance], center = true);
                // micro usb port things
                if (includeCables) {
                    translate([-15, -8.9, 1])
                        rotate([0, -90, 0])
                            linear_extrude(0, 0, 8)
                                roundedRect(8, 11, 1);
                    translate([-15, -21.5, 1])
                        rotate([0, -90, 0])
                            linear_extrude(0, 0, 8)
                                roundedRect(8, 11, 1);
                }
                // micro hdmi port
                translate([-7, 20.1, 1.7])
                    rotate([0, -90, 0])
                        linear_extrude(0, 0, 9.5)
                            square([3.4 + 2 * printerTolerance, 11.5 + 2 * printerTolerance], center = true);
                // micro hdmi adapter
                if (includeCables) {
                    translate([-15, 20.1, 1.7])
                        rotate([0, -90, 0])
                            linear_extrude(0, 0, 9.5)
                                roundedRect(9 + 2 * printerTolerance, 14 + 2* printerTolerance, 2);
                }
                
                // microsd card
                translate([1.9, 28, 0])
                    linear_extrude(0, 0, 1.5 + heightPadding)
                        square([sdWidth + 2 * printerTolerance, 16 + 2 * printerTolerance], center = true);
                // cpu heatsink
                if (includeHeatsink) {
                    translate([-3, 32.5 - 18.5 - 7, 0])
                        linear_extrude(0, 0, 7)
                            square([14, 14], center = true);
                }
            };
}