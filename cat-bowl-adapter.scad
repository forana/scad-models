ring_diameter = 107;
ring_overhang = 5;

bowl_diameter = 102;
//bowl_overhang = 7.5

height = 2;
$fn = 64;

outer_radius = (ring_diameter/2) + ring_overhang;
inner_radius = bowl_diameter/2;

difference() {
    cylinder(h = height, r = outer_radius);
    cylinder(h = height, r = inner_radius);
}
