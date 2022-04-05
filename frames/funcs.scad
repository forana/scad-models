include <MCAD/constants.scad>;

function inches(n) = n*mm_per_inch;

module right_triangle(width, height, thickness) {
    linear_extrude(height=thickness, center = false)
        polygon([[0, 0], [0, height], [width, height]]);
}

// testing
right_triangle(20, 30, 10);
