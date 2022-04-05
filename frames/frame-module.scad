use <funcs.scad>;

module frame_bar(item_width, item_thickness, frame_width, pane_thickness, pane_inset_x, pane_inset_z, backing_thickness, backing_inset) {
    total_width = item_width + 2*frame_width;
    total_thickness = backing_thickness + item_thickness + pane_thickness + pane_inset_z;
    difference() {
        cube([total_width, frame_width, total_thickness]);
        // backing
        translate([-0.1, backing_inset, -0.1])
            cube([total_width + 0.2, frame_width, backing_thickness + 0.1]);
        // pane
        translate([-0.1, pane_inset_x, backing_thickness + item_thickness])
            cube([total_width + 0.2, frame_width, pane_thickness]);
        // bottom corner
        translate([-0.1, -0.1, -0.1])
            right_triangle(frame_width + 0.2, frame_width + 0.2, total_thickness + 0.2);
        // top corner
        translate([total_width + 0.1, -0.1, -0.1])
            right_triangle(-frame_width - 0.2, frame_width + 0.2, total_thickness + 0.2);
    }
}

// testing
frame_bar(inches(6.375), inches(0.375), inches(0.5), inches(0.125), inches(0.25), inches(0.125), inches(0.25), inches(0.25));
translate([0, inches(1.5), 0])
    frame_bar(inches(4.125), inches(0.375), inches(0.5), inches(0.125), inches(0.25), inches(0.125), inches(0.25), inches(0.25));