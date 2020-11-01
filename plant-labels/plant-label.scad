linear_extrude(0, 0, 3) union() {
//    translate([0, 9, 0])
//    text("JALEPENO", font = "liberation mono:style=Bold", size = 10, spacing=0.8, halign="center", valign="baseline");
    text("CATNIP", font = "liberation mono:style=Bold", size = 10, spacing=0.8, halign="center", valign="baseline");
    square([32, 1.5], center = true);
    polygon([
        [-4, 0],
        [4, 0],
        [3, -50],
        [-3, -50]
    ]);
}
