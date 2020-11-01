// stupid shelf spacer thing
// for our stupid shelves
// so they don't fall out
// like the stupid shelves
// that they are

wiggleRoom = 1;

pegWidth = 9 + wiggleRoom;
pegHeight = 11 + wiggleRoom;
spacerWidth = 5;

outline = 5;
clipWidth = 2;

$fn = 36;

linear_extrude(spacerWidth) {
    difference() {
        minkowski() {
            square([pegWidth, pegHeight]);
            circle(r=outline);
        };
        square([pegWidth, pegHeight]);
        polygon(points=[
            [clipWidth, pegHeight],
            [pegWidth-clipWidth, pegHeight],
            [pegWidth, pegHeight + outline],
            [0, pegHeight + outline]
        ]);
    }
}