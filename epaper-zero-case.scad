use <rounded-rect.scad>;

$fn = 16;
pt = 0.2;

piLength = 65;
piWidth = 30;
piThickness = 1.5;
connectorHeight = 16.2;
boardLength = 85.3;
boardWidth = 56.3;
boardThickness = 2.6;
boardRadius = 2.2;
headerStickout = 2;
headerWidth = 7.5;
headerLength = 51;
headerLengthOffset = 6.5;
sdOffset = 7.5;
sdWidth = 15;
sdStickout = 4;
cableCenterOffset = 41.3;
cableCenterHeight = 1.5;
cableWidth = 11;
cableHeight = 8.5;
postWidth = 4;
postOffset = 1;
buttonRadius = 2;
buttonPlay = 0.5;
buttonOffset = 4;
buttonHeight = 4;
buttonPlateInset = 2;
buttonPlateOffsetX = 4;
buttonPlateOffsetY = 0.6;
buttonPlateThickness = 1;
buttonPlateLength = 50;
buttonPlateWidth = 6;

caseThickness = 3;

halfHeight = (piThickness + connectorHeight + boardThickness)/2;

union() {
    translate([-boardWidth/2 - 2*caseThickness, 0, caseThickness])
        case(true);
    rotate([0, 180, 0])
        translate([-boardWidth/2 - 2*caseThickness, 0, -2*halfHeight - caseThickness])
            case(false);
    translate([0, -boardLength/2 - caseThickness - buttonPlateWidth, 0])
        buttonPlate();
}

module case(isBottom) {
    difference() {
        if (isBottom) {
            caseBottom();
        } else {
            caseTop();
        }
        hatStack();
        lcdCutout();
        sdCutout();
        cableCutout();
        buttonHoles();
    }
    if (isBottom) {
        supportPosts();
    }
}

module caseTop() {
    translate([0, 0, halfHeight]) {
        linear_extrude(0, 0, caseThickness + halfHeight)
            roundedRect(w = boardWidth + 2*caseThickness, h = boardLength + 2*caseThickness, r = 3);
        translate([0, 0, -caseThickness])
            linear_extrude(0, 0, caseThickness)
                difference() {
                    roundedRect(w = boardWidth + 2*caseThickness, h = boardLength + 2*caseThickness, r = 3);
                    roundedRect(w = boardWidth + caseThickness + pt, h = boardLength + caseThickness + pt, r = 2.5);
                }
    }
}

module caseBottom() {
    translate([0, 0, -caseThickness]) {
        linear_extrude(0, 0, halfHeight)
            roundedRect(w = boardWidth + 2*caseThickness, h = boardLength + 2*caseThickness, r = 3);
        translate([0, 0, halfHeight])
            linear_extrude(0, 0, caseThickness)
                roundedRect(w = boardWidth + caseThickness - pt, h = boardLength + caseThickness - pt, r = 2.5);
    }
}

module hatStack() {
    translate([-boardWidth/2, -boardLength/2, 0]) {
        translate([0, 0, 0])
            linear_extrude(0, 0, piThickness + connectorHeight + boardThickness)
                roundedRect(w = boardWidth + pt, h = boardLength + pt, r = boardRadius, center = false);
        
        translate([boardWidth - headerWidth, boardLength - headerLength - headerLengthOffset, -headerStickout])
            linear_extrude(0, 0, piThickness + connectorHeight + boardThickness + 2*headerStickout)
                square([headerWidth, headerLength], center = false);
    }
}

module lcdCutout() {
    translate([-boardWidth/2, -boardLength/2, 0])
        translate([4.4, 14.8, 0])
            linear_extrude(0, 0, halfHeight*3)
                square([42.4, 62], center = false);
}

module sdCutout() {
    translate([boardWidth/2-sdOffset-sdWidth, boardLength/2-sdStickout, 0])
        linear_extrude(0, 0, 3*piThickness)
            square([sdWidth, 2*sdStickout], center = false);
}

module cableCutout() {
    translate([-boardWidth/2 + piWidth, boardLength/2-cableCenterOffset, 0])
        rotate([0, -90, 0])
            linear_extrude(0, 0, piWidth*2)
                roundedRect(w = cableHeight, h = cableWidth, r = cableHeight/4);
}

module supportPosts() {
    linear_extrude(0, 0, piThickness + connectorHeight)
        translate([-boardWidth/2, -boardLength/2, 0]) {
            translate([postOffset, postOffset, 0])
                roundedRect(h = postWidth, w = boardWidth - 2*postOffset, r = 1, center = false);
            translate([postOffset, boardLength-postWidth-postOffset, 0])
                roundedRect(h = postWidth, w = postWidth, r = 1, center = false);
//            translate([postOffset, (boardLength-postWidth)/2, 0])
//                roundedRect(h = postWidth, w = postWidth, r = 1, center = false);
    }
}

module buttonHoles() {
    translate([-boardWidth/2, -boardLength/2, piThickness + connectorHeight + boardThickness]) {
        translate([buttonPlateOffsetX, buttonPlateOffsetY, -buttonPlay])
            linear_extrude(0, 0, buttonPlateInset + buttonPlay)
                roundedRect(w = buttonPlateLength + 2*pt, h = buttonPlateWidth + 2*pt, r = buttonPlateWidth/2, center = false);
        linear_extrude(0, 0, buttonHeight + buttonPlateInset) {
            translate([0, buttonOffset, 0]) {
                translate([9.5, 0, 0])
                    circle(r = buttonRadius + buttonPlay + pt);
                translate([23, 0, 0])
                    circle(r = buttonRadius + buttonPlay + pt);
                translate([36, 0, 0])
                    circle(r = buttonRadius + buttonPlay + pt);
                translate([49, 0, 0])
                    circle(r = buttonRadius + buttonPlay + pt);
            }
        }
    }
}

module buttonPlate() {
    linear_extrude(0, 0, buttonPlateThickness)
        roundedRect(w = buttonPlateLength, h = buttonPlateWidth, r = buttonPlateWidth/2);
    translate([-buttonPlateLength/2 - buttonPlateOffsetX, 0, 0]) {
        linear_extrude(0, 0, buttonHeight + buttonPlateThickness) {
            translate([9.5, 0, 0])
                circle(r = buttonRadius);
            translate([23, 0, 0])
                circle(r = buttonRadius);
            translate([36, 0, 0])
                circle(r = buttonRadius);
            translate([49, 0, 0])
                circle(r = buttonRadius);
        }
    }
}
